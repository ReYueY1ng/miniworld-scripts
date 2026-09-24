--[[
    JitDemo —— 单文件版：反 JIT 热循环 + 可 JIT 热循环 + 类似 jit.status() 的状态查询

    ── JIT 的逻辑 ────────────────────────────────────────────────────────────
    LuaJIT 2.1 是 trace JIT，编译单位是「热循环」而不是函数：
      1. for 的循环回边(FORL/JFORL)每迭代一次递减一次 hotcount；
      2. hotcount 归零(默认 hotloop 约 56，本机实测第 58 次迭代)后，trace 记录器
         从循环头开始录制整条 trace；
      3. 录制途中撞到 NYI(Not Yet Implemented)字节码就立即 abort，并执行
           blacklist_pc   —— 把该字节码 PC 拉黑；
           blacklist_loop —— 反复失败到阈值后，把整个循环永久拉黑；
      4. 被拉黑的循环在本次进程生命周期内不会再被录制，只能一直跑解释器。

    ── 两个探针 ──────────────────────────────────────────────────────────────
    探针 A(hotLoopInterp): 循环体里 `{...}` 塞的是变长参数 -> VARG 字节码是 NYI
                           -> 永远编译不了，而且会被 blacklisted。
    探针 B(hotLoopJit)   : 表里塞普通参数 -> 照样每轮建表，但没有 VARG
                           -> trace 一次录制成功，拿到机器码。

    两个探针必须「同工同酬」：每轮都分配一张表、都做同样的算术，唯一区别只有
    VARG 那一个字节码。否则量出来的差距会混进「省掉分配」的收益，JIT 关掉也会
    被误判成开启。A 因此同时充当「解释器吞吐基准」。

    ── 为什么不用 jit.status() ───────────────────────────────────────────────
    Mini World 的脚本环境里没有 jit 库(官方 env dump 里搜不到 "jit")，
    所以状态只能自己推断：先跑反 JIT 循环量出解释器基准吞吐，再跑可 JIT 循环量出
    实际吞吐，两者比值就是"JIT 到底在不在干活"的证据。这条基准是自校准的，
    不依赖机型、也不依赖硬编码的 ns/iter。

    ── 实测标定(x64 Linux，改阈值前先看这里)────────────────────────────────
      JIT 开启：反JIT版 ~32 轮/ms，可JIT版 ~940 轮/ms，ratio ~29x
      JIT 关闭：反JIT版 ~39 轮/ms，可JIT版 ~42 轮/ms， ratio ~1.1x
    JIT 关闭时 [TRACE] 一行都不会产生，两个探针都走解释器，比值自然塌回 1 ——
    这一档是必须保住的，它就是"没开 JIT 也报 true"的回归检验。阈值 4 落在两档
    正中间。ratio 终究只是计时推断，所以只要能拿到 jit 库，一律以 jit.status()
    为准(source="jit.status")，探针退居参考。
]]

---JitDemo —— JIT 状态探针
---两个「同工同酬」的热循环互相对照，推断当前环境有没有在编译热循环，效果等价 jit.status()。
---JIT 开启时 ratio 约 25~30x，关闭时约 1.1x，据此判定；单次采样约 200ms，结果会缓存。
---@class JitDemo: WorldComponent
---@field inner number 单次内层循环次数
---@field budget number 每个探针的采样时长(ms)
local JitDemo = {}

JitDemo.propertys = {
    inner = {
        type = Mini.Number,
        default = 400,
        displayName = "内层循环次数",
        sort = 1,
        style = ComponentUIStyle.NumberSlider,
        minValue = 64,
        maxValue = 5000,
        stride = 16,
        tips = "必须大于 hotloop 阈值(约 56)，否则不会触发 trace 录制",
    },
    budget = {
        type = Mini.Number,
        default = 100,
        displayName = "采样时长(ms)",
        sort = 2,
        style = ComponentUIStyle.NumberSlider,
        minValue = 10,
        maxValue = 2000,
        stride = 10,
    },
}

--==========================================================================
-- 探针 A：反 JIT 版
-- 循环体里的 `{...}` 需要不定数量的返回值，编译成 VARG 字节码 —— 正是 NYI。
--==========================================================================
---@param inner number 循环次数
---@param ... any 变长参数
---@return number acc 累加结果
local function hotLoopInterp(inner, ...)
    local acc = 0
    for i = 1, inner do
        local pack = { ... } -- ★ NYI: bytecode VARG，trace 就卡在这一行
        acc = acc + i + (pack[1] or 0)
    end
    return acc
end

--==========================================================================
-- 探针 B：可 JIT 版
-- 与 A 的唯一差别：表里塞的是普通参数而不是 `...`，于是没有 VARG，trace 能编译。
-- 注意这里**故意**把建表留在循环内 —— 两个探针每轮都分配一张表，工作量才对等。
-- 曾经把建表提到循环外，结果 JIT 关闭时比值仍有 7 倍（那是省掉分配的收益，
-- 不是 JIT 的功劳），于是关掉 JIT 也会误判成 true。基准必须同工同酬。
--==========================================================================
---@param inner number 循环次数
---@param a any 普通参数
---@return number acc 累加结果
local function hotLoopJit(inner, a)
    local acc = 0
    for i = 1, inner do
        local pack = { a } -- ★ 同样每轮建表，但没有 VARG
        acc = acc + i + (pack[1] or 0)
    end
    return acc
end

