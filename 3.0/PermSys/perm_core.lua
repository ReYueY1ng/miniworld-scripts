---@class PermCore: WorldComponent
local PermCore = {}

local USER_BACKEND_MAP = { [0] = "table", [1] = "global_string", [2] = "private_string", [3] = "global_kv" }
local GROUP_BACKEND_MAP = { [0] = "table", [1] = "global_string", [2] = "global_kv" }

if Mini.Enum then
    PermCore.UserBackendEnum = Mini.Enum({
        table          = { sort = 1, value = 0, displayName = "table" },
        global_string  = { sort = 2, value = 1, displayName = "global_string" },
        private_string = { sort = 3, value = 2, displayName = "private_string" },
        global_kv      = { sort = 4, value = 3, displayName = "global_kv" },
    })
    PermCore.GroupBackendEnum = Mini.Enum({
        table         = { sort = 1, value = 0, displayName = "table" },
        global_string = { sort = 2, value = 1, displayName = "global_string" },
        global_kv     = { sort = 3, value = 2, displayName = "global_kv" },
    })
end

PermCore.propertys = {
    userStorageBackend = PermCore.UserBackendEnum and {
        type = PermCore.UserBackendEnum,
        enumDef = PermCore.UserBackendEnum,
        sort = 1,
        default = PermCore.UserBackendEnum.table,
        displayName = "用户存储后端",
    } or {
        type = Mini.String,
        sort = 1,
        default = "table",
        displayName = "用户存储后端",
    },
    userVarId = {
        type = Mini.String,
        sort = 2,
        default = "",
        displayName = "用户变量ID",
        tips = "Data变量ID，留空则使用默认值",
    },
    groupStorageBackend = PermCore.GroupBackendEnum and {
        type = PermCore.GroupBackendEnum,
        enumDef = PermCore.GroupBackendEnum,
        sort = 3,
        default = PermCore.GroupBackendEnum.table,
        displayName = "组存储后端",
    } or {
        type = Mini.String,
        sort = 3,
        default = "table",
        displayName = "组存储后端",
    },
    groupVarId = {
        type = Mini.String,
        sort = 4,
        default = "",
        displayName = "组变量ID",
        tips = "Data变量ID，留空则使用默认值\n可与用户kv表共存",
    },
    users = {
        type = Mini.Array,
        sort = 5,
        itemType = Mini.CustomData,
        hideSize = true,
        customDisplayName = '玩家',
        customDef = {
            uin = {
                displayName = 'Uin',
                type = Mini.String,
                sort = 1,
                default = '1000'
            },
            truePermissions = {
                displayName = '启用权限',
                type = Mini.Array,
                itemType = Mini.String,
                hideSize = true,
                sort = 2
            },
            falsePermissions = {
                displayName = '禁用权限',
                type = Mini.Array,
                itemType = Mini.String,
                hideSize = true,
                sort = 3
            }
        }
    },
    groups = {
        type = Mini.Array,
        sort = 6,
        itemType = Mini.CustomData,
        hideSize = true,
        customDisplayName = '组',
        customDef = {
            name = {
                displayName = '名称',
                type = Mini.String,
                sort = 1,
                default = 'default'
            },
            truePermissions = {
                displayName = '启用权限',
                type = Mini.Array,
                itemType = Mini.String,
                hideSize = true,
                sort = 2
            },
            falsePermissions = {
                displayName = '禁用权限',
                type = Mini.Array,
                itemType = Mini.String,
                hideSize = true,
                sort = 3
            }
        }
    },

}

---@return Mini.Array
local function arrayWrapper(propertytype)
    local arrayUserData = Mini.Array(propertytype)
    local newArray = {}
    local meta = {}
    local getcount = 0
    function meta.__index(_, key)
        if key == '__className_' then
            getcount = getcount + 1
            if getcount == 3 then
                return "String"
            else
                return "Array"
            end
        else
            return arrayUserData[key]
        end
    end

    return setmetatable(newArray, meta)
end


PermCore.openFnArgs = {
    addUserNode = { returnType = Mini.Bool, displayName = "Add User Node", params = { Mini.Number, Mini.String, Mini.Bool } },
    removeUserNode = { returnType = Mini.Bool, displayName = "Remove User Node", params = { Mini.Number, Mini.String } },
    setUserMeta = { returnType = Mini.Bool, displayName = "Set User Meta", params = { Mini.Number, Mini.String, Mini.String } },
    getUserMeta = { returnType = Mini.String, displayName = "Get User Meta", params = { Mini.Number, Mini.String } },
    removeUserMeta = { returnType = Mini.Bool, displayName = "Remove User Meta", params = { Mini.Number, Mini.String } },
    getAllUserMeta = { returnType = arrayWrapper(Mini.String), displayName = "Get All User Meta", params = { Mini.Number } },
    setGroupMeta = { returnType = Mini.Bool, displayName = "Set Group Meta", params = { Mini.String, Mini.String, Mini.String } },
    getGroupMeta = { returnType = Mini.String, displayName = "Get Group Meta", params = { Mini.String, Mini.String } },
    removeGroupMeta = { returnType = Mini.Bool, displayName = "Remove Group Meta", params = { Mini.String, Mini.String } },
    getAllGroupMeta = { returnType = arrayWrapper(Mini.String), displayName = "Get All Group Meta", params = { Mini.String } },
    registerContextProvider = { returnType = Mini.Bool, displayName = "Register Context Provider", params = { Mini.String } },
    unregisterContextProvider = { returnType = Mini.Bool, displayName = "Unregister Context Provider", params = { Mini.String } },
    registerListener = { returnType = Mini.Bool, displayName = "Register Event Listener", params = { Mini.String, Mini.String } },
    unregisterListener = { returnType = Mini.Bool, displayName = "Unregister Event Listener", params = { Mini.String, Mini.String } },
    hasPermission = { returnType = Mini.Bool, displayName = "Check Permission", params = { Mini.Number, Mini.String } },
    getUserGroups = { returnType = arrayWrapper(Mini.String), displayName = "Get User Groups", params = { Mini.Number } },
    getPrimaryGroup = { returnType = Mini.String, displayName = "Get Primary Group", params = { Mini.Number } },
    addTemporaryPermission = { returnType = Mini.Bool, displayName = "Add Temp Permission", params = { Mini.Number, Mini.String, Mini.Number } },
    addUser = { returnType = Mini.Bool, displayName = "Add User", params = { Mini.String } },
    removeUser = { returnType = Mini.Bool, displayName = "Remove User", params = { Mini.String } },
    clearUser = { returnType = Mini.Bool, displayName = "Clear User", params = { Mini.String } },
    addUserToGroup = { returnType = Mini.Bool, displayName = "Add User To Group", params = { Mini.String, Mini.String } },
    removeUserFromGroup = { returnType = Mini.Bool, displayName = "Remove User From Group", params = { Mini.String, Mini.String } },
    setPrimaryGroup = { returnType = Mini.Bool, displayName = "Set Primary Group", params = { Mini.String, Mini.String } },
    createGroup = { returnType = Mini.Bool, displayName = "Create Group", params = { Mini.String, Mini.Number } },
    deleteGroup = { returnType = Mini.Bool, displayName = "Delete Group", params = { Mini.String } },
    clearGroup = { returnType = Mini.Bool, displayName = "Clear Group", params = { Mini.String } },
    setGroupWeight = { returnType = Mini.Bool, displayName = "Set Group Weight", params = { Mini.String, Mini.Number } },
    addGroupNode = { returnType = Mini.Bool, displayName = "Add Group Node", params = { Mini.String, Mini.String } },
    removeGroupNode = { returnType = Mini.Bool, displayName = "Remove Group Node", params = { Mini.String, Mini.String } },
    addInheritance = { returnType = Mini.Bool, displayName = "Add Inheritance", params = { Mini.String, Mini.String } },
    removeInheritance = { returnType = Mini.Bool, displayName = "Remove Inheritance", params = { Mini.String, Mini.String } },
    renameGroup = { returnType = Mini.Bool, displayName = "Rename Group", params = { Mini.String, Mini.String } },
    checkPermission = true, -- returns true|false|nil, not suitable for trigger Mini.Bool
    isSyncReady = { returnType = Mini.Bool, displayName = "Is Sync Ready" },
    getSyncQueueSize = { returnType = Mini.Number, displayName = "Get Sync Queue Size" },
    enableLogging = { displayName = "Enable Logging" },
    disableLogging = { displayName = "Disable Logging" },
    isLoggingEnabled = { returnType = Mini.Bool, displayName = "Is Logging Enabled" },
    matchPattern = { returnType = Mini.Bool, displayName = "Match Pattern", params = { Mini.String, Mini.String } },
    getMaxLogEntries = { returnType = Mini.Number, displayName = "Get Max Log Entries" },
    ensureUser = true,
    getGroupMembers = { returnType = arrayWrapper(Mini.String), displayName = "Get Group Members", params = { Mini.String } },
    getInheritedNodes = { returnType = arrayWrapper(Mini.String), displayName = "Get Inherited Nodes", params = { Mini.String } },
    getActionLogRecent = { returnType = arrayWrapper(Mini.String), displayName = "Get Action Log Recent", params = { Mini.Number } },
    searchActionLog = { returnType = arrayWrapper(Mini.String), displayName = "Search Action Log", params = { Mini.String } },
    getMaxActionLogEntries = { returnType = Mini.Number, displayName = "Get Max Action Log Entries" },
    searchPermissions = { returnType = arrayWrapper(Mini.String), displayName = "Search Permissions", params = { Mini.String } },
    cloneUser = { returnType = Mini.Bool, displayName = "Clone User", params = { Mini.String, Mini.String } },
    cloneGroup = { returnType = Mini.Bool, displayName = "Clone Group", params = { Mini.String, Mini.String } },
    getAllUsers = { returnType = arrayWrapper(Mini.String), displayName = "Get All Users" },
    getAllGroups = { returnType = arrayWrapper(Mini.String), displayName = "Get All Groups" },
    clearPermCache = { displayName = "Clear Permission Cache" },
    clearPlayerCache = { displayName = "Clear Player Cache", params = { Mini.Number } },
    addTemporaryParent = { returnType = Mini.Bool, displayName = "Add Temporary Parent", params = { Mini.Number, Mini.String, Mini.Number } },
    removeTemporaryParent = { returnType = Mini.Bool, displayName = "Remove Temporary Parent", params = { Mini.Number, Mini.String } },
    cleanTempGroups = { returnType = Mini.Bool, displayName = "Clean Temp Groups", params = { Mini.Number } },
    createTrack = { returnType = Mini.Bool, displayName = "Create Track", params = { Mini.String } },
    deleteTrack = { returnType = Mini.Bool, displayName = "Delete Track", params = { Mini.String } },
    getTrack = { returnType = Mini.String, displayName = "Get Track", params = { Mini.String } },
    getAllTracks = { returnType = arrayWrapper(Mini.String), displayName = "Get All Tracks" },
    appendTrack = { returnType = Mini.Bool, displayName = "Append Track", params = { Mini.String, Mini.String } },
    insertTrack = { returnType = Mini.Bool, displayName = "Insert Track", params = { Mini.String, Mini.Number, Mini.String } },
    removeTrackGroup = { returnType = Mini.Bool, displayName = "Remove Track Group", params = { Mini.String, Mini.String } },
    clearTrack = { returnType = Mini.Bool, displayName = "Clear Track", params = { Mini.String } },
    renameTrack = { returnType = Mini.Bool, displayName = "Rename Track", params = { Mini.String, Mini.String } },
    cloneTrack = { returnType = Mini.Bool, displayName = "Clone Track", params = { Mini.String, Mini.String } },
    promoteUser = { returnType = Mini.Bool, displayName = "Promote User", params = { Mini.Number, Mini.String } },
    demoteUser = { returnType = Mini.Bool, displayName = "Demote User", params = { Mini.Number, Mini.String } },
    registerVerboseListener = { returnType = Mini.Bool, displayName = "Register Verbose Listener", params = { Mini.Number, Mini.String } },
    unregisterVerboseListener = { returnType = Mini.Bool, displayName = "Unregister Verbose Listener", params = { Mini.Number } },
    getGroupWeight = { returnType = Mini.Number, displayName = "Get Group Weight", params = { Mini.String } },
    getGroupNodes = { returnType = arrayWrapper(Mini.String), displayName = "Get Group Nodes", params = { Mini.String } },
    registerPermissions = true,
    unregisterPermissions = true,
    getRegisteredPermissions = true,
    getPermissionsByPlugin = true,
}

----------------------------------------------------------------------
-- Config
----------------------------------------------------------------------

local Config = {
    DEFAULT_GROUP = "default",
    COMMAND_PREFIX = "/perm",
    SCHEMA_VERSION = "v1",
    WEIGHT_MIN = 0,
    WEIGHT_MAX = 1000,
    MAX_GROUPS_PER_PLAYER = 10,
    MAX_INHERITANCE_DEPTH = 10,
    MAX_USERS = 1000,
    MAX_GROUPS = 100,
    MAX_PERMS_PER_GROUP = 50,
    MAX_LOG_ENTRIES = 1000,
    MAX_ACTION_LOG_ENTRIES = 5000,
    MAX_PERM_CACHE = 5000,
    MAX_TRACKS = 100,
    MAX_GROUPS_PER_TRACK = 20,
    SYNC_RATE_LIMIT_SECONDS = 15,
    SYNC_MSG_ID = "PermSys_Sync",
    SYNC_QUEUE_INTERVAL = 5,
    VERBOSE_LOGGING_DEFAULT = false,
    VARID_USERS = "v7664925802106940633686758",
    VARID_GROUPS = "v7664925836466679001686759",
    VARID_SCHEMA = "v7664925497164262617686756",
    VARID_LOG = "v7664925724797529305686757",
    VARID_ACTIONLOG = "v7664925724797529315686758",
    VARID_TRACKS = "v7664925836466679011686760",
}

