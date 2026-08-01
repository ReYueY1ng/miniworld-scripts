---Freecam 自由相机脚本 v3.0
---自由飞行相机，可在空中自由移动观察世界
---指令: /fc 或 /freecam 切换自由相机模式

local Freecam = {}

Freecam.propertys = {
    version = {
        type = Mini.Number,
        default = 1,
        format = '%.1f',
        hide = true
    }
}

Freecam.openFnArgs = {}

--- 配置
local CONFIG = {
    -- 默认飞行速度（方块/秒）
    defaultSpeed = 5,
    -- 位置更新间隔（秒）
    updateInterval = 0.05,
    -- 指令前缀
    commands = { '/fc', '/freecam' }
}

--- 玩家状态
local playerStates = {}

--- 计时器ID
local updateTimerId = nil

--- 获取或初始化玩家状态
local function getPlayerState(uin)
    if not playerStates[uin] then
        playerStates[uin] = {
            enabled = false,
            speed = CONFIG.defaultSpeed,
            -- 保存的位置和状态
            savedPos = nil,
            savedMoveType = nil,
            -- 当前飞行方向
            forward = false,
            backward = false,
            left = false,
            right = false,
            up = false,
            down = false,
            -- 摄像机角度
            yaw = 0,
            pitch = 0
        }
    end
    return playerStates[uin]
end

--- 保存玩家状态
local function savePlayerState(uin, state)
    local x, y, z = Actor:GetPosition(uin)
    state.savedPos = { x = x, y = y, z = z }
    state.savedMoveType = Actor:GetActorMovementMode(uin)
end

--- 恢复玩家状态
local function restorePlayerState(uin, state)
    if state.savedPos then
        Actor:SetPosition(uin, state.savedPos.x, state.savedPos.y, state.savedPos.z)
    end
    if state.savedMoveType then
        Actor:ChangActorMoveType(uin, state.savedMoveType)
    end
end

--- 启用自由相机
local function enableFreecam(uin)
    local state = getPlayerState(uin)

    if state.enabled then
        return
    end

    -- 保存当前状态
    savePlayerState(uin, state)

    -- 切换为飞行模式
    Player:ChangPlayerMoveType(uin, MoveType.Flying)

    -- 设置为飞行模式
    state.enabled = true

    -- 获取当前摄像机角度
    state.yaw = Actor:GetFaceYaw(uin) or 0
    state.pitch = Actor:GetFacePitch(uin) or 0

    Player:NotifyGameInfo2Self(uin, '§a[Freecam] 已启用自由相机模式')
    Player:NotifyGameInfo2Self(uin, '§e[WASD] 移动 [Space/Shift] 上下')
end

--- 禁用自由相机
local function disableFreecam(uin)
    local state = getPlayerState(uin)

    if not state.enabled then
        return
    end

    -- 恢复状态
    restorePlayerState(uin, state)

    state.enabled = false
    -- 重置方向状态
    state.forward = false
    state.backward = false
    state.left = false
    state.right = false
    state.up = false
    state.down = false

    Player:NotifyGameInfo2Self(uin, '§c[Freecam] 已禁用自由相机模式')
end

--- 计算移动方向
local function calcMovementDirection(state)
    local dx, dy, dz = 0, 0, 0

    -- 获取摄像机朝向
    local yaw = state.yaw

    -- 将角度转换为弧度
    local yawRad = math.rad(yaw)

    -- 计算前方向量（忽略 pitch，只在水平面移动）
    local forwardX = -math.sin(yawRad)
    local forwardZ = math.cos(yawRad)

    -- 计算右方向量
    local rightX = math.cos(yawRad)
    local rightZ = math.sin(yawRad)

    -- 根据按键状态累加方向
    if state.forward then
        dx = dx + forwardX
        dz = dz + forwardZ
    end
    if state.backward then
        dx = dx - forwardX
        dz = dz - forwardZ
    end
    if state.left then
        dx = dx - rightX
        dz = dz - rightZ
    end
    if state.right then
        dx = dx + rightX
        dz = dz + rightZ
    end
    if state.up then
        dy = dy + 1
    end
    if state.down then
        dy = dy - 1
    end

    -- 归一化
    local len = math.sqrt(dx * dx + dy * dy + dz * dz)
    if len > 0 then
        dx = dx / len
        dy = dy / len
        dz = dz / len
    end

    return dx, dy, dz
end

--- 更新玩家位置
local function updatePlayerPosition(uin, state)
    if not state.enabled then
        return
    end

    local dx, dy, dz = calcMovementDirection(state)

    -- 如果没有移动输入，跳过更新
    if dx == 0 and dy == 0 and dz == 0 then
        return
    end

    -- 获取当前位置
    local x, y, z = Actor:GetPosition(uin)

    -- 计算新位置
    local speed = state.speed * CONFIG.updateInterval
    local newX = x + dx * speed
    local newY = y + dy * speed
    local newZ = z + dz * speed

    -- 设置新位置
    Actor:SetPosition(uin, newX, newY, newZ)
end

