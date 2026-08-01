# PermSys — Permission System for Mini World UGC 3.0

A LuckPerms-inspired permission system for Mini World UGC 3.0 mods. Provides group-based permission management with inheritance, wildcard matching, multi-server sync, verbose logging, and Lua pattern matching.

## Features

- **Group-based permissions** — Create groups with weighted priority, assign permission nodes
- **Inheritance** — Groups inherit from parent groups with cycle detection
- **Wildcard matching** — `essentials.*` matches `essentials.fly`, `essentials.fly.world`, etc. (all depths)
- **Lua pattern matching** — Full Lua pattern syntax for flexible permission matching
- **Temporary permissions** — Time-limited permission nodes with automatic expiry
- **Temporary parents** — Time-limited group membership with automatic cleanup
- **Track system** — Ordered group tracks for promote/demote workflows
- **Multi-server sync** — Broadcast permission changes across cloud-server rooms (KV backend)
- **Verbose logging** — Opt-in real-time permission check logging with per-player filters
- **Action log** — Audit trail of all permission mutations with search
- **Chat commands** — Full `/perm` command interface for in-game management
- **Context support** — World and gamemode context constraints on permission nodes
- **Default group permissions** — Configurable via component propertys

## Architecture

```
perm_core.lua       — All business logic (monolithic WorldComponent, ~3500 lines)
perm_commands.lua   — Chat command dispatcher (/perm)
perm_events.lua     — Player join/leave lifecycle handling
tests/
└── test_integration.lua — 565+ integration tests
```

All modules (config, models, storage, validation, schema, user/group/track management, inheritance, permission engine, weight resolver, context resolver, pattern engine, verbose logger, action logger, multi-server sync) are inlined as local tables within `perm_core.lua`. Cross-component communication uses `GetComponent()` + `openFnArgs`.

## Installation

1. Copy `perm_core.lua`, `perm_commands.lua`, and `perm_events.lua` into your Mini World mod's script directory

2. If using the `table` backend (default), import the Data.Table CSV templates:
   - In the Mini World mod editor, go to Data Management → Data.Table
   - Import `PermSys_Users.csv` → create variable ID `PermSys_Users`
   - Import `PermSys_Groups.csv` → create variable ID `PermSys_Groups`
   
   For other backends, create the corresponding Data variables and configure via propertys.

3. Create the remaining Data variables:

| Variable ID | Type | Purpose |
|---|---|---|
| `PermSys_SchemaVersion` | Data (KV) | Schema version string |
| `PermSys_Log` | Data.Array | Verbose log entries |

4. Attach all three components to a World object:
   - `perm_core` — core permission logic + public API
   - `perm_commands` — handles `/perm` chat commands
   - `perm_events` — handles player join/leave lifecycle

5. **Configure component IDs**: In `perm_commands.lua` and `perm_events.lua`, replace `PERM_CORE_COMPONENT_ID` with the actual `perm_core` component ID (e.g., `"c7664495880175578329132459"`)

6. The `default` group is auto-created on first run. Configure via propertys:
   - `玩家` — pre-configure players with grant/deny permissions
   - `组` — pre-configure groups with grant/deny permissions (auto-created if missing)

## API Reference

### Cross-Component Access (from other mods)

```lua
function MyComponent:OnStart()
    -- Get perm_core by its component ID
    self.permCore = self:GetComponent("c7664495880175578329132459") --[[@as PermCore]]
end

function MyComponent:OnPlayerClickBlock(e)
    local uin = e.eventobjid
    if self.permCore and self.permCore:IsValid() then
        local has = self.permCore:hasPermission(uin, "world.build")
        if has then
            -- allow building
        end
    end
end
```

### PermCore Public API (via openFnArgs)

