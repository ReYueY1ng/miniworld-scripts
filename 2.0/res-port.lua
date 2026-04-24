--[[
ResPort

global var: res_data_json
--]]

--[[ Example Data
res_data = {resname = {authoruin = uin, authorname = name, posbeg = {x=x,y=y,z=z}, posend = {x=x,y=y,z=z}, member = {authoruin, uin2}, tppos = {x=x,y=y,z=z}, perms = {move=true}}, resid2 = {}}
resAreaData = {}
resAreaData[areaid] = resname
--]]

---@alias uin number 玩家迷你号
---@alias area_id number 区域 id
---@alias res_name string 领地名称
---@alias res_data table 领地数据

PermissionSystem = Game.PermissionSystem

---@class ResPort
---@field version number 版本
---@field resAreaData table<area_id, res_name> 区域 id 对应的领地列表
---@field resTempPlayerData table<uin, table> 玩家临时数据
---@field rangeLimit number 范围限制
---@field playerMaxRes number 玩家可创建领地限制
ResPort = {
    version = 0.3,
    rangeLimit = 100,
    playerMaxRes = 2,
    resAreaData = {},
    resTempPlayerData = {},
    ---@enum reasons
    reasons = {
        NOT_A_NUMBER = 'Something is not a number',
        RES_ALREADY_EXISTS = 'This res already exists',
        RES_NOT_EXISTS = 'Res does not exist',
        POSBEG_OR_POSEND_DO_NOT_EXIST = "Player's posbeg or posend do not exist",
        NOT_THE_RES_OWNER = 'Player is not the res owner',
        ALREADY_IN_THE_MENBER_LIST = 'Already in the res menber list',
        NOT_IN_THE_MENBER_LIST = 'Not in the res menber list',
        PLAYER_CANNOT_CREATE_MORE_RES = 'Player cannot create more res',
        RANGE_LIMIT = 'Triggered range limit',
        INVAILD_BOOLEAN = 'Invaild boolean',
        CANNOT_REMOVE_SELF = 'Player cannot remove himself'
    },
    ---@enum messages
    messages = {
        VERSION = '[color=#eeeeee]res-port v%s',
        NO_PERMISSION_TO_ENTER_RES = '[color=#ffaaaa]你没有权限进入领地 [color=#eeeeaa]%s .',
        ENTERED_RES = '[color=#eeeeee]你已进入 [color=#aaeeee]%s[/color] 的领地 [color=#eeeeaa]%s[/color] .',
        LEFT_RES = '[color=#eeeeee]你已离开 [color=#aaeeee]%s[/color] 的领地 [color=#eeeeaa]%s[/color] .',
        SUCCESS_CREATE_RES = '[color=#aaffaa]创建成功, 领地名字 [color=#eeeeaa]%s',
        PLAYER_CANNOT_CREATE_MORE_RES = '[color=#ffaaaa]你不能再创建更多领地了!',
        NOT_SELECT_POSBEG_OR_POSEND = '[color=#ffaaaa]未设置起始点或结束点!',
        POSBEG_INFO = '[color=#eeeeee]起始点: [color=#ffaaaa]X: %d [color=#aaffaa]Y: %d [color=#aaaaff]Z: %d',
        POSEND_INFO = '[color=#eeeeee]结束点: [color=#ffaaaa]X: %d [color=#aaffaa]Y: %d [color=#aaaaff]Z: %d',
        RANGE_LIMIT = '[color=#ffaaaa]范围不能超过 %d 格!',
        NOT_SELECT_RES = '[color=#ffaaaa]未选择领地!',
        NOT_THE_RES_OWNER = '[color=#ffaaaa]你不是该领地的所有者!',
        ASK_COMFIRM_REMOVE_RES = '[color=#ffaaaa]你确定要移除领地 [color=#eeeeaaa]%s[color=#ffaaaa] 吗? \n[color=#ffaaaa]输入 [color=#eeeeee]/res confirm[color=#ffaaaa] 以移除.',
        SUCCESS_REMOVE_RES = '[color=#aaffaa]已移除领地 [color=#eeeeaa]%s[color=#aaffaa] .',
        RES_NOT_EXISTS = '[color=#ffaaaa]该领地不存在.',
        NOT_ALLOWED_TO_TP_RES = '[color=#ffaaaa]你不允许传送到该领地.',
        WAIT_TP_TO_RES = '[color=#ffffaa]3s 后传送到 [color=#eeeeaa]%s[color=#ffffaa] .',
        SUCCESS_SET_TP_POS = '[color=#aaffaa]已设置传送点.',
        NOT_A_NUMBER = '[color=#ffaaaa]有些参数必须为数字!',
        INVAILD_BOOLEAN = '[color=#ffaaaa]无效的布尔值.',
        SUCCESS_SET_PERMISSION = '[color=#aaffaa]已将领地 [color=#eeeeaa]%s[color=#aaffaa] 的 [color=#ffaaff]%s[color=#aaffaa] 权限设置为 [color=#eeeeaa]%s[color=#aaffaa] .',
        SUCCESS_ADD_PLAYER_TO_RES = '[color=#aaffaa]已将玩家 [color=#aaeeee]%s[color=#aaffaa] 添加进领地 [color=#eeeeaa]%s[color=#aaffaa] 内.',
        ALREADY_IN_THE_MENBER_LIST = '[color=#ffaaaa]该玩家已经在领地内了.',
        NOT_IN_THE_MENBER_LIST = '[color=#ffaaaa]该玩家没有在领地内.',
        CANNOT_REMOVE_SELF = '[color=#ffaaaa]你不能移除你自己!',
        SUCCESS_REMOVE_PLAYER_FROM_RES = '[color=#aaffaa]已将玩家 [color=#aaeeee]%s[color=#aaffaa] 移除出领地 [color=#eeeeaa]%s[color=#aaffaa] 内.'
    }
}

