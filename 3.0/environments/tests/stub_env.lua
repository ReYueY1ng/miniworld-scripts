--#region stub_env.lua
--[==[
Offline stand-in for the parts of the game runtime that dump_env.lua talks to.

Running this file under a stock Lua 5.1 / LuaJIT installs a fake ScriptEnvMgr,
a fake global `Service` registry and a few enum globals, then loads
dump_env.lua, so the dumper and the Python-side format parser can be exercised
without the game.

    luajit 3.0/environments/tests/stub_env.lua /tmp/out
]==]
--#endregion

local outdir = arg and arg[1] or "/tmp/mwenviron-stub"
local here = arg and arg[0] or "3.0/environments/tests/stub_env.lua"
local envDir = here:match("^(.*)/tests/[^/]+$") or "."

--#region fake raw service registry

local Service = {}

local function Raw_GetHostUin(self, uin)
	return uin
end
local function Raw_GetFriendList(self, uin, page)
	return {}
end
local function Raw_Teleport(self, x, y, z)
	return true
end
local function Raw_Secret(self, a, b, c)
	return a, b, c
end

Service.Player = {
	GetHostUin = Raw_GetHostUin,
	GetFriendList = Raw_GetFriendList,
}
Service.World = {
	Teleport = Raw_Teleport,
	Secret = Raw_Secret,
}
Service.Cpp = setmetatable({}, { __index = function() return function() end end })
Service.Ghost = {
	Untracked = function(self, flag) end,
}
Service.Trigger = {
	Inner = {
		Nested = function(self, alpha) end,
	},
}

_G.Service = Service

--#endregion

--#region fake wrappers

-- Mirrors ScriptEnvMgr:LoadServicesApi: a wrapper named `sev` whose upvalues are
-- named `limitkey` and `service`, exactly what dump_env.lua sniffs for.
local function makeWrapper(limitkey, service, fn)
	return function(sev, ...)
		local _ = limitkey
		return fn(service, ...)
	end
end

local function makeBrokenWrapper()
	return function(sev, ...)
		return nil
	end
end

local function buildApi(serviceName, root, keys)
	local api = {}
	for _, method in ipairs(keys) do
		local raw = root[serviceName][method]
		api[method] = raw and makeWrapper(serviceName .. "." .. method, root[serviceName], raw)
			or makeWrapper(serviceName .. "." .. method, root[serviceName], function() end)
	end
	return api
end

--#endregion

--#region fake faces

local shared = { tag = "shared node" }
local cyclic = { name = "cyclic" }
cyclic.self = cyclic
cyclic.shared = shared

local cycMeta = { __className_ = "Cyclic", __index = shared }
setmetatable(cyclic, cycMeta)

local deep = {}
do
	local node = deep
	for i = 1, 70 do
		node.next = { depth = i }
		node = node.next
	end
end

local devEnv = {
	_G = nil,
	Mini = { Class = function(className, super) end },
	Player = buildApi("Player", Service, { "GetHostUin", "GetFriendList" }),
	World = buildApi("World", Service, { "Teleport", "Secret" }),
	Ghost = buildApi("Ghost", Service, { "Untracked" }),
	Broken = { NoTarget = makeBrokenWrapper() },
	Trigger = {
		Inner = {
			Nested = makeWrapper("Trigger.Inner.Nested", Service.Trigger.Inner, Service.Trigger.Inner.Nested),
		},
	},
	Cyclic = cyclic,
	Deep = deep,
	Strings = { ascii = "hello", quoted = 'say "hi"', ctrl = "a\nb\tc", unicode = "自定义方块作物" },
	Numbers = { int = 42, neg = -7, float = 1.5, big = 2 ^ 40 },
	Bools = { yes = true, no = false },
	Escaped = { ["$ref"] = "a real key that looks reserved", ["$meta"] = "another one" },
	Numeric = { [1] = "one", [2] = "two", [10] = "ten" },
	Userdata = io.stdout,
}
local wrapper = {}
local gData = { hidden = "gData member" }
setmetatable(devEnv, { __metatable = "read only", __index = gData })
local metaWrite = { __metatable = "read only", __index = devEnv, __newindex = gData }
setmetatable(wrapper, metaWrite)
devEnv._G = wrapper
wrapper._G = wrapper

