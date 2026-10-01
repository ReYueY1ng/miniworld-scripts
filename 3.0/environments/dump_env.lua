--#region dump_env.lua
--[==[
================================================================================
 Mini World UGC environment dumper                                     mwenviron/1
================================================================================

 Serialises the sandbox environments that ScriptEnvMgr builds for UGC scripts
 into a deterministic, valid-Lua format.

 Why this exists (supersedes the old threadpool.env.dumptable one-liner):

   * the old output was pseudo-Lua: bare `table: 0x76fb38ac58` memory addresses,
     random `pairs()` ordering and dangling `"k" = table: 0x... ,` lines for
     cycles.  Two runs of the same build never produced the same bytes, so git
     diffs were useless and the file could not be loaded.
   * every key is now sorted, memory addresses are replaced by stable
     `{"$ref" = "path"}` back-references and the result is a chunk that
     `loadstring()` restores into a real table graph.
   * parameters are resolved by name (upvalues `limitkey` / `service`) instead of
     the fragile `debug.getupvalue(env.Player.GetHostUin, 4)` index, and an
     unresolvable wrapper is reported instead of silently degrading.
   * every face ScriptEnvMgr can build is exported (dev / official / motion),
     plus the ScriptEnvMgr runtime configuration (limitcfg / modServices / ...).

 Format (parsed by miniworld-code-3.0/tools/env_lib.py)
 ------
   return { ... }                      -- a single Lua value
     <table>     nested literal, keys sorted (strings, then numbers, then rest)
     "$meta"     the metatable of the enclosing table (debug.getmetatable)
     "$ref"      sole key: a back-reference to a table emitted elsewhere, by path
     "$userdata" sole key: placeholder for a userdata/thread value, addresses in
                 its tostring() normalised to #1, #2, ... in traversal order
     "$truncated" sole key: true when maxDepth was hit
     function    emitted as `function(a, b) end`; the signature lives in the
                 source text, followed by a trailing annotation comment
     annotation  semicolon separated:
                   @<source>:<line>  lua function origin
                   @service Key      the service method this wrapper forwards to
                   @mtype Type       DevApiMType of that service method
                   @rtype Type=value DevApiRType restriction; tuples render as
                                     (a,b), e.g. Uin_TimeLimit=(10,"\344\275\240\345\245\275\345\244\232\344\272\206")
                   @C / @builtin     native function
                   @unresolved Key   service wrapper whose target was not found
   A real key that itself starts with `$` is escaped with one extra `$`.

 Usage (MWRC console, one line):
   local p="Z:/home/yuey1ng/mini/miniworld-scripts/3.0/environments/dump_env.lua" local f=io.open(p,"rb") local s=f:read("*a") f:close() return loadstring(s,"dump_env")()
 
 Note: it cannot run in the sandbox environments!

 The chunk runs immediately and returns a stats table.
================================================================================
]==]
--#endregion

local M = {}

M.VERSION = "1.0.0"
M.FORMAT  = "mwenviron/1"

M.CONFIG = {
	-- Written verbatim; must end with "/".  Inside the game this is a Proton
	-- path (Z: maps to the host filesystem root).
	outdir = "Z:/home/yuey1ng/mini/miniworld-scripts/3.0/environments/",
	-- Mod id (cache key) used for the official / motion faces.
	officialModId = "AgentOfficialEnv",
	faces = {
		dev      = true, -- GetScriptFenv()                      -> servicesDev
		official = true, -- GetScriptFenv(id, Official)          -> services
		motion   = true, -- GetScriptFenv(id, Official, Motion)  -> servicesMotion
		mgr      = true, -- ScriptEnvMgr runtime configuration
	},
	-- Tables deeper than this are emitted as {"$truncated" = true}.
	maxDepth = 64,
	-- Emit the metatable of every table as its "$meta" entry.
	withMeta = true,
	-- Emit "@<source>:<line>" annotations for Lua functions.
	withSource = false,
	-- Print one line per face to the game console.
	verbose = true,
}

local genv  = _G
local debug = genv.debug
local io    = genv.io
local os    = genv.os

local RESERVED = {
	["$meta"]      = true,
	["$ref"]       = true,
	["$userdata"]  = true,
	["$truncated"] = true,
}

--#region helpers

