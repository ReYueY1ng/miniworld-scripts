local DumpTable = {}

DumpTable.openFnArgs = {
    dump = true
}

local tempIO = {}
local appendcount = 0
local memoryaddrlist = {}

--local genv = debug.getfenv(table.getinfo(3, 'f')['func']) -- 内部环境
--local fenv = debug.getfenv(table.getinfo(1, 'f')['func']) -- 脚本环境
--local debug = genv.debug
--local require = genv.require
--local package = genv.package
--local os, jit, ffi, threadpoolenv, iox, gthreadpool, rawset = genv.os, genv.jit, genv.ffi, genv.threadpool.env, genv.io, genv.threadpool, rawset

function write(...)
    for _, v in ipairs({...}) do
        appendcount = appendcount + 1
        tempIO[appendcount] = v
    end
end

function dumptab(data, showmeta, removeduplicate, maxcount, lastcount)
    lastcount = lastcount or 0
    local count = lastcount + 1
    maxcount = maxcount or 2147483647
    if type(data) ~= 'table' or count > maxcount then
        if type(data) == 'string' then
            write('"', data, '"')
        elseif type(data) == 'userdata' and showmeta then
            write(rawtostring(data), ' ')
            local meta = debug.getmetatable and debug.getmetatable(data) or getmetatable(data)
            if removeduplicate and type(meta) == 'table' then
                local addr = rawtostring(meta)
                write(addr, ' ')
                if not memoryaddrlist[addr] then
                    memoryaddrlist[addr] = true
                    dumptab(meta, showmeta, removeduplicate, maxcount, lastcount)
                end
            else
                dumptab(meta, showmeta, removeduplicate, maxcount, lastcount)
            end
        else
            if type(data) ~= 'table' then
                local str = tostring(data):gsub('function', 'func')
                write(str)
            else
                tempIO[appendcount] = nil
                appendcount = appendcount - 1
            end
        end
    else
        write('{\n')
        
        if showmeta then
            for i = 1, count do write('    ') end
            local meta = debug.getmetatable and debug.getmetatable(data) or getmetatable(data)
            write('"__metatableX" = ')
            if removeduplicate and type(meta) == 'table' then
                local addr = rawtostring(meta)
                write(addr, ' ')
                if not memoryaddrlist[addr] then
                    memoryaddrlist[addr] = true
                    dumptab(meta, showmeta, removeduplicate, maxcount, count)
                end
            else
                dumptab(meta, showmeta, removeduplicate, maxcount, count)
            end
            write(',\n')
        end
        
        for k, v in pairs(data) do
            for i = 1, count do write('    ') end
            if type(k) == "string" then
                write("\"", k, "\" = ")
            elseif type(k) == "number" then
                write("[", k, "] = ")
            else
                dumptab(k, showmeta, removeduplicate, maxcount, count)
                write(' = ')
            end

            if type(v) == 'table' then
                local addr = rawtostring(v)
                write(addr, ' ')
                if removeduplicate then
                    if not memoryaddrlist[addr] then
                        memoryaddrlist[addr] = true
                        if k ~= 'tolua_ubox' then
                            dumptab(v, showmeta, removeduplicate, maxcount, count)
                        end
                    end
                else
                    if k ~= 'tolua_ubox' then
                        dumptab(v, showmeta, removeduplicate, maxcount, count)
                    end
                end
            else
                if k == 'tolua_ubox' then
                    write(rawtostring(v))
                else
                    dumptab(v, showmeta, removeduplicate, maxcount, count)
                end
            end
            write(',\n')
        end
        
        for i = 1, lastcount do write("    ") end
        write('}')
    end
end

function set(tab, k, v)
    if rawset then
        rawset(tab, k, v)
    else
        tab[k] = v
    end
end

function rawtostring(data)
    if type(data) == 'table' or type(data) == 'userdata' then
        local meta = debug.getmetatable and debug.getmetatable(data) or getmetatable(data)
        if type(meta) == 'table' then
            local __tostring = rawget(meta, '__tostring')
            if __tostring then
                set(meta, '__tostring', nil)
            end
            local result = tostring(data)
            if __tostring then set(meta, '__tostring', __tostring) end
            return result
        end
    end
    return tostring(data)
end

function DumpTable:dump(data, showmeta, removeduplicate, maxcount, lastcount)
    tempIO = {}
    appendcount = 0
    memoryaddrlist = {}
    dumptab(data, showmeta, removeduplicate, maxcount, lastcount)
    local val = table.concat(tempIO)
    tempIO = {}
    appendcount = 0
    memoryaddrlist = {}
    return val
end


function threadpoolenv.dumptable(data, showmeta, removeduplicate, maxcount, lastcount)
    tempIO = {}
    appendcount = 0
    memoryaddrlist = {}
    dumptab(data, showmeta, removeduplicate, maxcount, lastcount)
    local val = table.concat(tempIO)
    tempIO = {}
    appendcount = 0
    memoryaddrlist = {}
    return val
end

---threadpoolenv.tempIO = tempIO
---threadpoolenv.appendcount = appendcount
---threadpoolenv.memoryaddrlist = memoryaddrlist
return DumpTable