Game.ResPort = ResPort

-- APIs

--设置领地起始点
---@param uin number 玩家迷你号
---@param x number x 坐标
---@param y number y 坐标
---@param z number z 坐标
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:setPosBeg (uin, x, y, z)
	if type(x) ~= 'number' or type(y) ~= 'number' or type(z) ~= 'number' then
		return false, self.reasons.NOT_A_NUMBER
	end
	self.resTempPlayerData[uin]['posbeg'] = {x=x,y=y,z=z}
	return true
end

--设置领地结束点
---@param uin number 玩家迷你号
---@param x number x 坐标
---@param y number y 坐标
---@param z number z 坐标
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:setPosEnd(uin, x, y, z)
	if type(x) ~= 'number' or type(y) ~= 'number' or type(z) ~= 'number' then
		return false, self.reasons.NOT_A_NUMBER
	end
	self.resTempPlayerData[uin]['posend'] = {x=x,y=y,z=z}
	return true
end

--创建领地
---@param uin number 玩家迷你号
---@param res_name string 领地名称
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:createRes(uin, res_name)
    local _, name = Player:getNickname(uin)
    local _, res_data = self.getData()
    if res_data[res_name] then
        return false, self.reasons.RES_ALREADY_EXISTS
    end
    local posbeg = self.resTempPlayerData[uin]['posbeg']
    local posend = self.resTempPlayerData[uin]['posend']
    if not(posbeg and posend) then
        return false, self.reasons.POSBEG_OR_POSEND_DO_NOT_EXIST
    end
    res_data[res_name] = {authoruin = uin, authorname = name, posbeg = posbeg, posend = posend, member = {uin}, tppos = posbeg, perms = {move=true, tp=true}}
    local _, areaid = Area:createAreaRectByRange(posbeg, posend)
    self.resAreaData[areaid] = res_name
    self.setData(res_data)
    return true
end