local officialWrapper = {}
local officialEnv = {
	_G = nil,
	Player = buildApi("Player", Service, { "GetHostUin" }),
	OnlyOfficials = function(self, alpha, beta) end,
}
officialEnv._G = officialWrapper
officialWrapper._G = officialWrapper
setmetatable(officialWrapper, { __metatable = "read only", __index = officialEnv, __newindex = {} })

local motionWrapper = {}
local motionEnv = {
	_G = nil,
	Motion = { Move = function(self, speed) end },
}
motionEnv._G = motionWrapper
motionWrapper._G = motionWrapper
setmetatable(motionWrapper, { __metatable = "read only", __index = motionEnv, __newindex = {} })

--#endregion

--#region fake ScriptEnvMgr

local faces = { dev = wrapper, official = officialWrapper, motion = motionWrapper }
local envTables = { dev = devEnv, official = officialEnv, motion = motionEnv }

local ScriptEnvMgr = {
	limitcfg = {
		["Player.GetFriendList"] = { [2] = { 10, "调用频繁，请稍后尝试！" } },
		["World.Teleport"] = { [3] = "LuaApi3_World_Teleport" },
	},
	modServices = { Player = { GetHostUin = true }, World = {} },
	scriptEnum = {
		ObjType = { isOfficial = true },
		LocalOnly = { isOfficial = false },
	},
	scriptEnvList = {
		map = { env = devEnv, scriptEnv = wrapper, gData = gData, evnType = nil },
		AgentOfficialEnv = { env = officialEnv, scriptEnv = officialWrapper, gData = {}, evnType = 1 },
		["AgentOfficialEnv_3"] = { env = motionEnv, scriptEnv = motionWrapper, gData = {}, evnType = 3 },
	},
}

function ScriptEnvMgr:GetScriptFenv(modId, scriptSourceType, evnType)
	local key = "dev"
	if evnType == 3 then
		key = "motion"
	elseif modId ~= nil and modId ~= "map" then
		key = "official"
	end
	return faces[key]
end

_G.UGCGetInst = function(name)
	if name == "ScriptEnvMgr" then return ScriptEnvMgr end
	return nil
end

_G.GetInst = _G.UGCGetInst

_G.ModScriptSourceType = { DevEditor = 3, Dev = 2, Official = 1 }
_G.DevApiEnvType = { Client = 2, Host = 1, Motion = 3 }

_G.DevApiMType = {
	Mod = 9, BoardCast = 8, HostAndClient = 7, ReportHost = 6, ClientData = 5,
	SyncPack = 4, Sync = 3, NoBlock = 2, Block = 1, Normal = 0,
}
_G.DevApiRType = {
	ResetCompareParam = 6, CompareParam = 5, TimeLimit = 4, WhiteList = 3,
	Uin_TimeLimit = 2, ResendMsg = 7,
}
_G.DevApiCfg = {
	services = {
		Player = {
			ix = 1,
			dismethods = {},
			methods = {
				{ "GetHostUin", DevApiMType.Mod },
				{
					"GetFriendList",
					DevApiMType.Mod,
					{ [DevApiRType.Uin_TimeLimit] = { 10, "调用频繁，请稍后尝试！" } },
				},
			},
		},
		World = {
			ix = 2,
			dismethods = {},
			methods = {
				"Teleport",
				{
					"Secret",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = { 3 },
						[DevApiRType.ResetCompareParam] = { 3, "SetScale", "SmoothScaleTo" },
						[DevApiRType.WhiteList] = 'LuaApi3_Stub"quote',
					},
				},
			},
		},
		Timer = {
			ix = 3,
			dismethods = {},
			methods = {},
			items = {
				Inner = {
					dismethods = {},
					methods = { { "Nested", DevApiMType.Block, { [DevApiRType.TimeLimit] = 30 } } },
				},
			},
		},
		Trigger = {
			ix = 4,
			dismethods = {},
			methods = {},
			items = {
				Inner = {
					dismethods = {},
					methods = { { "Nested", DevApiMType.Block, { [DevApiRType.TimeLimit] = 30 } } },
				},
			},
		},
	},
}

_G.GetClientInfo = function()
	return {
		GetClientVersionStr = function() return "0.0.0-stub" end,
	}
end

--#endregion

DUMP_ENV_CONFIG = { outdir = outdir, verbose = true }

local chunk, err = loadfile(envDir .. "/dump_env.lua")
if not chunk then
	error("cannot load dump_env.lua from " .. envDir .. ": " .. tostring(err))
end

local results = chunk()
results.outdir = outdir
return results
