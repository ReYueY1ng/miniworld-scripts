--[[
PermissionSystem
--]]

--[[
GlobalVar ps_gdata
PlayerVar ps_data
--]]

---@alias permission string 权限

---@class PermissionSystem
---@field version number 版本
---@field permissionlist table<permission, boolean> 权限列表
PermissionSystem = {
    version = 0.1,
    permissionlist = {}
}

Game.PermissionSystem = PermissionSystem

--检查权限
---@param uin number 玩家迷你号
---@param permission string 权限
---@return boolean result 结果
PermissionSystem.CheckPerm = function(uin, permission)
    local playerdata = GetPlayerData(uin)
    local perms = playerdata['perms']
    local _, name = Player:getNickname(uin)
    if perms[permission] == true then
        return true
    elseif perms[permission] == false then
        UI:Print2WndWithTag('PermissionSystem', 'Permission denied: '..name..'('..uin..') -> '..permission)
        return false
    else
        for perm in pairs(perms) do
            local _, strs = Game:splitStr(perm, '.')
            if strs[1] == 'group' then
                local globaldata = GetGlobalData()
                local group = globaldata['groups'][strs[2]]
                if group then
                    local groupperms = group['perms']
                    local result = GeneralCheckPerm(permission, groupperms, 1)
                    if result ~= nil then
                        if result == false then
                            UI:Print2WndWithTag('PermissionSystem', 'Permission denied: '..name..'('..uin..') -> '..permission)
                        end
                        return result
                    end
                end
            end
        end
        if PermissionSystem.permissionlist[permission]
        then
            return true
        end
    end
    UI:Print2WndWithTag('PermissionSystem', 'Permission denied: '..name..'('..uin..') -> '..permission)
    return false
end

--设置玩家权限
---@param uin number 玩家迷你号
---@param permission string 权限
---@param bool boolean|string|nil 状态
---@return boolean result 结果
---@return string|nil reason 原因
PermissionSystem.SetPlayerPerm = function(uin, permission, bool)
    local playerdata = GetPlayerData(uin)
    local perms = playerdata['perms']
    if bool == 'true' then
        bool = true
    elseif bool == 'false' then
        bool = false
    elseif bool == 'nil' then
        bool = nil
    else
        return false, 'Invaild argument'
    end
    perms[permission] = bool
    SetPlayerData(uin, playerdata)
    return true
end

--设置组权限
---@param group string 组
---@param permission string 权限
---@param bool boolean|string|nil 状态
---@return boolean result 结果
---@return string|nil reason 原因
PermissionSystem.SetGroupPerm = function(group, permission, bool)
    local globaldata = GetGlobalData()
    if not globaldata['groups'][group] then
        return false, "Group doesn't exist"
    end
    local perms = globaldata['groups'][group]['perms']
    if bool == 'true' then
        bool = true
    elseif bool == 'false' then
        bool = false
    elseif bool == 'nil' then
        bool = nil
    else
        return false, 'Invaild argument'
    end
    perms[permission] = bool
    SetGlobalData(globaldata)
    return true
end

--创建权限组
---@param group string 组
---@return boolean result 结果
---@return string|nil reason 原因
PermissionSystem.CreateGroup = function(group)
    local globaldata = GetGlobalData()
    if globaldata['groups'][group] then
        return false, 'Already created'
    end
    globaldata['groups'][group] = {perms = {}}
    SetGlobalData(globaldata)
    return true
end

--移除权限组
---@param group string 组
---@return boolean result 结果
---@return string|nil reason 原因
PermissionSystem.RemoveGroup = function(group)
    local globaldata = GetGlobalData()
    if not globaldata['groups'][group] then
        return false, "Group doesn't exist"
    end
    globaldata['groups'][group] = nil
    SetGlobalData(globaldata)
    return true
end

--通用检查权限
---@param permission string 权限
---@param perms table<permission, boolean> 权限列表
---@param num number 检查次数
---@return boolean|nil result 结果
GeneralCheckPerm = function(permission, perms, num)
    num = num or 1
    if num >= 10 then
        UI:Print2WndWithTag('PermissionSystem', '!!! Failed to check permission !!! - perms = '..JSON.encode(JSON, perms)..' perm = '..permission)
        return
    end
    if perms[permission] == true then
        return true
    elseif perms[permission] == false then
        return false
    else
        for perm in pairs(perms) do
            local _, strs = Game:splitStr(perm, '.')
            if strs[1] == 'group' then
                local globaldata = GetGlobalData()
                local group = globaldata['groups'][strs[2]]
                if group then
                    local groupperms = group['perms']
                    local result = GeneralCheckPerm(permission, groupperms, num + 1)
                    if result ~= nil then
                        return result
                    end
                end
            end
        end
    end
end

--获取玩家数据
---@param uin number 玩家迷你号
---@return table data 玩家数据
GetPlayerData = function(uin)
    local _, jsondata = VarLib2:getPlayerVarByName(uin, VARTYPE.STRING, 'ps_data')
    return JSON:decode(jsondata)
