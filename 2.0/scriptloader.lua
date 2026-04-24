MoonLib = Game.MoonLib
if MoonLib then
    Logger = MoonLib.logger:new("ScriptLoader")
else
    printtag('ERROR', '(ScriptLoader) MoonLib was not loaded!')
    return false
end

---@class ScriptLoader
---@field version number 版本
---@field returnScriptList table<string, function> 脚本返回函数的列表
---@field loadedScriptList table<string, table> 已加载脚本列表
ScriptLoader = {
    version = 0.3,
    returnScriptList = {},
    loadedScriptList = {}
}

Game.ScriptLoader = ScriptLoader

local temp_player_data = {}

-- 加载脚本
---@param scriptstr string 脚本
---@param name string 脚本名称, \_\_FILE\_\_
---@param usereturnfunctoload boolean|nil 通过返回函数来加载
---@param loadby string|number|nil 加载者
---@param mod table|nil 插件环境, 默认全局, \_\_ssmod\_\_ 
---@param modpacketid number|nil 插件包ID, 默认全局, \_\_modpacketid\_\_
---@return boolean result 加载成功/失败
---@return any value 返回值
function ScriptLoader:loadScript(scriptstr, name, usereturnfunctoload, loadby, mod, modpacketid)
    if not scriptstr or type(scriptstr) ~= "string" then
        return false
    end

    name = name or tostring(#self.returnScriptList)
    mod = mod or {}
    mod['scriptloader'] = {
        version = self.version,
        script_name = name,
        load_by = loadby or nil,
    }

    if usereturnfunctoload then
        scriptstr = 'return function() \n'..scriptstr..' \nend'
        local func = LoadLuaScript(scriptstr, name)
        local returnedfunc = func(mod, modpacketid)
        if type(returnedfunc) ~= "function" then
            Logger:error('Failed to load script '..name..' : returnedfunc is not a function')
            return false, 'returnedfunc is not a function'
        end
        local results = {pcall(returnedfunc)}
        local concatresult, returnliststr
        if not results[1] then
            Logger:error('Failed to load script '..name..' : '..results[2])
            return false, results[2]
        else
            concatresult, returnliststr = pcall(table.concat, results, ', ', 2)
            if concatresult then
                Logger:info('Loaded script '..name..' : '..returnliststr)
            else
                Logger:info('Loaded script '..name..' (concat failed): '..tostring(results[2]))
            end
        end
        for _, v in ipairs(results) do
            if type(v) == "function" then
                self.returnScriptList[name] = v
            end
        end
        self.loadedScriptList[name] = {loadby = loadby}
        if concatresult then
            return results[1], returnliststr
        end
        return results[1], results[2]
    else
        local func = LoadLuaScript(scriptstr, name)
        local value = func(mod, modpacketid)
        Logger:info('Loaded script '..name..' : '..tostring(value))

        if type(value) == "function" then
            self.returnScriptList[name] = value
        end

        self.loadedScriptList[name] = {loadby = loadby}
        return true, value
    end
end

-- 以base64加载脚本
---@param scriptstr string 脚本
---@param name string 脚本名称, \_\_FILE\_\_
---@param usereturnfunctoload boolean|nil 通过返回函数来加载
---@param loadby string|number|nil 加载者
---@param mod table|nil 插件环境, 默认全局, \_\_ssmod\_\_ 
---@param modpacketid number|nil 插件包ID, 默认全局, \_\_modpacketid\_\_
function ScriptLoader:loadScriptBase64(scriptstr, name, usereturnfunctoload, loadby, mod, modpacketid)
    if not scriptstr or type(name) ~= "string" then
        return false
    end

    scriptstr = MoonLib.encoding.base64:decode(scriptstr)
    return self:loadScript(scriptstr, name, usereturnfunctoload, loadby, mod, modpacketid)
end

-- 执行函数
---@param scriptstr string 函数str
---@param usereturnfunctoload boolean|nil 通过返回函数来加载
---@param loadby string|number|nil 加载者
---@return boolean result 加载成功/失败
---@return any value 返回值
function ScriptLoader:execfunc(scriptstr, usereturnfunctoload, loadby)
    if not scriptstr then
        return false
    end

    local origscriptstr = scriptstr
    if usereturnfunctoload then
        scriptstr = 'return function() \n'..scriptstr..' \nend'
        local func = LoadLuaScript(scriptstr, origscriptstr)
        local returnedfunc = func({scriptloader = {version = self.version, load_by = loadby or nil}})
        if type(returnedfunc) ~= "function" then
            Logger:error('Failed to execute func '..origscriptstr..' : returnedfunc is not a function')
            return false, 'returnedfunc is not a function'
        end
        local results = {pcall(returnedfunc)}
        local concatresult, returnliststr
        if not results[1] then
            Logger:error('Failed to execute func '..origscriptstr..' : '..results[2])
            return false, results[2]
        else
            concatresult, returnliststr = pcall(table.concat, results, ', ', 2)
            if concatresult then
                Logger:info('Executed func '..origscriptstr..' : '..returnliststr)
            else
                Logger:info('Executed func '..origscriptstr..' (concat failed): '..tostring(results[2]))
            end
        end
        if concatresult then
            return results[1], returnliststr
        end
        return results[1], results[2]
    else
        local func = LoadLuaScript(scriptstr, origscriptstr)
        local value = func({scriptloader = {version = self.version, load_by = loadby}})
        Logger:info('Executed func '..origscriptstr..' : '..tostring(value))
        return true, value
    end
end

-- 卸载脚本
---@param name string 脚本名称
---@return boolean result 卸载成功/失败
---@return string|nil reason 原因
function ScriptLoader:unloadScript(name)
    if type(name) ~= "string" then
        return false, 'Invaild name'
    end

    if ScriptLoader.loadedScriptList[name] then
        ScriptLoader.returnScriptList[name] = nil
        ScriptLoader.loadedScriptList[name] = nil
        Game:dispatchEvent(name..".Unload", {})
        Logger:info('Unloaded '..name)
        return true
    else
        return false, "Script has not loaded"
    end
end

local function OnPlayerChat(e)
    local uin = e.eventobjid
    local content = e.content
    local _, strs = Game:splitStr(content, ' ')
    if not temp_player_data[uin] then
        temp_player_data[uin] = {}
    end
    local pdata = temp_player_data[uin]
    if strs[1] == '/scriptloader' or strs[1] == '/sl' then
        if strs[2] == "loadencoded" then
            local name, scriptstr
            if strs[4] then
                name = strs[3]
                scriptstr = strs[4]
            else
                name = tostring(os.time())..'_'..tostring(math.random(0, 100))
                scriptstr = strs[3]
            end
            local result, value = ScriptLoader:loadScriptBase64(scriptstr, name, true, uin)
            if result then
                Chat:sendSystemMsg('[color=#aaffaa]Load success: '..tostring(value), uin)
            else
                Chat:sendSystemMsg('[color=#ffaaaa]Load failed: '..tostring(value), uin)
            end
        elseif strs[2] == 'load' then
            local scriptstr = table.concat(strs, '\n', 3)
            local result, value = ScriptLoader:execfunc(scriptstr, true, uin)
            if result then
                Chat:sendSystemMsg('[color=#aaffaa]Load success: '..tostring(value), uin)
            else
                Chat:sendSystemMsg('[color=#ffaaaa]Load failed: '..tostring(value), uin)
            end
        elseif strs[2] == 'importstart' then
            local name = strs[3] or tostring(os.time())..'_'..tostring(math.random(0, 100))
            pdata['importname'] = name
            pdata['importstrs'] = {}
            Chat:sendSystemMsg('[color=#aaffaa]ok, length = '..#table.concat(pdata['importstrs']), uin)
        elseif strs[2] == 'import' then
            local importstrs = pdata['importstrs']
            if not importstrs then
                Chat:sendSystemMsg('[color=#ffaaaa]have not started import', uin)
                return
            end
            importstrs[#importstrs+1] = strs[3]
            Chat:sendSystemMsg('[color=#aaffaa]ok, length = '..#table.concat(importstrs), uin)
        elseif strs[2] == 'importend' then
            local name = pdata['importname']
            if not name then
                Chat:sendSystemMsg('[color=#ffaaaa]have not started import', uin)
                return
            end
            local scriptstr = table.concat(pdata['importstrs'])
            local result, value = ScriptLoader:loadScriptBase64(scriptstr, name, true, uin)
            if result then
                Chat:sendSystemMsg('[color=#aaffaa]Load success: '..tostring(value), uin)
            else
                Chat:sendSystemMsg('[color=#ffaaaa]Load failed: '..tostring(value), uin)
            end
            pdata['importname'] = nil
            pdata['importstrs'] = nil
        elseif strs[2] == 'cancelimport' then
            pdata['importname'] = nil
            pdata['importstrs'] = nil
            Chat:sendSystemMsg('[color=#aaffaa]cancelled', uin)
        elseif strs[2] == 'help' then
            Chat:sendSystemMsg('[color=#ffffaa]load <func> - 执行函数')
            Chat:sendSystemMsg('[color=#ffffaa]loadencoded [name] <scriptstr> - 加载base64脚本')
            Chat:sendSystemMsg('[color=#ffffaa]importstart [name] - 开始分段导入base64脚本')
            Chat:sendSystemMsg('[color=#ffffaa]import <scriptstr> - 分段导入')
            Chat:sendSystemMsg('[color=#ffffaa]importend - 加载导入脚本')
            Chat:sendSystemMsg('[color=#ffffaa]cancelimport - 取消导入')
            Chat:sendSystemMsg('[color=#ffffaa]unload - 卸载脚本')
        elseif strs[2] == 'list' then
            local scriptlist = {}
            for k in pairs(ScriptLoader.loadedScriptList) do
                scriptlist[#scriptlist+1] = k
            end
            local scriptliststr = table.concat(scriptlist, ', ')
            Chat:sendSystemMsg('[color=#eeeeee]List: '..scriptliststr, uin)
        elseif strs[2] == 'version' or strs[2] == nil then
            Chat:sendSystemMsg('[color=#eeeeee]ScriptLoader v'..ScriptLoader.version)
        elseif strs[2] == 'unload' then
            local result , reason = ScriptLoader:unloadScript(table.concat(strs, ' ', 3 ))
            if result then
                Chat:sendSystemMsg('[color=#aaeeaa]Unload success')
            else
                Chat:sendSystemMsg('[color=#eeaaaa]Unload failed: '..reason)
            end
        end
    end
end

local function init()
    ScriptSupportEvent:registerEvent("Player.NewInputContent", OnPlayerChat)
    if type(Game.ScriptLoader_InitLoadScriptList) == "table" then
        Logger:info("Loading Scripts in InitLoadScriptList")
        for k, v in pairs(Game.ScriptLoader_InitLoadScriptList) do
            Logger:info("Loading "..k)
            ScriptLoader:loadScriptBase64(v["scriptstr"], k, v["usereturnfunctoload"] or true, "ServerInit", v["mod"], v["modpacketid"])
        end
        Logger:info("Loaded All Scripts!")
    else
        Logger:info("InitLoadScriptList is not a table, skipping")
    end
end

init()

return function ()
    for k, v in pairs(ScriptLoader.returnScriptList) do
        if type(v) == "function" then
            local result, value = pcall(v)
            if not result then
                Logger:error('Failed to load returned script '..k..' : '..value)
            end
        end
    end
end