--- 按键按下事件
function Freecam:onKeyDown(e)
    local uin = e.eventobjid
    local state = getPlayerState(uin)

    if not state.enabled then
        return
    end

    local key = e.vkey

    if key == KeyCode.W then
        state.forward = true
    elseif key == KeyCode.S then
        state.backward = true
    elseif key == KeyCode.A then
        state.left = true
    elseif key == KeyCode.D then
        state.right = true
    elseif key == KeyCode.Space then
        state.up = true
    elseif key == KeyCode.Shift then
        state.down = true
    end
end

--- 按键抬起事件
function Freecam:onKeyUp(e)
    local uin = e.eventobjid
    local state = getPlayerState(uin)

    if not state.enabled then
        return
    end

    local key = e.vkey

    if key == KeyCode.W then
        state.forward = false
    elseif key == KeyCode.S then
        state.backward = false
    elseif key == KeyCode.A then
        state.left = false
    elseif key == KeyCode.D then
        state.right = false
    elseif key == KeyCode.Space then
        state.up = false
    elseif key == KeyCode.Shift then
        state.down = false
    end
end

--- 玩家移动事件（更新摄像机角度）
function Freecam:onPlayerMove(e)
    local uin = e.eventobjid
    local state = getPlayerState(uin)

    if not state.enabled then
        return
    end

    -- 更新摄像机角度
    state.yaw = Actor:GetFaceYaw(uin) or state.yaw
    state.pitch = Actor:GetFacePitch(uin) or state.pitch
end

--- 聊天指令处理
function Freecam:onPlayerChat(e)
    local uin = e.eventobjid
    local content = e.content

    -- 解析指令
    local args = content:split(' ')
    local cmd = args[1]

    -- 检查是否是指令
    local isCommand = false
    for _, v in ipairs(CONFIG.commands) do
        if cmd == v then
            isCommand = true
            break
        end
    end

    if not isCommand then
        return
    end

    local state = getPlayerState(uin)

    -- 处理子指令
    local subCmd = args[2]

    if not subCmd or subCmd == 'toggle' then
        -- 切换状态
        if state.enabled then
            disableFreecam(uin)
        else
            enableFreecam(uin)
        end
    elseif subCmd == 'on' or subCmd == 'enable' then
        enableFreecam(uin)
    elseif subCmd == 'off' or subCmd == 'disable' then
        disableFreecam(uin)
    elseif subCmd == 'speed' then
        -- 设置速度
        local speed = tonumber(args[3])
        if speed then
            speed = math.min(math.max(speed, 1), 100)
            state.speed = speed
            Player:NotifyGameInfo2Self(uin, string.format('§a[Freecam] 飞行速度设置为 %.1f', speed))
        else
            Player:NotifyGameInfo2Self(uin, '§c[Freecam] 用法: /fc speed <数值>')
        end
    elseif subCmd == 'help' then
        -- 显示帮助
        Player:NotifyGameInfo2Self(uin, '§6=== Freecam 帮助 ===')
        Player:NotifyGameInfo2Self(uin, '§e/fc §7- 切换自由相机')
        Player:NotifyGameInfo2Self(uin, '§e/fc on|off §7- 启用/禁用')
        Player:NotifyGameInfo2Self(uin, '§e/fc speed <数值> §7- 设置速度(1-100)')
        Player:NotifyGameInfo2Self(uin, '§e/fc help §7- 显示帮助')
        Player:NotifyGameInfo2Self(uin, '§b操作: §7WASD移动 Space上升 Shift下降')
    else
        Player:NotifyGameInfo2Self(uin, '§c[Freecam] 未知指令，使用 /fc help 查看帮助')
    end
end

--- 定时器触发事件（更新位置）
function Freecam:onTimerTick(e)
    -- 检查是否是我们的定时器
    if updateTimerId and e.timerid == updateTimerId then
        for uin, state in pairs(playerStates) do
            if state.enabled then
                updatePlayerPosition(uin, state)
            end
        end
    end
end

--- 玩家离开游戏
function Freecam:onPlayerLeave(e)
    local uin = e.eventobjid
    local state = getPlayerState(uin)

    if state.enabled then
        restorePlayerState(uin, state)
    end

    playerStates[uin] = nil
end

--- 脚本启动
function Freecam:OnStart()
    -- 注册事件
    self:AddTriggerEvent(TriggerEvent.PlayerInputKeyDown, self.onKeyDown)
    self:AddTriggerEvent(TriggerEvent.PlayerInputKeyUp, self.onKeyUp)
    self:AddTriggerEvent(TriggerEvent.PlayerMoveOneBlockSize, self.onPlayerMove)
    self:AddTriggerEvent(TriggerEvent.PlayerNewInputContent, self.onPlayerChat)
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerLeaveGame, self.onPlayerLeave)

    -- 创建定时器用于位置更新
    updateTimerId = Timer:CreateTimer('Freecam_Update')
    if updateTimerId then
        -- 启动重复倒计时
        Timer:StartBackwardTimer(updateTimerId, CONFIG.updateInterval, true)
        -- 注册定时器事件
        self:AddTriggerEvent(TriggerEvent.MinitimerChange, self.onTimerTick)
        print('[Freecam] 定时器已创建: ' .. tostring(updateTimerId))
    else
        print('[Freecam] 警告: 无法创建定时器')
    end

    print('[Freecam] v3.0 已加载')
    print('[Freecam] 使用 /fc 或 /freecam 来切换自由相机模式')
end

return Freecam