| Method | Params | Returns | Description |
|---|---|---|---|
| `hasPermission` | `(uin, node)` | `boolean` | Check if player has permission |
| `getUserGroups` | `(uin)` | `string[]` | Get player's group list |
| `getPrimaryGroup` | `(uin)` | `string\|nil` | Get player's primary group |
| `addTemporaryPermission` | `(uin, node, duration)` | `boolean, string` | Add time-limited permission |
| `addUser` | `(uin)` | `boolean, string` | Create user record |
| `removeUser` | `(uin)` | `boolean, string` | Delete user record |
| `clearUser` | `(uin)` | `boolean, string` | Clear user nodes and meta |
| `addUserToGroup` | `(uin, group)` | `boolean, string` | Add user to group |
| `removeUserFromGroup` | `(uin, group)` | `boolean, string` | Remove user from group |
| `setPrimaryGroup` | `(uin, group)` | `boolean, string` | Set user's primary group |
| `createGroup` | `(name, weight)` | `boolean, string` | Create a group |
| `deleteGroup` | `(name)` | `boolean, string` | Delete a group |
| `clearGroup` | `(name)` | `boolean, string` | Clear group nodes and meta |
| `renameGroup` | `(old, new)` | `boolean, string` | Rename a group |
| `cloneGroup` | `(source, target)` | `boolean, string` | Clone a group |
| `setGroupWeight` | `(name, weight)` | `boolean, string` | Set group priority weight |
| `getGroupWeight` | `(name)` | `number\|nil` | Get group priority weight |
| `addGroupNode` | `(group, node)` | `boolean, string` | Add permission node to group |
| `removeGroupNode` | `(group, node)` | `boolean, string` | Remove permission node from group |
| `getGroupNodes` | `(group)` | `table\|nil` | Get group's permission nodes |
| `getGroupMembers` | `(group)` | `string[]` | Get group member UINs |
| `addInheritance` | `(child, parent)` | `boolean, string` | Add inheritance edge |
| `removeInheritance` | `(child, parent)` | `boolean, string` | Remove inheritance edge |
| `getInheritedNodes` | `(group)` | `table` | Get inherited permission nodes |
| `addUserNode` | `(uin, node, value)` | `boolean, string` | Add permanent permission node to user |
| `removeUserNode` | `(uin, node)` | `boolean, string` | Remove permission node from user |
| `cloneUser` | `(source, target)` | `boolean, string` | Clone a user |
| `setUserMeta` | `(uin, key, value)` | `boolean, string` | Set metadata on user |
| `getUserMeta` | `(uin, key)` | `string\|nil` | Get metadata from user |
| `removeUserMeta` | `(uin, key)` | `boolean, string` | Remove metadata from user |
| `getAllUserMeta` | `(uin)` | `table` | Get all metadata for user |
| `setGroupMeta` | `(group, key, value)` | `boolean, string` | Set metadata on group |
| `getGroupMeta` | `(group, key)` | `string\|nil` | Get metadata from group |
| `removeGroupMeta` | `(group, key)` | `boolean, string` | Remove metadata from group |
| `getAllGroupMeta` | `(group)` | `table` | Get all metadata for group |
| `registerContextProvider` | `(key, fn)` | `boolean, string` | Register custom context provider |
| `unregisterContextProvider` | `(key)` | `boolean, string` | Unregister custom context provider |
| `registerListener` | `(type, fn)` | `boolean, string` | Register event listener |
| `unregisterListener` | `(type, fn)` | `boolean, string` | Unregister event listener |
| `checkPermission` | `(uin, node)` | `true\|false\|nil` | Raw 3-value permission check (script-only) |
| `matchPattern` | `(pattern, node)` | `boolean, string` | Test Lua pattern against node |
| `ensureUser` | `(uin)` | `void` | Ensure user exists + clean expired perms |
| `clearPermCache` | `()` | `void` | Clear entire permission cache |
| `clearPlayerCache` | `(uin)` | `void` | Clear player's perm cache + backend cache |
| `isSyncReady` | `()` | `boolean` | Whether sync module is initialized |
| `getSyncQueueSize` | `()` | `number` | Outbound sync queue length |
| `enableLogging` | `()` | `void` | Enable verbose logging |
| `disableLogging` | `()` | `void` | Disable verbose logging |
| `isLoggingEnabled` | `()` | `boolean` | Check logging state |
| `getMaxLogEntries` | `()` | `number` | Get max log entries config |
| `registerVerboseListener` | `(uin, filter)` | `boolean` | Register real-time verbose listener |
| `unregisterVerboseListener` | `(uin)` | `boolean` | Unregister verbose listener |
| `getAllUsers` | `()` | `string[]` | Get all user UINs |
| `getAllGroups` | `()` | `string[]` | Get all group names |
| `searchPermissions` | `(node)` | `string[]` | Search for matching permission nodes |
| `addTemporaryParent` | `(uin, group, dur)` | `boolean, string` | Add temporary group membership |
| `removeTemporaryParent` | `(uin, group)` | `boolean, string` | Remove temporary group membership |
| `cleanTempGroups` | `(uin)` | `boolean` | Clean expired temp groups |
| `createTrack` | `(name)` | `boolean, string` | Create a track |
| `deleteTrack` | `(name)` | `boolean, string` | Delete a track |
| `getTrack` | `(name)` | `table\|nil` | Get track data |
| `getAllTracks` | `()` | `string[]` | Get all track names |
| `appendTrack` | `(track, group)` | `boolean, string` | Append group to track |
| `insertTrack` | `(track, idx, group)` | `boolean, string` | Insert group at index in track |
| `removeTrackGroup` | `(track, group)` | `boolean, string` | Remove group from track |
| `clearTrack` | `(track)` | `boolean, string` | Clear all groups from track |
| `renameTrack` | `(old, new)` | `boolean, string` | Rename a track |
| `cloneTrack` | `(source, target)` | `boolean, string` | Clone a track |
| `promoteUser` | `(uin, track)` | `boolean, string` | Promote user in track |
| `demoteUser` | `(uin, track)` | `boolean, string` | Demote user in track |
| `getActionLogRecent` | `(count)` | `table` | Get recent action log entries |
| `searchActionLog` | `(keyword)` | `table` | Search action log by keyword |
| `getMaxActionLogEntries` | `()` | `number` | Get max action log entries config |
| `registerPermissions` | `(plugin, perms)` | `boolean, number` | Register permission nodes (Bukkit-style) |
| `unregisterPermissions` | `(plugin)` | `boolean, number` | Unregister all permissions from plugin |
| `getRegisteredPermissions` | `()` | `table` | Get all registered permission metadata |
| `getPermissionsByPlugin` | `(plugin)` | `table` | Get permissions registered by specific plugin |