local function quote(s)
	local out = s:gsub('[%z\1-\31\\"]', function(c)
		if c == "\\" then return "\\\\" end
		if c == '"'  then return '\\"' end
		if c == "\n" then return "\\n" end
		if c == "\r" then return "\\r" end
		if c == "\t" then return "\\t" end
		return string.format("\\%03d", string.byte(c))
	end)
	return '"' .. out .. '"'
end

local function num2str(n)
	if n ~= n then return "0/0" end
	if n == math.huge then return "1/0" end
	if n == -math.huge then return "-1/0" end
	if n == math.floor(n) and math.abs(n) < 1e15 then return string.format("%d", n) end
	return string.format("%.14g", n)
end

local function getMeta(v)
	if debug and debug.getmetatable then
		local ok, mt = pcall(debug.getmetatable, v)
		if ok and mt ~= nil then return mt end
	end
	local ok, mt = pcall(getmetatable, v)
	if ok then return mt end
	return nil
end

local function safeStr(v)
	local ok, s = pcall(tostring, v)
	if ok and s then return s end
	return "<" .. type(v) .. ">"
end

--#endregion

--#region service api metadata

-- DevApiMType / DevApiRType names, keyed by the number the runtime table stores.
local M_TYPE_NAMES = {
	[0] = "Normal", [1] = "Block", [2] = "NoBlock", [3] = "Sync", [4] = "SyncPack",
	[5] = "ClientData", [6] = "ReportHost", [7] = "HostAndClient", [8] = "BoardCast", [9] = "Mod",
}
local R_TYPE_NAMES = {
	[2] = "Uin_TimeLimit", [3] = "WhiteList", [4] = "TimeLimit",
	[5] = "CompareParam", [6] = "ResetCompareParam", [7] = "ResendMsg",
}

local API_META, API_META_AVAILABLE = nil, false

local function nameMap(live, fallback)
	local out = {}
	for value, name in pairs(fallback) do out[value] = name end
	if type(live) == "table" then
		for name, value in pairs(live) do
			if type(value) == "number" then out[value] = name end
		end
	end
	return out
end