--移除领地
---@param uin number 玩家迷你号
---@param res_name string 领地名称
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:removeRes(uin, res_name)
    local area_id
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
        return false, self.reasons.NOT_THE_RES_OWNER
    end
    for k, v in pairs(self.resAreaData) do
        if v == res_name then
            area_id = k
            break
        end
    end
    if not area_id then
        UI:Print2WndWithTag('ResPort', "Could't find areaid??? res_name = "..res_name)
        area_id = 0
    end
    local _, playerlist = Area:getAreaPlayers(area_id)
    if playerlist and #playerlist > 0 then
	    for _, v in ipairs(playerlist) do
	        AreaOut({eventobjid = v, areaid = area_id})
	    end
    end
    self.resAreaData[area_id] = nil
    Area:destroyArea(area_id)
    res_data[res_name] = nil
    ResPort.setData(res_data)
    return true
end

--获取领地传送点
---@param res_name string 领地名称
---@return boolean result 结果
---@return string|nil reason 原因
---@return number|nil x x 坐标
---@return number|nil y y 坐标
---@return number|nil z z 坐标
function ResPort:getResTPPos(res_name)
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    end
    local x, y, z = res_data[res_name]['tppos']['x'], res_data[res_name]['tppos']['y'], res_data[res_name]['tppos']['z']
    return true, nil, x, y, z
end

--获取某领地数据
---@param res_name string 领地名称
---@return boolean result 结果
---@return string|nil reason 原因
---@return table|nil res_data 某领地数据
function ResPort:getResData(res_name)
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    end
    return true, nil, res_data[res_name]
end