-- forward declaration for cache invalidation (must be before any function that clears perm_cache)
local perm_cache = {}

----------------------------------------------------------------------
-- Models
----------------------------------------------------------------------

local PermNode = {}
local User = {}
local Group = {}
local Track = {}

function PermNode.new(key, value, contexts, expiry)
    return {
        key      = key,
        value    = value,
        contexts = contexts,
        expiry   = expiry,
    }
end

function User.new(uin)
    return {
        uin          = uin,
        primaryGroup = "default",
        groups       = {},
        nodes        = {},
        meta         = {},
        tempGroups   = {},
    }
end

function Group.new(name, weight)
    return {
        name             = name,
        weight           = weight or 0,
        nodes            = {},
        inheritanceNodes = {},
        members          = {},
        meta             = {},
    }
end

function Track.new(name, groups)
    return {
        name   = name,
        groups = groups or {},
    }
end

----------------------------------------------------------------------
-- Storage
----------------------------------------------------------------------

local Storage = {}

local function encode(tbl)
    if tbl == nil then return nil end
    return json.encode(tbl)
end

local function decode(str)
    if str == nil or str == "" then return nil end
    local ok, result = pcall(json.decode, str)
    if ok then return result end
    print("[PermSys] Storage: JSON decode failed: " .. tostring(result))
    return nil
end

----------------------------------------------------------------------
-- Table Backend (Data.Table with CSV-imported tables)
----------------------------------------------------------------------

local table_backend  = {}
local COL_KEY        = 1
local COL_DATA       = 2
local tb_user_var    = Config.VARID_USERS
local tb_group_var   = Config.VARID_GROUPS
local tb_user_cache  = {}
local tb_group_cache = {}

local function find_row(varId, col, value)
    local row = Data.Table:GetRowIndex(varId, nil, col, value)
    if row ~= nil and row > 0 then return row end
    return nil
end

local function table_upsert(varId, keyVal, data)
    local data_str = encode(data)
    if not data_str then return false end
    local row = find_row(varId, COL_KEY, keyVal)
    if row then
        return Data.Table:SetValue(varId, nil, row, COL_DATA, data_str)
    else
        return Data.Table:InsertValueByRow(varId, nil, { keyVal, data_str })
    end
end

local function table_load(varId, keyVal)
    local row = find_row(varId, COL_KEY, keyVal)
    if not row then return nil end
    local data_str = Data.Table:GetValue(varId, nil, row, COL_DATA)
    return decode(data_str)
end

local function table_delete(varId, keyVal)
    local row = find_row(varId, COL_KEY, keyVal)
    if not row then return false end
    return Data.Table:RemoveRow(varId, nil, row)
end

function table_backend.init(userVarId, groupVarId)
    tb_user_var = userVarId
    tb_group_var = groupVarId
    tb_user_cache = {}
    tb_group_cache = {}
end

function table_backend.save_user(uin, userData)
    tb_user_cache[uin] = userData
    return table_upsert(tb_user_var, uin, userData)
end

function table_backend.load_user(uin)
    if tb_user_cache[uin] ~= nil then return tb_user_cache[uin] end
    local data = table_load(tb_user_var, uin)
    if data then tb_user_cache[uin] = data end
    return data
end

function table_backend.delete_user(uin)
    tb_user_cache[uin] = nil
    return table_delete(tb_user_var, uin)
end

function table_backend.get_all_users()
    local col = Data.Table:GetValuesByCol(tb_user_var, nil, COL_KEY)
    if not col then return {} end
    return col
end

function table_backend.clear_user_cache(uin)
    tb_user_cache[uin] = nil
end

function table_backend.save_group(groupName, groupData)
    tb_group_cache[groupName] = groupData
    return table_upsert(tb_group_var, groupName, groupData)
end

function table_backend.load_group(groupName)
    if tb_group_cache[groupName] ~= nil then return tb_group_cache[groupName] end
    local data = table_load(tb_group_var, groupName)
    if data then tb_group_cache[groupName] = data end
    return data
end

function table_backend.delete_group(groupName)
    tb_group_cache[groupName] = nil
    return table_delete(tb_group_var, groupName)
end

function table_backend.get_all_groups()
    local col = Data.Table:GetValuesByCol(tb_group_var, nil, COL_KEY)
    if not col then return {} end
    return col
end

----------------------------------------------------------------------
-- Global String Backend (Data:SetValue single JSON blob)
----------------------------------------------------------------------

local global_string_backend = {}
local gs_user_cache = nil
local gs_group_cache = nil
local gs_user_var = nil
local gs_group_var = nil

local function gs_load_users()
    if gs_user_cache then return gs_user_cache end
    local raw = Data:GetValue(gs_user_var, nil)
    gs_user_cache = decode(raw) or {}
    return gs_user_cache
end

local function gs_save_users(data)
    gs_user_cache = data
    return Data:SetValue(gs_user_var, nil, encode(data))
end

local function gs_load_groups()
    if gs_group_cache then return gs_group_cache end
    local raw = Data:GetValue(gs_group_var, nil)
    gs_group_cache = decode(raw) or {}
    return gs_group_cache
end

local function gs_save_groups(data)
    gs_group_cache = data
    return Data:SetValue(gs_group_var, nil, encode(data))
end

function global_string_backend.init(userVarId, groupVarId)
    gs_user_var = userVarId
    gs_group_var = groupVarId
    gs_user_cache = nil
    gs_group_cache = nil
end

function global_string_backend.save_user(uin, userData)
    local all = gs_load_users()
    all[tostring(uin)] = userData
    return gs_save_users(all)
end

function global_string_backend.load_user(uin)
    local all = gs_load_users()
    return all[tostring(uin)]
end

function global_string_backend.delete_user(uin)
    local all = gs_load_users()
    all[tostring(uin)] = nil
    return gs_save_users(all)
end

