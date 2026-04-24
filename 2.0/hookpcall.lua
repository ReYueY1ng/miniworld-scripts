local origpcall = threadpool.env.origpcall or pcall
threadpool.env.origpcall = origpcall
local tab = {}

local function pcallhandler(...)
    local arg = {...}
    local tabkey = #tab+1
    tab[tabkey] = {}
    if not ScriptSupportEvent.eventList.hookpcall_newEnv then
        ScriptSupportEvent.eventList.hookpcall_newEnv = true
        print("Detected new environment")
        Chat:sendSystemMsg('[color=#aaeeee]Detected new environment')
        ScriptSupportEvent:registerEvent("Player.NewInputContent", chat)
    end
    print("pcall start --- "..tabkey)
    Chat:sendSystemMsg("pcall start --- "..tabkey)
    local result = {origpcall(...)}
    tab[tabkey] = {time = threadpool.env.msec, arg = arg, result = result, type = arg[2] and arg[2]['msgStr'] or 'Others'}
    print("pcall end --- "..tabkey)
    threadpool.env.printtable2print(tab[tabkey])
    print("pcall result end --- "..tabkey)
    return unpack(result)
end

function chat(e)
    local uin = e.eventobjid
    local content = e.content
    local _, strs = Game:splitStr(content, ' ')
    if strs[1] == '/hp' then
        if strs[2] == 'list' then
            for k, v in pairs(tab) do
                Chat:sendSystemMsg('[color=#eeeeee]'..k..':', uin)
                for i, j in ipairs(v) do
                    Chat:sendSystemMsg('[color=#eeeeee]'..i..': '..tostring(j), uin)
                end
            end
        elseif strs[2] == 'output' then
            print(threadpool.env.msec)
            Customui:setText(273640665,"7481680936523754713-22857","7481680936523754713-22857_4",Game.MoonLib.encoding.b64tounicode:encode(Game.MoonLib.encoding.base64:encode(string.dump(tab[strs[3]][tonumber(strs[4])]))))
            print(threadpool.env.msec)
        elseif strs[2] == 'listevents' then
            local strtab = {}
            --print(ScriptSupportEvent.eventList)
            for k, v in pairs(ScriptSupportEvent.eventList) do
                strtab[#strtab+1] = k..': '..table_leng(v['infos'])
                --Chat:sendSystemMsg('[color=#eeeeee]'..k..':', uin)
                --for i, j in ipairs(v) do
                --    Chat:sendSystemMsg('[color=#eeeeee]'..i..': '..tostring(j), uin)
                --end
            end
            Customui:setText(uin,"7481680936523754713-22857","7481680936523754713-22857_4",table.concat(strtab,"\n"))
        elseif strs[2] == 'callevent' then
            Game:dispatchEvent(strs[3], {foo = 'bar'})
            Chat:sendSystemMsg('[color=#aaeeaa]ok', uin)
        end
    end
end

function TabFindValue(tbl, value)
    if tbl == nil then
        return false
    end
 
    for k, v in pairs(tbl) do
        if v == value then
            return true, k
        end
    end
    return false
end

function table_leng(t)
    local leng=0
    for k, v in pairs(t) do
        leng=leng+1
    end
    return leng
end

threadpool.env.pcallhandler = pcallhandler

function buildpcall()
    threadpool.env.pcalltab = tab
    pcall = threadpool.env.pcallhandler
    Chat:sendSystemMsg('[color=#aaeeee]pcall builded')
end

threadpool.env.buildpcall = buildpcall
buildpcall()

ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], chat)