## Command Reference

All commands use the `/perm` prefix. Command style follows LuckPerms: target entity comes first.

### User Commands: `/perm user <user> <type> <action> [args...]`

| Command | Description |
|---|---|
| `/perm user <user> info` | Show user info (groups, primary, meta) |
| `/perm user <user> permission set <node> [true\|false]` | Add permanent permission |
| `/perm user <user> permission unset <node>` | Remove permanent permission |
| `/perm user <user> parent add <group>` | Add user to group |
| `/perm user <user> parent remove <group>` | Remove user from group |
| `/perm user <user> parent set <group>` | Set primary group |
| `/perm user <user> parent addtemp <group> <duration>` | Add temporary group membership |
| `/perm user <user> parent removetemp <group>` | Remove temporary group membership |
| `/perm user <user> meta set <key> <value>` | Set metadata |
| `/perm user <user> meta unset <key>` | Remove metadata |
| `/perm user <user> meta setprefix <prefix>` | Set prefix |
| `/perm user <user> meta setsuffix <suffix>` | Set suffix |
| `/perm user <source> clone <target>` | Clone user |
| `/perm user <user> clear` | Clear user nodes and meta |
| `/perm user <user> promote <track>` | Promote user in track |
| `/perm user <user> demote <track>` | Demote user in track |