function global_string_backend.get_all_users()
    local all = gs_load_users()
    local result = {}
    for k, _ in pairs(all) do result[#result + 1] = k end
    return result
end

function global_string_backend.clear_user_cache(_uin)
end

function global_string_backend.save_group(groupName, groupData)
    local all = gs_load_groups()
    all[groupName] = groupData
    return gs_save_groups(all)
end

function global_string_backend.load_group(groupName)
    local all = gs_load_groups()
    return all[groupName]
end

function global_string_backend.delete_group(groupName)
    local all = gs_load_groups()
    all[groupName] = nil
    return gs_save_groups(all)
end

function global_string_backend.get_all_groups()
    local all = gs_load_groups()
    local result = {}
    for k, _ in pairs(all) do result[#result + 1] = k end
    return result
end

----------------------------------------------------------------------
-- Private String Backend (Data:SetValue per-player, users only)
----------------------------------------------------------------------

local private_string_backend = {}
local ps_user_var = nil
local ps_user_cache = {}

function private_string_backend.init(userVarId, _groupVarId)
    ps_user_var = userVarId
    ps_user_cache = {}
end

function private_string_backend.save_user(uin, userData)
    ps_user_cache[tostring(uin)] = userData
    return Data:SetValue(ps_user_var, tonumber(uin), encode(userData))
end

function private_string_backend.load_user(uin)
    local key = tostring(uin)
    if ps_user_cache[key] ~= nil then return ps_user_cache[key] end
    local raw = Data:GetValue(ps_user_var, tonumber(uin))
    local data = decode(raw)
    if data then ps_user_cache[key] = data end
    return data
end

function private_string_backend.delete_user(uin)
    ps_user_cache[tostring(uin)] = nil
    return Data:SetValue(ps_user_var, tonumber(uin), nil)
end

function private_string_backend.get_all_users()
    return {}
end

function private_string_backend.clear_user_cache(uin)
    ps_user_cache[tostring(uin)] = nil
end

function private_string_backend.save_group(groupName, groupData)
    return global_string_backend.save_group(groupName, groupData)
end

function private_string_backend.load_group(groupName)
    return global_string_backend.load_group(groupName)
end

function private_string_backend.delete_group(groupName)
    return global_string_backend.delete_group(groupName)
end

function private_string_backend.get_all_groups()
    return global_string_backend.get_all_groups()
end

----------------------------------------------------------------------
-- Global KV Backend (Data.Map, single table for users + groups)
----------------------------------------------------------------------

local global_kv_backend = {}
local gk_var = nil
local gk_user_cache = {}
local gk_group_cache = {}

function global_kv_backend.init(userVarId, _groupVarId)
    gk_var = userVarId
    gk_user_cache = {}
    gk_group_cache = {}
end

function global_kv_backend.save_user(uin, userData)
    gk_user_cache[tostring(uin)] = userData
    local code = Data.Map:SetValueAndBlock(gk_var, nil, "user:" .. tostring(uin), encode(userData))
    local ok = code == ErrorCode.OK
    if ok and MultiServerSync and MultiServerSync.is_ready() then
        MultiServerSync.broadcast_change("user_update", { uin = tostring(uin), data = userData })
    end
    return ok
end

function global_kv_backend.load_user(uin)
    local key = tostring(uin)
    if gk_user_cache[key] ~= nil then return gk_user_cache[key] end
    local code, _, value = Data.Map:GetValueAndBlock(gk_var, nil, "user:" .. key)
    if code ~= ErrorCode.OK then return nil end
    local data = decode(value)
    if data then gk_user_cache[key] = data end
    return data
end

function global_kv_backend.delete_user(uin)
    gk_user_cache[tostring(uin)] = nil
    local code = Data.Map:RemoveValueAndBlock(gk_var, nil, "user:" .. tostring(uin))
    local ok = code == ErrorCode.OK
    if ok and MultiServerSync and MultiServerSync.is_ready() then
        MultiServerSync.broadcast_change("user_update", { uin = tostring(uin), deleted = true })
    end
    return ok
end

function global_kv_backend.get_all_users()
    return {}
end

function global_kv_backend.clear_user_cache(uin)
    gk_user_cache[tostring(uin)] = nil
end

function global_kv_backend.save_group(groupName, groupData)
    gk_group_cache[groupName] = groupData
    local code = Data.Map:SetValueAndBlock(gk_var, nil, "group:" .. groupName, encode(groupData))
    local ok = code == ErrorCode.OK
    if ok and MultiServerSync and MultiServerSync.is_ready() then
        MultiServerSync.broadcast_change("group_update", { groupName = groupName, data = groupData })
    end
    return ok
end

function global_kv_backend.load_group(groupName)
    if gk_group_cache[groupName] ~= nil then return gk_group_cache[groupName] end
    local code, _, value = Data.Map:GetValueAndBlock(gk_var, nil, "group:" .. groupName)
    if code ~= ErrorCode.OK then return nil end
    local data = decode(value)
    if data then gk_group_cache[groupName] = data end
    return data
end

function global_kv_backend.delete_group(groupName)
    gk_group_cache[groupName] = nil
    local code = Data.Map:RemoveValueAndBlock(gk_var, nil, "group:" .. groupName)
    local ok = code == ErrorCode.OK
    if ok and MultiServerSync and MultiServerSync.is_ready() then
        MultiServerSync.broadcast_change("group_update", { groupName = groupName, deleted = true })
    end
    return ok
end

function global_kv_backend.get_all_groups()
    return {}
end

function global_kv_backend.apply_sync_user(uin, data)
    gk_user_cache[tostring(uin)] = data
end

function global_kv_backend.apply_sync_group(groupName, data)
    gk_group_cache[groupName] = data
end

----------------------------------------------------------------------
-- Storage facade (delegates to active backend)
----------------------------------------------------------------------

local user_backend = table_backend
local group_backend = table_backend
local user_backend_type = "table"

function Storage.init(userBackendType, userVarId, groupBackendType, groupVarId)
    local backends = {
        table = table_backend,
        global_string = global_string_backend,
        private_string = private_string_backend,
        global_kv = global_kv_backend,
    }
    user_backend = backends[userBackendType] or table_backend
    group_backend = backends[groupBackendType] or table_backend
    user_backend_type = userBackendType or "table"
    user_backend.init(userVarId, groupVarId)
    if group_backend ~= user_backend then
        group_backend.init(userVarId, groupVarId)
    end
end

function Storage.get_user_backend_type()
    return user_backend_type
end

function Storage.is_kv_backend()
    return user_backend == global_kv_backend or group_backend == global_kv_backend
end

function Storage.apply_sync_user(uin, data)
    if user_backend == global_kv_backend then
        global_kv_backend.apply_sync_user(uin, data)
    end
end

function Storage.apply_sync_group(groupName, data)
    if group_backend == global_kv_backend then
        global_kv_backend.apply_sync_group(groupName, data)
    end
end

function Storage.save_user(uin, userData)
    local ok = user_backend.save_user(uin, userData)
    if not ok then print("[PermSys] Storage: save_user failed for uin=" .. tostring(uin)) end
    return ok
end

function Storage.load_user(uin)
    return user_backend.load_user(uin)
end

function Storage.delete_user(uin)
    local ok = user_backend.delete_user(uin)
    if not ok then print("[PermSys] Storage: delete_user not found or failed, uin=" .. tostring(uin)) end
    return ok
end

function Storage.get_all_users()
    return user_backend.get_all_users()
end

function Storage.clear_user_cache(uin)
    user_backend.clear_user_cache(uin)
end

function Storage.save_group(groupName, groupData)
    local ok = group_backend.save_group(groupName, groupData)
    if not ok then print("[PermSys] Storage: save_group failed for group=" .. tostring(groupName)) end
    return ok
end

function Storage.load_group(groupName)
    return group_backend.load_group(groupName)
end

function Storage.delete_group(groupName)
    local ok = group_backend.delete_group(groupName)
    if not ok then print("[PermSys] Storage: delete_group not found or failed, group=" .. tostring(groupName)) end
    return ok
end

function Storage.get_all_groups()
    return group_backend.get_all_groups()
end

function Storage.get_room_id()
    return CloudSever:GetRoomID()
end

function Storage.save_schema_version(version)
    local ok = Data:SetValue(Config.VARID_SCHEMA, nil, version)
    if not ok then print("[PermSys] Storage: failed to save schema version") end
    return ok
end

function Storage.load_schema_version()
    local val = Data:GetValue(Config.VARID_SCHEMA, nil)
    if val == nil or val == "" then return nil end
    return tostring(val)
end

----------------------------------------------------------------------
-- Validation
----------------------------------------------------------------------

local Validation = {}

function Validation.isValidUin(uin)
    if type(uin) ~= "string" then
        return false, "uin must be a string"
    end
    if uin == "" then
        return false, "uin must not be empty"
    end
    return true, nil
end

function Validation.isValidNodeKey(key)
    if type(key) ~= "string" then
        return false, "node key must be a string"
    end
    if key == "" then
        return false, "node key must not be empty"
    end
    if #key > 200 then
        return false, "node key must not exceed 200 characters"
    end
    if not key:match("^[a-z0-9.*]+$") then
        return false, "node key must contain only lowercase alphanumeric characters, dots, and asterisks"
    end
    if key:match("^%.") or key:match("%.$") or key:match("%.%.") then
        return false, "node key must not have leading, trailing, or consecutive dots"
    end
    return true, nil
end

function Validation.isValidGroupName(name)
    if type(name) ~= "string" then
        return false, "group name must be a string"
    end
    if name == "" then
        return false, "group name must not be empty"
    end
    if not name:match("^[a-z0-9%-]+$") then
        return false, "group name must contain only lowercase alphanumeric characters and hyphens"
    end
    if name:match("^%-") or name:match("%-$") or name:match("%-%-") then
        return false, "group name must not have leading, trailing, or consecutive hyphens"
    end
    return true, nil
end

function Validation.isValidWeight(weight)
    if type(weight) ~= "number" then
        return false, "weight must be a number"
    end
    if weight ~= math.floor(weight) then
        return false, "weight must be an integer"
    end
    if weight < Config.WEIGHT_MIN or weight > Config.WEIGHT_MAX then
        return false, string.format("weight must be between %d and %d", Config.WEIGHT_MIN, Config.WEIGHT_MAX)
    end
    return true, nil
end

function Validation.isValidExpiry(expiry)
    if type(expiry) ~= "number" then
        return false, "expiry must be a number (Unix timestamp in seconds)"
    end
    if expiry ~= math.floor(expiry) then
        return false, "expiry must be an integer"
    end
    local now = os.time()
    if expiry <= now then
        return false, "expiry must be a future timestamp"
    end
    return true, nil
end

----------------------------------------------------------------------
-- Schema
----------------------------------------------------------------------

local Schema = {}

local CURRENT_VERSION = Config.SCHEMA_VERSION

local KNOWN_VERSIONS = { "v1" }

local function version_index(version)
    for i, v in ipairs(KNOWN_VERSIONS) do
        if v == version then
            return i
        end
    end
    return nil
end

function Schema.migrate_v1_to_v2(data)
    return data
end

function Schema.check_version(storage)
    local stored = storage.load_schema_version()

    if not stored or stored == "" then
        storage.save_schema_version(CURRENT_VERSION)
        print("[PermSys] Schema: no stored version found, initialised to " .. CURRENT_VERSION)
        return CURRENT_VERSION
    end

    if stored ~= CURRENT_VERSION then
        print("[PermSys] Schema WARNING: stored version '" .. stored
            .. "' differs from current version '" .. CURRENT_VERSION .. "'")
    end

    return stored
end

function Schema.migrate(data, from_version, to_version)
    if from_version == to_version then
        return data
    end

    local from_idx = version_index(from_version)
    local to_idx   = version_index(to_version)

    if not from_idx then
        print("[PermSys] Schema ERROR: unknown source version '" .. from_version .. "', returning data unchanged")
        return data
    end
    if not to_idx then
        print("[PermSys] Schema ERROR: unknown target version '" .. to_version .. "', returning data unchanged")
        return data
    end

    for i = from_idx, to_idx - 1 do
        local src = KNOWN_VERSIONS[i]
        local dst = KNOWN_VERSIONS[i + 1]
        local fn_name = "migrate_" .. src:gsub("%.", "_") .. "_to_" .. dst:gsub("%.", "_")

        local fn = Schema[fn_name]
        if fn then
            print("[PermSys] Schema: migrating " .. src .. " -> " .. dst .. " ...")
            data = fn(data)
        else
            print("[PermSys] Schema WARNING: no migration function '" .. fn_name .. "', skipping")
        end
    end

    return data
end

----------------------------------------------------------------------
-- DefaultGroup
----------------------------------------------------------------------

local DefaultGroup = {}

function DefaultGroup.ensure_default_group()
    local existing = Storage.load_group(Config.DEFAULT_GROUP)
    if existing then
        return false
    end

    local group = Group.new(Config.DEFAULT_GROUP, Config.WEIGHT_MIN)
    local ok = Storage.save_group(Config.DEFAULT_GROUP, group)
    if ok then
        print("[PermSys] DefaultGroup: created 'default' group")
    else
        print("[PermSys] DefaultGroup: FAILED to create 'default' group")
    end
    return ok
end

function DefaultGroup.is_default_group(groupName)
    return groupName == Config.DEFAULT_GROUP
end

function DefaultGroup.can_delete_group(groupName)
    if groupName == Config.DEFAULT_GROUP then
        print("[PermSys] DefaultGroup: cannot delete protected group 'default'")
        return false
    end
    return true
end

----------------------------------------------------------------------
-- EventSystem
----------------------------------------------------------------------

local EventSystem                   = {}

EventSystem.EVENT_NODE_ADD          = "node_add"
EventSystem.EVENT_NODE_REMOVE       = "node_remove"
EventSystem.EVENT_USER_GROUP_ADD    = "user_group_add"
EventSystem.EVENT_USER_GROUP_REMOVE = "user_group_remove"
EventSystem.EVENT_GROUP_CREATE      = "group_create"
EventSystem.EVENT_GROUP_DELETE      = "group_delete"

local listeners                     = {}

function EventSystem.registerListener(eventType, callback)
    if type(eventType) ~= "string" or eventType == "" then
        return false, "event type must be a non-empty string"
    end
    if type(callback) ~= "function" then
        return false, "callback must be a function"
    end
    if not listeners[eventType] then
        listeners[eventType] = {}
    end
    table.insert(listeners[eventType], callback)
    return true, nil
end

function EventSystem.unregisterListener(eventType, callback)
    if type(eventType) ~= "string" or eventType == "" then
        return false, "event type must be a non-empty string"
    end
    if type(callback) ~= "function" then
        return false, "callback must be a function"
    end
    local list = listeners[eventType]
    if not list then
        return false, "no listeners for event type '" .. eventType .. "'"
    end
    for i, cb in ipairs(list) do
        if cb == callback then
            table.remove(list, i)
            return true, nil
        end
    end
    return false, "callback not found for event type '" .. eventType .. "'"
end

function EventSystem.fire(eventType, data)
    local list = listeners[eventType]
    if not list then return end
    for _, callback in ipairs(list) do
        pcall(callback, data)
    end
end

----------------------------------------------------------------------
-- PermissionRegistry
----------------------------------------------------------------------

local PermissionRegistry = {}
local perm_registry = {}

function PermissionRegistry.register(pluginName, permissions)
    if type(pluginName) ~= "string" or pluginName == "" then
        return false, "plugin name must be a non-empty string"
    end
    if type(permissions) ~= "table" then
        return false, "permissions must be a table"
    end

    local count = 0
    for _, entry in ipairs(permissions) do
        if type(entry) == "table" and type(entry.node) == "string" and entry.node ~= "" then
            perm_registry[entry.node] = {
                description = entry.description or "",
                default     = entry.default,
                children    = entry.children or {},
                plugin      = pluginName,
            }
            count = count + 1
        end
    end

    print("[PermSys] PermissionRegistry: registered " .. count .. " permissions from '" .. pluginName .. "'")
    return true, count
end

function PermissionRegistry.unregister(pluginName)
    if type(pluginName) ~= "string" or pluginName == "" then
        return false, "plugin name must be a non-empty string"
    end

    local count = 0
    for node, meta in pairs(perm_registry) do
        if meta.plugin == pluginName then
            perm_registry[node] = nil
            count = count + 1
        end
    end

    print("[PermSys] PermissionRegistry: unregistered " .. count .. " permissions from '" .. pluginName .. "'")
    return true, count
end

function PermissionRegistry.get(node)
    return perm_registry[node]
end

function PermissionRegistry.getAll()
    return perm_registry
end

function PermissionRegistry.getByPlugin(pluginName)
    local result = {}
    for node, meta in pairs(perm_registry) do
        if meta.plugin == pluginName then
            result[node] = meta
        end
    end
    return result
end

function PermissionRegistry.applyDefaults()
    for node, meta in pairs(perm_registry) do
        if meta.default == true then
            local group = Storage.load_group(Config.DEFAULT_GROUP)
            if group then
                local exists = false
                for _, n in ipairs(group.nodes or {}) do
                    if n.key == node then exists = true; break end
                end
                if not exists then
                    table.insert(group.nodes, PermNode.new(node, true, {}, nil))
                    Storage.save_group(Config.DEFAULT_GROUP, group)
                end
            end
        end
    end
end

----------------------------------------------------------------------
-- UserManager
----------------------------------------------------------------------

local ActionLogger = {}
local UserManager = {}

local function table_contains(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

local function table_remove_value(tbl, val)
    for i, v in ipairs(tbl) do
        if v == val then
            table.remove(tbl, i)
            return true
        end
    end
    return false
end

local function deep_copy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            copy[k] = deep_copy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

local function is_expired(node)
    if node.expiry == nil then
        return false
    end
    return node.expiry < os.time()
end

local function remove_expired_nodes(user)
    local nodes = user.nodes
    if not nodes or #nodes == 0 then
        return false
    end

    local modified = false
    for i = #nodes, 1, -1 do
        if is_expired(nodes[i]) then
            table.remove(nodes, i)
            modified = true
        end
    end
    return modified
end

function UserManager.addUser(uin)
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    local existing = Storage.load_user(uin)
    if existing then
        return false, "user already exists"
    end

    local user = User.new(uin)
    user.groups = { Config.DEFAULT_GROUP }

    local ok = Storage.save_user(uin, user)
    if not ok then
        return false, "failed to save user to storage"
    end
    return true, nil
end

function UserManager.removeUser(uin)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found or delete failed"
    end

    local allGroups = Storage.get_all_groups()
    for _, groupName in ipairs(allGroups) do
        local group = Storage.load_group(groupName)
        if group and group.members and group.members[uin] then
            group.members[uin] = nil
            Storage.save_group(groupName, group)
        end
    end

    local ok = Storage.delete_user(uin)
    if not ok then
        return false, "user not found or delete failed"
    end
    return true, nil
end

function UserManager.clearUser(uin)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    user.nodes = {}
    user.meta = {}

    local ok = Storage.save_user(uin, user)
    if not ok then
        return false, "failed to save user"
    end
    return true, nil
end

function UserManager.getUser(uin)
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return nil
    end

    return Storage.load_user(uin)
end

function UserManager.getPrimaryGroup(uin)
    local user = UserManager.getUser(uin)
    if not user then
        return nil
    end
    return user.primaryGroup
end

function UserManager.setPrimaryGroup(uin, groupName)
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    if not table_contains(user.groups, groupName) then
        return false, "user is not a member of group '" .. groupName .. "'"
    end

    user.primaryGroup = groupName
    local ok = Storage.save_user(uin, user)
    if not ok then
        return false, "failed to save user"
    end
    return true, nil
end

function UserManager.addUserToGroup(uin, groupName, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    if table_contains(user.groups, groupName) then
        return true, nil
    end

    if #user.groups >= Config.MAX_GROUPS_PER_PLAYER then
        return false, "user has reached the maximum number of groups (" .. Config.MAX_GROUPS_PER_PLAYER .. ")"
    end

    table.insert(user.groups, groupName)

    local ok = Storage.save_user(uin, user)
    if not ok then
        return false, "failed to save user"
    end

    local group = Storage.load_group(groupName)
    if group then
        group.members = group.members or {}
        group.members[uin] = true
        Storage.save_group(groupName, group)
    end

    ActionLogger.log(actor, "addUserToGroup", "user:" .. uin, "Added user " .. uin .. " to group " .. groupName)
    EventSystem.fire(EventSystem.EVENT_USER_GROUP_ADD, { uin = uin, groupName = groupName, actor = actor })
    return true, nil
end

function UserManager.removeUserFromGroup(uin, groupName, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    if user.primaryGroup == groupName then
        return false, "cannot remove the primary group; change primary group first"
    end

    local removed = table_remove_value(user.groups, groupName)
    if not removed then
        return false, "user is not a member of group '" .. groupName .. "'"
    end

    local ok = Storage.save_user(uin, user)
    if not ok then
        return false, "failed to save user"
    end

    local group = Storage.load_group(groupName)
    if group and group.members then
        group.members[uin] = nil
        Storage.save_group(groupName, group)
    end

    ActionLogger.log(actor, "removeUserFromGroup", "user:" .. uin, "Removed user " .. uin .. " from group " .. groupName)
    EventSystem.fire(EventSystem.EVENT_USER_GROUP_REMOVE, { uin = uin, groupName = groupName, actor = actor })
    return true, nil
end

function UserManager.getUserGroups(uin)
    local user = UserManager.getUser(uin)
    if not user then
        return nil
    end
    return user.groups
end

function UserManager.addUserTemporaryPerm(uin, node, duration)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then
        return false, err
    end

    local nodeOk, nodeErr = Validation.isValidNodeKey(node)
    if not nodeOk then
        return false, "invalid node key: " .. tostring(nodeErr)
    end

    if type(duration) ~= "number" or duration <= 0 then
        return false, "duration must be a positive number (seconds)"
    end

    local user = Storage.load_user(uin)
    if not user then
        local createOk, createErr = UserManager.addUser(uin)
        if not createOk then
            return false, "failed to create user: " .. tostring(createErr)
        end
        user = Storage.load_user(uin)
        if not user then
            return false, "user creation succeeded but load failed"
        end
    end

    local expiry = os.time() + math.floor(duration)
    local permNode = PermNode.new(node, true, {}, expiry)

    if not user.nodes then
        user.nodes = {}
    end
    table.insert(user.nodes, permNode)

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then
        return false, "failed to save user"
    end

    return true, nil
end

function UserManager.addUserNode(uin, nodeKey, nodeValue, contexts, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end
    local nodeOk, nodeErr = Validation.isValidNodeKey(nodeKey)
    if not nodeOk then return false, "invalid node key: " .. tostring(nodeErr) end
    if nodeValue == nil then nodeValue = true end
    if contexts == nil then contexts = {} end

    local user = Storage.load_user(uin)
    if not user then
        local createOk, createErr = UserManager.addUser(uin)
        if not createOk then return false, "failed to create user: " .. tostring(createErr) end
        user = Storage.load_user(uin)
        if not user then return false, "user creation succeeded but load failed" end
    end

    if not user.nodes then user.nodes = {} end
    local permNode = PermNode.new(nodeKey, nodeValue, contexts, nil)
    table.insert(user.nodes, permNode)

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then return false, "failed to save user" end
    ActionLogger.log(actor, "addUserNode", "user:" .. uin, "Added node " .. nodeKey .. " to user " .. uin)
    EventSystem.fire(EventSystem.EVENT_NODE_ADD, { uin = uin, nodeKey = nodeKey, nodeValue = nodeValue, actor = actor })
    return true, nil
end

function UserManager.removeUserNode(uin, nodeKey, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end
    local nodeOk, nodeErr = Validation.isValidNodeKey(nodeKey)
    if not nodeOk then return false, "invalid node key: " .. tostring(nodeErr) end

    local user = Storage.load_user(uin)
    if not user then return false, "user not found" end

    local found = false
    for i = #(user.nodes or {}), 1, -1 do
        if user.nodes[i].key == nodeKey then
            table.remove(user.nodes, i)
            found = true
            break
        end
    end

    if not found then return false, "permanent node '" .. nodeKey .. "' not found for user " .. uin end
    local saveOk = Storage.save_user(uin, user)
    if not saveOk then return false, "failed to save user" end
    ActionLogger.log(actor, "removeUserNode", "user:" .. uin, "Removed node " .. nodeKey .. " from user " .. uin)
    EventSystem.fire(EventSystem.EVENT_NODE_REMOVE, { uin = uin, nodeKey = nodeKey, actor = actor })
    return true, nil
end

function UserManager.setMeta(uin, key, value, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end
    if type(key) ~= "string" or key == "" then return false, "meta key must be a non-empty string" end
    local user = Storage.load_user(uin)
    if not user then return false, "user not found" end
    if not user.meta then user.meta = {} end
    user.meta[key] = value
    local saveOk = Storage.save_user(uin, user)
    if not saveOk then return false, "failed to save user" end
    ActionLogger.log(actor, "setMeta", "user:" .. uin,
        "Set meta " .. key .. " = " .. tostring(value) .. " on user " .. uin)
    return true, nil
end

function UserManager.getMeta(uin, key)
    local valid, err = Validation.isValidUin(uin)
    if not valid then return nil end
    if type(key) ~= "string" or key == "" then return nil end
    local user = Storage.load_user(uin)
    if not user or not user.meta then return nil end
    return user.meta[key]
end

function UserManager.removeMeta(uin, key, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end
    if type(key) ~= "string" or key == "" then return false, "meta key must be a non-empty string" end
    local user = Storage.load_user(uin)
    if not user then return false, "user not found" end
    if not user.meta or user.meta[key] == nil then return false, "meta key '" .. key .. "' not found for user " .. uin end
    user.meta[key] = nil
    local saveOk = Storage.save_user(uin, user)
    if not saveOk then return false, "failed to save user" end
    ActionLogger.log(actor, "removeMeta", "user:" .. uin, "Removed meta " .. key .. " from user " .. uin)
    return true, nil
end

function UserManager.getAllMeta(uin)
    local valid, err = Validation.isValidUin(uin)
    if not valid then return {} end
    local user = Storage.load_user(uin)
    if not user or not user.meta then return {} end
    return user.meta
end

function UserManager.ensureUser(uin)
    local user = Storage.load_user(uin)
    if not user then
        local ok, err = UserManager.addUser(uin)
        if not ok then
            print("[PermSys] UserManager: failed to create user " .. tostring(uin) .. ": " .. tostring(err))
            return
        end
        user = Storage.load_user(uin)
        if not user then
            print("[PermSys] UserManager: user " .. tostring(uin) .. " not found after creation")
            return
        end
        print("[PermSys] UserManager: created new user " .. tostring(uin))
    end

    user.tempGroups = user.tempGroups or {}

    UserManager.cleanTempGroups(uin, user)

    local modified = remove_expired_nodes(user)
    if modified then
        local ok = Storage.save_user(uin, user)
        if ok then
            print("[PermSys] UserManager: cleaned expired permissions for user " .. uin)
        else
            print("[PermSys] UserManager: failed to save cleaned user " .. uin)
        end
    end
end

function UserManager.cleanTempGroups(uin, user)
    user = user or Storage.load_user(uin)
    if not user then return false end

    user.tempGroups = user.tempGroups or {}
    local now = os.time()
    local modified = false

    for groupName, expiry in pairs(user.tempGroups) do
        if type(expiry) == "number" and expiry < now then
            user.tempGroups[groupName] = nil
            modified = true

            local group = Storage.load_group(groupName)
            if group then
                group.members = group.members or {}
                group.members[uin] = nil
                Storage.save_group(groupName, group)
            end
        end
    end

    if modified then
        perm_cache = {}
        local saveOk = Storage.save_user(uin, user)
        if saveOk then
            print("[PermSys] UserManager: cleaned expired temp groups for user " .. uin)
        end
    end

    return modified
end

function UserManager.addTemporaryParent(uin, groupName, duration)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end

    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local groupExists = Storage.load_group(groupName)
    if not groupExists then
        return false, "group '" .. groupName .. "' does not exist"
    end

    if type(duration) ~= "number" or duration <= 0 then
        return false, "duration must be a positive number (seconds)"
    end

    local user = Storage.load_user(uin)
    if not user then
        local createOk, createErr = UserManager.addUser(uin)
        if not createOk then
            return false, "failed to create user: " .. tostring(createErr)
        end
        user = Storage.load_user(uin)
        if not user then
            return false, "user creation succeeded but load failed"
        end
    end

    user.tempGroups = user.tempGroups or {}
    user.tempGroups[groupName] = os.time() + math.floor(duration)

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then
        return false, "failed to save user"
    end

    local group = Storage.load_group(groupName)
    if group then
        group.members = group.members or {}
        group.members[uin] = true
        Storage.save_group(groupName, group)
    end

    ActionLogger.log(uin, "addTemporaryParent", "user:" .. uin,
        "Added temp parent group '" .. groupName .. "' for " .. duration .. "s")
    return true, nil
end

function UserManager.removeTemporaryParent(uin, groupName)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end

    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    user.tempGroups = user.tempGroups or {}
    if not user.tempGroups[groupName] then
        return false, "user does not have a temporary membership in group '" .. groupName .. "'"
    end

    user.tempGroups[groupName] = nil

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then
        return false, "failed to save user"
    end

    local group = Storage.load_group(groupName)
    if group and group.members then
        group.members[uin] = nil
        Storage.save_group(groupName, group)
    end

    return true, nil
end

function UserManager.cloneUser(sourceUin, targetUin, actor)
    perm_cache = {}
    local valid1, err1 = Validation.isValidUin(sourceUin)
    if not valid1 then return false, err1 end
    local valid2, err2 = Validation.isValidUin(targetUin)
    if not valid2 then return false, err2 end

    local source = Storage.load_user(sourceUin)
    if not source then
        return false, "source user '" .. sourceUin .. "' not found"
    end

    local existing = Storage.load_user(targetUin)
    if existing then
        return false, "target user '" .. targetUin .. "' already exists"
    end

    local target = User.new(targetUin)
    target.primaryGroup = source.primaryGroup
    target.groups = deep_copy(source.groups)
    target.nodes = deep_copy(source.nodes)
    target.meta = deep_copy(source.meta)

    local ok = Storage.save_user(targetUin, target)
    if not ok then
        return false, "failed to save cloned user"
    end

    ActionLogger.log(actor, "cloneUser", "user:" .. targetUin, "Cloned user " .. sourceUin .. " to " .. targetUin)
    print("[PermSys] UserManager: cloned user " .. sourceUin .. " to " .. targetUin)
    return true, nil
end

----------------------------------------------------------------------
-- GroupManager
----------------------------------------------------------------------

local GroupManager = {}

local function count_groups()
    local names = Storage.get_all_groups()
    return #names
end

function GroupManager.create_group(name, weight, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, err end

    ok, err = Validation.isValidWeight(weight)
    if not ok then return false, err end

    local existing = Storage.load_group(name)
    if existing then
        return false, "group '" .. name .. "' already exists"
    end

    if count_groups() >= Config.MAX_GROUPS then
        return false, "maximum number of groups (" .. Config.MAX_GROUPS .. ") reached"
    end

    local group = Group.new(name, weight)
    local saved = Storage.save_group(name, group)
    if not saved then
        return false, "failed to persist group '" .. name .. "'"
    end

    ActionLogger.log(actor, "create_group", "group:" .. name, "Created group '" .. name .. "' with weight " .. weight)
    EventSystem.fire(EventSystem.EVENT_GROUP_CREATE, { groupName = name, weight = weight, actor = actor })
    print("[PermSys] GroupManager: created group '" .. name .. "' weight=" .. weight)
    return true, nil
end

function GroupManager.delete_group(name, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, err end

    if not DefaultGroup.can_delete_group(name) then
        return false, "cannot delete protected group '" .. name .. "'"
    end

    local existing = Storage.load_group(name)
    if not existing then
        return false, "group '" .. name .. "' does not exist"
    end

    local deleted = Storage.delete_group(name)
    if not deleted then
        return false, "failed to delete group '" .. name .. "'"
    end

    ActionLogger.log(actor, "delete_group", "group:" .. name, "Deleted group '" .. name .. "'")
    EventSystem.fire(EventSystem.EVENT_GROUP_DELETE, { groupName = name, actor = actor })
    print("[PermSys] GroupManager: deleted group '" .. name .. "'")
    return true, nil
end

function GroupManager.clearGroup(groupName, actor)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, err end

    local group = Storage.load_group(groupName)
    if not group then
        return false, "group '" .. groupName .. "' does not exist"
    end

    group.nodes = {}
    group.meta = {}

    local saved = Storage.save_group(groupName, group)
    if not saved then
        return false, "failed to save group '" .. groupName .. "'"
    end

    ActionLogger.log(actor, "clear_group", "group:" .. groupName,
        "Cleared nodes and meta for group '" .. groupName .. "'")
    print("[PermSys] GroupManager: cleared group '" .. groupName .. "'")
    return true, nil
end

function GroupManager.get_group(name)
    return Storage.load_group(name)
end

function GroupManager.get_all_groups()
    return Storage.get_all_groups()
end

function GroupManager.set_weight(name, weight)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, err end

    ok, err = Validation.isValidWeight(weight)
    if not ok then return false, err end

    local group = Storage.load_group(name)
    if not group then
        return false, "group '" .. name .. "' does not exist"
    end

    group.weight = weight
    local saved = Storage.save_group(name, group)
    if not saved then
        return false, "failed to save weight for group '" .. name .. "'"
    end

    return true, nil
end

function GroupManager.get_weight(name)
    local group = Storage.load_group(name)
    if not group then return nil end
    return group.weight
end

function GroupManager.add_group_node(groupName, nodeKey, nodeValue, contexts, expiry, actor)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, err end

    ok, err = Validation.isValidNodeKey(nodeKey)
    if not ok then return false, err end

    if nodeValue == nil then nodeValue = true end
    if contexts == nil then contexts = {} end

    local group = Storage.load_group(groupName)
    if not group then
        return false, "group '" .. groupName .. "' does not exist"
    end

    if #group.nodes >= Config.MAX_PERMS_PER_GROUP then
        return false,
            "group '" ..
            groupName .. "' has reached the maximum number of permission nodes (" .. Config.MAX_PERMS_PER_GROUP .. ")"
    end

    local node = PermNode.new(nodeKey, nodeValue, contexts, expiry)
    table.insert(group.nodes, node)

    local saved = Storage.save_group(groupName, group)
    if not saved then
        return false, "failed to save node for group '" .. groupName .. "'"
    end

    ActionLogger.log(actor, "add_group_node", "group:" .. groupName,
        "Added node " .. nodeKey .. " to group " .. groupName)
    return true, nil
end

function GroupManager.remove_group_node(groupName, nodeKey, actor)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, err end

    ok, err = Validation.isValidNodeKey(nodeKey)
    if not ok then return false, err end

    local group = Storage.load_group(groupName)
    if not group then
        return false, "group '" .. groupName .. "' does not exist"
    end

    local found = false
    for i = #group.nodes, 1, -1 do
        if group.nodes[i].key == nodeKey then
            table.remove(group.nodes, i)
            found = true
            break
        end
    end

    if not found then
        return false, "node '" .. nodeKey .. "' not found in group '" .. groupName .. "'"
    end

    local saved = Storage.save_group(groupName, group)
    if not saved then
        return false, "failed to save group '" .. groupName .. "' after removing node"
    end

    ActionLogger.log(actor, "remove_group_node", "group:" .. groupName,
        "Removed node " .. nodeKey .. " from group " .. groupName)
    return true, nil
end

function GroupManager.get_group_nodes(groupName)
    local group = Storage.load_group(groupName)
    if not group then return nil end
    return group.nodes
end

function GroupManager.set_meta(groupName, key, value, actor)
    perm_cache = {}
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, err end
    if type(key) ~= "string" or key == "" then return false, "meta key must be a non-empty string" end
    local group = Storage.load_group(groupName)
    if not group then return false, "group '" .. groupName .. "' does not exist" end
    if not group.meta then group.meta = {} end
    group.meta[key] = value
    local saved = Storage.save_group(groupName, group)
    if not saved then return false, "failed to save group '" .. groupName .. "'" end
    ActionLogger.log(actor, "set_meta", "group:" .. groupName,
        "Set meta " .. key .. " = " .. tostring(value) .. " on group " .. groupName)
    return true, nil
end

function GroupManager.get_meta(groupName, key)
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return nil end
    if type(key) ~= "string" or key == "" then return nil end
    local group = Storage.load_group(groupName)
    if not group or not group.meta then return nil end
    return group.meta[key]
end

function GroupManager.remove_meta(groupName, key, actor)
    perm_cache = {}
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, err end
    if type(key) ~= "string" or key == "" then return false, "meta key must be a non-empty string" end
    local group = Storage.load_group(groupName)
    if not group then return false, "group '" .. groupName .. "' does not exist" end
    if not group.meta or group.meta[key] == nil then return false,
            "meta key '" .. key .. "' not found in group '" .. groupName .. "'" end
    group.meta[key] = nil
    local saved = Storage.save_group(groupName, group)
    if not saved then return false, "failed to save group '" .. groupName .. "'" end
    ActionLogger.log(actor, "remove_meta", "group:" .. groupName, "Removed meta " .. key .. " from group " .. groupName)
    return true, nil
end

function GroupManager.get_all_meta(groupName)
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return {} end
    local group = Storage.load_group(groupName)
    if not group or not group.meta then return {} end
    return group.meta
end

function GroupManager.get_group_members(groupName)
    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return {} end
    local group = Storage.load_group(groupName)
    if not group then return {} end
    local members = group.members or {}
    local result = {}
    for uin, v in pairs(members) do
        if v then
            result[#result + 1] = uin
        end
    end
    table.sort(result)
    return result
end

function GroupManager.cloneGroup(sourceName, targetName, actor)
    perm_cache = {}
    local ok1, err1 = Validation.isValidGroupName(sourceName)
    if not ok1 then return false, err1 end
    local ok2, err2 = Validation.isValidGroupName(targetName)
    if not ok2 then return false, err2 end

    local source = Storage.load_group(sourceName)
    if not source then
        return false, "source group '" .. sourceName .. "' not found"
    end

    local existing = Storage.load_group(targetName)
    if existing then
        return false, "target group '" .. targetName .. "' already exists"
    end

    if count_groups() >= Config.MAX_GROUPS then
        return false, "maximum number of groups (" .. Config.MAX_GROUPS .. ") reached"
    end

    local target = Group.new(targetName, source.weight)
    target.nodes = deep_copy(source.nodes)
    target.inheritanceNodes = deep_copy(source.inheritanceNodes)
    target.meta = deep_copy(source.meta)

    local saved = Storage.save_group(targetName, target)
    if not saved then
        return false, "failed to save cloned group"
    end

    ActionLogger.log(actor, "cloneGroup", "group:" .. targetName, "Cloned group " .. sourceName .. " to " .. targetName)
    print("[PermSys] GroupManager: cloned group " .. sourceName .. " to " .. targetName)
    return true, nil
end

function GroupManager.renameGroup(oldName, newName, actor)
    perm_cache = {}

    local ok, err = Validation.isValidGroupName(oldName)
    if not ok then return false, "invalid old name: " .. tostring(err) end

    ok, err = Validation.isValidGroupName(newName)
    if not ok then return false, "invalid new name: " .. tostring(err) end

    if oldName == newName then
        return false, "old name and new name are the same"
    end

    local existing = Storage.load_group(oldName)
    if not existing then
        return false, "group '" .. oldName .. "' does not exist"
    end

    local collision = Storage.load_group(newName)
    if collision then
        return false, "group '" .. newName .. "' already exists"
    end

    if DefaultGroup.is_default_group(oldName) then
        return false, "cannot rename protected group 'default'"
    end

    if DefaultGroup.is_default_group(newName) then
        return false, "cannot rename to protected group name 'default'"
    end

    local backendType = Storage.get_user_backend_type()
    if backendType == "private_string" or backendType == "global_kv" then
        return false, "该后端不支持 rename 功能"
    end

    local oldAncestors = InheritanceEngine.getInheritances(oldName)
    for _, ancestor in ipairs(oldAncestors) do
        if ancestor == newName then
            return false, "cannot rename to a group that is an ancestor of '" .. oldName .. "'"
        end
    end

    local allGroups = Storage.get_all_groups()
    for _, gName in ipairs(allGroups) do
        if gName ~= oldName then
            local ancestors = InheritanceEngine.getInheritances(gName)
            for _, ancestor in ipairs(ancestors) do
                if ancestor == oldName and gName == newName then
                    return false, "cannot rename to a group that is a descendant of '" .. oldName .. "'"
                end
            end
        end
    end

    local allUsers = Storage.get_all_users()
    local affectedUsers = {}
    for _, uin in ipairs(allUsers) do
        local user = Storage.load_user(uin)
        if user then
            local groups = user.groups or {}
            local found = false
            for _, g in ipairs(groups) do
                if g == oldName then
                    found = true
                    break
                end
            end
            if found then
                affectedUsers[#affectedUsers + 1] = { uin = uin, user = user }
            end
        end
    end

    for _, entry in ipairs(affectedUsers) do
        local user = entry.user
        local groups = user.groups
        for i, g in ipairs(groups) do
            if g == oldName then
                groups[i] = newName
                break
            end
        end
        if user.primaryGroup == oldName then
            user.primaryGroup = newName
        end
        local ok = Storage.save_user(entry.uin, user)
        if not ok then
            return false, "failed to save user '" .. entry.uin .. "' during rename; aborting"
        end
    end

    existing.name = newName
    for _, gName in ipairs(allGroups) do
        if gName ~= oldName then
            local g = Storage.load_group(gName)
            if g and g.inheritanceNodes and g.inheritanceNodes[oldName] then
                g.inheritanceNodes[oldName] = nil
                g.inheritanceNodes[newName] = true
                Storage.save_group(gName, g)
            end
        end
    end

    local allTracks = tracks_load_all()
    for tName, track in pairs(allTracks) do
        local changed = false
        for i, g in ipairs(track.groups) do
            if g == oldName then
                track.groups[i] = newName
                changed = true
            end
        end
        if changed then
            tracks_save_all(allTracks)
        end
    end

    local saved = Storage.save_group(newName, existing)
    if not saved then
        return false, "failed to save group '" .. newName .. "'"
    end

    local deleted = Storage.delete_group(oldName)
    if not deleted then
        return false, "failed to delete old group '" .. oldName .. "' after saving new group"
    end

    ActionLogger.log(actor, "renameGroup", "group:" .. oldName,
        "Renamed group '" .. oldName .. "' to '" .. newName .. "'")
    print("[PermSys] GroupManager: renamed group '" .. oldName .. "' to '" .. newName .. "'")
    return true, nil
end

----------------------------------------------------------------------
-- TrackManager
----------------------------------------------------------------------

local TrackManager = {}

local track_cache_data = nil

local function tracks_load_all()
    if track_cache_data then return track_cache_data end
    local raw = Data:GetValue(Config.VARID_TRACKS, nil)
    track_cache_data = decode(raw) or {}
    return track_cache_data
end

local function tracks_save_all(data)
    track_cache_data = data
    return Data:SetValue(Config.VARID_TRACKS, nil, encode(data))
end

function TrackManager.createTrack(name, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end

    local all = tracks_load_all()
    if all[name] then
        return false, "track '" .. name .. "' already exists"
    end

    local count = 0
    for _ in pairs(all) do count = count + 1 end
    if count >= Config.MAX_TRACKS then
        return false, "maximum number of tracks (" .. Config.MAX_TRACKS .. ") reached"
    end

    local track = Track.new(name, {})
    all[name] = track
    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to persist track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "createTrack", "track:" .. name, "Created track '" .. name .. "'")
    print("[PermSys] TrackManager: created track '" .. name .. "'")
    return true, nil
end

function TrackManager.deleteTrack(name, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end

    local all = tracks_load_all()
    if not all[name] then
        return false, "track '" .. name .. "' does not exist"
    end

    all[name] = nil
    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to delete track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "deleteTrack", "track:" .. name, "Deleted track '" .. name .. "'")
    print("[PermSys] TrackManager: deleted track '" .. name .. "'")
    return true, nil
end

function TrackManager.getTrack(name)
    if type(name) ~= "string" or name == "" then return nil end
    local all = tracks_load_all()
    return all[name]
end

function TrackManager.getAllTracks()
    local all = tracks_load_all()
    local result = {}
    for k, _ in pairs(all) do
        result[#result + 1] = k
    end
    table.sort(result)
    return result
end

function TrackManager.appendTrack(name, groupName, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end
    ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, "invalid group name: " .. tostring(err) end

    local all = tracks_load_all()
    local track = all[name]
    if not track then
        return false, "track '" .. name .. "' does not exist"
    end

    for _, g in ipairs(track.groups) do
        if g == groupName then
            return false, "group '" .. groupName .. "' already exists in track '" .. name .. "'"
        end
    end

    if #track.groups >= Config.MAX_GROUPS_PER_TRACK then
        return false,
            "track '" .. name .. "' has reached the maximum number of groups (" .. Config.MAX_GROUPS_PER_TRACK .. ")"
    end

    track.groups[#track.groups + 1] = groupName
    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "appendTrack", "track:" .. name,
        "Appended group '" .. groupName .. "' to track '" .. name .. "'")
    return true, nil
end

function TrackManager.insertTrack(name, index, groupName, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end
    ok, err = Validation.isValidGroupName(groupName)
    if not ok then return false, "invalid group name: " .. tostring(err) end
    if type(index) ~= "number" or index ~= math.floor(index) or index < 1 then
        return false, "index must be a positive integer"
    end

    local all = tracks_load_all()
    local track = all[name]
    if not track then
        return false, "track '" .. name .. "' does not exist"
    end

    for _, g in ipairs(track.groups) do
        if g == groupName then
            return false, "group '" .. groupName .. "' already exists in track '" .. name .. "'"
        end
    end

    if #track.groups >= Config.MAX_GROUPS_PER_TRACK then
        return false,
            "track '" .. name .. "' has reached the maximum number of groups (" .. Config.MAX_GROUPS_PER_TRACK .. ")"
    end

    if index > #track.groups + 1 then
        index = #track.groups + 1
    end

    table.insert(track.groups, index, groupName)
    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "insertTrack", "track:" .. name,
        "Inserted group '" .. groupName .. "' at index " .. index .. " in track '" .. name .. "'")
    return true, nil
end

function TrackManager.removeTrackGroup(name, groupName, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end
    if type(groupName) ~= "string" or groupName == "" then
        return false, "group name must be a non-empty string"
    end

    local all = tracks_load_all()
    local track = all[name]
    if not track then
        return false, "track '" .. name .. "' does not exist"
    end

    local found = false
    for i, g in ipairs(track.groups) do
        if g == groupName then
            table.remove(track.groups, i)
            found = true
            break
        end
    end

    if not found then
        return false, "group '" .. groupName .. "' not found in track '" .. name .. "'"
    end

    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "removeTrackGroup", "track:" .. name,
        "Removed group '" .. groupName .. "' from track '" .. name .. "'")
    return true, nil
end

function TrackManager.clearTrack(name, actor)
    local ok, err = Validation.isValidGroupName(name)
    if not ok then return false, "invalid track name: " .. tostring(err) end

    local all = tracks_load_all()
    local track = all[name]
    if not track then
        return false, "track '" .. name .. "' does not exist"
    end

    track.groups = {}
    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save track '" .. name .. "'"
    end

    perm_cache = {}
    ActionLogger.log(actor, "clearTrack", "track:" .. name, "Cleared all groups from track '" .. name .. "'")
    return true, nil
end

function TrackManager.renameTrack(oldName, newName, actor)
    local ok, err = Validation.isValidGroupName(oldName)
    if not ok then return false, "invalid old name: " .. tostring(err) end
    ok, err = Validation.isValidGroupName(newName)
    if not ok then return false, "invalid new name: " .. tostring(err) end

    if oldName == newName then
        return false, "old name and new name are the same"
    end

    local all = tracks_load_all()
    if not all[oldName] then
        return false, "track '" .. oldName .. "' does not exist"
    end
    if all[newName] then
        return false, "track '" .. newName .. "' already exists"
    end

    local track = all[oldName]
    track.name = newName
    all[newName] = track
    all[oldName] = nil

    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save renamed track"
    end

    perm_cache = {}
    ActionLogger.log(actor, "renameTrack", "track:" .. oldName,
        "Renamed track '" .. oldName .. "' to '" .. newName .. "'")
    print("[PermSys] TrackManager: renamed track '" .. oldName .. "' to '" .. newName .. "'")
    return true, nil
end

function TrackManager.cloneTrack(sourceName, targetName, actor)
    local ok1, err1 = Validation.isValidGroupName(sourceName)
    if not ok1 then return false, "invalid source name: " .. tostring(err1) end
    local ok2, err2 = Validation.isValidGroupName(targetName)
    if not ok2 then return false, "invalid target name: " .. tostring(err2) end

    local all = tracks_load_all()
    local source = all[sourceName]
    if not source then
        return false, "source track '" .. sourceName .. "' not found"
    end
    if all[targetName] then
        return false, "target track '" .. targetName .. "' already exists"
    end

    local count = 0
    for _ in pairs(all) do count = count + 1 end
    if count >= Config.MAX_TRACKS then
        return false, "maximum number of tracks (" .. Config.MAX_TRACKS .. ") reached"
    end

    local target = Track.new(targetName, deep_copy(source.groups))
    all[targetName] = target

    local saved = tracks_save_all(all)
    if not saved then
        return false, "failed to save cloned track"
    end

    perm_cache = {}
    ActionLogger.log(actor, "cloneTrack", "track:" .. targetName,
        "Cloned track '" .. sourceName .. "' to '" .. targetName .. "'")
    print("[PermSys] TrackManager: cloned track '" .. sourceName .. "' to '" .. targetName .. "'")
    return true, nil
end

function TrackManager.promoteUser(uin, trackName, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end

    local all = tracks_load_all()
    local track = all[trackName]
    if not track then
        return false, "track '" .. trackName .. "' does not exist"
    end

    if #track.groups < 2 then
        return false, "track '" .. trackName .. "' must have at least 2 groups to promote"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    local currentIndex = nil
    for i, groupName in ipairs(track.groups) do
        if table_contains(user.groups, groupName) then
            currentIndex = i
            break
        end
    end

    if not currentIndex then
        return false, "user is not a member of any group in track '" .. trackName .. "'"
    end

    if currentIndex >= #track.groups then
        return false, "user is already at the highest group in track '" .. trackName .. "'"
    end

    local oldGroup = track.groups[currentIndex]
    local newGroup = track.groups[currentIndex + 1]

    if not table_contains(user.groups, newGroup) then
        table_remove_value(user.groups, oldGroup)
        table.insert(user.groups, newGroup)
    end

    if user.primaryGroup == oldGroup then
        user.primaryGroup = newGroup
    end

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then
        return false, "failed to save user"
    end

    local oldGroupData = Storage.load_group(oldGroup)
    if oldGroupData and oldGroupData.members and oldGroupData.members[uin] then
        oldGroupData.members[uin] = nil
        Storage.save_group(oldGroup, oldGroupData)
    end

    local newGroupData = Storage.load_group(newGroup)
    if newGroupData then
        newGroupData.members = newGroupData.members or {}
        newGroupData.members[uin] = true
        Storage.save_group(newGroup, newGroupData)
    end

    ActionLogger.log(actor, "promoteUser", "user:" .. uin,
        "Promoted user " .. uin .. " from '" .. oldGroup .. "' to '" .. newGroup .. "' in track '" .. trackName .. "'")
    return true, nil
end

function TrackManager.demoteUser(uin, trackName, actor)
    perm_cache = {}
    local valid, err = Validation.isValidUin(uin)
    if not valid then return false, err end

    local all = tracks_load_all()
    local track = all[trackName]
    if not track then
        return false, "track '" .. trackName .. "' does not exist"
    end

    if #track.groups < 2 then
        return false, "track '" .. trackName .. "' must have at least 2 groups to demote"
    end

    local user = Storage.load_user(uin)
    if not user then
        return false, "user not found"
    end

    local currentIndex = nil
    for i, groupName in ipairs(track.groups) do
        if table_contains(user.groups, groupName) then
            currentIndex = i
            break
        end
    end

    if not currentIndex then
        return false, "user is not a member of any group in track '" .. trackName .. "'"
    end

    if currentIndex <= 1 then
        return false, "user is already at the lowest group in track '" .. trackName .. "'"
    end

    local oldGroup = track.groups[currentIndex]
    local newGroup = track.groups[currentIndex - 1]

    if not table_contains(user.groups, newGroup) then
        table_remove_value(user.groups, oldGroup)
        table.insert(user.groups, newGroup)
    end

    if user.primaryGroup == oldGroup then
        user.primaryGroup = newGroup
    end

    local saveOk = Storage.save_user(uin, user)
    if not saveOk then
        return false, "failed to save user"
    end

    local oldGroupData = Storage.load_group(oldGroup)
    if oldGroupData and oldGroupData.members and oldGroupData.members[uin] then
        oldGroupData.members[uin] = nil
        Storage.save_group(oldGroup, oldGroupData)
    end

    local newGroupData = Storage.load_group(newGroup)
    if newGroupData then
        newGroupData.members = newGroupData.members or {}
        newGroupData.members[uin] = true
        Storage.save_group(newGroup, newGroupData)
    end

    ActionLogger.log(actor, "demoteUser", "user:" .. uin,
        "Demoted user " .. uin .. " from '" .. oldGroup .. "' to '" .. newGroup .. "' in track '" .. trackName .. "'")
    return true, nil
end

----------------------------------------------------------------------
-- InheritanceEngine
----------------------------------------------------------------------

local InheritanceEngine = {}

local function load_group_or_nil(groupName)
    local group = Storage.load_group(groupName)
    if not group then
        print("[PermSys] Inheritance: group '" .. groupName .. "' not found")
    end
    return group
end

local function get_parent_set(groupName)
    local group = Storage.load_group(groupName)
    if not group or not group.inheritanceNodes then
        return {}
    end
    return group.inheritanceNodes
end

local function would_create_cycle(child, parent)
    if child == parent then
        return true
    end

    local visited = {}
    local stack = { parent }

    while #stack > 0 do
        local current = table.remove(stack)
        if not visited[current] then
            visited[current] = true

            if current == child then
                return true
            end

            local parents = get_parent_set(current)
            for pName, _ in pairs(parents) do
                if not visited[pName] then
                    table.insert(stack, pName)
                end
            end
        end
    end

    return false
end

function InheritanceEngine.addInheritance(childGroup, parentGroup, actor)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(childGroup)
    if not ok then return false, err end

    ok, err = Validation.isValidGroupName(parentGroup)
    if not ok then return false, err end

    if childGroup == parentGroup then
        return false, "a group cannot inherit from itself"
    end

    local child = load_group_or_nil(childGroup)
    if not child then
        return false, "child group '" .. childGroup .. "' does not exist"
    end

    local parent = load_group_or_nil(parentGroup)
    if not parent then
        return false, "parent group '" .. parentGroup .. "' does not exist"
    end

    if not child.inheritanceNodes then
        child.inheritanceNodes = {}
    end

    if child.inheritanceNodes[parentGroup] then
        return false, "'" .. childGroup .. "' already inherits from '" .. parentGroup .. "'"
    end

    if would_create_cycle(childGroup, parentGroup) then
        return false, "adding inheritance '" .. childGroup .. "' → '" .. parentGroup .. "' would create a cycle"
    end

    child.inheritanceNodes[parentGroup] = true
    local saved = Storage.save_group(childGroup, child)
    if not saved then
        return false, "failed to persist inheritance for '" .. childGroup .. "'"
    end

    ActionLogger.log(actor, "addInheritance", "group:" .. childGroup,
        "Added inheritance: " .. childGroup .. " → " .. parentGroup)
    print("[PermSys] Inheritance: '" .. childGroup .. "' now inherits from '" .. parentGroup .. "'")
    return true, nil
end

function InheritanceEngine.removeInheritance(childGroup, parentGroup, actor)
    perm_cache = {}
    local ok, err = Validation.isValidGroupName(childGroup)
    if not ok then return false, err end

    ok, err = Validation.isValidGroupName(parentGroup)
    if not ok then return false, err end

    local child = load_group_or_nil(childGroup)
    if not child then
        return false, "child group '" .. childGroup .. "' does not exist"
    end

    if not child.inheritanceNodes then
        child.inheritanceNodes = {}
    end

    if not child.inheritanceNodes[parentGroup] then
        return false, "'" .. childGroup .. "' does not inherit from '" .. parentGroup .. "'"
    end

    child.inheritanceNodes[parentGroup] = nil
    local saved = Storage.save_group(childGroup, child)
    if not saved then
        return false, "failed to persist inheritance removal for '" .. childGroup .. "'"
    end

    ActionLogger.log(actor, "removeInheritance", "group:" .. childGroup,
        "Removed inheritance: " .. childGroup .. " → " .. parentGroup)
    print("[PermSys] Inheritance: '" .. childGroup .. "' no longer inherits from '" .. parentGroup .. "'")
    return true, nil
end

function InheritanceEngine.getInheritances(groupName)
    local ok = Validation.isValidGroupName(groupName)
    if not ok then return {} end

    local parents = get_parent_set(groupName)

    local result = {}
    for name, _ in pairs(parents) do
        table.insert(result, name)
    end
    table.sort(result)
    return result
end

function InheritanceEngine.resolveInheritedNodes(groupName, depth)
    depth = depth or 0

    if depth >= Config.MAX_INHERITANCE_DEPTH then
        return {},
            "inheritance depth exceeded maximum (" .. Config.MAX_INHERITANCE_DEPTH .. ") for group '" .. groupName .. "'"
    end

    local ok, err = Validation.isValidGroupName(groupName)
    if not ok then return {}, err end

    local group = Storage.load_group(groupName)
    if not group then
        return {}, nil
    end

    local collected = {}

    local parents = group.inheritanceNodes or {}
    for parentName, _ in pairs(parents) do
        local parentGroup = Storage.load_group(parentName)
        if parentGroup then
            if parentGroup.nodes then
                for _, node in ipairs(parentGroup.nodes) do
                    table.insert(collected, node)
                end
            end

            local ancestorNodes, recErr = InheritanceEngine.resolveInheritedNodes(parentName, depth + 1)
            if recErr then
                return collected, recErr
            end
            for _, node in ipairs(ancestorNodes) do
                table.insert(collected, node)
            end
        end
    end

    return collected, nil
end

local ContextResolver -- forward declaration (defined at ~line 2763)

----------------------------------------------------------------------
-- VerboseLogger
----------------------------------------------------------------------

local VerboseLogger = {}

local logging_enabled = false
local verbose_listeners = {}

function VerboseLogger.enable_logging()
    logging_enabled = true
end

function VerboseLogger.disable_logging()
    logging_enabled = false
end

function VerboseLogger.is_enabled()
    return logging_enabled
end

function VerboseLogger.log_check(uin, node, result, source)
    if not logging_enabled then
        return
    end

    local entry = {
        timestamp = os.time(),
        playerUin = uin,
        permission = node,
        result = result,
        source = source,
    }

    Data.Array:InsertValue(Config.VARID_LOG, nil, entry)

    local size = Data.Array:GetSize(Config.VARID_LOG, nil)
    if size > Config.MAX_LOG_ENTRIES then
        Data.Array:Remove(Config.VARID_LOG, nil, 1)
    end
end

function VerboseLogger.registerListener(uin, filter)
    verbose_listeners[uin] = filter
end

function VerboseLogger.unregisterListener(uin)
    verbose_listeners[uin] = nil
end

function VerboseLogger.hasListeners()
    return next(verbose_listeners) ~= nil
end

function VerboseLogger.notifyListeners(uin, node, result)
    for listenerUin, filter in pairs(verbose_listeners) do
        if filter == nil then
            Chat:SendSystemMsg("[Verbose] " .. tostring(uin) .. " check " .. node .. " = " .. tostring(result),
                listenerUin)
        else
            local ok, match = pcall(string.find, node, filter)
            if ok and match then
                Chat:SendSystemMsg("[Verbose] " .. tostring(uin) .. " check " .. node .. " = " .. tostring(result),
                    listenerUin)
            end
        end
    end
end

----------------------------------------------------------------------
-- PermissionEngine
----------------------------------------------------------------------

local PermissionEngine = {}

function PermissionEngine.checkNode(candidate, target)
    if candidate == target then
        return true
    end

    if string.sub(candidate, -2) == ".*" then
        local prefix = string.sub(candidate, 1, -3)
        local prefixDot = prefix .. "."
        if string.sub(target, 1, #prefixDot) == prefixDot then
            return true
        end
    end

    return false
end

function PermissionEngine.hasPermission(uin, node)
    local user = UserManager.getUser(uin)
    if not user then
        return nil
    end

    user.tempGroups = user.tempGroups or {}
    UserManager.cleanTempGroups(uin, user)

    local ok, currentContexts = pcall(ContextResolver.buildCurrentContexts, uin)
    if not ok then
        currentContexts = {}
    end

    local parts = {}
    for k, v in pairs(currentContexts) do
        parts[#parts + 1] = k .. "=" .. tostring(v)
    end
    table.sort(parts)
    local contextHash = table.concat(parts, ";")
    local cacheKey = uin .. "\0" .. node .. "\0" .. contextHash

    if perm_cache[cacheKey] ~= nil then
        return perm_cache[cacheKey]
    end

    local result
    if user.nodes then
        for _, permNode in ipairs(user.nodes) do
            if not is_expired(permNode) and ContextResolver.checkContext(permNode.contexts, currentContexts) then
                if PermissionEngine.checkNode(permNode.key, node) then
                    result = permNode.value
                    break
                end
            end
        end
    end

    if result == nil then
        local groups = user.groups or {}
        user.tempGroups = user.tempGroups or {}
        local now = os.time()
        local seen = {}
        local weighted = {}
        for _, g in ipairs(groups) do
            if not seen[g] then
                seen[g] = true
                weighted[#weighted + 1] = { name = g, weight = GroupManager.get_weight(g) or 0 }
            end
        end
        for g, expiry in pairs(user.tempGroups) do
            if type(expiry) == "number" and expiry >= now and not seen[g] then
                seen[g] = true
                weighted[#weighted + 1] = { name = g, weight = GroupManager.get_weight(g) or 0 }
            end
        end
        table.sort(weighted, function(a, b) return a.weight > b.weight end)

        for _, entry in ipairs(weighted) do
            local groupName = entry.name
            local groupNodes = GroupManager.get_group_nodes(groupName)
            if groupNodes then
                for _, permNode in ipairs(groupNodes) do
                    if not is_expired(permNode) and ContextResolver.checkContext(permNode.contexts, currentContexts) then
                        if PermissionEngine.checkNode(permNode.key, node) then
                            result = permNode.value
                            break
                        end
                    end
                end
            end
            if result ~= nil then break end

            local inheritedNodes = InheritanceEngine.resolveInheritedNodes(groupName)
            if inheritedNodes then
                for _, permNode in ipairs(inheritedNodes) do
                    if not is_expired(permNode) and ContextResolver.checkContext(permNode.contexts, currentContexts) then
                        if PermissionEngine.checkNode(permNode.key, node) then
                            result = permNode.value
                            break
                        end
                    end
                end
            end
            if result ~= nil then break end
        end
    end

    if #perm_cache >= Config.MAX_PERM_CACHE then
        perm_cache = {}
    end
    perm_cache[cacheKey] = result

    if VerboseLogger.hasListeners() then
        VerboseLogger.notifyListeners(uin, node, result)
    end

    return result
end

----------------------------------------------------------------------
-- WeightResolver
----------------------------------------------------------------------

local WeightResolver = {}

function WeightResolver.resolve_group_weight(groupName)
    if type(groupName) ~= "string" or groupName == "" then
        return nil
    end
    return GroupManager.get_weight(groupName)
end

function WeightResolver.resolve_user_groups(uin)
    local group_names = UserManager.getUserGroups(uin)
    if not group_names then
        return nil
    end

    local entries = {}
    for i, name in ipairs(group_names) do
        local weight = GroupManager.get_weight(name) or 0
        entries[#entries + 1] = {
            name   = name,
            weight = weight,
            index  = i,
        }
    end

    table.sort(entries, function(a, b)
        if a.weight ~= b.weight then
            return a.weight > b.weight
        end
        return a.index < b.index
    end)

    return entries
end

function WeightResolver.resolve_user_group_names(uin)
    local sorted = WeightResolver.resolve_user_groups(uin)
    if not sorted then
        return nil
    end

    local names = {}
    for i, entry in ipairs(sorted) do
        names[i] = entry.name
    end
    return names
end

----------------------------------------------------------------------
-- ContextResolver
----------------------------------------------------------------------

ContextResolver = {}

local function resolve_world(uin)
    if __PERMSYS_TEST_MODE then
        return CloudSever:GetRoomCategory() -- 权限不足没法用
    else
        return Actor:GetObjWorldId(uin)
    end
end

local function resolve_room_category()
    if __PERMSYS_TEST_MODE then
        return CloudSever:GetRoomCategory() -- 权限不足没法用
    else
        return nil
    end
end

local function resolve_gamemode()
    local mode = World:GetGameMode()
    if mode ~= nil then
        return tostring(mode)
    end
    return nil
end

local CONTEXT_RESOLVERS = {
    world        = resolve_world,
    gamemode     = resolve_gamemode,
    roomCategory = resolve_room_category
}

function ContextResolver.registerContextProvider(key, resolver_fn)
    if type(key) ~= "string" or key == "" then
        return false, "context key must be a non-empty string"
    end
    if type(resolver_fn) ~= "function" then
        return false, "resolver must be a function"
    end
    CONTEXT_RESOLVERS[key] = resolver_fn
    return true, nil
end

function ContextResolver.unregisterContextProvider(key)
    if type(key) ~= "string" or key == "" then
        return false, "context key must be a non-empty string"
    end
    if CONTEXT_RESOLVERS[key] == nil then
        return false, "context provider '" .. key .. "' not found"
    end
    CONTEXT_RESOLVERS[key] = nil
    return true, nil
end

function ContextResolver.resolveContext(uin, contextKey)
    local resolver = CONTEXT_RESOLVERS[contextKey]
    if not resolver then
        return nil
    end
    return resolver(uin)
end

function ContextResolver.checkContext(nodeContexts, currentContexts)
    if nodeContexts == nil then
        return true
    end

    for key, required_value in pairs(nodeContexts) do
        local current_value = currentContexts[key]
        if current_value ~= required_value then
            return false
        end
    end

    return true
end

function ContextResolver.buildCurrentContexts(uin)
    local contexts = {}
    for key, resolver in pairs(CONTEXT_RESOLVERS) do
        local value = resolver(uin)
        if value ~= nil then
            contexts[key] = value
        end
    end
    return contexts
end

----------------------------------------------------------------------
-- PatternEngine
----------------------------------------------------------------------

local PatternEngine = {}

function PatternEngine.matchPattern(pattern, node)
    if type(pattern) ~= "string" then
        return nil, "pattern must be a string"
    end
    if type(node) ~= "string" then
        return nil, "node must be a string"
    end
    if pattern == "" then
        return nil, "pattern must not be empty"
    end
    if node == "" then
        return nil, "node must not be empty"
    end

    local anchored = "^" .. pattern .. "$"

    local ok, startPos = pcall(string.find, node, anchored)
    if not ok then
        return nil, "invalid pattern: " .. tostring(startPos)
    end

    if startPos ~= nil then
        return true
    end
    return nil, "no match"
end

----------------------------------------------------------------------
-- ActionLogger
----------------------------------------------------------------------

function ActionLogger.log(actor, action, target, desc)
    actor = actor or "system"
    action = action or ""
    target = target or ""
    desc = desc or ""

    local entry = {
        timestamp = os.time(),
        actor = actor,
        action = action,
        target = target,
        desc = desc,
    }

    Data.Array:InsertValue(Config.VARID_ACTIONLOG, nil, entry)

    local size = Data.Array:GetSize(Config.VARID_ACTIONLOG, nil)
    if size > Config.MAX_ACTION_LOG_ENTRIES then
        Data.Array:Remove(Config.VARID_ACTIONLOG, nil, 1)
    end
end

function ActionLogger.getRecent(count)
    count = count or 10
    local size = Data.Array:GetSize(Config.VARID_ACTIONLOG, nil)
    if size == 0 then return {} end
    local startIdx = size - count + 1
    if startIdx < 1 then startIdx = 1 end
    local results = {}
    for i = startIdx, size do
        local values = Data.Array:GetValues(Config.VARID_ACTIONLOG, nil, i, 1)
        if values and #values > 0 then
            results[#results + 1] = values[1]
        end
    end
    return results
end

function ActionLogger.search(keyword, maxScan)
    maxScan = maxScan or 100
    if not keyword or keyword == "" then return {} end
    local size = Data.Array:GetSize(Config.VARID_ACTIONLOG, nil)
    if size == 0 then return {} end
    local startIdx = size - maxScan + 1
    if startIdx < 1 then startIdx = 1 end
    local results = {}
    for i = startIdx, size do
        local values = Data.Array:GetValues(Config.VARID_ACTIONLOG, nil, i, 1)
        if values and #values > 0 then
            local entry = values[1]
            if entry.desc and string.find(entry.desc, keyword, 1, true) then
                results[#results + 1] = entry
            end
        end
    end
    return results
end

----------------------------------------------------------------------
-- MultiServerSync
----------------------------------------------------------------------

local MultiServerSync = {}

local RATE_LIMIT_SECONDS = 15
local SYNC_MSG_ID = "PermSys_Sync"

local ALLOWED_TYPES = {
    user_update        = true,
    group_update       = true,
    node_update        = true,
    inheritance_update = true,
}

local component = nil
local queue = {}
local last_sent = {}
local handlers = {}
local timer_started = false

local function is_valid_type(sync_type)
    return ALLOWED_TYPES[sync_type] == true
end

local function can_send(sync_type)
    local last = last_sent[sync_type]
    if last == nil then
        return true
    end
    return (os.time() - last) >= RATE_LIMIT_SECONDS
end

local function encode_payload(sync_type, data)
    local payload = {
        type      = sync_type,
        data      = data,
        source    = CloudSever:GetRoomID(),
        timestamp = os.time(),
    }
    local ok, result = pcall(json.encode, payload)
    if ok then return result end
    print("[PermSys] MultiServerSync: encode failed for type=" .. tostring(sync_type))
    return nil
end

local function decode_payload(raw)
    if raw == nil or raw == "" then return nil end
    local ok, result = pcall(json.decode, raw)
    if ok then return result end
    print("[PermSys] MultiServerSync: decode failed: " .. tostring(result))
    return nil
end

local function dispatch(payload)
    local sync_type = payload.type
    if not sync_type then
        print("[PermSys] MultiServerSync: incoming message missing type field")
        return
    end

    local source = payload.source
    if source ~= nil and source == CloudSever:GetRoomID() then
        return
    end

    local type_handlers = handlers[sync_type]
    if type_handlers == nil then
        return
    end

    for _, fn in ipairs(type_handlers) do
        local ok, err = pcall(fn, payload.data)
        if not ok then
            print("[PermSys] MultiServerSync: handler error for type=" .. sync_type .. ": " .. tostring(err))
        end
    end
end

function MultiServerSync.process_queue()
    if not component then return end
    if #queue == 0 then return end

    for i = #queue, 1, -1 do
        local entry = queue[i]
        if can_send(entry.type) then
            local encoded = encode_payload(entry.type, entry.data)
            if encoded then
                component:PushCloudServerMsg(SYNC_MSG_ID, encoded)
                last_sent[entry.type] = os.time()
            end
            table.remove(queue, i)
            return
        end
    end
end

function MultiServerSync.init(cmp)
    component = cmp

    component:AddCloudSeverEvent(SYNC_MSG_ID, function(_, raw)
        local payload = decode_payload(raw)
        if payload then
            dispatch(payload)
        end
    end)

    if not timer_started then
        component:DoPeriodicTask(function()
            MultiServerSync.process_queue()
        end, 5)
        timer_started = true
    end

    print("[PermSys] MultiServerSync: initialized, room=" .. tostring(CloudSever:GetRoomID()))
end

function MultiServerSync.broadcast_change(sync_type, data)
    if not is_valid_type(sync_type) then
        print("[PermSys] MultiServerSync: invalid sync type: " .. tostring(sync_type))
        return false
    end
    if data == nil then
        print("[PermSys] MultiServerSync: nil data for type=" .. sync_type)
        return false
    end

    table.insert(queue, {
        type      = sync_type,
        data      = data,
        timestamp = os.time(),
    })
    return true
end

function MultiServerSync.on_message(sync_type, handler)
    if not is_valid_type(sync_type) then
        print("[PermSys] MultiServerSync: cannot register handler for invalid type: " .. tostring(sync_type))
        return
    end
    if type(handler) ~= "function" then
        print("[PermSys] MultiServerSync: handler must be a function for type=" .. sync_type)
        return
    end

    if handlers[sync_type] == nil then
        handlers[sync_type] = {}
    end
    table.insert(handlers[sync_type], handler)
end

function MultiServerSync.get_queue_size()
    return #queue
end

function MultiServerSync.is_ready()
    return component ~= nil
end

----------------------------------------------------------------------
-- Test Mode Export
----------------------------------------------------------------------

if _G.__PERMSYS_TEST_MODE then
    _G.__PermCore_internals = {
        Config = Config,
        PermNode = PermNode,
        User = User,
        Group = Group,
        Track = Track,
        Storage = Storage,
        Validation = Validation,
        Schema = Schema,
        DefaultGroup = DefaultGroup,
        UserManager = UserManager,
        GroupManager = GroupManager,
        TrackManager = TrackManager,
        InheritanceEngine = InheritanceEngine,
        PermissionEngine = PermissionEngine,
        WeightResolver = WeightResolver,
        ContextResolver = ContextResolver,
        PatternEngine = PatternEngine,
        VerboseLogger = VerboseLogger,
        MultiServerSync = MultiServerSync,
        EventSystem = EventSystem,
        user_backend_type = user_backend_type,
    }
end

----------------------------------------------------------------------
-- Public API (exposed via openFnArgs)
----------------------------------------------------------------------

local function normalize_uin(player)
    if type(player) == "number" then return tostring(player) end
    if type(player) == "string" then return player end
    return nil
end

function PermCore:hasPermission(player, node)
    local uin = normalize_uin(player)
    if not uin or type(node) ~= "string" or node == "" then return false end
    local result = PermissionEngine.hasPermission(uin, node)
    return result == true
end

function PermCore:getUserGroups(player)
    local uin = normalize_uin(player)
    if not uin then return {} end
    return UserManager.getUserGroups(uin) or {}
end

function PermCore:getPrimaryGroup(player)
    local uin = normalize_uin(player)
    if not uin then return nil end
    return UserManager.getPrimaryGroup(uin)
end

function PermCore:addTemporaryPermission(player, node, duration)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if type(node) ~= "string" or node == "" then return false, "invalid node" end
    if type(duration) ~= "number" or duration <= 0 then return false, "invalid duration" end
    return UserManager.addUserTemporaryPerm(uin, node, duration)
end

function PermCore:ensureUser(player)
    local uin = normalize_uin(player)
    if not uin then return end
    UserManager.ensureUser(uin)
end

function PermCore:addUser(uin)
    return UserManager.addUser(uin)
end

function PermCore:removeUser(uin)
    return UserManager.removeUser(uin)
end

function PermCore:clearUser(uin)
    return UserManager.clearUser(uin)
end

function PermCore:addUserToGroup(uin, groupName, actor)
    return UserManager.addUserToGroup(uin, groupName, actor)
end

function PermCore:removeUserFromGroup(uin, groupName, actor)
    return UserManager.removeUserFromGroup(uin, groupName, actor)
end

function PermCore:setPrimaryGroup(uin, groupName)
    return UserManager.setPrimaryGroup(uin, groupName)
end

function PermCore:createGroup(name, weight, actor)
    return GroupManager.create_group(name, weight or 0, actor)
end

function PermCore:deleteGroup(name, actor)
    return GroupManager.delete_group(name, actor)
end

function PermCore:renameGroup(oldName, newName, actor)
    return GroupManager.renameGroup(oldName, newName, actor)
end

function PermCore:clearGroup(groupName, actor)
    return GroupManager.clearGroup(groupName, actor)
end

function PermCore:setGroupWeight(name, weight)
    return GroupManager.set_weight(name, weight)
end

function PermCore:getGroupWeight(name)
    return GroupManager.get_weight(name)
end

function PermCore:getGroupNodes(groupName)
    return GroupManager.get_group_nodes(groupName)
end

function PermCore:addGroupNode(groupName, nodeKey, actor)
    return GroupManager.add_group_node(groupName, nodeKey, true, nil, nil, actor)
end

function PermCore:removeGroupNode(groupName, nodeKey, actor)
    return GroupManager.remove_group_node(groupName, nodeKey, actor)
end

function PermCore:addInheritance(childGroup, parentGroup, actor)
    return InheritanceEngine.addInheritance(childGroup, parentGroup, actor)
end

function PermCore:removeInheritance(childGroup, parentGroup, actor)
    return InheritanceEngine.removeInheritance(childGroup, parentGroup, actor)
end

function PermCore:checkPermission(uin, node)
    return PermissionEngine.hasPermission(uin, node)
end

function PermCore:isSyncReady()
    return MultiServerSync.is_ready()
end

function PermCore:getSyncQueueSize()
    return MultiServerSync.get_queue_size()
end

function PermCore:enableLogging()
    VerboseLogger.enable_logging()
end

function PermCore:disableLogging()
    VerboseLogger.disable_logging()
end

function PermCore:isLoggingEnabled()
    return VerboseLogger.is_enabled()
end

function PermCore:matchPattern(pattern, node)
    return PatternEngine.matchPattern(pattern, node)
end

function PermCore:getMaxLogEntries()
    return Config.MAX_LOG_ENTRIES
end

function PermCore:registerVerboseListener(player, filter)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if filter ~= nil and type(filter) ~= "string" then return false, "filter must be a string or nil" end
    VerboseLogger.registerListener(uin, filter)
    return true
end

function PermCore:unregisterVerboseListener(player)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    VerboseLogger.unregisterListener(uin)
    return true
end

function PermCore:addUserNode(player, nodeKey, nodeValue, actor)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if type(nodeKey) ~= "string" or nodeKey == "" then return false, "invalid node" end
    if nodeValue == nil then nodeValue = true end
    return UserManager.addUserNode(uin, nodeKey, nodeValue, {}, actor)
end

function PermCore:removeUserNode(player, nodeKey, actor)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if type(nodeKey) ~= "string" or nodeKey == "" then return false, "invalid node" end
    return UserManager.removeUserNode(uin, nodeKey, actor)
end

function PermCore:setUserMeta(player, key, value, actor)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    return UserManager.setMeta(uin, key, value, actor)
end

function PermCore:getUserMeta(player, key)
    local uin = normalize_uin(player)
    if not uin then return nil end
    return UserManager.getMeta(uin, key)
end

function PermCore:removeUserMeta(player, key, actor)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    return UserManager.removeMeta(uin, key, actor)
end

function PermCore:getAllUserMeta(player)
    local uin = normalize_uin(player)
    if not uin then return {} end
    return UserManager.getAllMeta(uin)
end

function PermCore:setGroupMeta(groupName, key, value, actor)
    return GroupManager.set_meta(groupName, key, value, actor)
end

function PermCore:getGroupMeta(groupName, key)
    return GroupManager.get_meta(groupName, key)
end

function PermCore:removeGroupMeta(groupName, key, actor)
    return GroupManager.remove_meta(groupName, key, actor)
end

function PermCore:getAllGroupMeta(groupName)
    return GroupManager.get_all_meta(groupName)
end

function PermCore:getGroupMembers(groupName)
    return GroupManager.get_group_members(groupName)
end

function PermCore:getInheritedNodes(groupName)
    if type(groupName) ~= "string" or groupName == "" then return {} end
    local nodes, _ = InheritanceEngine.resolveInheritedNodes(groupName)
    return nodes or {}
end

function PermCore:registerContextProvider(key, resolver_fn)
    return ContextResolver.registerContextProvider(key, resolver_fn)
end

function PermCore:unregisterContextProvider(key)
    return ContextResolver.unregisterContextProvider(key)
end

function PermCore:registerListener(eventType, callback)
    return EventSystem.registerListener(eventType, callback)
end

function PermCore:unregisterListener(eventType, callback)
    return EventSystem.unregisterListener(eventType, callback)
end

function PermCore:registerPermissions(pluginName, permissions)
    return PermissionRegistry.register(pluginName, permissions)
end

function PermCore:unregisterPermissions(pluginName)
    return PermissionRegistry.unregister(pluginName)
end

function PermCore:getRegisteredPermissions()
    return PermissionRegistry.getAll()
end

function PermCore:getPermissionsByPlugin(pluginName)
    return PermissionRegistry.getByPlugin(pluginName)
end

function PermCore:getActionLogRecent(count)
    return ActionLogger.getRecent(count)
end

function PermCore:searchActionLog(keyword)
    return ActionLogger.search(keyword)
end

function PermCore:getMaxActionLogEntries()
    return Config.MAX_ACTION_LOG_ENTRIES
end

function PermCore:searchPermissions(searchNode)
    if type(searchNode) ~= "string" or searchNode == "" then
        return {}
    end

    local results = {}

    local allUsers = Storage.get_all_users()
    for _, uin in ipairs(allUsers) do
        local userData = Storage.load_user(uin)
        if userData and userData.nodes then
            for _, node in ipairs(userData.nodes) do
                if not is_expired(node) and PermissionEngine.checkNode(node.key, searchNode) then
                    results[#results + 1] = "user " .. tostring(uin) .. " " .. node.key .. "=" .. tostring(node.value)
                end
            end
        end
    end

    local allGroups = Storage.get_all_groups()
    for _, groupName in ipairs(allGroups) do
        local groupData = Storage.load_group(groupName)
        if groupData and groupData.nodes then
            for _, node in ipairs(groupData.nodes) do
                if PermissionEngine.checkNode(node.key, searchNode) then
                    results[#results + 1] = "group " .. groupName .. " " .. node.key .. "=" .. tostring(node.value)
                end
            end
        end
    end

    return results
end

function PermCore:cloneUser(sourceUin, targetUin, actor)
    local src = normalize_uin(sourceUin)
    local tgt = normalize_uin(targetUin)
    if not src then return false, "invalid source user" end
    if not tgt then return false, "invalid target user" end
    return UserManager.cloneUser(src, tgt, actor)
end

function PermCore:cloneGroup(sourceName, targetName, actor)
    return GroupManager.cloneGroup(sourceName, targetName, actor)
end

function PermCore:getAllUsers()
    return Storage.get_all_users()
end

function PermCore:getAllGroups()
    return Storage.get_all_groups()
end

function PermCore:clearPermCache()
    perm_cache = {}
end

function PermCore:clearPlayerCache(player)
    local uin = normalize_uin(player)
    if not uin then return end
    local prefix = uin .. "\0"
    for key, _ in pairs(perm_cache) do
        if key:sub(1, #prefix) == prefix then
            perm_cache[key] = nil
        end
    end
    Storage.clear_user_cache(uin)
end

function PermCore:addTemporaryParent(player, groupName, duration)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if type(groupName) ~= "string" or groupName == "" then return false, "invalid group name" end
    if type(duration) ~= "number" or duration <= 0 then return false, "invalid duration" end
    return UserManager.addTemporaryParent(uin, groupName, duration)
end

function PermCore:removeTemporaryParent(player, groupName)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    if type(groupName) ~= "string" or groupName == "" then return false, "invalid group name" end
    return UserManager.removeTemporaryParent(uin, groupName)
end

function PermCore:cleanTempGroups(player)
    local uin = normalize_uin(player)
    if not uin then return false, "invalid player" end
    return UserManager.cleanTempGroups(uin)
end

function PermCore:createTrack(name, actor)
    return TrackManager.createTrack(name, actor)
end

function PermCore:deleteTrack(name, actor)
    return TrackManager.deleteTrack(name, actor)
end

function PermCore:getTrack(name)
    return TrackManager.getTrack(name)
end

function PermCore:getAllTracks()
    return TrackManager.getAllTracks()
end

function PermCore:appendTrack(name, groupName, actor)
    return TrackManager.appendTrack(name, groupName, actor)
end

function PermCore:insertTrack(name, index, groupName, actor)
    return TrackManager.insertTrack(name, index, groupName, actor)
end

function PermCore:removeTrackGroup(name, groupName, actor)
    return TrackManager.removeTrackGroup(name, groupName, actor)
end

function PermCore:clearTrack(name, actor)
    return TrackManager.clearTrack(name, actor)
end

function PermCore:renameTrack(oldName, newName, actor)
    return TrackManager.renameTrack(oldName, newName, actor)
end

function PermCore:cloneTrack(sourceName, targetName, actor)
    return TrackManager.cloneTrack(sourceName, targetName, actor)
end

function PermCore:promoteUser(uin, trackName, actor)
    return TrackManager.promoteUser(uin, trackName, actor)
end

function PermCore:demoteUser(uin, trackName, actor)
    return TrackManager.demoteUser(uin, trackName, actor)
end

----------------------------------------------------------------------
-- Lifecycle
----------------------------------------------------------------------

function PermCore:OnStart()
    local ub = self.userStorageBackend
    local userBackend = type(ub) == "number" and (USER_BACKEND_MAP[ub] or "table") or (ub or "table")
    local userVar = self.userVarId ~= "" and self.userVarId or Config.VARID_USERS
    local gb = self.groupStorageBackend
    local groupBackend = type(gb) == "number" and (GROUP_BACKEND_MAP[gb] or "table") or (gb or "table")
    local groupVar = self.groupVarId ~= "" and self.groupVarId or Config.VARID_GROUPS
    Storage.init(userBackend, userVar, groupBackend, groupVar)

    DefaultGroup.ensure_default_group()
    Schema.check_version(Storage)
    MultiServerSync.init(self)

    if Storage.is_kv_backend() then
        MultiServerSync.on_message("user_update", function(payload)
            if payload.uin and payload.deleted then
                Storage.apply_sync_user(payload.uin, nil)
            elseif payload.uin and payload.data then
                Storage.apply_sync_user(payload.uin, payload.data)
            end
        end)
        MultiServerSync.on_message("group_update", function(payload)
            if payload.groupName and payload.deleted then
                Storage.apply_sync_group(payload.groupName, nil)
            elseif payload.groupName and payload.data then
                Storage.apply_sync_group(payload.groupName, payload.data)
            end
        end)
    end

    local existingTracks = Data:GetValue(Config.VARID_TRACKS, nil)
    if not existingTracks or existingTracks == "" then
        Data:SetValue(Config.VARID_TRACKS, nil, "{}")
        print("[PermSys] PermCore: initialized empty track storage")
    end

    local function add_group_perm_if_missing(group, nodeKey, nodeValue)
        for _, n in ipairs(group.nodes or {}) do
            if n.key == nodeKey then return end
        end
        table.insert(group.nodes, PermNode.new(nodeKey, nodeValue, {}, nil))
    end

    local groupsArr = self.groups
    if groupsArr then
        for i = 1, groupsArr:Size() do
            local entry = groupsArr:GetValue(i)
            if entry then
                local gName = entry.name
                if gName and gName ~= "" then
                    local group = Storage.load_group(gName)
                    if not group then
                        GroupManager.create_group(gName, 0)
                        group = Storage.load_group(gName)
                    end
                    if group then
                        local changed = false
                        local tp = entry.truePermissions
                        if tp then
                            for j = 1, tp:Size() do
                                local node = tp:GetValue(j)
                                if node and node ~= "" then
                                    add_group_perm_if_missing(group, node, true)
                                    changed = true
                                end
                            end
                        end
                        local fp = entry.falsePermissions
                        if fp then
                            for j = 1, fp:Size() do
                                local node = fp:GetValue(j)
                                if node and node ~= "" then
                                    add_group_perm_if_missing(group, node, false)
                                    changed = true
                                end
                            end
                        end
                        if changed then
                            Storage.save_group(gName, group)
                        end
                    end
                end
            end
        end
    end

    local usersArr = self.users
    if usersArr then
        for i = 1, usersArr:Size() do
            local entry = usersArr:GetValue(i)
            if entry then
                local uin = entry.uin
                if uin and uin ~= "" then
                    UserManager.addUser(uin)
                    local tp = entry.truePermissions
                    if tp then
                        for j = 1, tp:Size() do
                            local node = tp:GetValue(j)
                            if node and node ~= "" then
                                UserManager.addUserNode(uin, node, true, {}, nil)
                            end
                        end
                    end
                    local fp = entry.falsePermissions
                    if fp then
                        for j = 1, fp:Size() do
                            local node = fp:GetValue(j)
                            if node and node ~= "" then
                                UserManager.addUserNode(uin, node, false, {}, nil)
                            end
                        end
                    end
                end
            end
        end
    end

    print("[PermSys] PermCore: initialized (user=" .. userBackend .. ", group=" .. groupBackend .. ")")
end

return PermCore
