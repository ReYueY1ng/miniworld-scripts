---@class Leaderboard: UIComponent
---@field uiid string 页面id
---@field leaderboardList CustomLeaderBoard[] 排行榜列表
---@field tmpPlayerData TempPlayerData[] 临时玩家数据
---@field cloudKVRefreshDelay number 全服排行榜刷新间隔
---@field moveIndex integer 元件移动开始索引
---@field boardElementNum integer 元件显示数量
local Leaderboard = {}

---@class TempPlayerData
---@field opened boolean 是否打开ui
---@field select integer 选择排行榜
---@field dirty boolean 数据已更新但未刷新UI
---@field barElements string[] 选择栏克隆元件列表
---@field boardElements {id: string, leader: integer, name: string, score: number, displayedDataIndex: integer}[] 排行榜克隆元件列表
---@field lastScrollIndex number 上次滚动的数据起始索引
---@field scrollTask Task

---@class CustomLeaderBoard
---@field name string 名称
---@field type LeaderboardType 类型
---@field varID string 变量id
---@field maxNum integer 最大条数
---@field refreshDelay number 刷新间隔(秒)
---@field refreshMode RefreshMode 刷新模式
---@field pipelineId string 流水线ID(仅Pipeline模式)

---@enum LeaderboardType
local LeaderboardType = {
    PlayerVar = 1,
    RoomKV = 2,
    CloudKV = 3
}

---@enum RefreshMode
local RefreshMode = {
    Fixed = 1,
    Pipeline = 2
}

local LeaderboardTypeEnum = Mini.Enum({
    PlayerVar = { sort = 1, value = LeaderboardType.PlayerVar, displayName = '玩家变量' },
    RoomKV = { sort = 2, value = LeaderboardType.RoomKV, displayName = '房间排行榜' },
    CloudKV = { sort = 3, value = LeaderboardType.CloudKV, displayName = '全服排行榜' }
})

local RefreshModeEnum = Mini.Enum({
    Fixed = { sort = 1, value = RefreshMode.Fixed, displayName = '固定间隔' },
    Pipeline = { sort = 2, value = RefreshMode.Pipeline, displayName = '流水线' }
})

---@enum LeaderBoardUIElements
local LeaderboardUIElements = {
    main = "7658228917300325593-137751_1",
    close = '7658228917300325593-137751_9',
    barscroll = '7658228917300325593-137751_10',
    bar = '7658228917300325593-137751_11',
    barname = '7658228917300325593-137751_12',
    boardscroll = '7658228917300325593-137751_16',
    board = '7658228917300325593-137751_15',
    boardleader = '7658228917300325593-137751_17',
    boardname = '7658228917300325593-137751_18',
    boardscore = '7658228917300325593-137751_19',
    nodata = '7658228917300325593-137751_21',
    boardscrolllimit = '7658228917300325593-137751_37',
    scaleboard = '7658228917300325593-137751_43'
}

Leaderboard.propertys = {
    cloudKVRefreshDelay = {
        displayName = '全服排行榜刷新间隔',
        tips = '建议设为 60s 为其他调用预留次数\n每分钟请求上限: 5 + numPlayers × 2',
        type = Mini.Number,
        sort = 1,
        format = "%.0fs",
        style = ComponentUIStyle.NumberButton,
        default = 60,
        minValue = 10
    },
    moveIndex = {
        displayName = '元件移动开始索引',
        tips = '当滚动容器滚动到大于某行时才开始移动元件',
        type = Mini.Number,
        sort = 2,
        format = "%.0f",
        style = ComponentUIStyle.NumberButton,
        default = 3,
    },
    boardElementNum = {
        displayName = '元件显示数量',
        type = Mini.Number,
        sort = 3,
        format = "%.0f",
        style = ComponentUIStyle.NumberButton,
        default = 20
    },
    leaderboardList = {
        displayName = '排行榜列表',
        type = Mini.Array,
        sort = 4,
        itemType = Mini.CustomData,
        customDisplayName = '排行榜',
        customDef = {
            name = {
                displayName = '名称',
                type = Mini.String,
                sort = 1,
                default = '排行榜'
            },
            type = {
                displayName = '类型',
                tips = '玩家变量: 以玩家变量进行排行\n房间排行榜: 没有上传云变量的排行榜\n全服排行榜: 上传云变量的排行榜',
                type = LeaderboardTypeEnum,
                enumDef = LeaderboardTypeEnum,
                sort = 2,
                default = LeaderboardType.PlayerVar
            },
            varID = {
                displayName = '变量id',
                type = Mini.String,
                sort = 3
            },
            maxNum = {
                displayName = '最大条数',
                type = Mini.Number,
                sort = 4,
                format = "%.0f条",
                style = ComponentUIStyle.NumberButton,
                default = 10
            },
            refreshMode = {
                displayName = '刷新模式',
                tips = '固定间隔: 每隔固定时间独立刷新\n流水线: 同一流水线内的排行榜依次刷新',
                type = RefreshModeEnum,
                enumDef = RefreshModeEnum,
                sort = 5,
                default = RefreshMode.Fixed,
            },
            pipelineId = {
                displayName = '流水线ID',
                tips = '相同ID的排行榜会在同一流水线中依次刷新',
                type = Mini.String,
                sort = 6,
                default = 'default',
                showRule = {
                    { property = "refreshMode", values = { RefreshModeEnum.Pipeline } }
                }
            },
            refreshDelay = {
                displayName = '刷新间隔',
                type = Mini.Number,
                sort = 7,
                format = "%.0fs",
                style = ComponentUIStyle.NumberButton,
                default = 5,
                minValue = 1
            },
        }
    }
}