--==========================================================================
-- 工具：取运行时的 jit 库（可能不存在，也可能被沙箱拦，所以用 pcall 兜住）
--==========================================================================
---@return table|nil jitlib
local function getJitLib()
    local ok, lib = pcall(function()
        return jit
    end)
    if ok and type(lib) == "table" then
        return lib
    end
    return nil
end

--==========================================================================
-- 采样：warmup 轮预热让 trace 录制/拉黑彻底稳定，然后在 budgetMs 内尽可能多跑，
--       返回「轮/毫秒」吞吐。预热很关键：探针 A 要被反复 abort 之后才会进入
--       永久 blacklisted 的稳定态，探针 B 要跑到 hotloop 才开始编译。
--==========================================================================
---@param fn function 被测函数
---@param inner number 内层循环次数
---@param budgetMs number 采样时长(ms)
---@param warmupRounds number 预热轮数
---@return number roundsPerMs 吞吐
local function throughput(fn, inner, budgetMs, warmupRounds)
    for _ = 1, warmupRounds do
        fn(inner, 7)
    end

    local t0 = os.timeMs()
    local rounds = 0
    local dt = 0
    repeat
        fn(inner, 7)
        rounds = rounds + 1
        dt = os.timeMs() - t0
    until dt >= budgetMs
    if dt <= 0 then
        dt = 1
    end
    return rounds / dt
end

--==========================================================================
-- 状态查询：等价于 jit.status() 的替代品
--==========================================================================
local RATIO_THRESHOLD = 4 -- 吞吐比 > 4 判定为「拿到了机器码」
local WARMUP_ROUNDS = 300 -- 预热轮数，确保 trace 录制/拉黑进入稳定态

---@class JitProbeResult
---@field inner number 本轮采样用的内层循环次数
---@field budget number 本轮采样用的时长(ms)
---@field compiled boolean JIT 是否在工作
---@field ratio number 实测加速比
---@field source string 判定来源
---@field baseTp number 反 JIT 版吞吐(轮/ms)
---@field jitTp number 可 JIT 版吞吐(轮/ms)

---@type JitProbeResult|nil
local cache = nil

---跑/取探针结果（带缓存）。第一次调用会真正采样一次。
---@param inner number 内层循环次数
---@param budgetMs number 采样时长(ms)
---@return JitProbeResult result
local function probeResult(inner, budgetMs)
    if cache and cache.inner == inner and cache.budget == budgetMs then
        return cache
    end

    -- 用「反 JIT 循环」当解释器基准，再量「可 JIT 循环」的实际吞吐
    local baseTp = throughput(hotLoopInterp, inner, budgetMs, WARMUP_ROUNDS)
    local jitTp = throughput(hotLoopJit, inner, budgetMs, WARMUP_ROUNDS)
    local ratio = (baseTp > 0) and (jitTp / baseTp) or 0

    -- 有 jit 库就用权威状态；没有就按吞吐比推断
    local compiled, source = false, "probe"
    local lib = getJitLib()
    local ok, on
    if lib and type(lib.status) == "function" then
        ok, on = pcall(lib.status)
    end
    if ok then
        compiled, source = (on and true or false), "jit.status"
    else
        compiled, source = ratio > RATIO_THRESHOLD, "probe"
    end

    cache = {
        inner = inner,
        budget = budgetMs,
        compiled = compiled,
        ratio = ratio,
        source = source,
        baseTp = baseTp,
        jitTp = jitTp,
    }
    return cache
end

---类似 jit.status()：查询 JIT 是否正在编译热循环
---@param inner number 内层循环次数
---@param budgetMs number 采样时长(ms)
---@return boolean compiled JIT 是否在工作（可 JIT 版探针是否拿到了机器码）
---@return number ratio 实测加速比（可 JIT 版吞吐 / 反 JIT 版吞吐）
---@return string source 判定来源："jit.status" = 运行时自带 jit 库(权威)，"probe" = 计时探针推断
local function jitStatus(inner, budgetMs)
    local r = probeResult(inner, budgetMs)
    return r.compiled, r.ratio, r.source
end

---@return boolean compiled JIT 是否在工作
---@return number ratio 实测加速比
---@return string source 判定来源
function JitDemo:status()
    return jitStatus(self.inner, self.budget)
end

---文本形式的状态报告，方便触发器/编辑器直接显示
---@return string report
function JitDemo:statusReport()
    local r = probeResult(self.inner, self.budget)
    return string.format(
        "jit=%s ratio=%.1fx source=%s | 反JIT版=%.1f 轮/ms 可JIT版=%.1f 轮/ms",
        tostring(r.compiled),
        r.ratio,
        r.source,
        r.baseTp,
        r.jitTp
    )
end

JitDemo.openFnArgs = {
    status = true, -- 仅脚本组件可通过 GetComponent 调用
    statusReport = { -- 触发器/编辑器的函数下拉里也能看到
        displayName = "查询JIT状态",
        returnType = Mini.String,
    },
}

function JitDemo:OnStart()
    local t0 = os.timeMs()
    local r = probeResult(self.inner, self.budget)
    local cost = os.timeMs() - t0

    print(string.format("[JitDemo] 探针采样完成，耗时 %dms", cost))
    print(string.format("  反JIT版(解释器) : %8.1f 轮/ms", r.baseTp))
    print(string.format("  可JIT版(%s) : %8.1f 轮/ms", r.compiled and "已编译" or "解释器", r.jitTp))
    print(string.format("  jit working = %s   ratio = %.1fx   source = %s", tostring(r.compiled), r.ratio, r.source))
end

return JitDemo