### Group Commands: `/perm group <group> <type> <action> [args...]`

| Command | Description |
|---|---|
| `/perm group <group> info [page]` | Show group info (weight, nodes, parents, meta) |
| `/perm group <group> permission set <node> [true\|false]` | Add permission node |
| `/perm group <group> permission unset <node>` | Remove permission node |
| `/perm group <group> parent add <parent>` | Add inheritance |
| `/perm group <group> parent remove <parent>` | Remove inheritance |
| `/perm group <group> meta set <key> <value>` | Set metadata |
| `/perm group <group> meta unset <key>` | Remove metadata |
| `/perm group <group> meta setprefix <prefix>` | Set prefix |
| `/perm group <group> meta setsuffix <suffix>` | Set suffix |
| `/perm group <group> weight <weight>` | Set priority weight |
| `/perm group <group> listmembers [page]` | List group members |
| `/perm group <source> clone <target>` | Clone group |
| `/perm group <group> clear` | Clear group nodes and meta |
| `/perm group <group> rename <newname>` | Rename group |

### Track Commands: `/perm track <action> [args...]`

| Command | Description |
|---|---|
| `/perm track create <name>` | Create a track |
| `/perm track delete <name>` | Delete a track |
| `/perm track info <name>` | Show track info |
| `/perm track list` | List all tracks |
| `/perm track append <track> <group>` | Append group to track |
| `/perm track insert <track> <index> <group>` | Insert group at index |
| `/perm track remove <track> <group>` | Remove group from track |
| `/perm track clear <track>` | Clear all groups from track |
| `/perm track rename <old> <new>` | Rename track |
| `/perm track clone <source> <target>` | Clone track |

### Top-Level Commands

| Command | Description |
|---|---|
| `/perm creategroup <name> [weight]` | Create a group (default weight: 0) |
| `/perm deletegroup <name>` | Delete a group (cannot delete `default`) |
| `/perm check <user> <node>` | Check if a player has a permission |
| `/perm sync status` | Show sync module status |
| `/perm log <view\|enable\|disable\|recent\|search>` | Manage verbose logging and action log |
| `/perm verbose <on [filter]\|off>` | Real-time verbose for current player |
| `/perm pattern match <pattern> <node>` | Test a Lua pattern against a node |
| `/perm search <node> [page]` | Search for permission nodes across users/groups |
| `/perm bulkupdate <user\|group\|all> <add\|remove> <node> [--group=<name>]` | Batch permission changes |
| `/perm permissions [list]` | List all registered permission nodes |
| `/perm permissions <plugin>` | List permissions from a specific plugin |
| `/perm permissions info <node>` | Show details for a permission node |
| `/perm help` | Show all available commands |

## Configuration

All constants are centralized in the `Config` table inside `perm_core.lua`.

### General

| Constant | Default | Description |
|---|---|---|
| `DEFAULT_GROUP` | `"default"` | Auto-created group all players inherit from |
| `COMMAND_PREFIX` | `"/perm"` | Chat command prefix |
| `SCHEMA_VERSION` | `"v1"` | Storage schema version |

### Limits

| Constant | Default | Description |
|---|---|---|
| `WEIGHT_MIN` | `0` | Minimum group weight |
| `WEIGHT_MAX` | `1000` | Maximum group weight |
| `MAX_GROUPS_PER_PLAYER` | `10` | Max groups per player |
| `MAX_INHERITANCE_DEPTH` | `10` | Max inheritance chain depth |
| `MAX_USERS` | `1000` | Max user records |
| `MAX_GROUPS` | `100` | Max groups |
| `MAX_PERMS_PER_GROUP` | `50` | Max permission nodes per group |
| `MAX_LOG_ENTRIES` | `1000` | Max verbose log entries |
| `MAX_ACTION_LOG_ENTRIES` | `5000` | Max action log entries |
| `MAX_PERM_CACHE` | `5000` | Max cached permission check results |
| `MAX_TRACKS` | `100` | Max tracks |
| `MAX_GROUPS_PER_TRACK` | `20` | Max groups per track |