Leaderboard.openFnArgs = {}

---刷新单个排行榜
---@param index integer 排行榜索引
function Leaderboard:refreshSingle(index)
    local lb = self.leaderboardList[index]
    if not lb then return end

    if lb.type == LeaderboardType.PlayerVar then
        local cacheLB = {}
        local players = {}
        for _, uin in ipairs(World:GetAllPlayers()) do
            local name = Player:GetNickname(uin)
            local score = Data:GetValue(lb.varID, uin)
            cacheLB[#cacheLB + 1] = { uin = uin, name = name, score = score }
            players[uin] = { name = name, score = score }
        end
        table.sort(cacheLB, function(a, b)
            return a.score > b.score
        end)
        for leader, data in ipairs(cacheLB) do
            players[data.uin].leader = leader
        end
        local result = { players = players }
        local n = math.min(lb.maxNum, #cacheLB)
        for i = 1, n do
            result[i] = cacheLB[i]
        end
        self.cachedLeaderBoardList[index] = result
    else
        Data.Map:GetNumValuesAndCallback(lb.varID, nil, lb.maxNum, false, function(code, num, ascending, datas)
            if code == ErrorCode.OK then
                local cacheLB = { players = {} }
                for i, data in ipairs(datas) do
                    ---@diagnostic disable-next-line: param-type-mismatch
                    local name = json.decode(data.info).name
                    local score = data.v
                    cacheLB[i] = { uin = data.k, name = name, score = score }
                    cacheLB.players[data.k] = { name = name, score = score, leader = i }
                end
                self.cachedLeaderBoardList[index] = cacheLB
                for uin, tmpdata in pairs(self.tmpPlayerData) do
                    if tmpdata.select == index then
                        if tmpdata.opened then
                            self:refreshUI(uin)
                            self:refreshBoardScroll(uin, true)
                        else
                            tmpdata.dirty = true
                        end
                    end
                end
            else
                printError('[Leaderboard] Failed to fetch leaderboard ' .. lb.name .. ': ' .. tostring(code))
            end
        end)
    end
end

---刷新变量排行榜
function Leaderboard:refreshPlayerVar()
    for index, lb in ipairs(self.leaderboardList) do
        if lb.type == LeaderboardType.PlayerVar then
            local cacheLB = {}
            local players = {}
            for _, uin in ipairs(World:GetAllPlayers()) do
                local name = Player:GetNickname(uin)
                local score = Data:GetValue(lb.varID, uin)
                cacheLB[#cacheLB + 1] = { uin = uin, name = name, score = score }
                players[uin] = { name = name, score = score }
            end
            table.sort(cacheLB, function(a, b)
                return a.score > b.score
            end)
            for leader, data in ipairs(cacheLB) do
                players[data.uin].leader = leader
            end
            local result = { players = players }
            local n = math.min(lb.maxNum, #cacheLB)
            for i = 1, n do
                result[i] = cacheLB[i]
            end
            self.cachedLeaderBoardList[index] = result
        end
    end
end

---刷新KV排行榜
---@param lbType LeaderboardType
function Leaderboard:refreshKV(lbType)
    for index, lb in ipairs(self.leaderboardList) do
        if lb.type == lbType then
            Data.Map:GetNumValuesAndCallback(lb.varID, nil, lb.maxNum, false, function(code, num, ascending, datas)
                if code == ErrorCode.OK then
                    local cacheLB = { players = {} }
                    for i, data in ipairs(datas) do
                        ---@diagnostic disable-next-line: param-type-mismatch
                        local name = json.decode(data.info).name
                        local score = data.v
                        cacheLB[i] = { uin = data.k, name = name, score = score }
                        cacheLB.players[data.k] = { name = name, score = score, leader = i }
                    end
                    self.cachedLeaderBoardList[index] = cacheLB
                    for uin, tmpdata in pairs(self.tmpPlayerData) do
                        if tmpdata.select == index then
                            if tmpdata.opened then
                                self:refreshUI(uin)
                                self:refreshBoardScroll(uin, true)
                            else
                                tmpdata.dirty = true
                            end
                        end
                    end
                else
                    printError('[Leaderboard] Failed to fetch leaderboard ' .. lb.name .. ': ' .. tostring(code))
                end
            end)
        end
    end
end

---刷新普通排行榜
function Leaderboard:refreshNormal()
    self:refreshPlayerVar()
    self:refreshKV(LeaderboardType.RoomKV)
    for uin, tmpdata in pairs(self.tmpPlayerData) do
        if tmpdata.opened then
            self:refreshUI(uin)
            self:refreshBoardScroll(uin, true)
        else
            tmpdata.dirty = true
        end
    end
end

function Leaderboard:refreshUI(uin, ignorestatus)
    local tmpdata = self.tmpPlayerData[uin]
    if not tmpdata.opened and not ignorestatus then
        return
    end

    local lbsettings = self.leaderboardList[tmpdata.select]
    local lb = self.cachedLeaderBoardList[tmpdata.select]
    local name = Player:GetNickname(uin)
    local score, leader

    if lb.players and lb.players[uin] then
        score = lb.players[uin].score
        leader = tostring(lb.players[uin].leader)
    elseif lbsettings.type == LeaderboardType.PlayerVar then
        score = Data:GetValue(lbsettings.varID, uin)
        leader = tostring(lbsettings.maxNum) .. '+'
    else
        local code, _, value, index = Data.Map:GetValueAndBlock(lbsettings.varID, nil, uin)
        if code == ErrorCode.OK then
            score = value
            leader = tostring(index)
        elseif code == ErrorCode.KV_OP_NO_VAL then
            printError('[Leaderboard] Player ' ..
                tostring(uin) .. "'s data is not in the leaderboard " .. lbsettings.varID)
            score = -1
            leader = '-1'
        else
            printError('[Leaderboard] Fetch player ' ..
                tostring(uin) .. "'s data from the leaderboard " .. lbsettings.varID .. ' failed: ' .. tostring(code))
            score = -1
            leader = '-1'
        end
        if not lb.players then
            lb.players = {}
        end
        lb.players[uin] = { name = name, score = score, leader = leader }
    end
    CustomUI:SetText(uin, self.uiid, LeaderboardUIElements.boardleader, leader)
    CustomUI:SetText(uin, self.uiid, LeaderboardUIElements.boardname, name)
    CustomUI:SetText(uin, self.uiid, LeaderboardUIElements.boardscore, tostring(score))
    if #lb == 0 then
        CustomUI:HideElement(uin, self.uiid, LeaderboardUIElements.boardscroll)
        CustomUI:ShowElement(uin, self.uiid, LeaderboardUIElements.nodata)
    else
        CustomUI:ShowElement(uin, self.uiid, LeaderboardUIElements.boardscroll)
        CustomUI:HideElement(uin, self.uiid, LeaderboardUIElements.nodata)
    end
    self:refreshBoardScroll(uin)
end

---更新排行榜元件内容（带缓存）
---@param uin number 玩家ID
---@param elem table 元件数据
---@param dataIndex number 数据索引
---@param visible boolean 是否可见
function Leaderboard:updateBoardElement(uin, elem, dataIndex, visible)
    if not visible then
        if elem.visible ~= false then
            CustomUI:HideElement(uin, self.uiid, elem.id)
            elem.visible = false
        end
        return
    end
    if elem.visible ~= true then
        CustomUI:ShowElement(uin, self.uiid, elem.id)
        elem.visible = true
    end
    if elem.displayedDataIndex == dataIndex then
        return
    end
    local lb = self.cachedLeaderBoardList[self.tmpPlayerData[uin].select]
    if not lb or dataIndex < 1 or dataIndex > #lb then
        return
    end
    local data = lb[dataIndex]
    local leader = tostring(data.leader or dataIndex)
    local name = data.name or ''
    local score = tostring(data.score or 0)
    if elem.leader ~= leader then
        CustomUI:SetText(uin, self.uiid, elem.id .. '.' .. LeaderboardUIElements.boardleader, leader)
        elem.leader = leader
    end
    if elem.name ~= name then
        CustomUI:SetText(uin, self.uiid, elem.id .. '.' .. LeaderboardUIElements.boardname, name)
        elem.name = name
    end
    if elem.score ~= score then
        CustomUI:SetText(uin, self.uiid, elem.id .. '.' .. LeaderboardUIElements.boardscore, score)
        elem.score = score
    end
    elem.displayedDataIndex = dataIndex
end

---刷新排行榜滚动列表（虚拟滚动）
---原理：20个元件循环使用，当滚动到特定位置时移动元件并刷新内容
---@param uin number 玩家ID
---@param force boolean|nil 强制刷新所有元件
function Leaderboard:refreshBoardScroll(uin, force)
    local tmpdata = self.tmpPlayerData[uin]
    local lb = self.cachedLeaderBoardList[tmpdata.select]
    if not lb or #lb == 0 then return end

    local boardScrollY = CustomUI:GetElementAttrValue(uin, LeaderboardUIElements.boardscroll, ElementAttr.ScrollPosition)
        .y
    local currentIndex = math.floor(boardScrollY / 36) + 1
    if currentIndex < 1 then currentIndex = 1 end

    local lastIndex = tmpdata.lastScrollIndex or 1
    local diff = currentIndex - lastIndex

    print('[Scroll] y=' .. boardScrollY .. ' last=' .. lastIndex .. ' cur=' .. currentIndex .. ' diff=' .. diff)

    if force then
        for i, elem in ipairs(tmpdata.boardElements) do
            elem.displayedDataIndex = -1
            local dataIndex = currentIndex + i - 1
            self:updateBoardElement(uin, elem, dataIndex, dataIndex <= #lb)
            CustomUI:SetPosition(uin, self.uiid, elem.id, 2, 2 + 36 * (i - 1))
        end
        tmpdata.lastScrollIndex = currentIndex
        return
    end

    --if diff == 0 then return end
    if currentIndex <= self.moveIndex then
        currentIndex = 1
    else
        currentIndex = currentIndex - self.moveIndex
    end
    local diff = currentIndex - lastIndex
    if diff == 0 then return end

    local elemCount = #tmpdata.boardElements
    if diff > elemCount then
        tmpdata.lastScrollIndex = currentIndex
        for i, elem in ipairs(tmpdata.boardElements) do
            local dataIndex = currentIndex + i - 1
            self:updateBoardElement(uin, elem, dataIndex, dataIndex >= 1 and dataIndex <= #lb)
            if dataIndex >= 1 and dataIndex <= #lb then
                CustomUI:SetPosition(uin, self.uiid, elem.id, 2, 2 + 36 * (dataIndex - 1))
            end
        end
        return
    end
    if diff < -elemCount then
        tmpdata.lastScrollIndex = currentIndex
        for i, elem in ipairs(tmpdata.boardElements) do
            local dataIndex = currentIndex + i - 1
            self:updateBoardElement(uin, elem, dataIndex, dataIndex >= 1 and dataIndex <= #lb)
            if dataIndex >= 1 and dataIndex <= #lb then
                CustomUI:SetPosition(uin, self.uiid, elem.id, 2, 2 + 36 * (dataIndex - 1))
            end
        end
        return
    end

    if diff > 0 then
        for i = 1, diff do
            local elem = table.remove(tmpdata.boardElements, 1)
            table.insert(tmpdata.boardElements, elem)
            local newDataIndex = currentIndex + elemCount - diff + i - 1
            self:updateBoardElement(uin, elem, newDataIndex, newDataIndex >= 1 and newDataIndex <= #lb)
        end
    else
        for i = -diff, 1, -1 do
            local elem = table.remove(tmpdata.boardElements)
            table.insert(tmpdata.boardElements, 1, elem)
            local newDataIndex = currentIndex + i - 1
            self:updateBoardElement(uin, elem, newDataIndex, newDataIndex >= 1 and newDataIndex <= #lb)
        end
    end

    for i, elem in ipairs(tmpdata.boardElements) do
        local dataIndex = currentIndex + i - 1
        --self:updateBoardElement(uin, elem, dataIndex, dataIndex >= 1 and dataIndex <= #lb)
        if dataIndex >= 1 and dataIndex <= #lb then
            CustomUI:SetPosition(uin, self.uiid, elem.id, 2, 2 + 36 * (dataIndex - 1))
        end
    end

    tmpdata.lastScrollIndex = currentIndex
end

function Leaderboard:OnPlayerJoin(e)
    local uin = e.eventobjid
    local tmpdata = {
        opened = false,
        select = 1,
        dirty = false,
        barElements = {},
        boardElements = {},
        lastScrollIndex = 1
    }
    self.tmpPlayerData[uin] = tmpdata
    for i, lbsettings in ipairs(self.leaderboardList) do
        local elementid = CustomUI:CloneElement(uin, self.uiid, LeaderboardUIElements.bar)
        CustomUI:SetPosition(uin, self.uiid, elementid, 4 + 94 * (i - 1), 2)
        CustomUI:SetText(uin, self.uiid, elementid .. '.' .. LeaderboardUIElements.barname, lbsettings.name)
        CustomUI:ShowElement(uin, self.uiid, elementid)
        tmpdata.barElements[i] = elementid
        self:AddTriggerEvent(TriggerEvent.UIButtonClick, self.OnBarClick, elementid)
    end
    for i = 1, self.boardElementNum do
        local elementid = CustomUI:CloneElement(uin, self.uiid, LeaderboardUIElements.board)
        CustomUI:ChangeParent(uin, self.uiid, elementid, LeaderboardUIElements.boardscroll)
        CustomUI:SetPosition(uin, self.uiid, elementid, 2, 2 + 36 * (i - 1))
        tmpdata.boardElements[i] = { id = elementid, displayedDataIndex = -1, leader = -1, name = '', score = -1 }
    end
    CustomUI:SetPosition(uin, self.uiid, LeaderboardUIElements.boardscrolllimit, 0,
        2 + 36 * (self.leaderboardList[1].maxNum - 1))
    self:refreshUI(uin, true)
end

function Leaderboard:OnPlayerLeave(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    if tmpdata then
        if tmpdata.scrollTask then
            tmpdata.scrollTask:Cancel()
        end
        self.tmpPlayerData[uin] = nil
    end
end

function Leaderboard:OnScrollTouchBegin(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    if tmpdata.scrollTask then
        tmpdata.scrollTask:Cancel()
    end
    tmpdata.scrollTask = self:DoPeriodicTask(function()
        self:refreshBoardScroll(uin)
    end, 0)
end

function Leaderboard:OnScrollTouchEnd(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    if tmpdata.scrollTask then
        tmpdata.scrollTask:Cancel()
        tmpdata.scrollTask = self:DoPeriodicTask(function()
            self:refreshBoardScroll(uin)
        end, 0.04, 0, 100)
    end
end

function Leaderboard:OnScrollEnd(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    if tmpdata.scrollTask then
        tmpdata.scrollTask:Cancel()
        tmpdata.scrollTask = nil
    end
end

function Leaderboard:OnCloseClick(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    if tmpdata.opened then
        CustomUI:SmoothScaleTo(uin, self.uiid, LeaderboardUIElements.main, 0.5, 40, 40)
        CustomUI:HideElement(uin, self.uiid, LeaderboardUIElements.scaleboard, 20001, 0.5)
        CustomUI:SetTexture(uin, self.uiid, LeaderboardUIElements.close, "0_10433")
        tmpdata.opened = false
        --CustomUI:HideElement(uin, self.uiid, LeaderboardUIElements.main)
        if tmpdata.scrollTask then
            tmpdata.scrollTask:Cancel()
            tmpdata.scrollTask = nil
        end
    else
        CustomUI:SmoothScaleTo(uin, self.uiid, LeaderboardUIElements.main, 0.5, 300, 380)
        CustomUI:ShowElement(uin, self.uiid, LeaderboardUIElements.scaleboard, 10001, 0.5)
        CustomUI:SetTexture(uin, self.uiid, LeaderboardUIElements.close, "8_s_335224806622572550")
        return self:Open(uin)
    end
end

function Leaderboard:OnBarClick(e)
    local uin = e.eventobjid
    local tmpdata = self.tmpPlayerData[uin]
    local clickedElement = e.uielement
    for i, elementid in ipairs(tmpdata.barElements) do
        if clickedElement == elementid then
            if tmpdata.select ~= i then
                tmpdata.select = i
                tmpdata.lastScrollIndex = 1
                for _, elem in ipairs(tmpdata.boardElements) do
                    elem.displayedDataIndex = -1
                    elem.leader = -1
                    elem.name = ''
                    elem.score = -1
                end
                CustomUI:SetPosition(uin, self.uiid, LeaderboardUIElements.boardscrolllimit, 0,
                    2 + 36 * self.leaderboardList[i].maxNum)
                self:refreshUI(uin)
                self:refreshBoardScroll(uin, true)
            end
            break
        end
    end
end

function Leaderboard:Open(uin)
    local tmpdata = self.tmpPlayerData[uin]
    tmpdata.opened = true
    if tmpdata.dirty then
        self:refreshUI(uin)
        self:refreshBoardScroll(uin)
        tmpdata.dirty = false
    end
end

function Leaderboard:OnUIShow(e)
    local uin = e.eventobjid
    self:Open(uin)
end

function Leaderboard:OnStart()
    self.uiid = tostring(self:GetGameObjectId())
    self.tmpPlayerData = {}
    self.cachedLeaderBoardList = {}
    self.refreshTasks = {}
    for index, _ in ipairs(self.leaderboardList) do
        self.cachedLeaderBoardList[index] = { players = {} }
    end

    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerEnterGame, self.OnPlayerJoin)
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerLeaveGame, self.OnPlayerLeave)
    --self:AddTriggerEvent(TriggerEvent.UIShow, self.OnUIShow, self.uiid)
    self:AddTriggerEvent(TriggerEvent.UIButtonClick, self.OnCloseClick, LeaderboardUIElements.close)
    self:AddTriggerEvent(TriggerEvent.UIScrollPaneTouchBegin, self.OnScrollTouchBegin, LeaderboardUIElements.boardscroll)
    self:AddTriggerEvent(TriggerEvent.UIScrollPaneTouchEnd, self.OnScrollTouchEnd, LeaderboardUIElements.boardscroll)
    self:AddTriggerEvent(TriggerEvent.UIScrollPaneScrollEnd, self.OnScrollEnd, LeaderboardUIElements.boardscroll)

    -- 按流水线ID分组
    local pipelines = {}
    for index, lb in ipairs(self.leaderboardList) do
        if lb.refreshMode == RefreshMode.Pipeline then
            local pid = lb.pipelineId or 'default'
            if not pipelines[pid] then
                pipelines[pid] = {}
            end
            pipelines[pid][#pipelines[pid] + 1] = index
        end
    end

    -- 启动固定间隔刷新任务
    for index, lb in ipairs(self.leaderboardList) do
        if lb.refreshMode == RefreshMode.Fixed then
            self.refreshTasks[index] = self:DoPeriodicTask(function()
                self:refreshSingle(index)
            end, lb.refreshDelay)
        end
    end

    -- 启动流水线刷新任务
    for _, indices in pairs(pipelines) do
        self:ThreadWork(function()
            while true do
                for _, index in ipairs(indices) do
                    self:refreshSingle(index)
                    local lb = self.leaderboardList[index]
                    self:ThreadWait(lb.refreshDelay)
                end
            end
        end)
    end

    self.refreshCloudKVTask = self:DoPeriodicTask(function()
        return self:refreshKV(LeaderboardType.CloudKV)
    end, self.cloudKVRefreshDelay)
    print("[Leaderboard] Start Task")
end

function Leaderboard:OnDestroy()
    for _, task in pairs(self.refreshTasks) do
        task:Cancel()
    end
    self.refreshCloudKVTask:Cancel()
end

return Leaderboard
