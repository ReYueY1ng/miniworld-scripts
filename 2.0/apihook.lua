Mini = Game.Mini

origP2W = Mini.ui.Print2Wnd
origP2WWT = Mini.ui.Print2WndWithTag
origsc = Mini.chat.sendChat
origst = Mini.Customui.setText

local DumpTable = Mini.DumpTable -- 3.0/DumpTable.lua

function DeepCopy(object)      
    local SearchTable = {}  

    local function Func(object)  
        if type(object) ~= "table" then  
            return object         
        end  
        local NewTable = {}  
        SearchTable[object] = NewTable  
        for k, v in pairs(object) do  
            NewTable[Func(k)] = Func(v)  
        end     

        return setmetatable(NewTable, getmetatable(object))      
    end    

    return Func(object)  
end 

realMini = {}

metatab = {}
metatab.__index = function(tab, key)
    function x(...)
        printtag(key, ...)
        return rawget(metatab, key)(...)
    end
    return x
end

for k, v in pairs(Mini) do
    for i, j in pairs(v) do
        metatab[i] = j
    end
    Mini[k] = {}
    setmetatable(Mini[k], metatab)
end

Mini.ui = {}
Mini.chat = {}
Mini.chat.sendChat = origsc
Mini.Customui = {}

printlog = {}

Mini.ui.Print2Wnd = function(...)
    pcall(origP2W(...))
    local printtable={}
    for i,v in ipairs({...}) do
        if type(v) == 'table' then
            v = DumpTable:dump(v)
        end
        v=string.gsub(tostring(v),'#cff0000','#R')
        printtable[i]=tostring(v)
        table.insert(printlog, tostring(v))
    end
    local printstr=table.concat(printtable,' ')
    pcall(origsc, '#W(global) '..printstr, 1, 0)
end

Mini.ui.Print2WndWithTag = function(tag, ...)
    pcall(origP2WWT(tag, ...))
    local printtable={}
    for i,v in ipairs({...}) do
        if type(v) == 'table' then
            v = DumpTable:dump(v)
        end
        v=string.gsub(tostring(v),'#cff0000','#R')
        printtable[i]=tostring(v)
        table.insert(printlog, tostring(v))
    end
    local printstr=table.concat(printtable,' ')
    pcall(origsc, '#W('..tag..') '..printstr, 1, 0)
end

Mini.Customui.setText = function(...)
    Mini.ui.Print2WndWithTag(setText, ...)
    origst(...)
end

print = Mini.ui.Print2Wnd
printtag = Mini.ui.Print2WndWithTag
function playerchat(e)
    local uin = e.eventobjid
    local content = e.content
    if content == '/printlog' then
        for k, v in ipairs(printlog) do
            pcall(origsc, '#W'..v, 1, 0)
        end
    end
end
  

ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], playerchat)
