-- Moon Library
-- Licensed under the terms of the LGPL2
MoonLib = {}
MoonLib.version = 0.2 -- 版本

MoonLib.encoding = {} -- 编解码库

-- Sourced from http://lua-users.org/wiki/BaseSixtyFour
-- Lua 5.1+ base64 v3.0 (c) 2009 by Alex Kloss <alexthkloss@web.de>
-- licensed under the terms of the LGPL2

MoonLib.encoding.base64 = {b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'}

---Base64 编码
---@param data string 要编码的字符串
---@return string result 编码后的字符串
function MoonLib.encoding.base64:encode(data)
    local b = self.b
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

---Base64 解码
---@param data string 要解码的字符串
---@return string result 解码后的字符串
function MoonLib.encoding.base64:decode(data)
    local b = self.b
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

MoonLib.encoding.b64tounicode = {
    base64_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
    replacement_map = {}
}

-- Base64 ↔ Unicode E000-E03F 编解码器（Lua 5.1）
-- 预生成编码映射表
for i = 0, 63 do
    local c = MoonLib.encoding.b64tounicode.base64_chars:sub(i+1, i+1)
    local code_point = 0xE000 + i
    
    -- UTF-8 三字节编码规则
    local byte1 = 0xE0 + math.floor(code_point / 0x1000)
    local byte2 = 0x80 + math.floor((code_point % 0x1000) / 0x40)
    local byte3 = 0x80 + (code_point % 0x40)
    
    MoonLib.encoding.b64tounicode.replacement_map[c] = string.char(byte1, byte2, byte3)
end

---Base64 编码为私有 Unicode
---@param input string 要编码的字符串
---@return string result 编码后的字符串
function MoonLib.encoding.b64tounicode:encode(input)
    local result = {}
    for i = 1, #input do
        local char = input:sub(i, i)
        result[i] = self.replacement_map[char] or char
    end
    return table.concat(result)
end

---私有 Unicode 解码为 Base64
---@param input any 要解码的字符串
---@return string result 解码后的字符串
function MoonLib.encoding.b64tounicode:decode(input)
    local result = {}
    local i = 1
    
    while i <= #input do
        local b1 = input:byte(i)
        
        -- 检测三字节 UTF-8 字符
        if b1 >= 0xE0 and b1 <= 0xEF then
            local b2 = input:byte(i+1) or 0
            local b3 = input:byte(i+2) or 0
            
            if b2 >= 0x80 and b3 >= 0x80 then
                -- 计算 Unicode 码点
                local code = (b1 - 0xE0) * 0x1000
                           + (b2 - 0x80) * 0x40
                           + (b3 - 0x80)
                
                if code >= 0xE000 and code <= 0xE03F then
                    local index = code - 0xE000
                    result[#result+1] = self.base64_chars:sub(index+1, index+1)
                    i = i + 3  -- 跳过已处理的三个字节
                else
                    -- 非映射字符保留原样
                    result[#result+1] = string.char(b1, b2, b3)
                    i = i + 3
                end
            else
                -- 无效 UTF-8 序列
                result[#result+1] = string.char(b1)
                i = i + 1
            end
        else
            -- 保留非映射字符（如填充符 =）
            result[#result+1] = string.char(b1)
            i = i + 1
        end
    end
    
    return table.concat(result)
end

---@class logger
MoonLib.logger = {} -- 日志库
MoonLib.logger.name = 'Unknown'
MoonLib.logger.printdebug = false

---@param name string 名称
---@return logger
function MoonLib.logger:new(name)
    local obj = {
        name = name or self.name
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MoonLib.logger:info(...)
    printtag("INFO", "("..self.name..")", ...)
end

function MoonLib.logger:warn(...)
    printtag("WARN", "("..self.name..")", ...)
end

function MoonLib.logger:error(...)
    printtag("ERROR", "("..self.name..")", ...)
end

function MoonLib.logger:debug(...)
    if self.printdebug then
        printtag("DEBUG", "("..self.name..")", ...)
    end
end

Game.MoonLib = MoonLib
Game.Mini.MoonLib = MoonLib

return MoonLib