--获取领地列表
---@return table res_list 领地列表
function ResPort:getResList()
    local _, res_data = self.getData()
    local i = 0
    local tab = {}
    for res_name in pairs(res_data) do
        tab[#tab+1] = res_name
        i = i + 1
    end
    return tab
end

--设置领地传送点
---@param uin number 玩家迷你号
---@param res_name string 领地名字
---@param x number x 坐标
---@param y number y 坐标
---@param z number z 坐标
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:setResTPPos(uin, res_name, x, y, z)
    local _, res_data = self.getData()
    if type(x) ~= 'number' or type(y) ~= 'number' or type(z) ~= 'number' then
		return false, self.reasons.NOT_A_NUMBER
	end
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
        return false, self.reasons.NOT_THE_RES_OWNER
    end
    res_data[res_name]['tppos'] = {x=x, y=y, z=z}
    return true
end

--设置领地权限
---@param uin number 玩家迷你号
---@param res_name string 领地名字
---@param perm string 权限名字
---@param boolean boolean 状态
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:setResPerm(uin, res_name, perm, boolean)
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
        return false, self.reasons.NOT_THE_RES_OWNER
    elseif type(boolean) ~= "boolean" then
        return false, self.reasons.INVAILD_BOOLEAN
    end
    res_data[res_name]['perms'][perm] = boolean
    return true
end

--向领地添加玩家
---@param uin number 玩家迷你号
---@param res_name string 领地名字
---@param touin number 目标玩家迷你号
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:addResMenber(uin, res_name, touin)
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
        return false, self.reasons.NOT_THE_RES_OWNER
    elseif TabFindValue(res_data[res_name]['member'], touin) then
        return false, self.reasons.ALREADY_IN_THE_MENBER_LIST
    end
    table.insert(res_data[res_name]['member'], touin)
    return true
end

--从领地移除玩家
---@param uin number 玩家迷你号
---@param res_name string 领地名字
---@param touin number 目标玩家迷你号
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort:delResMenber(uin, res_name, touin)
    local _, res_data = self.getData()
    if not res_data[res_name] then
        return false, self.reasons.RES_NOT_EXISTS
    elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
        return false, self.reasons.NOT_THE_RES_OWNER
    elseif not TabFindValue(res_data[res_name]['member'], touin) then
        return false, self.reasons.NOT_IN_THE_MENBER_LIST
    end
    for k, v in pairs(res_data[res_name]['member']) do
        if v == touin then
            table.remove(res_data[res_name]['member'], k)
            break
        end
    end
    return true
end

-- Utils

--获取领地数据
---@return boolean result 结果
---@return table res_data 领地数据
function ResPort.getData()
    local _, res_data_json = VarLib2:getGlobalVarByName(4, 'res_data_json')
    return pcall(JSON.decode, JSON, res_data_json)
end

--设置领地数据
---@param res_data table 领地数据
---@return boolean result 结果
---@return string|nil reason 原因
function ResPort.setData(res_data)
    local result, res_data_json = pcall(JSON.encode, JSON, res_data)
    if result then
        result = VarLib2:setGlobalVarByName(4, 'res_data_json', res_data_json)
        if result == 0 then
            return true
        else
            UI:Print2WndWithTag('ResPort', 'Failed to set data (setvar)')
            return false, 'Failed to set data (setvar)'
        end
    end
    UI:Print2WndWithTag('ResPort', 'Failed to set data (encode)')
    return false, 'Failed to set data (encode)'
end

--表查找值
---@param tbl table 表
---@param value any 值
---@return boolean result 结果
function TabFindValue(tbl, value)
    if tbl == nil then
        return false
    end
 
    for k, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

--检测 UBB
---@param str string 要检查的字符串
---@return string newstr 经过处理的字符串
function UBBCheck(str)
    local newstr = str
    local code = string.find(str, '[i]', 1, true)
    if code then
        newstr = newstr..' [/i]'
    end
    code = string.find(str, '[b]', 1, true)
    if code then
        newstr = newstr..'[/b]'
    end
    code = string.find(str, '[u]', 1, true)
    if code then
        newstr = newstr..'[/u]'
    end
    return newstr
end

-- Events

local function player_chat(e)
    local errorhandler = function(err)
        Chat:sendSystemMsg('[color=#ffaaaa][ERROR] [color=#eeeeee]'..err, e.eventobjid)
    end
    xpcall(function()
    local uin = e.eventobjid
    local content = e.content
    local _, strs = Game:splitStr(content, ' ')
    if strs[1] == '/res' then
        local temp_player_data = ResPort.resTempPlayerData
        if strs[2] == 'version' or strs[2] == nil then
            Chat:sendSystemMsg(string.format(ResPort.messages.VERSION, ResPort.version), uin)
        elseif strs[2] == 'select' then
            if strs[3] == 'posbeg' then
                local x = math.ceil(strs[4])
                local y = math.ceil(strs[5])
                local z = math.ceil(strs[6])
                ResPort:setPosBeg(uin, x, y, z)
            elseif strs[3] == 'posend' then
                local x = math.ceil(strs[4])
                local y = math.ceil(strs[5])
                local z = math.ceil(strs[6])
                ResPort:setPosEnd(uin, x, y, z)
            else
                local begx = temp_player_data[uin]['posbeg']['x']
                local begy = temp_player_data[uin]['posbeg']['y']
                local begz = temp_player_data[uin]['posbeg']['z']
                local endx = temp_player_data[uin]['posend']['x']
                local endy = temp_player_data[uin]['posend']['y']
                local endz = temp_player_data[uin]['posend']['z']
                Chat:sendSystemMsg(string.format(ResPort.messages.POSBEG_INFO, begx, begy, begz), uin)
                Chat:sendSystemMsg(string.format(ResPort.messages.POSEND_INFO, endx, endy, endz), uin)
            end
        elseif strs[2] == 'create' then
            local _, name = Player:getNickname(uin)
            local res_name = strs[3] or name
            local result, reason = ResPort:createRes(uin, res_name)
            if result then
                Chat:sendSystemMsg(string.format(ResPort.messages.SUCCESS_CREATE_RES, res_name), uin)
            elseif reason == ResPort.reasons.POSBEG_OR_POSEND_DO_NOT_EXIST then
                Chat:sendSystemMsg(ResPort.messages.NOT_SELECT_POSBEG_OR_POSEND, uin)
            elseif reason == ResPort.reasons.PLAYER_CANNOT_CREATE_MORE_RES then
                Chat:sendSystemMsg(ResPort.messages.PLAYER_CANNOT_CREATE_MORE_RES, uin)
            elseif reason == ResPort.reasons.RANGE_LIMIT then
                Chat:sendSystemMsg(string.format(ResPort.messages.RANGE_LIMIT, ResPort.rangeLimit), uin)
            end
        elseif strs[2] == 'remove' then
            local res_name = strs[3] or temp_player_data[uin]['inres']
            local _, res_data = ResPort.getData()
            if not res_name then
                Chat:sendSystemMsg(ResPort.messages.NOT_SELECT_RES, uin)
                return
            elseif res_data[res_name]['authoruin'] ~= uin and not PermissionSystem.CheckPerm(uin, 'res.admin') then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
                return
            end
            temp_player_data[uin]['confirm_remove_res'] = res_name
            temp_player_data[uin]['confirm'] = 'remove'
            res_name = UBBCheck(res_name)
            Chat:sendSystemMsg(string.format(ResPort.messages.ASK_COMFIRM_REMOVE_RES, res_name))
        elseif strs[2] == 'confirm' then
            local res_name = temp_player_data[uin]['confirm_remove_res']
            local result, reason = ResPort:removeRes(uin, res_name)
            if result then
                Chat:sendSystemMsg(string.format(ResPort.messages.SUCCESS_REMOVE_RES, res_name), uin)
            elseif reason == ResPort.reasons.RES_NOT_EXISTS then
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            elseif reason == ResPort.reasons.NOT_THE_RES_OWNER then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
            end
        elseif strs[2] == 'tp' then
            local res_name = strs[3]
            local _, res_data = ResPort.getData()
            if res_data[res_name] then
                if res_data[res_name]['perms']['move'] and res_data[res_name]['perms']['tp'] or findvalue(res_data[res_name]['member'], uin) or PermissionSystem.CheckPerm(uin, 'res.admin') then
                    local _, x, y, z = ResPort:getResTPPos(res_name)
                    Chat:sendSystemMsg(string.format(ResPort.messages.WAIT_TP_TO_RES, res_name), uin)
                    Trigger:wait(3)
                    Player:setPosition(uin, x, y, z)
                else
                    Chat:sendSystemMsg(ResPort.messages.NOT_ALLOWED_TO_TP_RES, uin)
                end
            else
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            end
        elseif strs[2] == 'list' then
            for k, v in ipairs(ResPort:getResList()) do
                Chat:sendSystemMsg('[color=#aaffaa]'..k..'. [color=#eeeeaa]'..v, uin)
            end
        elseif strs[2] == 'tpset' then
            local res_name = strs[3] or temp_player_data[uin]['inres']
            local _, x, y, z
            if strs[4] then
                x = tonumber(strs[4])
                y = tonumber(strs[5])
                z = tonumber(strs[6])
            else
                _, x, y, z = Actor:getPosition(uin)
            end
            if type(x) ~= 'number' or type(y) ~= 'number' or type(z) ~= 'number'
	        then
		        Chat:sendSystemMsg(ResPort.messages.NOT_A_NUMBER, uin)
                return
	        end
            local result, reason = ResPort:setResTPPos(uin, res_name, x, y, z)
            if reason == ResPort.reasons.RES_NOT_EXISTS
            then
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            elseif reason == ResPort.reasons.NOT_THE_RES_OWNER
            then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
            end
        elseif strs[2] == 'set' then
            local res_name, perm, bool
            if strs[5] then
                res_name = strs[3]
                perm = strs[4]
                bool = strs[5]
            else
                res_name = temp_player_data[uin]['inres']
                perm = strs[3]
                bool = strs[4]
            end
            if bool == 'true'then
                bool = true
            elseif bool == 'false' then
                bool = false
            else
                Chat:sendSystemMsg(ResPort.messages.INVAILD_BOOLEAN, uin)
                return
            end
            local result, reason = ResPort:setResPerm(uin, res_name, perm, bool)
            if result then
                Chat:sendSystemMsg(string.format(ResPort.messages.SUCCESS_SET_PERMISSION, UBBCheck(res_name), perm, tostring(bool)))
            elseif reason == ResPort.reasons.RES_NOT_EXISTS then
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            elseif reason == ResPort.reasons.NOT_THE_RES_OWNER then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
            end
        elseif strs[2] == 'padd' then
            local res_name, touin
            if strs[4] then
                res_name = strs[3]
                touin = tonumber(strs[4])
            else
                res_name = temp_player_data[uin]['inres']
                touin = tonumber(strs[3])
            end
            if type(touin) ~= "number" then
                Chat:sendSystemMsg(ResPort.messages.NOT_A_NUMBER, uin)
                return
            end
            local result, reason = ResPort:addResMenber(uin, res_name, touin)
            if result then
                local _, name = Player:getNickname(touin)
                Chat:sendSystemMsg(string.format(ResPort.messages.SUCCESS_ADD_PLAYER_TO_RES, UBBCheck(name), UBBCheck(res_name)))
            elseif reason == ResPort.reasons.RES_NOT_EXISTS then
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            elseif reason == ResPort.reasons.NOT_THE_RES_OWNER then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
            elseif reason == ResPort.reasons.ALREADY_IN_THE_MENBER_LIST then
                Chat:sendSystemMsg(ResPort.messages.ALREADY_IN_THE_MENBER_LIST, uin)
            end
        elseif strs[2] == 'pdel' then
            local res_name, touin
            if strs[4] then
                res_name = strs[3]
                touin = tonumber(strs[4])
            else
                res_name = temp_player_data[uin]['inres']
                touin = tonumber(strs[3])
            end
            if type(touin) ~= "number" then
                Chat:sendSystemMsg(ResPort.messages.NOT_A_NUMBER, uin)
                return
            end
            local result, reason = ResPort:delResMenber(uin, res_name, touin)
            if result then
                local _, name = Player:getNickname(touin)
                Chat:sendSystemMsg(string.format(ResPort.messages.SUCCESS_REMOVE_PLAYER_FROM_RES, UBBCheck(name), UBBCheck(res_name)))
            elseif reason == ResPort.reasons.RES_NOT_EXISTS then
                Chat:sendSystemMsg(ResPort.messages.RES_NOT_EXISTS, uin)
            elseif reason == ResPort.reasons.NOT_THE_RES_OWNER then
                Chat:sendSystemMsg(ResPort.messages.NOT_THE_RES_OWNER, uin)
            elseif reason == ResPort.reasons.NOT_IN_THE_MENBER_LIST then
                Chat:sendSystemMsg(ResPort.messages.NOT_IN_THE_MENBER_LIST, uin)
            elseif reason == ResPort.messages.CANNOT_REMOVE_SELF then
                Chat:sendSystemMsg(ResPort.messages.CANNOT_REMOVE_SELF, uin)
            end
        elseif strs[2] == 'help' then
            Chat:sendSystemMsg('[color=#ffffaa]version - 查看版本', uin)
            Chat:sendSystemMsg('[color=#ffffaa]create - 创建领地', uin)
            Chat:sendSystemMsg('[color=#ffffaa]select posbeg/posend - 设置起始点和结束点', uin)
            Chat:sendSystemMsg('[color=#ffffaa]remove - 移除领地', uin)
            Chat:sendSystemMsg('[color=#ffffaa]tp - 传送到领地', uin)
            Chat:sendSystemMsg('[color=#ffffaa]list - 领地列表', uin)
            Chat:sendSystemMsg('[color=#ffffaa]tpset - 设置传送点', uin)
            Chat:sendSystemMsg('[color=#ffffaa]set move/tp - 设置权限', uin)
            Chat:sendSystemMsg('[color=#ffffaa]padd - 添加玩家', uin)
            Chat:sendSystemMsg('[color=#ffffaa]pdel - 移除玩家', uin)
        end
    end
    end, errorhandler)
end

local function init()
    local result, res_data = ResPort.getData()
    if res_data == nil
    then
        UI:Print2WndWithTag('ResPort', "Create res_data")
        ResPort.setData({})
    elseif not result
    then
        UI:Print2WndWithTag('ResPort', "!!! Couldn't decode res_data_json !!!")
        local _, res_data_json = VarLib2:getGlobalVarByName(4, 'res_data_json')
        UI:Print2WndWithTag('ResPort', res_data_json)
    elseif result
    then
        for res_name, res in pairs(res_data) do
            if not res['perms']
            then
                res_data[res_name]['perms'] = {move=true, tp=true}
            end
            local _, area_id = Area:createAreaRectByRange(res['posbeg'], res['posend'])
            ResPort.resAreaData[area_id] = res_name
        end
        ResPort.setData(res_data)
    end
end

local function area_in(e)
    local uin = e.eventobjid
    local area_id = e.areaid
    local res_name = ResPort.resAreaData[area_id]
    if res_name
    then
        local _, res_data = ResPort.getData()
        local temp_player_data = ResPort.resTempPlayerData[uin]
        if not res_data[res_name]['perms']['move']
        then
            if not TabFindValue(res_data[res_name]['member'], uin) and not PermissionSystem.CheckPerm(uin, 'res.admin')
            then
                res_name = UBBCheck(res_name)
                Chat:sendSystemMsg(string.format(ResPort.messages.NO_PERMISSION_TO_ENTER_RES, res_name), uin)
                Player:setPosition(uin, temp_player_data['posx'], temp_player_data['posy'], temp_player_data['posz'])
                return
            end
        end
        temp_player_data['inres'] = res_name
        local res_author_name = UBBCheck(res_data[res_name]['authorname'])
        res_name = UBBCheck(res_name)
        Chat:sendSystemMsg(string.format(ResPort.messages.ENTERED_RES, res_author_name, res_name), uin)
    end
end

function AreaOut(e)
    local uin = e.eventobjid
    local area_id = e.areaid
    local res_name = ResPort.resAreaData[area_id]
    if res_name
    then
        local _, res_data = ResPort.getData()
        local temp_player_data = ResPort.resTempPlayerData[uin]
        if not res_data[res_name]['perms']['move']
        then
            if not findvalue(res_data[res_name]['member'], uin) and not PermissionSystem.CheckPerm(uin, 'res.admin')
            then
                return
            end
        end
        temp_player_data['inres'] = nil
        local res_author_name = UBBCheck(res_data[res_name]['authorname'])
        res_name = UBBCheck(res_name)
        Chat:sendSystemMsg(string.format(ResPort.messages.LEFT_RES, res_author_name, res_name), uin)
    end
end

local function player_move(e)
    local uin = e.eventobjid
    local temp_player_data = ResPort.resTempPlayerData
    temp_player_data[uin]['posx'] = e.x
    temp_player_data[uin]['posy'] = e.y
    temp_player_data[uin]['posz'] = e.z
end

local function player_join(e)
    local uin = e.eventobjid
    local temp_player_data = ResPort.resTempPlayerData
    temp_player_data[uin] = {}
end

ScriptSupportEvent:registerEvent([=[Player.AreaIn]=], area_in)
ScriptSupportEvent:registerEvent([=[Player.AreaOut]=], AreaOut)
ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], player_chat)
ScriptSupportEvent:registerEvent([=[Player.MoveOneBlockSize]=], player_move)
ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=], player_join)
init()