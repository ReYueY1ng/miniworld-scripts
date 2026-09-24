# miniworld-scripts

《迷你世界》(Mini World) UGC 脚本合集 —— 自己写的各种游戏脚本，以及游戏脚本运行环境的导出/分析资料。

脚本按引擎版本分目录：

```
2.0/   旧版 UGC 2.0 脚本（单文件、全局函数风格）
3.0/   新版 UGC 3.0 脚本（组件化，基于 Mini API）
```

---

## 3.0 — UGC 3.0 组件化脚本

| 路径 | 说明 |
|---|---|
| `ActLog.lua` | **行为日志组件**。订阅游戏 / 世界 / 方块 / 容器 / 玩家等事件，按可配置的模板把玩家行为记录到日志，常用于服务器审计与回放。 |
| `DumpTable.lua` | **表序列化 / 打印工具**。递归打印 table（含循环引用、userdata、`__tostring` 处理），用于调试输出。 |
| `Freecam.lua` | **自由相机组件**。空中自由飞行的观察相机，支持 `/fc`、`/freecam` 指令切换模式、开关与调速。 |
| `Leaderboard.lua` | **排行榜 UI 组件**。支持玩家变量 / 房间 KV / 全服 KV 三种数据源，固定间隔或流水线刷新，可滚动、可切换排行榜。 |
| `MiniMatica.lua` | **原理图（Schematic）编辑器**。类似 WorldEdit 的选区、复制、粘贴、保存/加载原理图工具，供玩家建造使用。 |
| `PermSys/` | **权限系统**（LuckPerms 风格）。 |
| `JitDemo/` | **LuaJIT 热循环探针实验**。用反 JIT / 可 JIT 两个自校准探针推断脚本环境是否真正启用了 trace JIT。 |
| `environments/` | **游戏脚本环境导出与分析**。见下方。 |


### environments — 环境导出与分析

| 文件 | 说明 |
|---|---|
| `ugcofficialenv.txt` | 官方 UGC 运行环境导出（1.59.0） |
| `ugcscriptenv.txt` | UGC 脚本环境导出（1.59.0） |
| `devapicfg.lua` | 引擎 `DevApiCfg.lua`（API 权限控制与频率限制配置）反编译源码 |
| `devapicfg_analysis.md` | 对 `DevApiCfg` 限制体系（对象方法白名单、Service 黑白名单、调用类型等）的分析 |

> 环境导出从游戏运行时 dump 得到，采用 [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) 许可。

---

## 2.0 — 旧版 UGC 2.0 脚本

| 文件 | 说明 |
|---|---|
| `actlog.lua` | 行为日志（2.0 版），记录游戏 / 世界 / 容器等事件。 |
| `allrandomskyblock.lua` | 随机空岛：定时把区域内方块随机替换。 |
| `apihook.lua` | 挂钩 `Mini` 的 UI / 聊天输出接口，拦截并改写打印内容。 |
| `getblock.lua` | 方块信息查询工具：选中方块后查看定义名、描述、数据、开关、电力状态等。 |
| `hookpcall.lua` | 包装 `pcall`，记录脚本报错的参数与结果，便于排错。 |
| `hookprint.lua` | 挂钩打印输出，把 `Print2Wnd` 等重定向到自定义日志。 |
| `moonlib.lua` | 基础工具库（base64 编解码、logger 等）。 |
| `permissionsystem.lua` | 简易权限系统。 |
| `res-port.lua` | 领地系统（ResPort）：领地创建、成员管理、权限、传送等。 |
| `scriptloader.lua` | 脚本加载器：模块化加载 / 管理其他脚本。 |
| `tickfly.lua` | 按键飞行 / tick 飞行控制。 |

---

## 开发环境

- **语言**：Lua（运行于 LuaJIT）
- **类型检查**：配合 [LuaLS](https://github.com/LuaLS/lua-language-server) 使用迷你世界 UGC 3.0 类型定义库（见本地 `.luarc.json`，指向 `miniworld-code-3.0/library/`）
- `2.0/` 为旧脚本，不在类型检查范围内

---

## 许可证

除非特殊说明，否则默认 [MIT License](LICENSE)。

`3.0/environments/` 下的环境导出采用 CC BY 4.0 许可。
