local DumpTable = {}

DumpTable.openFnArgs = {
	dump = true,
}

local TOLUA_UBOX = "tolua_ubox"
local INDENT_CACHE = { "" }

local function getIndent(level)
	if not INDENT_CACHE[level] then
		INDENT_CACHE[level] = string.rep("    ", level)
	end
	return INDENT_CACHE[level]
end

local function rawtostring(data)
	if type(data) == "table" or type(data) == "userdata" then
		local meta = getmetatable(data)
		if type(meta) == "table" then
			local __tostring = meta.__tostring
			if __tostring then
				meta.__tostring = nil
				local result = tostring(data)
				meta.__tostring = __tostring
				return result
			end
		end
	end
	return tostring(data)
end

function DumpTable:dump(data, showmeta, removeduplicate, maxcount)
	local tempIO = {}
	local appendcount = 0
	local visited = {}

	local function write(...)
		for _, v in ipairs({ ... }) do
			appendcount = appendcount + 1
			tempIO[appendcount] = v
		end
	end

	local function dumptab(data, showmeta, removeduplicate, maxcount, lastcount)
		lastcount = lastcount or 0
		local count = lastcount + 1
		maxcount = maxcount or 2147483647

		if type(data) ~= "table" or count > maxcount then
			if type(data) == "string" then
				write('"', data, '"')
			elseif type(data) == "userdata" and showmeta then
				write(rawtostring(data), " ")
				local meta = getmetatable(data)
				if removeduplicate and type(meta) == "table" then
					local addr = rawtostring(meta)
					write(addr, " ")
					if not visited[addr] then
						visited[addr] = true
						dumptab(meta, showmeta, removeduplicate, maxcount, lastcount)
					end
				else
					dumptab(meta, showmeta, removeduplicate, maxcount, lastcount)
				end
			else
				write(tostring(data):gsub("function", "func"))
			end
			return
		end

		local addr = rawtostring(data)
		if visited[addr] then
			write(addr, " /* circular */")
			return
		end
		visited[addr] = true

		write("{\n")

		if showmeta then
			write(getIndent(count))
			local meta = getmetatable(data)
			write('"__metatableX" = ')
			if removeduplicate and type(meta) == "table" then
				local metaAddr = rawtostring(meta)
				write(metaAddr, " ")
				if not visited[metaAddr] then
					visited[metaAddr] = true
					dumptab(meta, showmeta, removeduplicate, maxcount, count)
				end
			else
				dumptab(meta, showmeta, removeduplicate, maxcount, count)
			end
			write(",\n")
		end

		for k, v in pairs(data) do
			write(getIndent(count))
			if type(k) == "string" then
				write('"', k, '" = ')
			elseif type(k) == "number" then
				write("[", k, "] = ")
			else
				dumptab(k, showmeta, removeduplicate, maxcount, count)
				write(" = ")
			end

			if type(v) == "table" then
				local vAddr = rawtostring(v)
				write(vAddr, " ")
				if removeduplicate then
					if not visited[vAddr] then
						visited[vAddr] = true
						if k ~= TOLUA_UBOX then
							dumptab(v, showmeta, removeduplicate, maxcount, count)
						end
					end
				else
					if k ~= TOLUA_UBOX then
						dumptab(v, showmeta, removeduplicate, maxcount, count)
					end
				end
			else
				if k == TOLUA_UBOX then
					write(rawtostring(v))
				else
					dumptab(v, showmeta, removeduplicate, maxcount, count)
				end
			end
			write(",\n")
		end

		write(getIndent(lastcount))
		write("}")
	end

	dumptab(data, showmeta, removeduplicate, maxcount, 0)
	return table.concat(tempIO)
end

return DumpTable