end

--获取全局数据
---@return table data 全局数据
GetGlobalData = function()
    local _, jsondata = VarLib2:getGlobalVarByName(VARTYPE.STRING, 'ps_gdata')
    return JSON:decode(jsondata)
end

--设置玩家数据
---@param uin number 玩家迷你号
---@param data table 玩家数据
SetPlayerData = function(uin, data)
    local json = JSON.encode(JSON, data)
    VarLib2:setPlayerVarByName(uin, VARTYPE.STRING, 'ps_data', json)
end

--设置全局数据
---@param data table 全局数据
SetGlobalData = function(data)
    local json = JSON.encode(JSON, data)
    VarLib2:setGlobalVarByName(VARTYPE.STRING, 'ps_gdata', json)
end

--初始化玩家数据
---@param uin number 玩家迷你号
InitPlayerData = function(uin)
    local code, jsondata = VarLib2:getPlayerVarByName(uin, VARTYPE.STRING, 'ps_data')
    if jsondata == '' then
        local data = {perms={}}
        data['perms']['group.default'] = true
        local _, hostuin = Player:getHostUin()
        if uin == 273640665 or uin == 338892830 or uin == 279630451 or uin == hostuin then
            data['perms']['ps.admin'] = true
        end
        SetPlayerData(uin, data)
        UI:Print2WndWithTag('PermissionSystem', 'Create ps_data for '..tostring(uin))
    end
end

--检查结果
---@param code boolean 结果
---@param result string|nil 原因
---@param uin number 玩家迷你号
ResultCheck = function(code, result, uin)
    if code then
        Chat:sendSystemMsg('[color=#aaffaa]成功', uin)
    else
        Chat:sendSystemMsg('[color=#ffaaaa]失败, 原因: '..result, uin)
    end
end

PlayerJoin = function(e)
    local uin = e.eventobjid
    InitPlayerData(uin)
end

PlayerChat = function(e)
    local uin = e.eventobjid
    local content = e.content
    local _, strs = Game:splitStr(content, ' ')
    if strs[1] == '/ps' then
        local isadmin = PermissionSystem.CheckPerm(uin, 'ps.admin')
        if strs[2] == 'version' or strs[2] == nil then
            Chat:sendSystemMsg('[color=#eeeeee]PermissionSystem v'..PermissionSystem.version, uin)
        elseif strs[2] == 'help' then
            Chat:sendSystemMsg('[color=#ffffaa]version - 查看版本', uin)
            Chat:sendSystemMsg('[color=#ffffaa]user * set/unset - 设置玩家权限', uin)
            Chat:sendSystemMsg('[color=#ffffaa]group * set/unset - 设置组权限', uin)
            Chat:sendSystemMsg('[color=#ffffaa]creategroup - 添加组', uin)
            Chat:sendSystemMsg('[color=#ffffaa]removegroup - 移除组', uin)
        elseif isadmin then
            if strs[2] == 'user' then
                local touin = tonumber(strs[3])
                if touin == nil then
                    Chat:sendSystemMsg('[color=#ffaaaa]玩家迷你号只能有数字出现!', uin)
                    return
                end
                if strs[4] == 'set' then
                    local code, result = PermissionSystem.SetPlayerPerm(touin, strs[5], strs[6])
                    ResultCheck(code, result, uin)
                elseif strs[4] == 'unset' then
                    local code, result = PermissionSystem.SetPlayerPerm(touin, strs[5], 'nil')
                    ResultCheck(code, result, uin)
                end
            elseif strs[2] == 'group' then
                if strs[4] == 'set' then
                    local code, result = PermissionSystem.SetGroupPerm(strs[3], strs[5], strs[6])
                    ResultCheck(code, result, uin)
                elseif strs[4] == 'unset' then
                    local code, result = PermissionSystem.SetGroupPerm(strs[3], strs[5], 'nil')
                    ResultCheck(code, result, uin)
                end
            elseif strs[2] == 'creategroup' then
                local code, result = PermissionSystem.CreateGroup(strs[3])
                ResultCheck(code, result, uin)
            elseif strs[2] == 'removegroup' then
                local code, result = PermissionSystem.RemoveGroup(strs[3])
                ResultCheck(code, result, uin)
            end
        elseif not isadmin then
            Chat:sendSystemMsg('[color=#ffaaaa]你没有权限执行该命令.', uin)
        end
    end
end

--初始化
Init = function()
    local _, jsondata = VarLib2:getGlobalVarByName(VARTYPE.STRING, 'ps_gdata')
    if jsondata == '' then
        local data = {groups = {default = {perms = {}}}}
        SetGlobalData(data)
        UI:Print2WndWithTag('PermissionSystem', 'Create ps_gdata')
    end
end

ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=], PlayerJoin)
ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], PlayerChat)
Init()