### Multi-Server Sync

| Constant | Default | Description |
|---|---|---|
| `SYNC_RATE_LIMIT_SECONDS` | `15` | Min seconds between sync messages of same type |
| `SYNC_MSG_ID` | `"PermSys_Sync"` | Cloud server message ID for sync traffic |
| `SYNC_QUEUE_INTERVAL` | `5` | Seconds between queue processing ticks |

### Verbose Logging

| Constant | Default | Description |
|---|---|---|
| `VERBOSE_LOGGING_DEFAULT` | `false` | Whether logging is enabled on startup |

## Storage Backends

PermSys supports 4 storage backends, configurable via component propertys in the Mini World editor. All backends cache entities in memory after first load; writes persist to storage and update the cache.

| Backend | User Storage | Group Storage | Cross-Server | Limitations |
|---------|-------------|---------------|-------------|-------------|
| `table` (default) | Data.Table | Data.Table | No | Max 1999 rows per table |
| `global_string` | Data:SetValue(nil) | Data:SetValue(nil) | No | Single JSON blob, last-write-wins |
| `private_string` | Data:SetValue(uin) | N/A (user-only) | No | Users only; **cannot be used as group backend** |
| `global_kv` | Data.Map | Data.Map | Yes | Single KV table, max 10 cloud KV variables |

### Configuration via Editor

In the Mini World mod editor, select the `perm_core` component and configure:

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `用户存储后端` | Enum | `table` | User storage backend: `table` / `global_string` / `private_string` / `global_kv` |
| `用户变量ID` | String | (empty) | Data variable ID for users (empty = use default) |
| `组存储后端` | Enum | `table` | Group storage backend: `table` / `global_string` / `global_kv` |
| `组变量ID` | String | (empty) | Data variable ID for groups (empty = use default) |
| `玩家` | Array(CustomData) | [] | Pre-configured players: each entry has `Uin`, `启用权限`(grant), `禁用权限`(deny) |
| `组` | Array(CustomData) | [] | Pre-configured groups: each entry has `名称`, `启用权限`(grant), `禁用权限`(deny) |

### Backend Details

**table** (default): Uses Data.Table with CSV-imported tables. Requires importing CSV templates. Best for small-scale single-server setups.

**global_string**: Stores all users/groups as a single JSON blob in a Data string variable. Simple setup, no CSV needed. Risk: last-write-wins on concurrent edits.

**private_string**: Each player's permissions stored in their own Data variable. **User storage only** — cannot be used as group backend. Groups must use `table` or `global_string`.

**global_kv**: Uses Data.Map cloud KV. Users and groups share a single KV table with `user:`/`group:` key prefixes. Cross-server persistent — saves automatically broadcast to other rooms via MultiServerSync. Best for multi-server setups. Limited to 10 cloud KV variables.

## Data Models

### PermNode

```lua
{
    key      = "essentials.fly",   -- permission key (dot notation)
    value    = true,               -- true = grant, false = deny
    contexts = {world = "lobby"},  -- context constraints (empty = none)
    expiry   = 1700000000,         -- unix timestamp or nil (permanent)
}
```

### User

```lua
{
    uin          = "12345",
    primaryGroup = "default",
    groups       = {"default", "vip"},
    nodes        = {PermNode, ...},
    tempGroups   = {["vip"] = 1700000000},  -- group name → expiry timestamp
    meta         = {prefix = "[Admin]", suffix = "[VIP]", custom_key = "value"},
}
```

### Group

```lua
{
    name             = "admin",
    weight           = 100,
    nodes            = {PermNode, ...},
    inheritanceNodes = {["default"] = true},
    members          = {["12345"] = true, ["67890"] = true},
    meta             = {prefix = "[Admin]", suffix = "[VIP]"},
}
```

