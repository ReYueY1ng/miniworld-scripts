Mini = Game.Mini

origP2W = Mini.ui.Print2Wnd
origP2WWT = Mini.ui.Print2WndWithTag
origsc = Mini.chat.sendChat

printlog = {}

Mini.ui.Print2Wnd = function(...)
    return Mini.ui.Print2WndWithTag('global', ...)
end

Mini.ui.Print2WndWithTag = function(tag, ...)
    pcall(origP2WWT(tag, ...))
    local printtable={}
    for i,v in ipairs({...}) do
        v=string.gsub(tostring(v),'#cff0000','#R')
        printtable[i]=tostring(v)
        table.insert(printlog, '('..tag..') '..tostring(v))
    end
    local printstr=table.concat(printtable,' ')
    pcall(origsc, '[color=#eeeeee]('..tag..') '..printstr, 1, 0)
end

print = Mini.ui.Print2Wnd

function playerchat(e)
    local uin = e.eventobjid
    local content = e.content
    if content == '/printlog' then
        for k, v in ipairs(printlog) do
            pcall(origsc, '[color=#eeeeee]'..v, 1, 0)
        end
    end
end

ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], playerchat)

print('Welcome to use hookprint')