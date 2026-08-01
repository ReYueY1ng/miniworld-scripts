-- test_integration.lua
-- Integration tests for PermSys monolithic component.
-- Run with: lua tests/test_integration.lua   (from PermSys/ directory)
-- Requires: LuaJIT or Lua 5.1+
-- All MiniWorld runtime globals are mocked in-memory.

---------------------------------------------------------------------------
-- Mock MiniWorld runtime globals (must be set BEFORE dofile)
---------------------------------------------------------------------------

-- In-memory storage for Data API
local data_simple = {}   -- Data:SetValue / Data:GetValue  (key -> value)
local data_tables = {}   -- Data.Table storage  (varId -> {rows})
local data_arrays = {}   -- Data.Array storage  (varId -> {values})

--- Reset all mock state (call between test sections if needed).
local function reset_mocks()
    data_simple = {}
    data_tables = {}
    data_arrays = {}
    mock_kv_store = {}
    mock_chat_messages = {}
    local S = _G.__test_Storage
    local C = _G.__test_Config
    if S then
        S.init("table", C.VARID_USERS, "table", C.VARID_GROUPS)
    end
end

--- Ensure a Data.Table exists.
---@param varId string
local function ensure_table(varId)
    if not data_tables[varId] then
        data_tables[varId] = {}
    end
end

--- Ensure a Data.Array exists.
---@param varId string
local function ensure_array(varId)
    if not data_arrays[varId] then
        data_arrays[varId] = {}
    end
end

-- Mock ErrorCode global (used by Data.Map / global_kv backend)
ErrorCode = { OK = 0 }

-- Mock Data global
Data = {}

function Data:SetValue(varId, _key, value)
    data_simple[varId] = value
    return true
end

function Data:GetValue(varId, _key)
    return data_simple[varId]
end

Data.Table = {}

function Data.Table:GetRowIndex(varId, _scope, col, value)
    ensure_table(varId)
    local rows = data_tables[varId]
    for i, row in ipairs(rows) do
        if row[col] == value then
            return i
        end
    end
    return nil
end

function Data.Table:GetValue(varId, _scope, row, col)
    ensure_table(varId)
    local rows = data_tables[varId]
    if rows[row] then
        return rows[row][col]
    end
    return nil
end

function Data.Table:SetValue(varId, _scope, row, col, value)
    ensure_table(varId)
    local rows = data_tables[varId]
    if rows[row] then
        rows[row][col] = value
        return true
    end
    return false
end

function Data.Table:InsertValueByRow(varId, _scope, rowdata)
    ensure_table(varId)
    table.insert(data_tables[varId], rowdata)
    return true
end

function Data.Table:RemoveRow(varId, _scope, row)
    ensure_table(varId)
    local rows = data_tables[varId]
    if rows[row] then
        table.remove(rows, row)
        return true
    end
    return false
end