### Track

```lua
{
    name   = "staff",
    groups = {"helper", "mod", "admin"},
}
```

## Permission Registration (Bukkit-style)

Components can register their permission nodes with PermSys, similar to Bukkit's `plugin.yml` permissions. This provides documentation, auto-default assignment, and admin visibility via `/perm permissions`.

### Registering Permissions

```lua
function FlyMod:OnStart()
    self.permCore = self:GetComponent("c766...") --[[@as PermCore]]
    if self.permCore and self.permCore:IsValid() then
        self.permCore:registerPermissions("fly", {
            {
                node = "fly.use",
                description = "允许飞行",
                default = false,
            },
            {
                node = "fly.speed",
                description = "修改飞行速度",
                default = false,
            },
            {
                node = "fly.bypass",
                description = "绕过飞行限制",
                default = false,
            },
            {
                node = "fly.*",
                description = "所有飞行权限",
                default = false,
                children = { "fly.use", "fly.speed", "fly.bypass" },
            },
        })
    end
end
```

### Permission Entry Fields

| Field | Type | Required | Description |
|---|---|---|---|
| `node` | string | yes | Permission node (dot notation) |
| `description` | string | no | Human-readable description |
| `default` | boolean | no | `true` = auto-grant to default group on startup |
| `children` | string[] | no | Child nodes (documentation only) |

### Default Values

| Value | Behavior |
|---|---|
| `true` | Auto-added to the `default` group on startup (all players get it) |
| `false` | Not auto-granted (must be assigned manually) |
| `nil` | Same as `false` |

### Unregistering

```lua
self.permCore:unregisterPermissions("fly")
-- Removes all permissions registered by the "fly" plugin
```

### Commands

- `/perm permissions` — list all registered permissions grouped by plugin
- `/perm permissions fly` — list permissions from the "fly" plugin
- `/perm permissions info fly.use` — show details for a specific permission

## Examples

### Checking Permissions from Another Mod

```lua
function MyComponent:OnStart()
    self.permCore = self:GetComponent("c7664495880175578329132459")
end

function MyComponent:OnPlayerClickBlock(e)
    if self.permCore and self.permCore:IsValid() then
        if self.permCore:hasPermission(e.eventobjid, "world.build") then
            -- allow building
        end
    end
end
```

### Creating a Permission Hierarchy via Commands

```
/perm group create default 0
/perm group create vip 50
/perm group create admin 100
/perm group inherit vip default
/perm group inherit admin vip
/perm group node add default world.build
/perm group node add vip essentials.fly
/perm group node add admin essentials.gamemode
```

### Adding a Temporary Permission

```lua
-- In another component:
self.permCore:addTemporaryPermission(playerUin, "essentials.fly", 3600)
-- Grants 1-hour fly permission; auto-expires on next player join
```

## Permission Resolution Order

1. **User direct nodes** — checked first (highest priority)
2. **Group nodes** — for each group the user belongs to (including temporary groups), sorted by **weight descending**
3. **Inherited ancestor nodes** — recursively resolved from parent groups

The first matching node wins. `true` = granted, `false` = denied, `nil` = no match.

## Player Lifecycle

- **Join**: `ensureUser(uin)` is called — creates user if needed, cleans expired permissions and temporary groups
- **Leave**: `clearPlayerCache(uin)` is called — removes permission cache entries and backend user cache for the departed player

## Sync Types

The multi-server sync module supports these message types:

| Type | Description |
|---|---|
| `user_update` | User record changed (group membership, primary group) |
| `group_update` | Group record changed (weight, metadata) |
| `node_update` | Permission node added or removed |
| `inheritance_update` | Inheritance edge added or removed |

## Testing

```bash
cd PermSys
lua tests/test_integration.lua
# Expected: 565+ tests passed, 0 failed
```

## License

Part of the miniworld-scripts project.