---Restriction values are arbitrary Lua data; render them compactly and readably.
local function valueText(v)
	local t = type(v)
	if t == "number" then return num2str(v) end
	if t == "string" then return quote(v) end
	if t == "boolean" then return v and "true" or "false" end
	if t == "table" then
		local parts = {}
		for i = 1, #v do parts[#parts + 1] = valueText(v[i]) end
		if #parts == 0 then
			local keys = {}
			for k in pairs(v) do keys[#keys + 1] = tostring(k) end
			table.sort(keys)
			for _, k in ipairs(keys) do parts[#parts + 1] = k .. "=" .. valueText(v[k]) end
		end
		return "(" .. table.concat(parts, ",") .. ")"
	end
	return tostring(v)
end

---Mirror ScriptEnvMgr:LoadServicesApi: walk DevApiCfg.services, flattening nested
---`items` into dotted ``Service.Sub.Method`` keys and recording MType plus the
---raw RType table for every *listed* method.  Unlisted methods default to Normal.
local function buildApiMeta()
	local mtypeNames = nameMap(genv.DevApiMType, M_TYPE_NAMES)
	local rtypeNames = nameMap(genv.DevApiRType, R_TYPE_NAMES)
	local flat = {}

	local function collect(prefix, node)
		if type(node) ~= "table" then return end
		local methods = node.methods
		if type(methods) == "table" then
			for i = 1, #methods do
				local entry = methods[i]
				local name, mtype, rtypes
				if type(entry) == "string" then
					name, mtype = entry, 0
				elseif type(entry) == "table" then
					name = entry[1]
					mtype = type(entry[2]) == "number" and entry[2] or 0
					rtypes = entry[3]
				end
				if type(name) == "string" and prefix ~= "" then
					local info = { mtype = mtypeNames[mtype] or ("MType" .. tostring(mtype)) }
					if type(rtypes) == "table" then
						local list = {}
						for itype, value in pairs(rtypes) do
							list[#list + 1] = {
								rtypeNames[itype] or ("RType" .. tostring(itype)),
								valueText(value),
							}
						end
						table.sort(list, function(a, b) return a[1] < b[1] end)
						if #list > 0 then info.rtypes = list end
					end
					flat[prefix .. "." .. name] = info
				end
			end
		end
		for sub, subnode in pairs(node.items or {}) do
			collect(prefix == "" and sub or (prefix .. "." .. sub), subnode)
		end
	end

	local cfg = genv.DevApiCfg
	if type(cfg) == "table" and type(cfg.services) == "table" then
		for service, node in pairs(cfg.services) do collect(service, node) end
	end
	if next(flat) == nil then return nil, nil end
	return flat, mtypeNames
end

---Fallback when DevApiCfg is not reachable: ScriptEnvMgr.limitcfg keeps the runtime
---snapshot of the three RTypes LoadServicesApi copies, but no MType.
local function buildApiMetaFromLimitcfg(SM)
	local rtypeNames = nameMap(genv.DevApiRType, R_TYPE_NAMES)
	local flat = {}
	for key, limits in pairs(SM and SM.limitcfg or {}) do
		local list = {}
		for itype, value in pairs(limits) do
			list[#list + 1] = { rtypeNames[itype] or ("RType" .. tostring(itype)), valueText(value) }
		end
		table.sort(list, function(a, b) return a[1] < b[1] end)
		flat[key] = { rtypes = list }
	end
	if next(flat) == nil then return nil end
	return flat
end

local function appendApiMeta(anns, limitkey)
	if not API_META_AVAILABLE then return end
	local info = API_META[limitkey]
	anns[#anns + 1] = "@mtype " .. ((info and info.mtype) or "Normal")
	for _, rtype in ipairs((info and info.rtypes) or {}) do
		anns[#anns + 1] = "@rtype " .. rtype[1] .. "=" .. rtype[2]
	end
end

--#endregion

--#region service signature resolution

-- The raw service registry is the global `Service` table
-- (luascript/ugc/framework/services/services.lua).  ScriptEnvMgr wraps every
-- method as `function(sev, ...)`; the real method is reachable through the
-- wrapper's upvalues, which also carry the "Service.Method" limit key.
local RAW_SERVICE, RAW_SERVICE_SOURCE = nil, nil

local function lookupRooted(root, dotted)
	if type(root) ~= "table" or type(dotted) ~= "string" then return nil end
	local node = root
	for part in dotted:gmatch("[^.]+") do
		if type(node) ~= "table" then return nil end
		node = node[part]
	end
	if type(node) == "function" then return node end
	return nil
end

local function wrapperInfo(fn)
	local limitkey, service = nil, nil
	for i = 1, 16 do
		local name, value = debug.getupvalue(fn, i)
		if name == nil then break end
		if name == "limitkey" and type(value) == "string" then limitkey = value end
		if name == "service" and type(value) == "table" then service = value end
	end
	return limitkey, service
end

local function resolveRawService()
	local ok, svc = pcall(function() return genv.Service end)
	if ok and type(svc) == "table" and next(svc) ~= nil then
		return svc, "global Service"
	end

	local mgr = M.getScriptEnvMgr and M.getScriptEnvMgr()
	if mgr then
		for _, face in ipairs({ "servicesDev", "services", "servicesMotion" }) do
			local root = mgr[face]
			if type(root) == "table" then
				for _, svcTbl in pairs(root) do
					if type(svcTbl) == "table" then
						for _, fn in pairs(svcTbl) do
							if type(fn) == "function" then
								local _, inst = wrapperInfo(fn)
								if inst then
									if lookupRooted(inst.service, "Player.GetHostUin") then
										return inst.service, "wrapper upvalue .service"
									end
									if lookupRooted(inst, "Player.GetHostUin") then
										return inst, "wrapper upvalue"
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return nil, nil
end

local function sourceOf(fn)
	local ok, info = pcall(debug.getinfo, fn, "S")
	if not ok or type(info) ~= "table" then return nil end
	local src = info.source
	if type(src) == "string" then
		if src:sub(1, 1) == "@" then src = src:sub(2) end
	else
		src = info.short_src
	end
	if not src or src == "" or src == "=?" then return nil end
	if info.linedefined and info.linedefined > 0 then
		return string.format("%s:%d", src, info.linedefined)
	end
	return src
end

local function rawParams(fn)
	local ok, info = pcall(debug.getinfo, fn, "uS")
	if not ok or type(info) ~= "table" then return nil, nil end
	if info.what == "C" then return "", "C" end
	local names = {}
	local count = info.nparams
	if count then
		for i = 1, count do
			local nameOk, name = pcall(debug.getlocal, fn, i)
			if not nameOk or not name then break end
			names[#names + 1] = name
		end
	else
		-- Lua 5.1.0 has no nparams; probe until the parameter list runs out.
		local i = 1
		while i <= 32 do
			local nameOk, name = pcall(debug.getlocal, fn, i)
			if not nameOk or not name then break end
			names[#names + 1] = name
			i = i + 1
		end
	end
	if info.isvararg then names[#names + 1] = "..." end
	local params, source = table.concat(names, ", "), nil
	if M.CONFIG.withSource then source = sourceOf(fn) end
	return params, "lua", source
end

local function describeFunction(fn)
	local plain = safeStr(fn)
	if plain:find("builtin", 1, true) then
		return "", { "@builtin" }, false
	end

	local params, kind, source = rawParams(fn)
	if kind == "C" then return "", { "@C" }, false end

	-- Service wrapper: function(sev, ...) closing over `limitkey`/`service`.
	local isWrapper = false
	local ok, first = pcall(debug.getlocal, fn, 1)
	if ok and first == "sev" then isWrapper = true end

	if isWrapper then
		local limitkey, inlineService = wrapperInfo(fn)
		local root = RAW_SERVICE
		local real = lookupRooted(root, limitkey or "")
		if not real and inlineService then
			real = lookupRooted(inlineService, limitkey or "")
				or lookupRooted(inlineService.service, limitkey or "")
			if real then root = inlineService.service or inlineService end
		end
		local anns = {}
		if real then
			local p, _, src = rawParams(real)
			if src then anns[#anns + 1] = "@" .. src end
			if limitkey then
				anns[#anns + 1] = "@service " .. limitkey
				appendApiMeta(anns, limitkey)
			end
			return p or "sev, ...", anns, false
		end
		anns[#anns + 1] = "@unresolved " .. (limitkey or "?")
		return "sev, ...", anns, true
	end

	return params, { "@" .. (source or "lua") }, false
end

--#endregion

--#region serializer

local serialize

serialize = function(root, face, cfg)
	local buf, n = {}, 0
	local function w(...)
		for i = 1, select("#", ...) do
			n = n + 1
			buf[n] = select(i, ...)
		end
	end

	local seen = {}
	local curPath = {}
	local keyCounter = 0
	local stats = {
		face = face, tables = 0, functions = 0, refs = 0, userdata = 0,
		truncated = 0, unresolved = 0, maxdepth = 0,
	}

	local refOf
	local emitValue

	-- Addresses inside a userdata's tostring() differ on every run; number them in
	-- traversal order so the export stays byte-identical across runs of one build.
	local addrIds, addrCount = {}, 0
	local function stableRepr(v)
		return (safeStr(v):gsub("0x%x+", function(addr)
			local id = addrIds[addr]
			if not id then
				addrCount = addrCount + 1
				id = "#" .. addrCount
				addrIds[addr] = id
			end
			return id
		end))
	end

	refOf = function(pathArr)
		w('{ ["$ref"] = {')
		for i = 1, #pathArr do
			if i > 1 then w(", ") end
			w(quote(pathArr[i]))
		end
		w("} }")
	end

	emitValue = function(v, depth, indent)
		local t = type(v)

		if t == "nil" then
			w("nil")
		elseif t == "boolean" then
			w(v and "true" or "false")
		elseif t == "number" then
			w(num2str(v))
		elseif t == "string" then
			w(quote(v))
		elseif t == "function" then
			local params, anns, unresolved = describeFunction(v)
			stats.functions = stats.functions + 1
			if unresolved then stats.unresolved = stats.unresolved + 1 end
			w("function(", params, ") end")
			return anns
		elseif t == "table" then
			local previous = seen[v]
			if previous then
				stats.refs = stats.refs + 1
				refOf(previous)
				return nil
			end
			if depth > cfg.maxDepth then
				stats.truncated = stats.truncated + 1
				w('{ ["$truncated"] = true }')
				return nil
			end
			local copy = {}
			for i = 1, #curPath do copy[i] = curPath[i] end
			seen[v] = copy
			stats.tables = stats.tables + 1
			if depth > stats.maxdepth then stats.maxdepth = depth end

			local strs, nums, others = {}, {}, {}
			for k in pairs(v) do
				local kt = type(k)
				if kt == "string" then
					strs[#strs + 1] = k
				elseif kt == "number" then
					nums[#nums + 1] = k
				else
					others[#others + 1] = k
				end
			end
			table.sort(strs)
			table.sort(nums)

			local inner = indent + 1
			w("{\n")

			local function pad()
				for _ = 1, inner do w("    ") end
			end
			local function note(anns)
				if type(anns) ~= "table" or #anns == 0 then return end
				w(" --[[", (table.concat(anns, "; "):gsub("%]%]", "] ]")), "]]")
			end
			local function entry(keyLiteral, segment, keyDisplay, val)
				pad()
				if keyLiteral then
					w(keyLiteral, " = ")
				else
					w("[")
					curPath[#curPath + 1] = segment
					emitValue(keyDisplay, depth + 1, inner)
					curPath[#curPath] = nil
					w("] = ")
				end
				curPath[#curPath + 1] = segment
				local anns = emitValue(val, depth + 1, inner)
				curPath[#curPath] = nil
				w(",")
				note(anns)
				w("\n")
			end

			if cfg.withMeta then
				local mt = getMeta(v)
				if mt ~= nil then
					pad()
					w('["$meta"] = ')
					curPath[#curPath + 1] = "$meta"
					local anns = emitValue(mt, depth + 1, inner)
					curPath[#curPath] = nil
					w(",")
					note(anns)
					w("\n")
				end
			end

			local function keyLiteralOf(k)
				if type(k) == "string" then
					return "[" .. quote(k:sub(1, 1) == "$" and ("$" .. k) or k) .. "]"
				elseif type(k) == "number" then
					return "[" .. num2str(k) .. "]"
				end
				return nil
			end

			for _, k in ipairs(strs) do entry(keyLiteralOf(k), k, k, v[k]) end
			for _, k in ipairs(nums) do entry(keyLiteralOf(k), k, k, v[k]) end
			for _, k in ipairs(others) do
				keyCounter = keyCounter + 1
				entry(nil, "#k" .. keyCounter, k, v[k])
			end

			for _ = 1, indent do w("    ") end
			w("}")
		else
			stats.userdata = stats.userdata + 1
			w('{ ["$userdata"] = ', quote(stableRepr(v)), " }")
		end
		return nil
	end

	emitValue(root, 0, 0)
	return table.concat(buf), stats
end

--#endregion

--#region driving

M.getScriptEnvMgr = function()
	local getter = genv.UGCGetInst or genv.GetInst
	if not getter then return nil end
	local ok, mgr = pcall(getter, "ScriptEnvMgr")
	if ok then return mgr end
	return nil
end

local function gameVersion()
	local ci = genv.GetClientInfo
	if type(ci) ~= "function" then return "unknown" end
	local ok, info = pcall(ci)
	if not ok or info == nil then return "unknown" end
	for _, method in ipairs({ "GetClientVersionStr", "clientVersionStr", "GetClientVersion" }) do
		local fn = info[method]
		if type(fn) == "function" then
			local ok2, v = pcall(fn, info)
			if ok2 and v ~= nil then return tostring(v) end
		end
	end
	return "unknown"
end

local function header(face, stats, extra)
	local lines = {
		"-- ============================================================================",
		"-- Mini World UGC environment export",
		"-- format: " .. M.FORMAT .. "   generator: dump_env.lua " .. M.VERSION,
		"-- face: " .. face,
		"-- game: " .. gameVersion(),
		"-- generated: " .. (os.date and os.date("%Y-%m-%d %H:%M:%S") or "unknown"),
		string.format(
			"-- stats: tables=%d functions=%d refs=%d userdata=%d unresolved=%d truncated=%d maxdepth=%d bytes=%d",
			stats.tables, stats.functions, stats.refs, stats.userdata,
			stats.unresolved, stats.truncated, stats.maxdepth, stats.bytes or 0),
        "-- exported by: ReYueY1ng",
        "-- source url: https://github.com/ReYueY1ng/miniworld-scripts/3.0/environments",
        "-- licensed under: CC BY 4.0"
	}
	for _, e in ipairs(extra or {}) do lines[#lines + 1] = "-- " .. e end
	lines[#lines + 1] = "-- ============================================================================"
    lines[#lines + 1] = "---@meta"
	return table.concat(lines, "\n") .. "\n"
end

local function writeFile(path, text)
	local f, err = io.open(path, "wb")
	if not f then return nil, "io.open failed: " .. tostring(err) end
	local ok, werr = f:write(text)
	if not ok then
		f:close()
		return nil, "write failed: " .. tostring(werr)
	end
	f:close()
	return true
end

local function faceValue(name, cfg, SM)
	if name == "dev" then
		return SM:GetScriptFenv(), nil
	end
	if name == "official" then
		if not genv.ModScriptSourceType then return nil, "ModScriptSourceType is not defined" end
		return SM:GetScriptFenv(cfg.officialModId, genv.ModScriptSourceType.Official), nil
	end
	if name == "motion" then
		if not genv.ModScriptSourceType or not genv.DevApiEnvType then
			return nil, "ModScriptSourceType / DevApiEnvType is not defined"
		end
		return SM:GetScriptFenv(cfg.officialModId, genv.ModScriptSourceType.Official, genv.DevApiEnvType.Motion), nil
	end
	if name == "mgr" then
		local scriptEnum = {}
		for key, value in pairs(SM.scriptEnum or {}) do
			scriptEnum[key] = { isOfficial = value.isOfficial and true or false }
		end
		local envList = {}
		for key, value in pairs(SM.scriptEnvList or {}) do
			envList[key] = {
				evnType = value.evnType,
				hasEnv = value.env ~= nil,
				hasGData = value.gData ~= nil,
				hasScriptEnv = value.scriptEnv ~= nil,
			}
		end
		return {
			limitcfg     = SM.limitcfg or {},
			modServices  = SM.modServices or {},
			scriptEnum   = scriptEnum,
			scriptEnvList = envList,
		}, nil
	end
	return nil, "unknown face"
end

M.dumpFace = function(name, cfg)
	local SM = M.getScriptEnvMgr()
	if not SM then return nil, "UGCGetInst('ScriptEnvMgr') is unavailable" end

	local value, err = faceValue(name, cfg, SM)
	if value == nil then return nil, err or (name .. " env is nil") end

	local text, stats = serialize(value, name, cfg)
	stats.bytes = #text
	local path = cfg.outdir .. name .. "env.lua"
	local ok, werr = writeFile(path, header(name, stats) .. "return " .. text .. "\n")
	if not ok then return nil, werr end
	stats.path = path
	return stats
end

M.run = function(overrides)
	local cfg = {}
	for k, v in pairs(M.CONFIG) do cfg[k] = v end
	-- A loader may retarget the run with `DUMP_ENV_CONFIG = {...}` before loading
	-- this chunk (used by the offline test harness and by alternate consoles).
	local layers = { genv.DUMP_ENV_CONFIG, overrides }
	for _, layer in ipairs(layers) do
		for k, v in pairs(layer or {}) do
			if k == "faces" and type(v) == "table" then
				for fk, fv in pairs(v) do cfg.faces[fk] = fv end
			else
				cfg[k] = v
			end
		end
	end
	if cfg.outdir:sub(-1) ~= "/" then cfg.outdir = cfg.outdir .. "/" end

	local mgr = M.getScriptEnvMgr()
	RAW_SERVICE, RAW_SERVICE_SOURCE = resolveRawService()
	API_META, API_META_AVAILABLE = buildApiMeta()
	if API_META == nil then
		API_META = buildApiMetaFromLimitcfg(mgr)
		API_META_AVAILABLE = API_META ~= nil
	end

	local results = {
		format = M.FORMAT,
		generator = "dump_env.lua " .. M.VERSION,
		outdir = cfg.outdir,
		rawService = RAW_SERVICE_SOURCE or "(not found - service signatures unresolved)",
		apiMeta = API_META_AVAILABLE and "DevApiCfg" or "(not found - no @mtype/@rtype annotations)",
	}
	if cfg.verbose then
		print(string.format("[dump_env] raw service table: %s", results.rawService))
		print(string.format("[dump_env] api metadata: %s", results.apiMeta))
	end

	for _, name in ipairs({ "dev", "official", "motion", "mgr" }) do
		if cfg.faces[name] then
			if not mgr then
				results[name] = { error = "ScriptEnvMgr unavailable" }
			else
				local ok, statsOrErr, maybeErr = pcall(M.dumpFace, name, cfg)
				if not ok then
					results[name] = { error = tostring(statsOrErr) }
				elseif statsOrErr == nil then
					results[name] = { error = tostring(maybeErr) }
				else
					results[name] = statsOrErr
				end
			end
			local r = results[name]
			if cfg.verbose then
				if r.error then
					print(string.format("[dump_env] %-8s FAILED: %s", name, r.error))
				else
					print(string.format(
						"[dump_env] %-8s %6d tables %5d funcs %3d unresolved -> %s (%d bytes)",
						name, r.tables, r.functions, r.unresolved, r.path, r.bytes))
				end
			end
		end
	end

	return results
end

--#endregion

return M.run()