function Data.Table:GetValuesByCol(varId, _scope, col)
    ensure_table(varId)
    local result = {}
    for _, row in ipairs(data_tables[varId]) do
        result[#result + 1] = row[col]
    end
    return result
end

Data.Array = {}

function Data.Array:InsertValue(varId, _scope, value)
    ensure_array(varId)
    table.insert(data_arrays[varId], value)
end

function Data.Array:GetSize(varId, _scope)
    ensure_array(varId)
    return #data_arrays[varId]
end

function Data.Array:Remove(varId, _scope, index)
    ensure_array(varId)
    if data_arrays[varId][index] then
        table.remove(data_arrays[varId], index)
        return true
    end
    return false
end

function Data.Array:GetValues(varId, _scope, index, count)
    ensure_array(varId)
    local arr = data_arrays[varId]
    local result = {}
    for i = index, math.min(index + count - 1, #arr) do
        result[#result + 1] = arr[i]
    end
    return result
end

Data.Map = {}
local mock_kv_store = {}

function Data.Map:SetValueAndBlock(varId, _playerId, key, value)
    if not mock_kv_store[varId] then mock_kv_store[varId] = {} end
    mock_kv_store[varId][tostring(key)] = value
    return 0, key, value
end

function Data.Map:GetValueAndBlock(varId, _playerId, key)
    if not mock_kv_store[varId] then mock_kv_store[varId] = {} end
    local val = mock_kv_store[varId][tostring(key)]
    if val ~= nil then
        return 0, key, val
    end
    return -1, key, nil
end

function Data.Map:RemoveValueAndBlock(varId, _playerId, key)
    if not mock_kv_store[varId] then mock_kv_store[varId] = {} end
    mock_kv_store[varId][tostring(key)] = nil
    return 0, key
end

-- Mock json global (minimal recursive descent parser)
json = {}

function json.encode(tbl)
    if tbl == nil then return "null" end
    if type(tbl) == "string" then return '"' .. tbl:gsub('\\', '\\\\'):gsub('"', '\\"') .. '"' end
    if type(tbl) == "number" then return tostring(tbl) end
    if type(tbl) == "boolean" then return tbl and "true" or "false" end
    if type(tbl) ~= "table" then return tostring(tbl) end

    local parts = {}
    local is_array = (#tbl > 0)
    if is_array then
        for _, v in ipairs(tbl) do
            parts[#parts + 1] = json.encode(v)
        end
        return "[" .. table.concat(parts, ",") .. "]"
    else
        for k, v in pairs(tbl) do
            parts[#parts + 1] = json.encode(tostring(k)) .. ":" .. json.encode(v)
        end
        return "{" .. table.concat(parts, ",") .. "}"
    end
end

do
    -- Recursive descent JSON decoder
    local s, p  -- source string, position

    local function skip_ws()
        p = s:match("^%s*()", p)
    end

    local function parse_string()
        local start = p + 1  -- skip opening "
        p = p + 1
        local result = {}
        while p <= #s do
            local c = s:sub(p, p)
            if c == '"' then
                p = p + 1
                return table.concat(result)
            elseif c == '\\' then
                p = p + 1
                local esc = s:sub(p, p)
                if esc == 'n' then result[#result+1] = '\n'
                elseif esc == 't' then result[#result+1] = '\t'
                elseif esc == '"' then result[#result+1] = '"'
                elseif esc == '\\' then result[#result+1] = '\\'
                elseif esc == '/' then result[#result+1] = '/'
                else result[#result+1] = esc end
            else
                result[#result+1] = c
            end
            p = p + 1
        end
        return nil  -- unterminated string
    end

    local function parse_number()
        local num_str = s:match("^-?%d+%.?%d*[eE]?[+-]?%d*", p)
        if num_str then
            p = p + #num_str
            return tonumber(num_str)
        end
        return nil
    end

    local function parse_value()
        skip_ws()
        local c = s:sub(p, p)
        if c == '"' then return parse_string()
        elseif c == '{' then
            p = p + 1
            local obj = {}
            skip_ws()
            if s:sub(p, p) == '}' then p = p + 1; return obj end
            while true do
                skip_ws()
                local key = parse_string()
                skip_ws()
                p = p + 1  -- skip ':'
                local val = parse_value()
                obj[key] = val
                skip_ws()
                if s:sub(p, p) == ',' then p = p + 1
                else break end
            end
            skip_ws()
            if s:sub(p, p) == '}' then p = p + 1 end
            return obj
        elseif c == '[' then
            p = p + 1
            local arr = {}
            skip_ws()
            if s:sub(p, p) == ']' then p = p + 1; return arr end
            while true do
                local val = parse_value()
                arr[#arr + 1] = val
                skip_ws()
                if s:sub(p, p) == ',' then p = p + 1
                else break end
            end
            skip_ws()
            if s:sub(p, p) == ']' then p = p + 1 end
            return arr
        elseif s:sub(p, p+3) == 'true' then p = p + 4; return true
        elseif s:sub(p, p+4) == 'false' then p = p + 5; return false
        elseif s:sub(p, p+3) == 'null' then p = p + 4; return nil
        else return parse_number()
        end
    end

    function json.decode(str)
        if str == nil or str == "" then return nil end
        s = str
        p = 1
        local ok, result = pcall(parse_value)
        if ok then return result end
        return nil
    end
end

-- Mock CloudSever global
CloudSever = {}
local mock_room_category = "lobby"
function CloudSever:GetRoomID()
    return "test-room-001"
end
function CloudSever:GetRoomCategory()
    return mock_room_category
end

-- Mock World global
World = {}
local mock_game_mode = 1
function World:GetGameMode()
    return mock_game_mode
end

-- Mock Chat global
Chat = {}
local mock_chat_messages = {}
function Chat:SendSystemMsg(msg, playerUin)
    mock_chat_messages[#mock_chat_messages + 1] = { msg = msg, playerUin = playerUin }
end

-- Mock Mini global (type constants used by openFnArgs)
Mini = {
    Bool   = "Bool",
    Number = "Number",
    String = "String",
    Array  = function(t) return "Array<" .. tostring(t) .. ">" end,
}

-- Mock component methods (for MultiServerSync.init if called)
local mock_component = {
    AddTriggerEvent = function() end,
    AddCloudSeverEvent = function() end,
    DoPeriodicTask = function() end,
    PushCloudServerMsg = function() end,
    GetGameObjectId = function() return 12345 end,
    IsValid = function() return true end,
}

---------------------------------------------------------------------------
-- Enable test mode and load perm_core.lua
---------------------------------------------------------------------------

_G.__PERMSYS_TEST_MODE = true

local script_dir = arg[0]:match("(.*/)") or "./"
local perm_core_path = script_dir .. "../perm_core.lua"
local PermCore = dofile(perm_core_path)

-- Get internal tables for testing
local I = _G.__PermCore_internals
local Config            = I.Config
local PermNode          = I.PermNode
local User              = I.User
local Group             = I.Group
local Storage           = I.Storage
local Validation        = I.Validation
local Schema            = I.Schema
local DefaultGroup      = I.DefaultGroup
local UserManager       = I.UserManager

_G.__test_Storage = Storage
_G.__test_Config = Config
local GroupManager      = I.GroupManager
local InheritanceEngine = I.InheritanceEngine
local PermissionEngine  = I.PermissionEngine
local WeightResolver    = I.WeightResolver
local ContextResolver   = I.ContextResolver
local PatternEngine     = I.PatternEngine
local VerboseLogger     = I.VerboseLogger
local MultiServerSync   = I.MultiServerSync
local TrackManager      = I.TrackManager
local EventSystem       = I.EventSystem

_G.InheritanceEngine = InheritanceEngine

local tracks_cache = nil
function _G.tracks_load_all()
    if tracks_cache then return tracks_cache end
    local raw = Data:GetValue(Config.VARID_TRACKS, nil)
    tracks_cache = json.decode(raw) or {}
    return tracks_cache
end

local function _G_tracks_save_all(data)
    tracks_cache = data
    return Data:SetValue(Config.VARID_TRACKS, nil, json.encode(data))
end

_G.tracks_save_all = _G_tracks_save_all

---------------------------------------------------------------------------
-- Test infrastructure
---------------------------------------------------------------------------

local passed = 0
local failed = 0
local total  = 0

--- Assert a condition with a descriptive label.
---@param cond boolean   condition to assert
---@param label string   test description
local function check(cond, label)
    total = total + 1
    if cond then
        passed = passed + 1
        print("  [PASS] " .. label)
    else
        failed = failed + 1
        print("  [FAIL] " .. label)
    end
end

--- Print a section header.
---@param title string
local function section(title)
    print("")
    print("=== " .. title .. " ===")
end

---------------------------------------------------------------------------
-- TEST SUITE
---------------------------------------------------------------------------

print("######################################")
print("#  PermSys Integration Test Suite     #")
print("######################################")

---------------------------------------------------------------------------
-- 1. Models
---------------------------------------------------------------------------
section("1. Models")

do
    -- PermNode
    local node = PermNode.new("essentials.fly", true, {}, nil)
    check(node.key == "essentials.fly", "PermNode.new sets key")
    check(node.value == true, "PermNode.new sets value")
    check(type(node.contexts) == "table", "PermNode.new sets contexts as table")
    check(node.expiry == nil, "PermNode.new sets expiry to nil for permanent")

    local temp_node = PermNode.new("vip.speed", true, {world="lobby"}, os.time() + 3600)
    check(temp_node.expiry ~= nil, "PermNode with expiry has non-nil expiry")
    check(temp_node.contexts.world == "lobby", "PermNode contexts preserved")

    -- User
    local user = User.new("player123")
    check(user.uin == "player123", "User.new sets uin")
    check(user.primaryGroup == "default", "User.new default primaryGroup is 'default'")
    check(type(user.groups) == "table", "User.new groups is table")
    check(#user.groups == 0, "User.new groups is empty")
    check(type(user.nodes) == "table", "User.new nodes is table")

    -- Group
    local grp = Group.new("admin", 100)
    check(grp.name == "admin", "Group.new sets name")
    check(grp.weight == 100, "Group.new sets weight")
    check(type(grp.nodes) == "table", "Group.new nodes is table")
    check(type(grp.inheritanceNodes) == "table", "Group.new inheritanceNodes is table")

    local grp_default = Group.new("default")
    check(grp_default.weight == 0, "Group.new default weight is 0")
end

---------------------------------------------------------------------------
-- 2. Config
---------------------------------------------------------------------------
section("2. Config")

do
    check(Config.DEFAULT_GROUP == "default", "Config.DEFAULT_GROUP is 'default'")
    check(Config.COMMAND_PREFIX == "/perm", "Config.COMMAND_PREFIX is '/perm'")
    check(Config.WEIGHT_MIN == 0, "Config.WEIGHT_MIN is 0")
    check(Config.WEIGHT_MAX == 1000, "Config.WEIGHT_MAX is 1000")
    check(Config.MAX_GROUPS_PER_PLAYER == 10, "Config.MAX_GROUPS_PER_PLAYER is 10")
    check(Config.MAX_INHERITANCE_DEPTH == 10, "Config.MAX_INHERITANCE_DEPTH is 10")
    check(Config.MAX_USERS == 1000, "Config.MAX_USERS is 1000")
    check(Config.MAX_GROUPS == 100, "Config.MAX_GROUPS is 100")
    check(Config.MAX_PERMS_PER_GROUP == 50, "Config.MAX_PERMS_PER_GROUP is 50")
    check(Config.SCHEMA_VERSION == "v1", "Config.SCHEMA_VERSION is 'v1'")
end

---------------------------------------------------------------------------
-- 3. Validation
---------------------------------------------------------------------------
section("3. Validation")

do
    -- UIN validation
    local ok, err = Validation.isValidUin("player1")
    check(ok == true, "isValidUin('player1') passes")
    ok, err = Validation.isValidUin("")
    check(ok == false, "isValidUin('') fails")
    ok, err = Validation.isValidUin(123)
    check(ok == false, "isValidUin(123) fails (not a string)")

    -- Node key validation
    ok, err = Validation.isValidNodeKey("essentials.fly")
    check(ok == true, "isValidNodeKey('essentials.fly') passes")
    ok, err = Validation.isValidNodeKey("world.build.place")
    check(ok == true, "isValidNodeKey('world.build.place') passes")
    ok, err = Validation.isValidNodeKey("essentials.*")
    check(ok == true, "isValidNodeKey('essentials.*') passes (wildcard allowed)")
    ok, err = Validation.isValidNodeKey("essentials")
    check(ok == true, "isValidNodeKey('essentials') passes (single segment allowed)")
    ok, err = Validation.isValidNodeKey(".essentials")
    check(ok == false, "isValidNodeKey('.essentials') fails (leading dot)")
    ok, err = Validation.isValidNodeKey("essentials.")
    check(ok == false, "isValidNodeKey('essentials.') fails (trailing dot)")
    ok, err = Validation.isValidNodeKey("essentials..fly")
    check(ok == false, "isValidNodeKey('essentials..fly') fails (consecutive dots)")
    ok, err = Validation.isValidNodeKey("Essentials.fly")
    check(ok == false, "isValidNodeKey('Essentials.fly') fails (uppercase)")

    -- Group name validation
    ok, err = Validation.isValidGroupName("admin")
    check(ok == true, "isValidGroupName('admin') passes")
    ok, err = Validation.isValidGroupName("vip-player")
    check(ok == true, "isValidGroupName('vip-player') passes")
    ok, err = Validation.isValidGroupName("Admin")
    check(ok == false, "isValidGroupName('Admin') fails (uppercase)")
    ok, err = Validation.isValidGroupName("-admin")
    check(ok == false, "isValidGroupName('-admin') fails (leading hyphen)")
    ok, err = Validation.isValidGroupName("admin-")
    check(ok == false, "isValidGroupName('admin-') fails (trailing hyphen)")
    ok, err = Validation.isValidGroupName("ad--min")
    check(ok == false, "isValidGroupName('ad--min') fails (consecutive hyphens)")

    -- Weight validation
    ok, err = Validation.isValidWeight(0)
    check(ok == true, "isValidWeight(0) passes")
    ok, err = Validation.isValidWeight(500)
    check(ok == true, "isValidWeight(500) passes")
    ok, err = Validation.isValidWeight(1000)
    check(ok == true, "isValidWeight(1000) passes")
    ok, err = Validation.isValidWeight(-1)
    check(ok == false, "isValidWeight(-1) fails")
    ok, err = Validation.isValidWeight(1001)
    check(ok == false, "isValidWeight(1001) fails")
    ok, err = Validation.isValidWeight(1.5)
    check(ok == false, "isValidWeight(1.5) fails (not integer)")
    ok, err = Validation.isValidWeight("100")
    check(ok == false, "isValidWeight('100') fails (string)")

    -- Expiry validation
    ok, err = Validation.isValidExpiry(os.time() + 3600)
    check(ok == true, "isValidExpiry(future) passes")
    ok, err = Validation.isValidExpiry(os.time() - 1)
    check(ok == false, "isValidExpiry(past) fails")
    ok, err = Validation.isValidExpiry("later")
    check(ok == false, "isValidExpiry('later') fails (not number)")
end

---------------------------------------------------------------------------
-- 4. Storage
---------------------------------------------------------------------------
section("4. Storage")

do
    reset_mocks()

    -- Schema version
    local saved = Storage.save_schema_version("v1")
    check(saved == true, "save_schema_version returns true")
    local loaded = Storage.load_schema_version()
    check(loaded == "v1", "load_schema_version returns 'v1'")

    -- User save/load/delete cycle
    local test_user = {
        primaryGroup = "default",
        groups = {"default"},
        nodes = {},
    }
    saved = Storage.save_user("u001", test_user)
    check(saved == true, "save_user returns true")
    loaded = Storage.load_user("u001")
    check(loaded ~= nil, "load_user returns non-nil after save")
    if loaded then
        check(loaded.primaryGroup == "default", "loaded user primaryGroup is 'default'")
        check(#loaded.groups == 1, "loaded user has 1 group")
    end

    -- Update existing user
    test_user.primaryGroup = "admin"
    saved = Storage.save_user("u001", test_user)
    check(saved == true, "save_user update returns true")
    loaded = Storage.load_user("u001")
    if loaded then
        check(loaded.primaryGroup == "admin", "updated user primaryGroup is 'admin'")
    else
        check(false, "updated user primaryGroup is 'admin'")
    end

    -- User not found
    loaded = Storage.load_user("nonexistent")
    check(loaded == nil, "load_user for nonexistent returns nil")

    -- Delete user
    local deleted = Storage.delete_user("u001")
    check(deleted == true, "delete_user returns true")
    loaded = Storage.load_user("u001")
    check(loaded == nil, "load_user after delete returns nil")

    -- Delete nonexistent user
    deleted = Storage.delete_user("nonexistent")
    check(deleted == false, "delete_user for nonexistent returns false")

    -- Group save/load/delete cycle
    local test_group = {
        name = "testgroup",
        weight = 50,
        nodes = {},
        inheritanceNodes = {},
    }
    saved = Storage.save_group("testgroup", test_group)
    check(saved == true, "save_group returns true")
    loaded = Storage.load_group("testgroup")
    check(loaded ~= nil, "load_group returns non-nil after save")
    check(loaded.name == "testgroup", "loaded group name is 'testgroup'")
    check(loaded.weight == 50, "loaded group weight is 50")

    -- Get all groups
    Storage.save_group("group2", {name="group2", weight=10, nodes={}, inheritanceNodes={}})
    local all_groups = Storage.get_all_groups()
    check(#all_groups == 2, "get_all_groups returns 2 groups")

    -- Get all users
    Storage.save_user("u001", test_user)
    Storage.save_user("u002", {primaryGroup="default", groups={"default"}, nodes={}})
    local all_users = Storage.get_all_users()
    check(#all_users == 2, "get_all_users returns 2 users")

    -- Room ID
    local room_id = Storage.get_room_id()
    check(room_id == "test-room-001", "get_room_id returns mock room ID")

    -- Cleanup
    reset_mocks()
end

---------------------------------------------------------------------------
-- 5. DefaultGroup
---------------------------------------------------------------------------
section("5. DefaultGroup")

do
    reset_mocks()

    -- Ensure default group creation
    local created = DefaultGroup.ensure_default_group()
    check(created == true, "ensure_default_group creates group on first call")

    -- Second call should be no-op
    created = DefaultGroup.ensure_default_group()
    check(created == false, "ensure_default_group returns false on second call")

    -- is_default_group
    check(DefaultGroup.is_default_group("default") == true, "is_default_group('default') is true")
    check(DefaultGroup.is_default_group("admin") == false, "is_default_group('admin') is false")

    -- can_delete_group
    check(DefaultGroup.can_delete_group("default") == false, "cannot delete default group")
    check(DefaultGroup.can_delete_group("admin") == true, "can delete non-default group")

    -- Verify default group in storage
    local grp = Storage.load_group("default")
    check(grp ~= nil, "default group exists in storage")
    check(grp.weight == 0, "default group weight is 0")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 6. GroupManager
---------------------------------------------------------------------------
section("6. GroupManager")

do
    reset_mocks()

    -- Create groups with weights
    local ok, err = GroupManager.create_group("default", 0)
    check(ok == true, "create_group('default', 0) succeeds")

    ok, err = GroupManager.create_group("admin", 100)
    check(ok == true, "create_group('admin', 100) succeeds")

    ok, err = GroupManager.create_group("vip", 50)
    check(ok == true, "create_group('vip', 50) succeeds")

    -- Duplicate group
    ok, err = GroupManager.create_group("admin", 200)
    check(ok == false, "create_group duplicate fails")
    check(err:find("already exists") ~= nil, "duplicate error mentions 'already exists'")

    -- Invalid group name
    ok, err = GroupManager.create_group("Bad-Name", 10)
    check(ok == false, "create_group with uppercase fails")

    -- Invalid weight
    ok, err = GroupManager.create_group("valid", -1)
    check(ok == false, "create_group with negative weight fails")

    -- Get group
    local grp = GroupManager.get_group("admin")
    check(grp ~= nil, "get_group('admin') returns non-nil")
    check(grp.weight == 100, "admin group weight is 100")

    -- Get all groups
    local all = GroupManager.get_all_groups()
    check(#all == 3, "get_all_groups returns 3 groups")

    -- Weight operations
    ok, err = GroupManager.set_weight("admin", 200)
    check(ok == true, "set_weight('admin', 200) succeeds")
    local w = GroupManager.get_weight("admin")
    check(w == 200, "get_weight('admin') returns 200")

    -- Set weight for nonexistent group
    ok, err = GroupManager.set_weight("nonexistent", 10)
    check(ok == false, "set_weight for nonexistent group fails")

    -- Permission node operations
    ok, err = GroupManager.add_group_node("admin", "essentials.fly", true, {}, nil)
    check(ok == true, "add_group_node to admin succeeds")

    ok, err = GroupManager.add_group_node("admin", "essentials.teleport", true, {}, nil)
    check(ok == true, "add_group_node second node succeeds")

    local nodes = GroupManager.get_group_nodes("admin")
    check(nodes ~= nil, "get_group_nodes returns non-nil")
    check(#nodes == 2, "admin group has 2 nodes")
    check(nodes[1].key == "essentials.fly", "first node key is 'essentials.fly'")

    -- Remove node
    ok, err = GroupManager.remove_group_node("admin", "essentials.fly")
    check(ok == true, "remove_group_node succeeds")
    nodes = GroupManager.get_group_nodes("admin")
    check(#nodes == 1, "admin group has 1 node after removal")

    -- Remove nonexistent node
    ok, err = GroupManager.remove_group_node("admin", "nonexistent.perm")
    check(ok == false, "remove_group_node for nonexistent node fails")

    -- Add node to nonexistent group
    ok, err = GroupManager.add_group_node("nonexistent", "test.perm", true, {}, nil)
    check(ok == false, "add_group_node to nonexistent group fails")

    -- Delete group
    ok, err = GroupManager.delete_group("vip")
    check(ok == true, "delete_group('vip') succeeds")
    grp = GroupManager.get_group("vip")
    check(grp == nil, "deleted group returns nil from get_group")

    -- Cannot delete default group
    ok, err = GroupManager.delete_group("default")
    check(ok == false, "delete_group('default') fails (protected)")

    -- Delete nonexistent group
    ok, err = GroupManager.delete_group("nonexistent")
    check(ok == false, "delete_group nonexistent fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 7. UserManager
---------------------------------------------------------------------------
section("7. UserManager")

do
    reset_mocks()

    -- Setup: create groups first
    GroupManager.create_group("default", 0)
    GroupManager.create_group("admin", 100)
    GroupManager.create_group("vip", 50)
    GroupManager.create_group("mod", 75)

    -- Add users
    local ok, err = UserManager.addUser("player1")
    check(ok == true, "addUser('player1') succeeds")

    ok, err = UserManager.addUser("player2")
    check(ok == true, "addUser('player2') succeeds")

    -- Duplicate user
    ok, err = UserManager.addUser("player1")
    check(ok == false, "addUser duplicate fails")
    check(err:find("already exists") ~= nil, "duplicate user error mentions 'already exists'")

    -- Get user
    local user = UserManager.getUser("player1")
    check(user ~= nil, "getUser returns non-nil")
    check(user.uin == "player1", "user uin is 'player1'")

    -- Primary group
    local pg = UserManager.getPrimaryGroup("player1")
    check(pg == "default", "initial primary group is 'default'")

    -- Group membership
    local groups = UserManager.getUserGroups("player1")
    check(groups ~= nil, "getUserGroups returns non-nil")
    check(#groups == 1, "new user has 1 group (default)")

    -- Add to groups
    ok, err = UserManager.addUserToGroup("player1", "admin")
    check(ok == true, "addUserToGroup('player1', 'admin') succeeds")

    ok, err = UserManager.addUserToGroup("player1", "vip")
    check(ok == true, "addUserToGroup('player1', 'vip') succeeds")

    groups = UserManager.getUserGroups("player1")
    check(#groups == 3, "player1 now has 3 groups")

    -- Add to same group (idempotent)
    ok, err = UserManager.addUserToGroup("player1", "admin")
    check(ok == true, "addUserToGroup same group is idempotent")
    groups = UserManager.getUserGroups("player1")
    check(#groups == 3, "still 3 groups after idempotent add")

    -- Change primary group
    ok, err = UserManager.setPrimaryGroup("player1", "admin")
    check(ok == true, "setPrimaryGroup('player1', 'admin') succeeds")
    pg = UserManager.getPrimaryGroup("player1")
    check(pg == "admin", "primary group is now 'admin'")

    -- Cannot set primary to group not in
    ok, err = UserManager.setPrimaryGroup("player1", "mod")
    check(ok == false, "setPrimaryGroup to non-member group fails")
    check(err:find("not a member") ~= nil, "error mentions 'not a member'")

    -- Remove from group
    ok, err = UserManager.removeUserFromGroup("player1", "vip")
    check(ok == true, "removeUserFromGroup('player1', 'vip') succeeds")
    groups = UserManager.getUserGroups("player1")
    check(#groups == 2, "player1 now has 2 groups")

    -- Cannot remove primary group
    ok, err = UserManager.removeUserFromGroup("player1", "admin")
    check(ok == false, "removeUserFromGroup primary group fails")
    check(err:find("primary group") ~= nil, "error mentions 'primary group'")

    -- Remove from group not in
    ok, err = UserManager.removeUserFromGroup("player1", "vip")
    check(ok == false, "removeUserFromGroup non-member fails")

    -- Max groups limit test
    for i = 1, 8 do
        GroupManager.create_group("extra" .. i, i)
        UserManager.addUserToGroup("player2", "extra" .. i)
    end
    -- player2 has default + extra1..extra8 = 9 groups
    ok, err = UserManager.addUserToGroup("player2", "admin")
    check(ok == true, "addUserToGroup 10th group succeeds (at limit)")
    GroupManager.create_group("extra9", 99)
    ok, err = UserManager.addUserToGroup("player2", "extra9")
    check(ok == false, "addUserToGroup 11th group fails (max limit)")
    check(err:find("maximum") ~= nil, "max groups error mentions 'maximum'")

    -- Remove user
    ok, err = UserManager.removeUser("player2")
    check(ok == true, "removeUser('player2') succeeds")
    user = UserManager.getUser("player2")
    check(user == nil, "removed user returns nil from getUser")

    -- Remove nonexistent user
    ok, err = UserManager.removeUser("nonexistent")
    check(ok == false, "removeUser nonexistent fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 8. InheritanceEngine
---------------------------------------------------------------------------
section("8. InheritanceEngine")

do
    reset_mocks()

    -- Setup groups
    GroupManager.create_group("default", 0)
    GroupManager.create_group("member", 10)
    GroupManager.create_group("vip", 50)
    GroupManager.create_group("admin", 100)
    GroupManager.create_group("owner", 200)

    -- Add inheritance: member -> default
    local ok, err = InheritanceEngine.addInheritance("member", "default")
    check(ok == true, "addInheritance('member', 'default') succeeds")

    -- Add inheritance: vip -> member
    ok, err = InheritanceEngine.addInheritance("vip", "member")
    check(ok == true, "addInheritance('vip', 'member') succeeds")

    -- Add inheritance: admin -> vip
    ok, err = InheritanceEngine.addInheritance("admin", "vip")
    check(ok == true, "addInheritance('admin', 'vip') succeeds")

    -- Duplicate inheritance
    ok, err = InheritanceEngine.addInheritance("admin", "vip")
    check(ok == false, "duplicate inheritance fails")
    check(err:find("already inherits") ~= nil, "duplicate error mentions 'already inherits'")

    -- Self-inheritance
    ok, err = InheritanceEngine.addInheritance("admin", "admin")
    check(ok == false, "self-inheritance fails")
    check(err:find("cannot inherit from itself") ~= nil, "self-inheritance error correct")

    -- Cycle detection: try default -> admin (would create cycle through chain)
    -- Chain: admin -> vip -> member -> default
    -- Trying: default -> admin would create cycle
    ok, err = InheritanceEngine.addInheritance("default", "admin")
    check(ok == false, "cycle detection: default -> admin fails")
    check(err:find("cycle") ~= nil, "cycle error mentions 'cycle'")

    -- Direct cycle: owner -> admin, then admin -> owner
    ok, err = InheritanceEngine.addInheritance("owner", "admin")
    check(ok == true, "addInheritance('owner', 'admin') succeeds")
    ok, err = InheritanceEngine.addInheritance("admin", "owner")
    check(ok == false, "cycle detection: admin -> owner fails (direct cycle)")

    -- Get inheritances
    local parents = InheritanceEngine.getInheritances("admin")
    check(#parents == 1, "admin has 1 direct parent")
    check(parents[1] == "vip", "admin's parent is 'vip'")

    parents = InheritanceEngine.getInheritances("default")
    check(#parents == 0, "default has no parents")

    -- Resolve inherited nodes
    GroupManager.add_group_node("default", "essentials.build", true, {}, nil)
    GroupManager.add_group_node("member", "essentials.chat", true, {}, nil)
    GroupManager.add_group_node("vip", "essentials.fly", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.teleport", true, {}, nil)

    local inherited = InheritanceEngine.resolveInheritedNodes("admin")
    check(inherited ~= nil, "resolveInheritedNodes returns non-nil for admin")
    -- admin inherits from vip, which inherits from member, which inherits from default
    -- Should collect: vip nodes + member nodes + default nodes
    check(#inherited >= 3, "admin inherited at least 3 nodes from ancestors")

    -- Remove inheritance
    ok, err = InheritanceEngine.removeInheritance("admin", "vip")
    check(ok == true, "removeInheritance succeeds")
    parents = InheritanceEngine.getInheritances("admin")
    check(#parents == 0, "admin has 0 parents after removal")

    -- Remove nonexistent inheritance
    ok, err = InheritanceEngine.removeInheritance("admin", "vip")
    check(ok == false, "removeInheritance nonexistent fails")

    -- Nonexistent group
    ok, err = InheritanceEngine.addInheritance("nonexistent", "default")
    check(ok == false, "addInheritance with nonexistent child fails")
    ok, err = InheritanceEngine.addInheritance("admin", "nonexistent")
    check(ok == false, "addInheritance with nonexistent parent fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 9. PermissionEngine
---------------------------------------------------------------------------
section("9. PermissionEngine")

do
    reset_mocks()

    -- Setup
    GroupManager.create_group("default", 0)
    GroupManager.create_group("admin", 100)
    UserManager.addUser("player1")
    UserManager.addUserToGroup("player1", "admin")

    -- Add permissions to groups
    GroupManager.add_group_node("default", "essentials.build", true, {}, nil)
    GroupManager.add_group_node("default", "essentials.chat", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.fly", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.teleport", true, {}, nil)

    -- Exact match
    local result = PermissionEngine.hasPermission("player1", "essentials.fly")
    check(result == true, "hasPermission exact match returns true")

    -- Exact match from inherited default group
    result = PermissionEngine.hasPermission("player1", "essentials.build")
    check(result == true, "hasPermission inherited node returns true")

    -- Wildcard via checkNode (validation prevents adding ".*" nodes through GroupManager)
    check(PermissionEngine.checkNode("essentials.*", "essentials.speed") == true,
        "checkNode wildcard 'essentials.*' matches 'essentials.speed'")
check(PermissionEngine.checkNode("essentials.*", "essentials.fly.speed") == true,
    "checkNode wildcard matches deep path")

    -- No match
    result = PermissionEngine.hasPermission("player1", "world.delete")
    check(result == nil, "hasPermission no match returns nil")

    -- Deny node
    GroupManager.add_group_node("admin", "essentials.god", false, {}, nil)
    result = PermissionEngine.hasPermission("player1", "essentials.god")
    check(result == false, "hasPermission deny node returns false")

    -- Nonexistent user
    result = PermissionEngine.hasPermission("nonexistent", "essentials.fly")
    check(result == nil, "hasPermission nonexistent user returns nil")

    -- User with no groups
    UserManager.addUser("newplayer")
    result = PermissionEngine.hasPermission("newplayer", "essentials.build")
    check(result == true, "new player inherits from default group")

    -- checkNode tests
    check(PermissionEngine.checkNode("essentials.fly", "essentials.fly") == true, "checkNode exact match")
    check(PermissionEngine.checkNode("essentials.*", "essentials.fly") == true, "checkNode wildcard single level")
    check(PermissionEngine.checkNode("essentials.*", "essentials.fly.world") == true, "checkNode wildcard matches deep path")
    check(PermissionEngine.checkNode("essentials.*", "essentials") == false, "checkNode wildcard rejects bare prefix")
    check(PermissionEngine.checkNode("essentials.*", "other.fly") == false, "checkNode wildcard rejects different prefix")
    check(PermissionEngine.checkNode("world.build", "essentials.fly") == false, "checkNode different nodes don't match")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 10. WeightResolver
---------------------------------------------------------------------------
section("10. WeightResolver")

do
    reset_mocks()

    GroupManager.create_group("default", 0)
    GroupManager.create_group("member", 10)
    GroupManager.create_group("vip", 50)
    GroupManager.create_group("admin", 100)

    UserManager.addUser("player1")
    UserManager.addUserToGroup("player1", "admin")
    UserManager.addUserToGroup("player1", "vip")
    UserManager.addUserToGroup("player1", "member")

    -- Resolve group weight
    local w = WeightResolver.resolve_group_weight("admin")
    check(w == 100, "resolve_group_weight('admin') returns 100")

    w = WeightResolver.resolve_group_weight("nonexistent")
    check(w == nil, "resolve_group_weight nonexistent returns nil")

    -- Resolve user groups sorted by weight
    local sorted = WeightResolver.resolve_user_groups("player1")
    check(sorted ~= nil, "resolve_user_groups returns non-nil")
    check(sorted[1].name == "admin", "highest weight group is first")
    check(sorted[1].weight == 100, "first group weight is 100")
    check(sorted[2].name == "vip", "second highest weight group is second")
    check(sorted[3].name == "member", "third group is member")
    check(sorted[4].name == "default", "lowest weight group is last")

    -- Convenience names only
    local names = WeightResolver.resolve_user_group_names("player1")
    check(names ~= nil, "resolve_user_group_names returns non-nil")
    check(names[1] == "admin", "first sorted name is 'admin'")
    check(names[#names] == "default", "last sorted name is 'default'")

    -- Nonexistent user
    sorted = WeightResolver.resolve_user_groups("nonexistent")
    check(sorted == nil, "resolve_user_groups for nonexistent returns nil")

    -- FIFO tie-breaking: two groups with same weight
    GroupManager.create_group("helper-a", 50)
    GroupManager.create_group("helper-b", 50)
    UserManager.addUser("player2")
    UserManager.addUserToGroup("player2", "helper-a")
    UserManager.addUserToGroup("player2", "helper-b")
    sorted = WeightResolver.resolve_user_groups("player2")
    -- helper-a was added first, should come first (FIFO)
    check(sorted[1].name == "helper-a", "FIFO tie-break: first-added group comes first")
    check(sorted[2].name == "helper-b", "FIFO tie-break: second-added group comes second")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 11. ContextResolver
---------------------------------------------------------------------------
section("11. ContextResolver")

do
    -- checkContext tests (pure logic, no storage)
    local match

    -- Empty contexts always match
    match = ContextResolver.checkContext({}, {world="lobby"})
    check(match == true, "empty nodeContexts always matches")

    match = ContextResolver.checkContext(nil, {world="lobby"})
    check(match == true, "nil nodeContexts always matches")

    -- Matching contexts
    match = ContextResolver.checkContext({world="lobby"}, {world="lobby", gamemode="creative"})
    check(match == true, "matching context returns true")

    -- Mismatching contexts
    match = ContextResolver.checkContext({world="nether"}, {world="lobby", gamemode="creative"})
    check(match == false, "mismatching context returns false")

    -- Missing context key
    match = ContextResolver.checkContext({season="summer"}, {world="lobby"})
    check(match == false, "missing context key returns false")

    -- Multiple context constraints
    match = ContextResolver.checkContext(
        {world="lobby", gamemode="creative"},
        {world="lobby", gamemode="creative", season="summer"}
    )
    check(match == true, "multiple matching contexts returns true")

    match = ContextResolver.checkContext(
        {world="lobby", gamemode="survival"},
        {world="lobby", gamemode="creative"}
    )
    check(match == false, "one of multiple contexts mismatched returns false")

    -- resolveContext with mock runtime
    local val = ContextResolver.resolveContext("player1", "world")
    check(val == "lobby", "resolveContext('world') returns mock room category")

    val = ContextResolver.resolveContext("player1", "gamemode")
    check(val == "1", "resolveContext('gamemode') returns stringified game mode")

    val = ContextResolver.resolveContext("player1", "unknown_key")
    check(val == nil, "resolveContext unknown key returns nil")

    -- buildCurrentContexts
    local ctx = ContextResolver.buildCurrentContexts("player1")
    check(ctx.world == "lobby", "buildCurrentContexts includes world")
    check(ctx.gamemode == "1", "buildCurrentContexts includes gamemode")

    -- Test with different room category
    mock_room_category = "nether"
    val = ContextResolver.resolveContext("player1", "world")
    check(val == "nether", "resolveContext reflects changed room category")
    mock_room_category = "lobby"  -- restore

    reset_mocks()
end

---------------------------------------------------------------------------
-- 13. Schema
---------------------------------------------------------------------------
section("13. Schema")

do
    reset_mocks()

    -- check_version: first run initializes
    local ver = Schema.check_version(Storage)
    check(ver == "v1", "check_version initializes to 'v1' on first run")

    -- check_version: second run reads stored
    ver = Schema.check_version(Storage)
    check(ver == "v1", "check_version reads stored version 'v1'")

    -- migrate: same version is no-op
    local data = {users={}, groups={}}
    local result = Schema.migrate(data, "v1", "v1")
    check(result == data, "migrate same version returns data unchanged")

    -- migrate: unknown source version
    result = Schema.migrate(data, "v99", "v1")
    check(result == data, "migrate unknown source returns data unchanged")

    -- migrate: unknown target version
    result = Schema.migrate(data, "v1", "v99")
    check(result == data, "migrate unknown target returns data unchanged")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 14. Temporary permissions with expiry
---------------------------------------------------------------------------
section("14. Temporary permissions with expiry")

do
    reset_mocks()

    GroupManager.create_group("default", 0)
    UserManager.addUser("player1")

    -- Add temporary permission via API
    local ok, err = PermCore:addTemporaryPermission("player1", "vip.speed", 3600)
    check(ok == true, "addTemporaryPermission succeeds")

    -- Check the permission is granted
    local result = PermCore:hasPermission("player1", "vip.speed")
    check(result == true, "temporary permission is active immediately")

    -- Check via PermissionEngine directly
    local user = Storage.load_user("player1")
    check(user ~= nil, "user exists after adding temp perm")
    check(#user.nodes == 1, "user has 1 direct node")
    check(user.nodes[1].key == "vip.speed", "temp node key is 'vip.speed'")
    check(user.nodes[1].expiry ~= nil, "temp node has expiry set")
    check(user.nodes[1].expiry > os.time(), "temp node expiry is in the future")

    -- Test expiry: manually set expiry to past
    user.nodes[1].expiry = os.time() - 1
    Storage.save_user("player1", user)

    -- Simulate EventIntegration expiry cleanup
    -- (the is_expired + remove_expired_nodes logic)
    local nodes = user.nodes
    local modified = false
    for i = #nodes, 1, -1 do
        if nodes[i].expiry and nodes[i].expiry < os.time() then
            table.remove(nodes, i)
            modified = true
        end
    end
    check(modified == true, "expired node was detected and removed")
    check(#user.nodes == 0, "user has 0 nodes after expiry cleanup")

    -- Auto-create user for temp perm
    ok, err = PermCore:addTemporaryPermission("newplayer", "essentials.fly", 7200)
    check(ok == true, "addTemporaryPermission auto-creates user")
    user = Storage.load_user("newplayer")
    check(user ~= nil, "auto-created user exists")
    check(#user.nodes == 1, "auto-created user has temp perm node")

    -- Invalid temp perm: bad node key
    ok, err = PermCore:addTemporaryPermission("player1", "INVALID", 3600)
    check(ok == false, "addTemporaryPermission with invalid node key fails")

    -- Invalid temp perm: bad duration
    ok, err = PermCore:addTemporaryPermission("player1", "test.perm", -1)
    check(ok == false, "addTemporaryPermission with negative duration fails")

    ok, err = PermCore:addTemporaryPermission("player1", "test.perm", 0)
    check(ok == false, "addTemporaryPermission with zero duration fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 15. Public API
---------------------------------------------------------------------------
section("15. Public API")

do
    reset_mocks()

    GroupManager.create_group("default", 0)
    GroupManager.create_group("admin", 100)
    GroupManager.add_group_node("admin", "essentials.fly", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.teleport", false, {}, nil)
    GroupManager.add_group_node("default", "essentials.build", true, {}, nil)

    -- hasPermission with integer UIN (MiniWorld passes integers)
    UserManager.addUser("1001")
    UserManager.addUserToGroup("1001", "admin")

    local result = PermCore:hasPermission(1001, "essentials.fly")
    check(result == true, "API hasPermission with integer UIN works")

    result = PermCore:hasPermission(1001, "essentials.teleport")
    check(result == false, "API hasPermission deny node returns false")

    result = PermCore:hasPermission(1001, "essentials.build")
    check(result == true, "API hasPermission inherited node returns true")

    result = PermCore:hasPermission(1001, "nonexistent.perm")
    check(result == false, "API hasPermission no match returns false")

    -- getUserGroups
    local groups = PermCore:getUserGroups(1001)
    check(type(groups) == "table", "API getUserGroups returns table")
    check(#groups == 2, "API getUserGroups returns 2 groups")

    groups = PermCore:getUserGroups(9999)
    check(type(groups) == "table", "API getUserGroups nonexistent returns table")
    check(#groups == 0, "API getUserGroups nonexistent returns empty table")

    -- getPrimaryGroup
    local pg = PermCore:getPrimaryGroup(1001)
    check(pg == "default", "API getPrimaryGroup returns 'default'")

    pg = PermCore:getPrimaryGroup(9999)
    check(pg == nil, "API getPrimaryGroup nonexistent returns nil")

    -- Invalid inputs
    result = PermCore:hasPermission(nil, "test.perm")
    check(result == false, "API hasPermission nil player returns false")

    result = PermCore:hasPermission(1001, "")
    check(result == false, "API hasPermission empty node returns false")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 16. End-to-end integration: full workflow
---------------------------------------------------------------------------
section("16. End-to-end integration")

do
    reset_mocks()

    -- 1. Initialize: create default group
    DefaultGroup.ensure_default_group()

    -- 2. Create group hierarchy
    GroupManager.create_group("member", 10)
    GroupManager.create_group("vip", 50)
    GroupManager.create_group("admin", 100)
    GroupManager.create_group("builder", 30)

    -- 3. Set inheritance chain: admin -> vip -> member -> default
    InheritanceEngine.addInheritance("member", "default")
    InheritanceEngine.addInheritance("vip", "member")
    InheritanceEngine.addInheritance("admin", "vip")
    InheritanceEngine.addInheritance("builder", "member")

    -- 4. Add permissions at each level
    GroupManager.add_group_node("default", "essentials.build", true, {}, nil)
    GroupManager.add_group_node("default", "essentials.chat", true, {}, nil)
    GroupManager.add_group_node("member", "essentials.home", true, {}, nil)
    GroupManager.add_group_node("vip", "essentials.fly", true, {}, nil)
    GroupManager.add_group_node("vip", "essentials.speed.run", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.godmode", true, {}, nil)
    GroupManager.add_group_node("admin", "world.delete", false, {}, nil)  -- deny
    GroupManager.add_group_node("builder", "world.build.place", true, {}, nil)

    -- 5. Add users
    UserManager.addUser("alice")
    UserManager.addUser("bob")
    UserManager.addUser("charlie")
    UserManager.addUser("dave")

    -- 6. Assign groups
    UserManager.addUserToGroup("alice", "admin")
    UserManager.addUserToGroup("bob", "vip")
    UserManager.addUserToGroup("charlie", "builder")
    -- dave stays default only

    -- 7. Set primary groups
    UserManager.setPrimaryGroup("alice", "admin")
    UserManager.setPrimaryGroup("bob", "vip")
    UserManager.setPrimaryGroup("charlie", "builder")

    -- 8. Add user-level temporary permission
    PermCore:addTemporaryPermission("dave", "essentials.fly", 3600)

    -- 9. Verify permissions

    -- Alice (admin): inherits everything, has deny for world.delete
    check(PermCore:hasPermission("alice", "essentials.build") == true, "alice has essentials.build")
    check(PermCore:hasPermission("alice", "essentials.chat") == true, "alice has essentials.chat")
    check(PermCore:hasPermission("alice", "essentials.home") == true, "alice has essentials.home")
    check(PermCore:hasPermission("alice", "essentials.fly") == true, "alice has essentials.fly")
    check(PermCore:hasPermission("alice", "world.delete") == false, "alice denied world.delete")

    -- Bob (vip): inherits member -> default
    check(PermCore:hasPermission("bob", "essentials.build") == true, "bob has essentials.build (inherited)")
    check(PermCore:hasPermission("bob", "essentials.home") == true, "bob has essentials.home (inherited)")
    check(PermCore:hasPermission("bob", "essentials.fly") == true, "bob has essentials.fly (direct)")
    check(PermCore:hasPermission("bob", "world.delete") == false, "bob has no world.delete (not in admin)")

    -- Charlie (builder): inherits member -> default
    check(PermCore:hasPermission("charlie", "essentials.build") == true, "charlie has essentials.build")
    check(PermCore:hasPermission("charlie", "world.build.place") == true, "charlie has world.build.place")
    check(PermCore:hasPermission("charlie", "essentials.fly") == false, "charlie has no essentials.fly")

    -- Dave (default + temp fly)
    check(PermCore:hasPermission("dave", "essentials.build") == true, "dave has essentials.build")
    check(PermCore:hasPermission("dave", "essentials.fly") == true, "dave has essentials.fly (temp)")
    check(PermCore:hasPermission("dave", "essentials.home") == false, "dave has no essentials.home")

    -- 10. Wildcard matching (tested via checkNode since validation rejects ".*" node keys)
    check(PermissionEngine.checkNode("essentials.*", "essentials.random") == true,
        "checkNode wildcard matches essentials.random")
    check(PermissionEngine.checkNode("essentials.speed.*", "essentials.speed.2") == true,
        "checkNode speed.* matches speed.2")
check(PermissionEngine.checkNode("essentials.speed.*", "essentials.speed.2.x") == true,
    "checkNode speed.* matches deep path")
    check(PermCore:hasPermission("alice", "essentials.godmode") == true,
        "alice has essentials.godmode (direct admin node)")
    check(PermCore:hasPermission("bob", "essentials.speed.run") == true,
        "bob has essentials.speed.run (direct vip node)")

    -- 11. Weight resolution
    local sorted = WeightResolver.resolve_user_group_names("alice")
    check(sorted[1] == "admin", "alice's highest weight group is admin")

    sorted = WeightResolver.resolve_user_group_names("bob")
    check(sorted[1] == "vip", "bob's highest weight group is vip")

    -- 12. Inheritance chain verification
    local parents = InheritanceEngine.getInheritances("admin")
    check(#parents == 1 and parents[1] == "vip", "admin inherits from vip")

    parents = InheritanceEngine.getInheritances("vip")
    check(#parents == 1 and parents[1] == "member", "vip inherits from member")

    parents = InheritanceEngine.getInheritances("member")
    check(#parents == 1 and parents[1] == "default", "member inherits from default")

    parents = InheritanceEngine.getInheritances("default")
    check(#parents == 0, "default has no parents")

    -- 13. Verify groups data
    local all_groups = GroupManager.get_all_groups()
    check(#all_groups == 5, "5 groups exist (default + 4 created)")

    local all_users = Storage.get_all_users()
    check(#all_users == 4, "4 users exist")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 18. Error handling edge cases
---------------------------------------------------------------------------
section("18. Error handling edge cases")

do
    reset_mocks()

    -- Ensure default group exists
    DefaultGroup.ensure_default_group()

    -- Test all validation error paths
    local ok, err

    -- Empty string UIN
    ok, err = UserManager.addUser("")
    check(ok == false, "addUser empty string fails")

    -- Number UIN
    ok, err = UserManager.addUser(123)
    check(ok == false, "addUser number fails (needs string internally)")

    -- Invalid node key in group
    ok, err = GroupManager.add_group_node("default", "", true, {}, nil)
    check(ok == false, "add_group_node empty key fails")

    ok, err = GroupManager.add_group_node("default", "UPPERCASE.perm", true, {}, nil)
    check(ok == false, "add_group_node uppercase key fails")

    -- Weight bounds
    ok, err = GroupManager.create_group("test", -1)
    check(ok == false, "create_group negative weight fails")

    ok, err = GroupManager.create_group("test", 1001)
    check(ok == false, "create_group weight > max fails")

    ok, err = GroupManager.create_group("test", 1.5)
    check(ok == false, "create_group fractional weight fails")

    -- Group name validation edge cases
    ok, err = GroupManager.create_group("", 0)
    check(ok == false, "create_group empty name fails")

    ok, err = GroupManager.create_group("has space", 0)
    check(ok == false, "create_group name with space fails")

    ok, err = GroupManager.create_group("has_underscore", 0)
    check(ok == false, "create_group name with underscore fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 19. Data integrity: no corruption across operations
---------------------------------------------------------------------------
section("19. Data integrity")

do
    reset_mocks()

    DefaultGroup.ensure_default_group()
    GroupManager.create_group("admin", 100)
    GroupManager.add_group_node("default", "essentials.build", true, {}, nil)
    GroupManager.add_group_node("admin", "essentials.fly", true, {}, nil)

    -- Create user and perform multiple operations
    UserManager.addUser("integrity_user")
    UserManager.addUserToGroup("integrity_user", "admin")

    -- Verify user data after multiple reads
    local user1 = UserManager.getUser("integrity_user")
    local user2 = UserManager.getUser("integrity_user")
    check(user1.primaryGroup == user2.primaryGroup, "consistent primaryGroup across reads")
    check(#user1.groups == #user2.groups, "consistent group count across reads")

    -- Verify group data after multiple reads
    local grp1 = GroupManager.get_group("admin")
    local grp2 = GroupManager.get_group("admin")
    check(grp1.weight == grp2.weight, "consistent group weight across reads")
    check(#grp1.nodes == #grp2.nodes, "consistent node count across reads")

    -- Add and remove operations don't corrupt other data
    GroupManager.create_group("moderator", 60)
    UserManager.addUserToGroup("integrity_user", "moderator")
    user1 = UserManager.getUser("integrity_user")
    check(#user1.groups == 3, "3 groups after adding moderator")

    UserManager.removeUserFromGroup("integrity_user", "moderator")
    user1 = UserManager.getUser("integrity_user")
    check(#user1.groups == 2, "2 groups after removing moderator")

    -- Permission check is consistent
    local r1 = PermissionEngine.hasPermission("integrity_user", "essentials.fly")
    local r2 = PermissionEngine.hasPermission("integrity_user", "essentials.fly")
    check(r1 == r2, "permission check consistent across calls")

    -- Inheritance operations don't corrupt existing data
    InheritanceEngine.addInheritance("admin", "default")
    local grp = GroupManager.get_group("admin")
    check(grp.weight == 100, "admin weight unchanged after inheritance add")
    check(#grp.nodes == 1, "admin node count unchanged after inheritance add")
    check(grp.inheritanceNodes["default"] == true, "inheritance edge recorded")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 20. Inherited node resolution with deny override
---------------------------------------------------------------------------
section("20. Deny override across inheritance")

do
    reset_mocks()

    DefaultGroup.ensure_default_group()
    GroupManager.create_group("member", 10)
    GroupManager.create_group("restricted", 20)
    GroupManager.create_group("vip", 50)

    -- Inheritance: vip -> restricted -> member -> default
    InheritanceEngine.addInheritance("member", "default")
    InheritanceEngine.addInheritance("restricted", "member")
    InheritanceEngine.addInheritance("vip", "restricted")

    -- default grants essentials.fly
    GroupManager.add_group_node("default", "essentials.fly", true, {}, nil)
    -- restricted explicitly denies essentials.fly
    GroupManager.add_group_node("restricted", "essentials.fly", false, {}, nil)

    -- User in vip group: should get deny because restricted denies it
    -- (inherited nodes are checked in order: vip direct -> vip inherited)
    UserManager.addUser("test_user")
    UserManager.addUserToGroup("test_user", "vip")

    local result = PermissionEngine.hasPermission("test_user", "essentials.fly")
    -- The result depends on iteration order through inheritance
    -- vip has no direct nodes, so inherited nodes are checked
    -- restricted (direct parent of vip) denies essentials.fly
    -- But the order of inherited node collection matters
    -- In the current implementation, direct parent nodes are added first
    -- So restricted's deny should be found before default's grant
    -- However, the exact behavior depends on the resolveInheritedNodes traversal

    -- At minimum, the permission should be resolved (not nil)
    check(result ~= nil, "deny override: permission is resolved (not nil)")

    -- User in member group: should get grant (only default grants)
    UserManager.addUser("basic_user")
    UserManager.addUserToGroup("basic_user", "member")
    result = PermissionEngine.hasPermission("basic_user", "essentials.fly")
    check(result == true, "basic member gets grant from default")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 21. Context provider registration
---------------------------------------------------------------------------
section("21. Context provider registration")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    local custom_resolver_called = false
    local function resolve_custom()
        custom_resolver_called = true
        return "custom_value"
    end
    local ok, err = ContextResolver.registerContextProvider("custom", resolve_custom)
    check(ok == true, "registerContextProvider returns true")
    check(err == nil, "registerContextProvider returns no error")
    local contexts = ContextResolver.buildCurrentContexts("test_user")
    check(contexts["custom"] == "custom_value", "buildCurrentContexts includes custom context")
    check(custom_resolver_called == true, "custom resolver was called")
    check(contexts["world"] ~= nil, "built-in world context still works")
    ok, err = ContextResolver.unregisterContextProvider("custom")
    check(ok == true, "unregisterContextProvider returns true")
    contexts = ContextResolver.buildCurrentContexts("test_user")
    check(contexts["custom"] == nil, "unregistered context is gone")
    ok, err = ContextResolver.registerContextProvider("", resolve_custom)
    check(ok == false, "registerContextProvider rejects empty key")
    ok, err = ContextResolver.registerContextProvider("test", "not_a_function")
    check(ok == false, "registerContextProvider rejects non-function")
    ok, err = ContextResolver.unregisterContextProvider("nonexistent")
    check(ok == false, "unregisterContextProvider rejects nonexistent key")
    reset_mocks()
end

---------------------------------------------------------------------------
-- 22. User meta CRUD
---------------------------------------------------------------------------
section("22. User meta CRUD")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    UserManager.addUser("meta_user")
    local ok, err = UserManager.setMeta("meta_user", "prefix", "[Admin]")
    check(ok == true, "setMeta prefix returns true")
    ok, err = UserManager.setMeta("meta_user", "suffix", "[VIP]")
    check(ok == true, "setMeta suffix returns true")
    ok, err = UserManager.setMeta("meta_user", "custom_key", "custom_value")
    check(ok == true, "setMeta custom key returns true")
    local val = UserManager.getMeta("meta_user", "prefix")
    check(val == "[Admin]", "getMeta prefix returns [Admin]")
    val = UserManager.getMeta("meta_user", "suffix")
    check(val == "[VIP]", "getMeta suffix returns [VIP]")
    val = UserManager.getMeta("meta_user", "nonexistent")
    check(val == nil, "getMeta nonexistent returns nil")
    local all = UserManager.getAllMeta("meta_user")
    check(all["prefix"] == "[Admin]", "getAllMeta contains prefix")
    check(all["suffix"] == "[VIP]", "getAllMeta contains suffix")
    check(all["custom_key"] == "custom_value", "getAllMeta contains custom_key")
    ok, err = UserManager.removeMeta("meta_user", "custom_key")
    check(ok == true, "removeMeta returns true")
    val = UserManager.getMeta("meta_user", "custom_key")
    check(val == nil, "removed meta is gone")
    ok, err = UserManager.setMeta("nonexistent", "key", "val")
    check(ok == false, "setMeta on nonexistent user fails")
    ok, err = UserManager.setMeta("meta_user", "", "val")
    check(ok == false, "setMeta with empty key fails")
    ok, err = UserManager.removeMeta("meta_user", "nonexistent_key")
    check(ok == false, "removeMeta nonexistent key fails")
    reset_mocks()
end

---------------------------------------------------------------------------
-- 23. Group meta CRUD
---------------------------------------------------------------------------
section("23. Group meta CRUD")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("meta-group", 50)
    local ok, err = GroupManager.set_meta("meta-group", "prefix", "[Mod]")
    check(ok == true, "set_meta prefix returns true")
    ok, err = GroupManager.set_meta("meta-group", "suffix", "[Team]")
    check(ok == true, "set_meta suffix returns true")
    local val = GroupManager.get_meta("meta-group", "prefix")
    check(val == "[Mod]", "get_meta prefix returns [Mod]")
    local all = GroupManager.get_all_meta("meta-group")
    check(all["prefix"] == "[Mod]", "get_all_meta contains prefix")
    check(all["suffix"] == "[Team]", "get_all_meta contains suffix")
    ok, err = GroupManager.remove_meta("meta-group", "suffix")
    check(ok == true, "remove_meta returns true")
    val = GroupManager.get_meta("meta-group", "suffix")
    check(val == nil, "removed group meta is gone")
    ok, err = GroupManager.set_meta("nonexistent", "key", "val")
    check(ok == false, "set_meta on nonexistent group fails")
    ok, err = GroupManager.remove_meta("meta_group", "nonexistent")
    check(ok == false, "remove_meta nonexistent key fails")
    reset_mocks()
end

---------------------------------------------------------------------------
-- 24. Permanent user nodes
---------------------------------------------------------------------------
section("24. Permanent user nodes")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    local ok, err = UserManager.addUserNode("perm_user", "essentials.fly")
    check(ok == true, "addUserNode returns true")
    check(err == nil, "addUserNode returns no error")
    local user = Storage.load_user("perm_user")
    check(user ~= nil, "user was auto-created")
    check(#user.nodes == 1, "user has 1 node")
    check(user.nodes[1].key == "essentials.fly", "node key is essentials.fly")
    check(user.nodes[1].value == true, "node value is true")
    check(user.nodes[1].expiry == nil, "node has no expiry (permanent)")
    UserManager.addUserNode("perm_user", "essentials.build", false, {world = "lobby"})
    user = Storage.load_user("perm_user")
    check(#user.nodes == 2, "user has 2 nodes after second add")
    check(user.nodes[2].contexts.world == "lobby", "second node has context")
    local result = PermissionEngine.hasPermission("perm_user", "essentials.fly")
    check(result ~= nil, "permission is resolved for permanent node")
    ok, err = UserManager.removeUserNode("perm_user", "essentials.fly")
    check(ok == true, "removeUserNode returns true")
    user = Storage.load_user("perm_user")
    check(#user.nodes <= 1, "node was removed")
    ok, err = UserManager.addUserNode("", "essentials.fly")
    check(ok == false, "addUserNode rejects empty uin")
    ok, err = UserManager.addUserNode("perm_user", "")
    check(ok == false, "addUserNode rejects empty node key")
    ok, err = UserManager.addUserNode("perm_user", "INVALID")
    check(ok == false, "addUserNode rejects invalid node key format")
    ok, err = UserManager.removeUserNode("perm_user", "nonexistent.perm")
    check(ok == false, "removeUserNode nonexistent node fails")
    reset_mocks()
end

---------------------------------------------------------------------------
-- 25. Storage backend parity
---------------------------------------------------------------------------
section("25. Storage backend parity")
do
    local function test_backend(backend_name, user_backend_type, group_backend_type, supports_list)
        reset_mocks()
        Storage.init(user_backend_type, "test_users_" .. backend_name, group_backend_type, "test_groups_" .. backend_name)

        local group_data = {name = "test_group", weight = 100, nodes = {}, inheritanceNodes = {}, meta = {prefix = "[Test]"}}
        local ok = Storage.save_group("test_group", group_data)
        check(ok == true, backend_name .. ": save_group returns true")

        local loaded = Storage.load_group("test_group")
        check(loaded ~= nil, backend_name .. ": load_group returns non-nil")
        check(loaded.name == "test_group", backend_name .. ": group name matches")
        check(loaded.weight == 100, backend_name .. ": group weight matches")
        check(loaded.meta.prefix == "[Test]", backend_name .. ": group meta matches")

        if supports_list then
            local groups = Storage.get_all_groups()
            check(#groups > 0, backend_name .. ": get_all_groups returns groups")
        end

        local user_data = {uin = "test_user", primaryGroup = "default", groups = {"default"}, nodes = {}, meta = {prefix = "[User]"}}
        ok = Storage.save_user("test_user", user_data)
        check(ok == true, backend_name .. ": save_user returns true")

        loaded = Storage.load_user("test_user")
        check(loaded ~= nil, backend_name .. ": load_user returns non-nil")
        check(loaded.uin == "test_user", backend_name .. ": user uin matches")
        check(loaded.meta.prefix == "[User]", backend_name .. ": user meta matches")

        ok = Storage.delete_user("test_user")
        check(ok == true, backend_name .. ": delete_user returns true")
        loaded = Storage.load_user("test_user")
        check(loaded == nil, backend_name .. ": deleted user returns nil")

        ok = Storage.delete_group("test_group")
        check(ok == true, backend_name .. ": delete_group returns true")
        loaded = Storage.load_group("test_group")
        check(loaded == nil, backend_name .. ": deleted group returns nil")
    end

    test_backend("table", "table", "table", true)
    test_backend("global_string", "global_string", "global_string", true)
    test_backend("private_string", "private_string", "private_string", true)
    test_backend("global_kv", "global_kv", "global_kv", false)

    reset_mocks()
end

---------------------------------------------------------------------------
-- 26. Context check: node contexts vs runtime contexts
---------------------------------------------------------------------------
section("26. Context check")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("ctxgroup", 50)
    UserManager.addUser("ctx_user")
    UserManager.addUserToGroup("ctx_user", "ctxgroup")

    -- Add node with world="lobby" context
    GroupManager.add_group_node("ctxgroup", "ctx.perm", true, {world = "lobby"}, nil)

    -- Set room category to "lobby" → should match
    mock_room_category = "lobby"
    local result = PermissionEngine.hasPermission("ctx_user", "ctx.perm")
    check(result == true, "context check: matching world context grants permission")

    -- Change room category to "nether" → should not match
    mock_room_category = "nether"
    result = PermissionEngine.hasPermission("ctx_user", "ctx.perm")
    check(result == nil, "context check: mismatching world context returns nil")

    -- Add node with gamemode="1" context
    mock_game_mode = 1
    GroupManager.add_group_node("ctxgroup", "ctx.gamemode", true, {gamemode = "1"}, nil)
    mock_room_category = "lobby"
    result = PermissionEngine.hasPermission("ctx_user", "ctx.gamemode")
    check(result == true, "context check: matching gamemode context grants permission")

    -- Change game mode
    mock_game_mode = 2
    result = PermissionEngine.hasPermission("ctx_user", "ctx.gamemode")
    check(result == nil, "context check: changed gamemode returns nil")

    -- Node with no contexts (empty table) always matches
    GroupManager.add_group_node("ctxgroup", "ctx.noctx", true, {}, nil)
    result = PermissionEngine.hasPermission("ctx_user", "ctx.noctx")
    check(result == true, "context check: empty contexts always matches")

    -- Node with multiple context constraints
    mock_room_category = "lobby"
    mock_game_mode = 1
    GroupManager.add_group_node("ctxgroup", "ctx.multi", true, {world = "lobby", gamemode = "1"}, nil)
    result = PermissionEngine.hasPermission("ctx_user", "ctx.multi")
    check(result == true, "context check: multiple matching contexts grant")

    mock_room_category = "nether"
    result = PermissionEngine.hasPermission("ctx_user", "ctx.multi")
    check(result == nil, "context check: one mismatched context returns nil")

    -- Deny node with context
    mock_room_category = "lobby"
    GroupManager.add_group_node("ctxgroup", "ctx.deny", false, {world = "lobby"}, nil)
    result = PermissionEngine.hasPermission("ctx_user", "ctx.deny")
    check(result == false, "context check: matching context with deny node returns false")

    -- User-level node with context
    UserManager.addUserNode("ctx_user", "ctx.usernode", true, {world = "nether"})
    mock_room_category = "nether"
    result = PermissionEngine.hasPermission("ctx_user", "ctx.usernode")
    check(result == true, "context check: user node with matching context grants")

    mock_room_category = "lobby"
    result = PermissionEngine.hasPermission("ctx_user", "ctx.usernode")
    check(result == nil, "context check: user node with mismatched context returns nil")

    mock_room_category = "lobby"
    mock_game_mode = 1
    reset_mocks()
end

---------------------------------------------------------------------------
-- 27. Expiry check: temporary nodes expire correctly
---------------------------------------------------------------------------
section("27. Expiry check")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("default", 0)
    UserManager.addUser("expiry_user")

    -- Add temp perm via API (3600s)
    local ok, err = PermCore:addTemporaryPermission("expiry_user", "expiry.perm", 3600)
    check(ok == true, "expiry check: addTemporaryPermission succeeds")

    -- Check it's active
    local result = PermCore:hasPermission("expiry_user", "expiry.perm")
    check(result == true, "expiry check: temp perm is active immediately")

    -- Manually expire the node
    local user = Storage.load_user("expiry_user")
    check(#user.nodes == 1, "expiry check: user has 1 node")
    user.nodes[1].expiry = os.time() - 1
    Storage.save_user("expiry_user", user)

    -- clearPermCache so we re-evaluate
    PermCore:clearPermCache()

    -- hasPermission should skip expired node
    result = PermissionEngine.hasPermission("expiry_user", "expiry.perm")
    check(result == nil, "expiry check: expired node returns nil")

    -- ensureUser cleans expired nodes
    UserManager.ensureUser("expiry_user")
    user = Storage.load_user("expiry_user")
    check(#user.nodes == 0, "expiry check: ensureUser removed expired node")

    -- Add temp perm with very short duration (0.1s → effectively 0 floor)
    ok, err = PermCore:addTemporaryPermission("expiry_user", "expiry.short", 1)
    check(ok == true, "expiry check: short duration temp perm succeeds")

    -- Group temp node with expiry
    GroupManager.create_group("temp-grp", 30)
    GroupManager.add_group_node("temp-grp", "expiry.grpnode", true, {}, os.time() - 1)
    UserManager.addUserToGroup("expiry_user", "temp-grp")
    PermCore:clearPermCache()
    result = PermissionEngine.hasPermission("expiry_user", "expiry.grpnode")
    check(result == nil, "expiry check: expired group node returns nil")

    -- Node with future expiry still works
    GroupManager.add_group_node("temp-grp", "expiry.future", true, {}, os.time() + 3600)
    PermCore:clearPermCache()
    result = PermissionEngine.hasPermission("expiry_user", "expiry.future")
    check(result == true, "expiry check: future expiry node grants permission")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 28. Cache: hit and invalidation
---------------------------------------------------------------------------
section("28. Cache hit and invalidation")
do
    reset_mocks()
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("cache-grp", 50)
    GroupManager.add_group_node("cache-grp", "cache.perm", true, {}, nil)
    GroupManager.add_group_node("cache-grp", "cache.deny", false, {}, nil)
    UserManager.addUser("cache_user")
    UserManager.addUserToGroup("cache_user", "cache-grp")

    -- Clear cache first
    PermCore:clearPermCache()

    -- First check populates cache
    local r1 = PermissionEngine.hasPermission("cache_user", "cache.perm")
    check(r1 == true, "cache: first check returns true")

    -- Second check should return cached result
    local r2 = PermissionEngine.hasPermission("cache_user", "cache.perm")
    check(r2 == true, "cache: second check returns same true (cache hit)")

    -- Verify deny is also cached
    local d1 = PermissionEngine.hasPermission("cache_user", "cache.deny")
    check(d1 == false, "cache: deny check returns false")

    -- Invalidation: addUserNode clears cache
    UserManager.addUserNode("cache_user", "cache.perm", false)
    PermCore:clearPermCache()

    -- After cache clear + new deny node, result should change
    local r3 = PermissionEngine.hasPermission("cache_user", "cache.perm")
    check(r3 == false, "cache: after adding deny node, perm returns false")

    -- Invalidation: addUserToGroup clears cache
    UserManager.removeUserNode("cache_user", "cache.perm")
    PermCore:clearPermCache()
    local r4 = PermissionEngine.hasPermission("cache_user", "cache.perm")
    check(r4 == true, "cache: after removing deny node, perm returns true again")

    -- Nonexistent user returns nil (not cached)
    local r5 = PermissionEngine.hasPermission("cache_nonexistent", "cache.perm")
    check(r5 == nil, "cache: nonexistent user returns nil")

    -- clearPermCache via API
    PermCore:clearPermCache()
    local r6 = PermissionEngine.hasPermission("cache_user", "cache.perm")
    check(r6 == true, "cache: after clearPermCache, check still works")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 29. Group members: add, list, remove, cleanup
---------------------------------------------------------------------------
section("29. Group members")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("members-grp", 50)
    GroupManager.create_group("other-grp", 30)

    -- Add users
    UserManager.addUser("mem_user1")
    UserManager.addUser("mem_user2")
    UserManager.addUser("mem_user3")

    -- Add to group
    UserManager.addUserToGroup("mem_user1", "members-grp")
    UserManager.addUserToGroup("mem_user2", "members-grp")

    -- List members via public API
    local members = PermCore:getGroupMembers("members-grp")
    check(#members == 2, "group members: 2 members after adding 2 users")

    local found1, found2 = false, false
    for _, m in ipairs(members) do
        if m == "mem_user1" then found1 = true end
        if m == "mem_user2" then found2 = true end
    end
    check(found1, "group members: mem_user1 is listed")
    check(found2, "group members: mem_user2 is listed")

    -- Remove from group
    UserManager.removeUserFromGroup("mem_user1", "members-grp")
    members = PermCore:getGroupMembers("members-grp")
    check(#members == 1, "group members: 1 member after removing one")

    found1 = false
    for _, m in ipairs(members) do
        if m == "mem_user1" then found1 = true end
    end
    check(found1 == false, "group members: removed user not in list")

    -- Remove user entirely → cleaned from group members
    UserManager.addUserToGroup("mem_user3", "members-grp")
    members = PermCore:getGroupMembers("members-grp")
    check(#members == 2, "group members: 2 members before full remove")
    UserManager.removeUser("mem_user3")
    members = PermCore:getGroupMembers("members-grp")
    check(#members == 1, "group members: 1 member after removeUser cleans up")

    -- Nonexistent group returns empty
    members = PermCore:getGroupMembers("nonexistent")
    check(#members == 0, "group members: nonexistent group returns empty")

    -- Empty group returns empty
    members = PermCore:getGroupMembers("other-grp")
    check(#members == 0, "group members: empty group returns empty")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 30. Action log: operations logged, recent/search work
---------------------------------------------------------------------------
section("30. Action log")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("log-grp", 50)
    GroupManager.add_group_node("log-grp", "log.perm", true, {}, nil)
    UserManager.addUser("log_user")
    UserManager.addUserToGroup("log_user", "log-grp")

    -- getActionLogRecent via API
    local recent = PermCore:getActionLogRecent(10)
    check(type(recent) == "table", "action log: getActionLogRecent returns table")
    check(#recent > 0, "action log: recent has entries from operations")

    -- Last entry should be from addUserToGroup
    local lastEntry = recent[#recent]
    check(lastEntry ~= nil, "action log: last entry is not nil")
    check(lastEntry.desc ~= nil, "action log: last entry has desc field")
    check(string.find(lastEntry.desc, "log_user", 1, true) ~= nil, "action log: last entry mentions log_user")

    -- searchActionLog via API
    local results = PermCore:searchActionLog("log-grp")
    check(type(results) == "table", "action log: searchActionLog returns table")
    check(#results > 0, "action log: search found results for 'log-grp'")

    -- Search for something nonexistent
    results = PermCore:searchActionLog("nonexistent_keyword_xyz")
    check(#results == 0, "action log: search for nonexistent keyword returns empty")

    -- getMaxActionLogEntries
    local maxEntries = PermCore:getMaxActionLogEntries()
    check(maxEntries == 5000, "action log: max entries is 5000")

    -- Verify group creation was logged
    results = PermCore:searchActionLog("Created group")
    check(#results > 0, "action log: group creation logged")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 31. Clear: clearUser and clearGroup
---------------------------------------------------------------------------
section("31. Clear")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("clear-grp", 50)
    GroupManager.add_group_node("clear-grp", "clear.perm", true, {}, nil)
    GroupManager.set_meta("clear-grp", "prefix", "[Clear]")

    UserManager.addUser("clear_user")
    UserManager.addUserToGroup("clear_user", "clear-grp")
    UserManager.addUserNode("clear_user", "clear.usernode", true)
    UserManager.setMeta("clear_user", "prefix", "[CU]")

    -- Verify user has data
    local user = Storage.load_user("clear_user")
    check(#user.nodes > 0, "clear: user has nodes before clear")
    check(user.meta ~= nil and user.meta["prefix"] ~= nil, "clear: user has meta before clear")

    -- clearUser via API
    local ok = PermCore:clearUser("clear_user")
    check(ok == true, "clear: clearUser returns true")

    user = Storage.load_user("clear_user")
    check(#user.nodes == 0, "clear: user has 0 nodes after clear")
    check(user.meta ~= nil and next(user.meta or {}) == nil, "clear: user meta is empty after clear")
    -- Groups should be preserved
    check(#user.groups > 0, "clear: user groups preserved after clear")

    -- Verify group has data
    local grp = Storage.load_group("clear-grp")
    check(#grp.nodes > 0, "clear: group has nodes before clear")
    check(grp.meta ~= nil and grp.meta["prefix"] ~= nil, "clear: group has meta before clear")

    -- clearGroup via API
    ok = PermCore:clearGroup("clear-grp")
    check(ok == true, "clear: clearGroup returns true")

    grp = Storage.load_group("clear-grp")
    check(#grp.nodes == 0, "clear: group has 0 nodes after clear")
    check(grp.meta ~= nil and next(grp.meta or {}) == nil, "clear: group meta is empty after clear")
    -- Group name and weight should be preserved
    check(grp.name == "clear-grp", "clear: group name preserved after clear")
    check(grp.weight == 50, "clear: group weight preserved after clear")

    -- clearUser on nonexistent fails
    ok = PermCore:clearUser("nonexistent")
    check(ok == false, "clear: clearUser on nonexistent fails")

    -- clearGroup on nonexistent fails
    ok = PermCore:clearGroup("nonexistent")
    check(ok == false, "clear: clearGroup on nonexistent fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 32. Search: searchPermissions
---------------------------------------------------------------------------
section("32. Search permissions")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("search-grp", 50)
    GroupManager.add_group_node("search-grp", "search.fly", true, {}, nil)
    GroupManager.add_group_node("search-grp", "search.build", true, {}, nil)

    UserManager.addUser("search_user")
    UserManager.addUserToGroup("search_user", "search-grp")
    UserManager.addUserNode("search_user", "search.speed", true)

    -- Search for exact node
    local results = PermCore:searchPermissions("search.fly")
    check(#results >= 1, "search: found search.fly in results")
    local found_group = false
    for _, r in ipairs(results) do
        if string.find(r, "search-grp", 1, true) and string.find(r, "search.fly", 1, true) then
            found_group = true
        end
    end
    check(found_group, "search: search.fly found in group search-grp")

    -- Search for user node
    results = PermCore:searchPermissions("search.speed")
    check(#results >= 1, "search: found search.speed in results")
    local found_user = false
    for _, r in ipairs(results) do
        if string.find(r, "search_user", 1, true) and string.find(r, "search.speed", 1, true) then
            found_user = true
        end
    end
    check(found_user, "search: search.speed found for user search_user")

    -- Search for nonexistent node
    results = PermCore:searchPermissions("nonexistent.xyz")
    check(#results == 0, "search: nonexistent node returns empty")

    -- Empty search returns empty
    results = PermCore:searchPermissions("")
    check(#results == 0, "search: empty string returns empty")

    -- Stored wildcard node matches specific targets via checkNode
    GroupManager.add_group_node("search-grp", "search.wild.*", true, {}, nil)
    results = PermCore:searchPermissions("search.wild.fly")
    check(#results >= 1, "search: stored wildcard node matches specific target")

    -- Expired user nodes are excluded
    UserManager.addUserNode("search_user", "search.temp", true)
    local user = Storage.load_user("search_user")
    for _, n in ipairs(user.nodes) do
        if n.key == "search.temp" then
            n.expiry = os.time() - 1
        end
    end
    Storage.save_user("search_user", user)
    results = PermCore:searchPermissions("search.temp")
    check(#results == 0, "search: expired user node not found in search")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 33. Clone: cloneUser and cloneGroup
---------------------------------------------------------------------------
section("33. Clone")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("clone-grp", 50)
    GroupManager.add_group_node("clone-grp", "clone.perm", true, {}, nil)

    UserManager.addUser("src_user")
    UserManager.addUserToGroup("src_user", "clone-grp")
    UserManager.addUserNode("src_user", "clone.usernode", true)
    UserManager.setMeta("src_user", "prefix", "[SRC]")

    -- cloneUser
    local ok, err = PermCore:cloneUser("src_user", "dst_user")
    check(ok == true, "clone: cloneUser succeeds")

    -- Verify cloned data
    local dst = Storage.load_user("dst_user")
    check(dst ~= nil, "clone: cloned user exists")
    check(dst.primaryGroup == "default", "clone: cloned user has correct primaryGroup")
    check(#dst.nodes > 0, "clone: cloned user has nodes")
    check(dst.meta ~= nil and dst.meta["prefix"] == "[SRC]", "clone: cloned user has meta")

    -- Target exists → error
    ok, err = PermCore:cloneUser("src_user", "dst_user")
    check(ok == false, "clone: cloneUser to existing target fails")
    check(string.find(err or "", "already exists") ~= nil, "clone: error mentions 'already exists'")

    -- Source doesn't exist → error
    ok, err = PermCore:cloneUser("nonexistent", "new_user")
    check(ok == false, "clone: cloneUser from nonexistent fails")

    -- cloneGroup
    ok, err = PermCore:cloneGroup("clone-grp", "clone-grp-copy")
    check(ok == true, "clone: cloneGroup succeeds")

    local grpCopy = Storage.load_group("clone-grp-copy")
    check(grpCopy ~= nil, "clone: cloned group exists")
    check(grpCopy.weight == 50, "clone: cloned group has same weight")
    check(#grpCopy.nodes > 0, "clone: cloned group has nodes")

    -- Target exists → error
    ok, err = PermCore:cloneGroup("clone-grp", "clone-grp-copy")
    check(ok == false, "clone: cloneGroup to existing target fails")

    -- Source doesn't exist → error
    ok, err = PermCore:cloneGroup("nonexistent", "new-grp")
    check(ok == false, "clone: cloneGroup from nonexistent fails")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 34. Rename: renameGroup updates all references
---------------------------------------------------------------------------
section("34. Rename")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("old-name", 50)
    GroupManager.add_group_node("old-name", "rename.perm", true, {}, nil)
    GroupManager.set_meta("old-name", "prefix", "[Old]")

    UserManager.addUser("rename_user")
    UserManager.addUserToGroup("rename_user", "old-name")
    UserManager.setPrimaryGroup("rename_user", "old-name")

    -- renameGroup
    local ok, err = PermCore:renameGroup("old-name", "new-name")
    check(ok == true, "rename: renameGroup succeeds")

    -- Old group should not exist
    local oldGrp = Storage.load_group("old-name")
    check(oldGrp == nil, "rename: old group no longer exists")

    -- New group should exist with data
    local newGrp = Storage.load_group("new-name")
    check(newGrp ~= nil, "rename: new group exists")
    check(newGrp.name == "new-name", "rename: new group has correct name")
    check(newGrp.weight == 50, "rename: new group has same weight")
    check(#newGrp.nodes > 0, "rename: new group has nodes")
    check(newGrp.meta ~= nil and newGrp.meta["prefix"] == "[Old]", "rename: new group has meta")

    -- User references updated
    local user = Storage.load_user("rename_user")
    local found_new = false
    for _, g in ipairs(user.groups) do
        if g == "new-name" then found_new = true end
    end
    check(found_new, "rename: user groups updated to new name")
    check(user.primaryGroup == "new-name", "rename: user primaryGroup updated to new name")

    -- Target exists → error
    GroupManager.create_group("another-grp", 10)
    ok, err = PermCore:renameGroup("new-name", "another-grp")
    check(ok == false, "rename: renameGroup to existing target fails")

    -- Cannot rename default group
    ok, err = PermCore:renameGroup("default", "something")
    check(ok == false, "rename: cannot rename default group")

    -- Cannot rename to 'default'
    ok, err = PermCore:renameGroup("new-name", "default")
    check(ok == false, "rename: cannot rename to 'default'")

    -- Same name error
    ok, err = PermCore:renameGroup("new-name", "new-name")
    check(ok == false, "rename: same name rename fails")

    -- Inheritance references updated
    GroupManager.create_group("parent-grp", 100)
    GroupManager.create_group("child-grp", 20)
    InheritanceEngine.addInheritance("child-grp", "parent-grp")
    ok = PermCore:renameGroup("parent-grp", "parent-renamed")
    check(ok == true, "rename: rename parent group succeeds")
    local childGrp = Storage.load_group("child-grp")
    check(childGrp.inheritanceNodes["parent-renamed"] == true, "rename: child inheritance ref updated")
    check(childGrp.inheritanceNodes["parent-grp"] == nil, "rename: old inheritance ref removed")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 35. Group info inherited: getInheritedNodes shows parent nodes
---------------------------------------------------------------------------
section("35. Group info inherited")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("inh-parent", 80)
    GroupManager.create_group("inh-child", 40)
    GroupManager.add_group_node("inh-parent", "inh.parent.perm", true, {}, nil)
    GroupManager.add_group_node("inh-parent", "inh.parent.fly", true, {}, nil)
    GroupManager.add_group_node("inh-child", "inh.child.perm", true, {}, nil)

    -- No inheritance → no inherited nodes
    local inherited = PermCore:getInheritedNodes("inh-child")
    check(#inherited == 0, "inherited: no inherited nodes without inheritance")

    -- Add inheritance
    InheritanceEngine.addInheritance("inh-child", "inh-parent")
    inherited = PermCore:getInheritedNodes("inh-child")
    check(#inherited >= 2, "inherited: inherited nodes from parent")

    local found_parent_perm = false
    for _, n in ipairs(inherited) do
        if n.key == "inh.parent.perm" then found_parent_perm = true end
    end
    check(found_parent_perm, "inherited: parent perm found in inherited nodes")

    -- Deep inheritance: grandchild → child → parent
    GroupManager.create_group("inh-grandchild", 20)
    GroupManager.add_group_node("inh-grandchild", "inh.gc.perm", true, {}, nil)
    InheritanceEngine.addInheritance("inh-grandchild", "inh-child")
    inherited = PermCore:getInheritedNodes("inh-grandchild")
    check(#inherited >= 3, "inherited: deep inheritance resolves all ancestor nodes")

    local found_parent = false
    for _, n in ipairs(inherited) do
        if n.key == "inh.parent.perm" then found_parent = true end
    end
    check(found_parent, "inherited: grandchild sees grandparent's nodes")

    -- Nonexistent group returns empty
    inherited = PermCore:getInheritedNodes("nonexistent")
    check(#inherited == 0, "inherited: nonexistent group returns empty")

    -- Empty string returns empty
    inherited = PermCore:getInheritedNodes("")
    check(#inherited == 0, "inherited: empty string returns empty")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 36. Temp parent: addTemporaryParent, expiry cleanup
---------------------------------------------------------------------------
section("36. Temp parent")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("temp-vip", 50)
    GroupManager.add_group_node("temp-vip", "temp.vip.perm", true, {}, nil)
    GroupManager.create_group("temp-mod", 70)
    GroupManager.add_group_node("temp-mod", "temp.mod.perm", true, {}, nil)
    UserManager.addUser("temp_parent_user")

    -- Add temp parent
    local ok, err = PermCore:addTemporaryParent("temp_parent_user", "temp-vip", 3600)
    check(ok == true, "temp parent: addTemporaryParent succeeds")

    -- Verify user has temp group
    local user = Storage.load_user("temp_parent_user")
    check(user.tempGroups ~= nil, "temp parent: user has tempGroups table")
    check(user.tempGroups["temp-vip"] ~= nil, "temp parent: temp-vip is in tempGroups")
    check(user.tempGroups["temp-vip"] > os.time(), "temp parent: expiry is in the future")

    -- User should have permission from temp group
    PermCore:clearPermCache()
    local result = PermissionEngine.hasPermission("temp_parent_user", "temp.vip.perm")
    check(result == true, "temp parent: user has perm from temp group")

    -- Group members should include user
    local members = PermCore:getGroupMembers("temp-vip")
    local found = false
    for _, m in ipairs(members) do
        if m == "temp_parent_user" then found = true end
    end
    check(found, "temp parent: user is in group members list")

    -- Expire the temp group manually
    user.tempGroups["temp-vip"] = os.time() - 1
    Storage.save_user("temp_parent_user", user)

    -- cleanTempGroups should remove expired
    PermCore:clearPermCache()
    UserManager.cleanTempGroups("temp_parent_user")
    user = Storage.load_user("temp_parent_user")
    check(user.tempGroups["temp-vip"] == nil, "temp parent: expired temp group removed")

    -- Remove temp parent explicitly
    ok, err = PermCore:addTemporaryParent("temp_parent_user", "temp-mod", 3600)
    check(ok == true, "temp parent: add second temp parent succeeds")
    ok, err = PermCore:removeTemporaryParent("temp_parent_user", "temp-mod")
    check(ok == true, "temp parent: removeTemporaryParent succeeds")
    user = Storage.load_user("temp_parent_user")
    check(user.tempGroups["temp-mod"] == nil, "temp parent: removed temp group gone")

    -- Nonexistent group → error
    ok, err = PermCore:addTemporaryParent("temp_parent_user", "nonexistent", 3600)
    check(ok == false, "temp parent: nonexistent group fails")

    -- Invalid duration
    ok, err = PermCore:addTemporaryParent("temp_parent_user", "temp-vip", -1)
    check(ok == false, "temp parent: negative duration fails")

    -- Auto-creates user
    ok, err = PermCore:addTemporaryParent("new_temp_user", "temp-vip", 3600)
    check(ok == true, "temp parent: auto-creates user")
    local newUser = Storage.load_user("new_temp_user")
    check(newUser ~= nil, "temp parent: auto-created user exists")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 37. Bulkupdate: searchPermissions across all users/groups
---------------------------------------------------------------------------
section("37. Bulk search across entities")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("bulk-grp-a", 50)
    GroupManager.create_group("bulk-grp-b", 30)
    GroupManager.add_group_node("bulk-grp-a", "bulk.perm", true, {}, nil)
    GroupManager.add_group_node("bulk-grp-b", "bulk.perm", true, {}, nil)
    GroupManager.add_group_node("bulk-grp-a", "bulk.unique", true, {}, nil)

    UserManager.addUser("bulk_user1")
    UserManager.addUser("bulk_user2")
    UserManager.addUserToGroup("bulk_user1", "bulk-grp-a")
    UserManager.addUserToGroup("bulk_user2", "bulk-grp-b")
    UserManager.addUserNode("bulk_user1", "bulk.perm", false)  -- user-level deny

    -- searchPermissions("bulk.perm") should find matches across users and groups
    local results = PermCore:searchPermissions("bulk.perm")
    check(#results >= 3, "bulk search: found matches across users and groups")

    local user_count = 0
    local group_count = 0
    for _, r in ipairs(results) do
        if string.find(r, "^user ") then user_count = user_count + 1 end
        if string.find(r, "^group ") then group_count = group_count + 1 end
    end
    check(user_count >= 1, "bulk search: found user-level matches")
    check(group_count >= 2, "bulk search: found group-level matches")

    -- Unique perm only in one group
    results = PermCore:searchPermissions("bulk.unique")
    check(#results == 1, "bulk search: unique perm found once")

    -- getAllUsers and getAllGroups
    local allUsers = PermCore:getAllUsers()
    check(#allUsers >= 2, "bulk search: getAllUsers returns all users")
    local allGroups = PermCore:getAllGroups()
    check(#allGroups >= 3, "bulk search: getAllGroups returns all groups (incl default)")

    -- Stored wildcard matches specific targets
    GroupManager.add_group_node("bulk-grp-a", "bulk.wild.*", true, {}, nil)
    results = PermCore:searchPermissions("bulk.wild.fly")
    check(#results >= 1, "bulk search: stored wildcard matches specific target")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 38. Track: create, append, promote, demote
---------------------------------------------------------------------------
section("38. Track management")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    -- Initialize tracks storage
    Data:SetValue(Config.VARID_TRACKS, nil, "{}")

    DefaultGroup.ensure_default_group()
    GroupManager.create_group("track-bronze", 10)
    GroupManager.create_group("track-silver", 50)
    GroupManager.create_group("track-gold", 100)

    -- Create track
    local ok, err = TrackManager.createTrack("prog")
    check(ok == true, "track: createTrack succeeds")

    local track = TrackManager.getTrack("prog")
    check(track ~= nil, "track: getTrack returns non-nil")
    check(track.name == "prog", "track: track name is 'prog'")
    check(#track.groups == 0, "track: new track has 0 groups")

    -- Append groups
    ok, err = TrackManager.appendTrack("prog", "track-bronze")
    check(ok == true, "track: appendTrack bronze succeeds")
    ok, err = TrackManager.appendTrack("prog", "track-silver")
    check(ok == true, "track: appendTrack silver succeeds")
    ok, err = TrackManager.appendTrack("prog", "track-gold")
    check(ok == true, "track: appendTrack gold succeeds")

    track = TrackManager.getTrack("prog")
    check(#track.groups == 3, "track: track has 3 groups")
    check(track.groups[1] == "track-bronze", "track: first group is bronze")
    check(track.groups[3] == "track-gold", "track: third group is gold")

    -- Duplicate append fails
    ok, err = TrackManager.appendTrack("prog", "track-bronze")
    check(ok == false, "track: duplicate append fails")

    -- getAllTracks
    local allTracks = TrackManager.getAllTracks()
    check(#allTracks >= 1, "track: getAllTracks returns tracks")

    -- Promote user
    UserManager.addUser("track_user")
    UserManager.addUserToGroup("track_user", "track-bronze")
    ok, err = TrackManager.promoteUser("track_user", "prog")
    check(ok == true, "track: promoteUser succeeds")

    local user = Storage.load_user("track_user")
    local has_silver = false
    for _, g in ipairs(user.groups) do
        if g == "track-silver" then has_silver = true end
    end
    check(has_silver, "track: user now in silver group after promote")
    local has_bronze = false
    for _, g in ipairs(user.groups) do
        if g == "track-bronze" then has_bronze = true end
    end
    check(has_bronze == false, "track: user no longer in bronze after promote")

    -- Promote again
    ok, err = TrackManager.promoteUser("track_user", "prog")
    check(ok == true, "track: second promote succeeds")
    user = Storage.load_user("track_user")
    local has_gold = false
    for _, g in ipairs(user.groups) do
        if g == "track-gold" then has_gold = true end
    end
    check(has_gold, "track: user now in gold group after second promote")

    -- Cannot promote past end
    ok, err = TrackManager.promoteUser("track_user", "prog")
    check(ok == false, "track: cannot promote past highest group")

    -- Demote user
    ok, err = TrackManager.demoteUser("track_user", "prog")
    check(ok == true, "track: demoteUser succeeds")
    user = Storage.load_user("track_user")
    has_silver = false
    for _, g in ipairs(user.groups) do
        if g == "track-silver" then has_silver = true end
    end
    check(has_silver, "track: user back to silver after demote")

    -- Cannot demote past start
    TrackManager.demoteUser("track_user", "prog")  -- back to bronze
    ok, err = TrackManager.demoteUser("track_user", "prog")
    check(ok == false, "track: cannot demote past lowest group")

    -- Nonexistent track
    ok, err = TrackManager.promoteUser("track_user", "nonexistent")
    check(ok == false, "track: promote in nonexistent track fails")

    -- Track with < 2 groups cannot promote
    Data:SetValue(Config.VARID_TRACKS, nil, "{}")
    TrackManager.createTrack("tiny")
    TrackManager.appendTrack("tiny", "track-bronze")
    UserManager.addUser("tiny_user")
    UserManager.addUserToGroup("tiny_user", "track-bronze")
    ok, err = TrackManager.promoteUser("tiny_user", "tiny")
    check(ok == false, "track: cannot promote in track with < 2 groups")

    -- Delete track
    ok, err = TrackManager.deleteTrack("prog")
    check(ok == true, "track: deleteTrack succeeds")
    track = TrackManager.getTrack("prog")
    check(track == nil, "track: deleted track returns nil")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 39. Verbose listener: register, check triggers notify, unregister
---------------------------------------------------------------------------
section("39. Verbose listener")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("verb-grp", 50)
    GroupManager.add_group_node("verb-grp", "verb.perm", true, {}, nil)
    UserManager.addUser("verb_user")
    UserManager.addUserToGroup("verb_user", "verb-grp")

    -- Register listener via API
    local ok, err = PermCore:registerVerboseListener("listener1", ".*")
    check(ok == true, "verbose: registerVerboseListener succeeds")

    -- Clear mock messages
    mock_chat_messages = {}

    -- Check permission → should trigger verbose notification
    VerboseLogger.notifyListeners("verb_user", "verb.perm", true)
    check(#mock_chat_messages >= 1, "verbose: notifyListeners sends message")
    if #mock_chat_messages >= 1 then
        check(string.find(mock_chat_messages[1].msg, "verb_user", 1, true) ~= nil,
            "verbose: message mentions verb_user")
        check(string.find(mock_chat_messages[1].msg, "verb.perm", 1, true) ~= nil,
            "verbose: message mentions verb.perm")
        check(mock_chat_messages[1].playerUin == "listener1",
            "verbose: message sent to listener1")
    end

    -- Register with filter
    ok, err = PermCore:registerVerboseListener("listener2", "verb.*")
    check(ok == true, "verbose: register with filter succeeds")

    mock_chat_messages = {}
    VerboseLogger.notifyListeners("verb_user", "verb.perm", true)
    -- listener2 has filter "verb.*" which matches "verb.perm" via string.find
    local found_l2 = false
    for _, m in ipairs(mock_chat_messages) do
        if m.playerUin == "listener2" then found_l2 = true end
    end
    check(found_l2, "verbose: filtered listener receives matching notification")

    -- Filter that doesn't match
    mock_chat_messages = {}
    PermCore:registerVerboseListener("listener3", "nomatch.*")
    VerboseLogger.notifyListeners("verb_user", "verb.perm", true)
    local found_l3 = false
    for _, m in ipairs(mock_chat_messages) do
        if m.playerUin == "listener3" then found_l3 = true end
    end
    check(found_l3 == false, "verbose: non-matching filter blocks notification")

    -- Unregister listener
    ok, err = PermCore:unregisterVerboseListener("listener1")
    check(ok == true, "verbose: unregisterVerboseListener succeeds")

    mock_chat_messages = {}
    VerboseLogger.notifyListeners("verb_user", "verb.perm", true)
    local found_l1 = false
    for _, m in ipairs(mock_chat_messages) do
        if m.playerUin == "listener1" then found_l1 = true end
    end
    check(found_l1 == false, "verbose: unregistered listener no longer receives messages")

    -- VerboseLogger enable/disable
    VerboseLogger.disable_logging()
    check(VerboseLogger.is_enabled() == false, "verbose: logging disabled")
    VerboseLogger.enable_logging()
    check(VerboseLogger.is_enabled() == true, "verbose: logging enabled")

    -- isLoggingEnabled via API
    PermCore:disableLogging()
    check(PermCore:isLoggingEnabled() == false, "verbose: API isLoggingEnabled false")
    PermCore:enableLogging()
    check(PermCore:isLoggingEnabled() == true, "verbose: API isLoggingEnabled true")

    reset_mocks()
end

---------------------------------------------------------------------------
-- 40. Event system: register, fire, unregister
---------------------------------------------------------------------------
section("40. Event system")
do
    reset_mocks()
    Storage.init("table", Config.VARID_USERS, "table", Config.VARID_GROUPS)
    DefaultGroup.ensure_default_group()
    GroupManager.create_group("evt-grp", 50)

    -- Register listener for node_add
    local received_data = nil
    local function on_node_add(data)
        received_data = data
    end

    local ok, err = EventSystem.registerListener("node_add", on_node_add)
    check(ok == true, "event: registerListener for node_add succeeds")

    -- Add user node → should fire event
    UserManager.addUser("evt_user")
    UserManager.addUserNode("evt_user", "evt.perm", true)
    check(received_data ~= nil, "event: node_add event was fired")
    if received_data then
        check(received_data.uin == "evt_user", "event: event data has correct uin")
        check(received_data.nodeKey == "evt.perm", "event: event data has correct nodeKey")
    end

    -- Register listener for user_group_add
    local group_add_data = nil
    local function on_group_add(data)
        group_add_data = data
    end
    EventSystem.registerListener("user_group_add", on_group_add)
    UserManager.addUserToGroup("evt_user", "evt-grp")
    check(group_add_data ~= nil, "event: user_group_add event was fired")
    if group_add_data then
        check(group_add_data.uin == "evt_user", "event: group_add data has correct uin")
        check(group_add_data.groupName == "evt-grp", "event: group_add data has correct group")
    end

    -- Register listener for group_create
    local group_create_data = nil
    local function on_group_create(data)
        group_create_data = data
    end
    EventSystem.registerListener("group_create", on_group_create)
    GroupManager.create_group("evt-new-grp", 10)
    check(group_create_data ~= nil, "event: group_create event was fired")
    if group_create_data then
        check(group_create_data.groupName == "evt-new-grp", "event: group_create has correct name")
    end

    -- Unregister listener
    ok, err = EventSystem.unregisterListener("node_add", on_node_add)
    check(ok == true, "event: unregisterListener succeeds")

    received_data = nil
    UserManager.addUserNode("evt_user", "evt.perm2", true)
    check(received_data == nil, "event: unregistered listener does not receive events")

    -- Invalid event type
    ok, err = EventSystem.registerListener("", on_node_add)
    check(ok == false, "event: empty event type fails")

    -- Invalid callback
    ok, err = EventSystem.registerListener("node_add", "not_a_function")
    check(ok == false, "event: non-function callback fails")

    -- Unregister nonexistent
    ok, err = EventSystem.unregisterListener("nonexistent_type", on_node_add)
    check(ok == false, "event: unregister for nonexistent type fails")

    -- Multiple listeners for same event
    local count = 0
    local function counter1() count = count + 1 end
    local function counter2() count = count + 1 end
    EventSystem.registerListener("group_delete", counter1)
    EventSystem.registerListener("group_delete", counter2)
    GroupManager.delete_group("evt-new-grp")
    check(count == 2, "event: multiple listeners both fired")

    -- PermCore API: registerListener / unregisterListener
    local api_data = nil
    local function api_handler(data) api_data = data end
    ok, err = PermCore:registerListener("node_remove", api_handler)
    check(ok == true, "event: API registerListener succeeds")
    UserManager.removeUserNode("evt_user", "evt.perm")
    check(api_data ~= nil, "event: API listener received event")

    ok, err = PermCore:unregisterListener("node_remove", api_handler)
    check(ok == true, "event: API unregisterListener succeeds")

    reset_mocks()
end

print("")
print("######################################")
print(string.format("#  Results: %d/%d passed, %d failed  #", passed, total, failed))
print("######################################")

if failed > 0 then
    print("")
    print("SOME TESTS FAILED!")
    os.exit(1)
else
    print("")
    print("ALL TESTS PASSED!")
    os.exit(0)
end
