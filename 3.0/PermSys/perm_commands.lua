---@class PermCommands: WorldComponent
local PermCommands = {}

local PERM_CORE_COMPONENT_ID = "c7664922215809248473686730"
local COMMAND_PREFIX = "/perm"

----------------------------------------------------------------------
-- Helpers
----------------------------------------------------------------------

local function split_args(str)
    local tokens = {}
    for token in str:gmatch("%S+") do
        tokens[#tokens + 1] = token
    end
    return tokens
end

local function reply(playerUin, msg)
    Chat:SendSystemMsg("#W[PermSys] " .. msg, playerUin)
end

local function check_perm(playerUin, permCore, permNode)
    if not permCore:hasPermission(playerUin, permNode) then
        reply(playerUin, "权限不足: 需要 " .. permNode)
        return false
    end
    return true
end

local function display_name(uin)
    local name = Player:GetNickname(tonumber(uin))
    if name and name ~= "" then
        return name
    end
    return tostring(uin)
end

----------------------------------------------------------------------
-- User commands: /perm user <user> <type> <action> [args...]
----------------------------------------------------------------------

local function cmd_user_info(playerUin, args, permCore)
    local targetUin = args[3]
    if not targetUin then
        reply(playerUin, "用法: /perm user <user> info")
        return
    end
    local groups = permCore:getUserGroups(targetUin)
    local primary = permCore:getPrimaryGroup(targetUin)
    local meta = permCore:getAllUserMeta(targetUin)
    reply(playerUin, "=== 用户 " .. display_name(targetUin) .. " ===")
    reply(playerUin, "主组: " .. (primary or "无"))
    reply(playerUin, "组: " .. table.concat(groups or {}, ", "))
    if meta then
        for k, v in pairs(meta) do
            reply(playerUin, "meta " .. k .. " = " .. tostring(v))
        end
    end
end

local function cmd_user_permission(playerUin, args, permCore)
    local targetUin = args[3]
    local action = args[5]
    local node = args[6]
    local value = args[7]

    if not targetUin or not action or not node then
        reply(playerUin, "用法: /perm user <user> permission <set|unset> <node> [true|false]")
        return
    end

    if action == "set" then
        local nodeValue = true
        if value == "false" then nodeValue = false end
        local ok, err = permCore:addUserNode(targetUin, node, nodeValue)
        if ok then
            reply(playerUin, "已向用户 " .. display_name(targetUin) .. " 添加节点 " .. node .. (nodeValue and " = true" or " = false"))
        else
            reply(playerUin, "添加节点失败: " .. (err or "未知错误"))
        end
    elseif action == "unset" then
        local ok, err = permCore:removeUserNode(targetUin, node)
        if ok then
            reply(playerUin, "已从用户 " .. display_name(targetUin) .. " 移除节点 " .. node)
        else
            reply(playerUin, "移除节点失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm user <user> permission <set|unset> <node> [true|false]")
    end
end

local function cmd_user_parent(playerUin, args, permCore)
    local targetUin = args[3]
    local action = args[5]
    local groupName = args[6]

    if not targetUin or not action then
        reply(playerUin, "用法: /perm user <user> parent <add|remove|set|addtemp|removetemp> <group> [duration]")
        return
    end

    if action == "add" then
        if not groupName then
            reply(playerUin, "用法: /perm user <user> parent add <group>")
            return
        end
        local ok, err = permCore:addUserToGroup(targetUin, groupName)
        if ok then
            reply(playerUin, "已将用户 " .. display_name(targetUin) .. " 添加到组 " .. groupName)
        else
            reply(playerUin, "添加组失败: " .. (err or "未知错误"))
        end
    elseif action == "remove" then
        if not groupName then
            reply(playerUin, "用法: /perm user <user> parent remove <group>")
            return
        end
        local ok, err = permCore:removeUserFromGroup(targetUin, groupName)
        if ok then
            reply(playerUin, "已将用户 " .. display_name(targetUin) .. " 从组 " .. groupName .. " 移除")
        else
            reply(playerUin, "移除组失败: " .. (err or "未知错误"))
        end
    elseif action == "set" then
        if not groupName then
            reply(playerUin, "用法: /perm user <user> parent set <group>")
            return
        end
        local ok, err = permCore:setPrimaryGroup(targetUin, groupName)
        if ok then
            reply(playerUin, "已将用户 " .. display_name(targetUin) .. " 的主组设为 " .. groupName)
        else
            reply(playerUin, "设置主组失败: " .. (err or "未知错误"))
        end
    elseif action == "addtemp" then
        local duration = tonumber(args[7])
        if not groupName then
            reply(playerUin, "用法: /perm user <user> parent addtemp <group> <duration>")
            return
        end
        if not duration or duration <= 0 then
            reply(playerUin, "用法: /perm user <user> parent addtemp <group> <duration> (duration为秒数)")
            return
        end
        local ok, err = permCore:addTemporaryParent(targetUin, groupName, duration)
        if ok then
            reply(playerUin, "已将用户 " .. display_name(targetUin) .. " 临时添加到组 " .. groupName .. " (持续 " .. duration .. " 秒)")
        else
            reply(playerUin, "添加临时组失败: " .. (err or "未知错误"))
        end
    elseif action == "removetemp" then
        if not groupName then
            reply(playerUin, "用法: /perm user <user> parent removetemp <group>")
            return
        end
        local ok, err = permCore:removeTemporaryParent(targetUin, groupName)
        if ok then
            reply(playerUin, "已将用户 " .. display_name(targetUin) .. " 的临时组 " .. groupName .. " 移除")
        else
            reply(playerUin, "移除临时组失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm user <user> parent <add|remove|set|addtemp|removetemp> <group> [duration]")
    end
end

local function cmd_user_meta(playerUin, args, permCore)
    local targetUin = args[3]
    local action = args[5]
    local key = args[6]
    local value = args[7]

    if not targetUin or not action then
        reply(playerUin, "用法: /perm user <user> meta <set|unset|setprefix|setsuffix> ...")
        return
    end

    if action == "set" then
        if not key or not value then
            reply(playerUin, "用法: /perm user <user> meta set <key> <value>")
            return
        end
        local ok, err = permCore:setUserMeta(targetUin, key, value)
        if ok then
            reply(playerUin, "已设置用户 " .. display_name(targetUin) .. " 的 meta " .. key .. " = " .. value)
        else
            reply(playerUin, "设置 meta 失败: " .. (err or "未知错误"))
        end
    elseif action == "unset" then
        if not key then
            reply(playerUin, "用法: /perm user <user> meta unset <key>")
            return
        end
        local ok, err = permCore:removeUserMeta(targetUin, key)
        if ok then
            reply(playerUin, "已移除用户 " .. display_name(targetUin) .. " 的 meta " .. key)
        else
            reply(playerUin, "移除 meta 失败: " .. (err or "未知错误"))
        end
    elseif action == "setprefix" then
        if not key then
            reply(playerUin, "用法: /perm user <user> meta setprefix <prefix>")
            return
        end
        local ok, err = permCore:setUserMeta(targetUin, "prefix", key)
        if ok then
            reply(playerUin, "已设置用户 " .. display_name(targetUin) .. " 的前缀为 " .. key)
        else
            reply(playerUin, "设置前缀失败: " .. (err or "未知错误"))
        end
    elseif action == "setsuffix" then
        if not key then
            reply(playerUin, "用法: /perm user <user> meta setsuffix <suffix>")
            return
        end
        local ok, err = permCore:setUserMeta(targetUin, "suffix", key)
        if ok then
            reply(playerUin, "已设置用户 " .. display_name(targetUin) .. " 的后缀为 " .. key)
        else
            reply(playerUin, "设置后缀失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm user <user> meta <set|unset|setprefix|setsuffix> ...")
    end
end

local function cmd_user_clone(playerUin, args, permCore)
    local sourceUin = args[3]
    local targetUin = args[6]

    if not sourceUin or not targetUin then
        reply(playerUin, "用法: /perm user <source> clone <target>")
        return
    end

    local ok, err = permCore:cloneUser(sourceUin, targetUin, tostring(playerUin))
    if ok then
        reply(playerUin, "已克隆用户 " .. display_name(sourceUin) .. " 到 " .. display_name(targetUin))
    else
        reply(playerUin, "克隆用户失败: " .. (err or "未知错误"))
    end
end

local function cmd_user_clear(playerUin, args, permCore)
    local targetUin = args[3]
    if not targetUin then
        reply(playerUin, "用法: /perm user <user> clear")
        return
    end
    local ok, err = permCore:clearUser(targetUin)
    if ok then
        reply(playerUin, "已清空用户 " .. display_name(targetUin) .. " 的权限节点和元数据")
    else
        reply(playerUin, "清空用户失败: " .. (err or "未知错误"))
    end
end

local function cmd_user_promote(playerUin, args, permCore)
    local targetUin = args[3]
    local trackName = args[5]

    if not targetUin or not trackName then
        reply(playerUin, "用法: /perm user <user> promote <track>")
        return
    end

    local ok, err = permCore:promoteUser(targetUin, trackName, tostring(playerUin))
    if ok then
        reply(playerUin, "已晋升用户 " .. display_name(targetUin) .. " (轨道: " .. trackName .. ")")
    else
        reply(playerUin, "晋升失败: " .. (err or "未知错误"))
    end
end

local function cmd_user_demote(playerUin, args, permCore)
    local targetUin = args[3]
    local trackName = args[5]

    if not targetUin or not trackName then
        reply(playerUin, "用法: /perm user <user> demote <track>")
        return
    end

    local ok, err = permCore:demoteUser(targetUin, trackName, tostring(playerUin))
    if ok then
        reply(playerUin, "已降级用户 " .. display_name(targetUin) .. " (轨道: " .. trackName .. ")")
    else
        reply(playerUin, "降级失败: " .. (err or "未知错误"))
    end
end

local function cmd_user(playerUin, args, permCore)
    local targetUin = args[3]
    local type = args[4]

    if not targetUin then
        reply(playerUin, "用法: /perm user <user> <info|permission|parent|meta|clone|clear|promote|demote>")
        return
    end

    if not type or type == "info" then
        if not check_perm(playerUin, permCore, "permsys.command.user.info") then return end
        cmd_user_info(playerUin, args, permCore)
    elseif type == "permission" then
        local action = args[5]
        if action == "set" then
            if not check_perm(playerUin, permCore, "permsys.command.user.permission.set") then return end
        elseif action == "unset" then
            if not check_perm(playerUin, permCore, "permsys.command.user.permission.unset") then return end
        end
        cmd_user_permission(playerUin, args, permCore)
    elseif type == "parent" then
        local action = args[5]
        if action == "add" then
            if not check_perm(playerUin, permCore, "permsys.command.user.parent.add") then return end
        elseif action == "remove" then
            if not check_perm(playerUin, permCore, "permsys.command.user.parent.remove") then return end
        elseif action == "set" then
            if not check_perm(playerUin, permCore, "permsys.command.user.parent.set") then return end
        elseif action == "addtemp" then
            if not check_perm(playerUin, permCore, "permsys.command.user.parent.addtemp") then return end
        elseif action == "removetemp" then
            if not check_perm(playerUin, permCore, "permsys.command.user.parent.removetemp") then return end
        end
        cmd_user_parent(playerUin, args, permCore)
    elseif type == "meta" then
        local action = args[5]
        if action == "set" then
            if not check_perm(playerUin, permCore, "permsys.command.user.meta.set") then return end
        elseif action == "unset" then
            if not check_perm(playerUin, permCore, "permsys.command.user.meta.unset") then return end
        elseif action == "setprefix" then
            if not check_perm(playerUin, permCore, "permsys.command.user.meta.setprefix") then return end
        elseif action == "setsuffix" then
            if not check_perm(playerUin, permCore, "permsys.command.user.meta.setsuffix") then return end
        end
        cmd_user_meta(playerUin, args, permCore)
    elseif type == "clone" then
        if not check_perm(playerUin, permCore, "permsys.command.user.clone") then return end
        cmd_user_clone(playerUin, args, permCore)
    elseif type == "clear" then
        if not check_perm(playerUin, permCore, "permsys.command.user.clear") then return end
        cmd_user_clear(playerUin, args, permCore)
    elseif type == "promote" then
        if not check_perm(playerUin, permCore, "permsys.command.user.promote") then return end
        cmd_user_promote(playerUin, args, permCore)
    elseif type == "demote" then
        if not check_perm(playerUin, permCore, "permsys.command.user.demote") then return end
        cmd_user_demote(playerUin, args, permCore)
    else
        reply(playerUin, "未知的 user 操作: " .. type)
        reply(playerUin, "可用操作: info, permission, parent, meta, clone, clear, promote, demote")
    end
end

----------------------------------------------------------------------
-- Group commands: /perm group <group> <type> <action> [args...]
----------------------------------------------------------------------

local function cmd_group_info(playerUin, args, permCore)
    local groupName = args[3]
    if not groupName then
        reply(playerUin, "用法: /perm group <group> info [page]")
        return
    end
    local page = tonumber(args[4]) or 1
    local PAGE_SIZE = 10
    local weight = nil
    local nodes = nil
    if permCore.getGroupWeight then weight = permCore:getGroupWeight(groupName) end
    if permCore.getGroupNodes then nodes = permCore:getGroupNodes(groupName) end
    local inheritedNodes = {}
    if permCore.getInheritedNodes then inheritedNodes = permCore:getInheritedNodes(groupName) end
    local meta = permCore:getAllGroupMeta(groupName)

    local allNodes = {}
    if nodes then
        for _, node in ipairs(nodes) do
            allNodes[#allNodes + 1] = { key = node.key, value = node.value, label = nil }
        end
    end
    for _, node in ipairs(inheritedNodes) do
        allNodes[#allNodes + 1] = { key = node.key, value = node.value, label = "(inherited)" }
    end

    local totalPages = math.max(1, math.ceil(#allNodes / PAGE_SIZE))
    if page < 1 then page = 1 end
    if page > totalPages then page = totalPages end

    reply(playerUin, "=== 组 " .. groupName .. " ===")
    reply(playerUin, "权重: " .. tostring(weight or 0))

    if #allNodes > 0 then
        reply(playerUin, "权限节点 (第 " .. page .. "/" .. totalPages .. " 页):")
        local startIdx = (page - 1) * PAGE_SIZE + 1
        local endIdx = math.min(startIdx + PAGE_SIZE - 1, #allNodes)
        for i = startIdx, endIdx do
            local n = allNodes[i]
            local suffix = n.label and (" " .. n.label) or ""
            reply(playerUin, "节点: " .. n.key .. " = " .. tostring(n.value) .. suffix)
        end
    end

    if meta then
        for k, v in pairs(meta) do
            reply(playerUin, "meta " .. k .. " = " .. tostring(v))
        end
    end
end

local function cmd_group_listmembers(playerUin, args, permCore)
    local groupName = args[3]
    if not groupName then
        reply(playerUin, "用法: /perm group <group> listmembers [page]")
        return
    end
    local page = tonumber(args[4]) or 1
    local PAGE_SIZE = 10
    local members = permCore:getGroupMembers(groupName)
    if #members == 0 then
        reply(playerUin, "组 '" .. groupName .. "' 没有成员")
        return
    end
    local totalPages = math.ceil(#members / PAGE_SIZE)
    if page < 1 then page = 1 end
    if page > totalPages then page = totalPages end
    local startIdx = (page - 1) * PAGE_SIZE + 1
    local endIdx = math.min(startIdx + PAGE_SIZE - 1, #members)
    reply(playerUin, "=== 组 " .. groupName .. " 成员 (第 " .. page .. "/" .. totalPages .. " 页) ===")
    for i = startIdx, endIdx do
        reply(playerUin, display_name(members[i]))
    end
end

local function cmd_group_clear(playerUin, args, permCore)
    local groupName = args[3]
    if not groupName then
        reply(playerUin, "用法: /perm group <group> clear")
        return
    end
    local ok, err = permCore:clearGroup(groupName)
    if ok then
        reply(playerUin, "已清空组 " .. groupName .. " 的权限节点和元数据")
    else
        reply(playerUin, "清空组失败: " .. (err or "未知错误"))
    end
end

local function cmd_group_permission(playerUin, args, permCore)
    local groupName = args[3]
    local action = args[5]
    local node = args[6]

    if not groupName or not action or not node then
        reply(playerUin, "用法: /perm group <group> permission <set|unset> <node>")
        return
    end

    if action == "set" then
        local ok, err = permCore:addGroupNode(groupName, node)
        if ok then
            reply(playerUin, "已向组 " .. groupName .. " 添加节点 " .. node)
        else
            reply(playerUin, "添加节点失败: " .. (err or "未知错误"))
        end
    elseif action == "unset" then
        local ok, err = permCore:removeGroupNode(groupName, node)
        if ok then
            reply(playerUin, "已从组 " .. groupName .. " 移除节点 " .. node)
        else
            reply(playerUin, "移除节点失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm group <group> permission <set|unset> <node>")
    end
end

local function cmd_group_parent(playerUin, args, permCore)
    local groupName = args[3]
    local action = args[5]
    local parentGroup = args[6]

    if not groupName or not action or not parentGroup then
        reply(playerUin, "用法: /perm group <group> parent <add|remove> <parent>")
        return
    end

    if action == "add" then
        local ok, err = permCore:addInheritance(groupName, parentGroup)
        if ok then
            reply(playerUin, "已设置继承: " .. groupName .. " → " .. parentGroup)
        else
            reply(playerUin, "设置继承失败: " .. (err or "未知错误"))
        end
    elseif action == "remove" then
        local ok, err = permCore:removeInheritance(groupName, parentGroup)
        if ok then
            reply(playerUin, "已移除继承: " .. groupName .. " → " .. parentGroup)
        else
            reply(playerUin, "移除继承失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm group <group> parent <add|remove> <parent>")
    end
end

local function cmd_group_meta(playerUin, args, permCore)
    local groupName = args[3]
    local action = args[5]
    local key = args[6]
    local value = args[7]

    if not groupName or not action then
        reply(playerUin, "用法: /perm group <group> meta <set|unset|setprefix|setsuffix> ...")
        return
    end

    if action == "set" then
        if not key or not value then
            reply(playerUin, "用法: /perm group <group> meta set <key> <value>")
            return
        end
        local ok, err = permCore:setGroupMeta(groupName, key, value)
        if ok then
            reply(playerUin, "已设置组 " .. groupName .. " 的 meta " .. key .. " = " .. value)
        else
            reply(playerUin, "设置 meta 失败: " .. (err or "未知错误"))
        end
    elseif action == "unset" then
        if not key then
            reply(playerUin, "用法: /perm group <group> meta unset <key>")
            return
        end
        local ok, err = permCore:removeGroupMeta(groupName, key)
        if ok then
            reply(playerUin, "已移除组 " .. groupName .. " 的 meta " .. key)
        else
            reply(playerUin, "移除 meta 失败: " .. (err or "未知错误"))
        end
    elseif action == "setprefix" then
        if not key then
            reply(playerUin, "用法: /perm group <group> meta setprefix <prefix>")
            return
        end
        local ok, err = permCore:setGroupMeta(groupName, "prefix", key)
        if ok then
            reply(playerUin, "已设置组 " .. groupName .. " 的前缀为 " .. key)
        else
            reply(playerUin, "设置前缀失败: " .. (err or "未知错误"))
        end
    elseif action == "setsuffix" then
        if not key then
            reply(playerUin, "用法: /perm group <group> meta setsuffix <suffix>")
            return
        end
        local ok, err = permCore:setGroupMeta(groupName, "suffix", key)
        if ok then
            reply(playerUin, "已设置组 " .. groupName .. " 的后缀为 " .. key)
        else
            reply(playerUin, "设置后缀失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "用法: /perm group <group> meta <set|unset|setprefix|setsuffix> ...")
    end
end

local function cmd_group_weight(playerUin, args, permCore)
    local groupName = args[3]
    local weight = args[5]

    if not groupName or not weight then
        reply(playerUin, "用法: /perm group <group> weight <weight>")
        return
    end
    local w = tonumber(weight)
    if not w then
        reply(playerUin, "权重必须是数字")
        return
    end
    local ok, err = permCore:setGroupWeight(groupName, w)
    if ok then
        reply(playerUin, "已将组 " .. groupName .. " 权重设为 " .. w)
    else
        reply(playerUin, "设置权重失败: " .. (err or "未知错误"))
    end
end

local function cmd_group_rename(playerUin, args, permCore)
    local groupName = args[3]
    local newName = args[5]

    if not groupName or not newName then
        reply(playerUin, "用法: /perm group <group> rename <newname>")
        return
    end
    local ok, err = permCore:renameGroup(groupName, newName)
    if ok then
        reply(playerUin, "已将组 " .. groupName .. " 重命名为 " .. newName)
    else
        reply(playerUin, "重命名组失败: " .. (err or "未知错误"))
    end
end

local function cmd_group_clone(playerUin, args, permCore)
    local sourceName = args[3]
    local targetName = args[6]

    if not sourceName or not targetName then
        reply(playerUin, "用法: /perm group <source> clone <target>")
        return
    end

    local ok, err = permCore:cloneGroup(sourceName, targetName, tostring(playerUin))
    if ok then
        reply(playerUin, "已克隆组 " .. sourceName .. " 到 " .. targetName)
    else
        reply(playerUin, "克隆组失败: " .. (err or "未知错误"))
    end
end

local function cmd_group(playerUin, args, permCore)
    local groupName = args[3]
    local type = args[4]

    if not groupName then
        reply(playerUin, "用法: /perm group <group> <info|permission|parent|meta|weight|listmembers|clone|clear|rename>")
        return
    end

    if not type or type == "info" then
        if not check_perm(playerUin, permCore, "permsys.command.group.info") then return end
        cmd_group_info(playerUin, args, permCore)
    elseif type == "permission" then
        local action = args[5]
        if action == "set" then
            if not check_perm(playerUin, permCore, "permsys.command.group.permission.set") then return end
        elseif action == "unset" then
            if not check_perm(playerUin, permCore, "permsys.command.group.permission.unset") then return end
        end
        cmd_group_permission(playerUin, args, permCore)
    elseif type == "parent" then
        local action = args[5]
        if action == "add" then
            if not check_perm(playerUin, permCore, "permsys.command.group.parent.add") then return end
        elseif action == "remove" then
            if not check_perm(playerUin, permCore, "permsys.command.group.parent.remove") then return end
        end
        cmd_group_parent(playerUin, args, permCore)
    elseif type == "meta" then
        local action = args[5]
        if action == "set" then
            if not check_perm(playerUin, permCore, "permsys.command.group.meta.set") then return end
        elseif action == "unset" then
            if not check_perm(playerUin, permCore, "permsys.command.group.meta.unset") then return end
        elseif action == "setprefix" then
            if not check_perm(playerUin, permCore, "permsys.command.group.meta.setprefix") then return end
        elseif action == "setsuffix" then
            if not check_perm(playerUin, permCore, "permsys.command.group.meta.setsuffix") then return end
        end
        cmd_group_meta(playerUin, args, permCore)
    elseif type == "weight" then
        if not check_perm(playerUin, permCore, "permsys.command.group.weight") then return end
        cmd_group_weight(playerUin, args, permCore)
    elseif type == "listmembers" then
        if not check_perm(playerUin, permCore, "permsys.command.group.listmembers") then return end
        cmd_group_listmembers(playerUin, args, permCore)
    elseif type == "clone" then
        if not check_perm(playerUin, permCore, "permsys.command.group.clone") then return end
        cmd_group_clone(playerUin, args, permCore)
    elseif type == "clear" then
        if not check_perm(playerUin, permCore, "permsys.command.group.clear") then return end
        cmd_group_clear(playerUin, args, permCore)
    elseif type == "rename" then
        if not check_perm(playerUin, permCore, "permsys.command.group.rename") then return end
        cmd_group_rename(playerUin, args, permCore)
    else
        reply(playerUin, "未知的 group 操作: " .. type)
        reply(playerUin, "可用操作: info, permission, parent, meta, weight, listmembers, clone, clear, rename")
    end
end

----------------------------------------------------------------------
-- Track commands: /perm track <name> <action> [args...]
----------------------------------------------------------------------

local function cmd_track_create(playerUin, args, permCore)
    local name = args[3]
    if not name then
        reply(playerUin, "用法: /perm track create <name>")
        return
    end
    local ok, err = permCore:createTrack(name, tostring(playerUin))
    if ok then
        reply(playerUin, "已创建轨道 " .. name)
    else
        reply(playerUin, "创建轨道失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_delete(playerUin, args, permCore)
    local name = args[3]
    if not name then
        reply(playerUin, "用法: /perm track delete <name>")
        return
    end
    local ok, err = permCore:deleteTrack(name, tostring(playerUin))
    if ok then
        reply(playerUin, "已删除轨道 " .. name)
    else
        reply(playerUin, "删除轨道失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_info(playerUin, args, permCore)
    local name = args[3]
    if not name then
        reply(playerUin, "用法: /perm track info <name>")
        return
    end
    local track = permCore:getTrack(name)
    if not track then
        reply(playerUin, "轨道 '" .. name .. "' 不存在")
        return
    end
    reply(playerUin, "=== 轨道 " .. name .. " ===")
    reply(playerUin, "组数: " .. #track.groups)
    if #track.groups > 0 then
        reply(playerUin, "组: " .. table.concat(track.groups, " → "))
    end
end

local function cmd_track_list(playerUin, permCore)
    local tracks = permCore:getAllTracks()
    if #tracks == 0 then
        reply(playerUin, "暂无轨道")
        return
    end
    reply(playerUin, "=== 轨道列表 (共 " .. #tracks .. " 个) ===")
    for _, name in ipairs(tracks) do
        local track = permCore:getTrack(name)
        reply(playerUin, name .. " (" .. #track.groups .. " 个组)")
    end
end

local function cmd_track_append(playerUin, args, permCore)
    local trackName = args[3]
    local groupName = args[4]
    if not trackName or not groupName then
        reply(playerUin, "用法: /perm track append <track> <group>")
        return
    end
    local ok, err = permCore:appendTrack(trackName, groupName, tostring(playerUin))
    if ok then
        reply(playerUin, "已向轨道 " .. trackName .. " 追加组 " .. groupName)
    else
        reply(playerUin, "追加组失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_insert(playerUin, args, permCore)
    local trackName = args[3]
    local index = tonumber(args[4])
    local groupName = args[5]
    if not trackName or not index or not groupName then
        reply(playerUin, "用法: /perm track insert <track> <index> <group>")
        return
    end
    local ok, err = permCore:insertTrack(trackName, index, groupName, tostring(playerUin))
    if ok then
        reply(playerUin, "已向轨道 " .. trackName .. " 第 " .. index .. " 位插入组 " .. groupName)
    else
        reply(playerUin, "插入组失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_remove(playerUin, args, permCore)
    local trackName = args[3]
    local groupName = args[4]
    if not trackName or not groupName then
        reply(playerUin, "用法: /perm track remove <track> <group>")
        return
    end
    local ok, err = permCore:removeTrackGroup(trackName, groupName, tostring(playerUin))
    if ok then
        reply(playerUin, "已从轨道 " .. trackName .. " 移除组 " .. groupName)
    else
        reply(playerUin, "移除组失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_clear(playerUin, args, permCore)
    local trackName = args[3]
    if not trackName then
        reply(playerUin, "用法: /perm track clear <track>")
        return
    end
    local ok, err = permCore:clearTrack(trackName, tostring(playerUin))
    if ok then
        reply(playerUin, "已清空轨道 " .. trackName)
    else
        reply(playerUin, "清空轨道失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_rename(playerUin, args, permCore)
    local oldName = args[3]
    local newName = args[4]
    if not oldName or not newName then
        reply(playerUin, "用法: /perm track rename <oldname> <newname>")
        return
    end
    local ok, err = permCore:renameTrack(oldName, newName, tostring(playerUin))
    if ok then
        reply(playerUin, "已将轨道 " .. oldName .. " 重命名为 " .. newName)
    else
        reply(playerUin, "重命名轨道失败: " .. (err or "未知错误"))
    end
end

local function cmd_track_clone(playerUin, args, permCore)
    local sourceName = args[3]
    local targetName = args[4]
    if not sourceName or not targetName then
        reply(playerUin, "用法: /perm track clone <source> <target>")
        return
    end
    local ok, err = permCore:cloneTrack(sourceName, targetName, tostring(playerUin))
    if ok then
        reply(playerUin, "已克隆轨道 " .. sourceName .. " 到 " .. targetName)
    else
        reply(playerUin, "克隆轨道失败: " .. (err or "未知错误"))
    end
end

local function cmd_track(playerUin, args, permCore)
    local action = args[3]

    if not action or action == "help" then
        reply(playerUin, "用法: /perm track <create|delete|info|list|append|insert|remove|clear|rename|clone>")
        return
    end

    if action == "create" then
        if not check_perm(playerUin, permCore, "permsys.command.track.create") then return end
        cmd_track_create(playerUin, args, permCore)
    elseif action == "delete" then
        if not check_perm(playerUin, permCore, "permsys.command.track.delete") then return end
        cmd_track_delete(playerUin, args, permCore)
    elseif action == "info" then
        if not check_perm(playerUin, permCore, "permsys.command.track.info") then return end
        cmd_track_info(playerUin, args, permCore)
    elseif action == "list" then
        if not check_perm(playerUin, permCore, "permsys.command.track.list") then return end
        cmd_track_list(playerUin, permCore)
    elseif action == "append" then
        if not check_perm(playerUin, permCore, "permsys.command.track.append") then return end
        cmd_track_append(playerUin, args, permCore)
    elseif action == "insert" then
        if not check_perm(playerUin, permCore, "permsys.command.track.insert") then return end
        cmd_track_insert(playerUin, args, permCore)
    elseif action == "remove" then
        if not check_perm(playerUin, permCore, "permsys.command.track.remove") then return end
        cmd_track_remove(playerUin, args, permCore)
    elseif action == "clear" then
        if not check_perm(playerUin, permCore, "permsys.command.track.clear") then return end
        cmd_track_clear(playerUin, args, permCore)
    elseif action == "rename" then
        if not check_perm(playerUin, permCore, "permsys.command.track.rename") then return end
        cmd_track_rename(playerUin, args, permCore)
    elseif action == "clone" then
        if not check_perm(playerUin, permCore, "permsys.command.track.clone") then return end
        cmd_track_clone(playerUin, args, permCore)
    else
        reply(playerUin, "未知的 track 操作: " .. action)
        reply(playerUin, "可用操作: create, delete, info, list, append, insert, remove, clear, rename, clone")
    end
end

----------------------------------------------------------------------
-- Top-level commands
----------------------------------------------------------------------

local function cmd_creategroup(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.creategroup") then return end
    local name = args[3]
    local weight = tonumber(args[4]) or 0
    if not name then
        reply(playerUin, "用法: /perm creategroup <name> [weight]")
        return
    end
    local ok, err = permCore:createGroup(name, weight)
    if ok then
        reply(playerUin, "已创建组 " .. name .. " (权重=" .. weight .. ")")
    else
        reply(playerUin, "创建组失败: " .. (err or "未知错误"))
    end
end

local function cmd_deletegroup(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.deletegroup") then return end
    local name = args[3]
    if not name then
        reply(playerUin, "用法: /perm deletegroup <name>")
        return
    end
    local ok, err = permCore:deleteGroup(name)
    if ok then
        reply(playerUin, "已删除组 " .. name)
    else
        reply(playerUin, "删除组失败: " .. (err or "未知错误"))
    end
end

local function cmd_check(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.check") then return end
    local targetUin = args[3]
    local node = args[4]
    if not targetUin or not node then
        reply(playerUin, "用法: /perm check <user> <node>")
        return
    end
    local result = permCore:checkPermission(targetUin, node)
    if result == nil then
        reply(playerUin, "用户 " .. display_name(targetUin) .. " 无节点 " .. node .. " (未匹配)")
    elseif result then
        reply(playerUin, "用户 " .. display_name(targetUin) .. " 拥有节点 " .. node .. " = true")
    else
        reply(playerUin, "用户 " .. display_name(targetUin) .. " 拥有节点 " .. node .. " = false (拒绝)")
    end
end

local function cmd_sync(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.sync") then return end
    local sub = args[3]
    if sub ~= "status" then
        reply(playerUin, "用法: /perm sync status")
        return
    end
    local ready = permCore:isSyncReady()
    local queue_size = permCore:getSyncQueueSize()
    reply(playerUin, "===== 同步状态 =====")
    reply(playerUin, "已初始化: " .. tostring(ready))
    reply(playerUin, "队列长度: " .. tostring(queue_size))
end

local function cmd_log(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.log") then return end
    local sub = args[3]
    if not sub then
        reply(playerUin, "用法: /perm log <view|enable|disable|recent|search>")
        return
    end
    if sub == "enable" then
        permCore:enableLogging()
        reply(playerUin, "详细日志已开启")
    elseif sub == "disable" then
        permCore:disableLogging()
        reply(playerUin, "详细日志已关闭")
    elseif sub == "view" then
        local enabled = permCore:isLoggingEnabled()
        reply(playerUin, "===== 日志状态 =====")
        reply(playerUin, "详细日志: " .. (enabled and "开启" or "关闭"))
        reply(playerUin, "最大条目: " .. tostring(permCore:getMaxLogEntries()))
    elseif sub == "recent" then
        local entries = permCore:getActionLogRecent(10)
        if #entries == 0 then
            reply(playerUin, "暂无操作日志")
            return
        end
        reply(playerUin, "===== 最近操作日志 =====")
        for _, entry in ipairs(entries) do
            local ts = os.date("%Y-%m-%d %H:%M:%S", entry.timestamp)
            reply(playerUin, "[" .. ts .. "] " .. entry.actor .. " " .. entry.action .. " " .. entry.target .. ": " .. entry.desc)
        end
    elseif sub == "search" then
        local keyword = args[4]
        if not keyword or keyword == "" then
            reply(playerUin, "用法: /perm log search <keyword>")
            return
        end
        local entries = permCore:searchActionLog(keyword)
        if #entries == 0 then
            reply(playerUin, "未找到匹配 '" .. keyword .. "' 的操作日志")
            return
        end
        reply(playerUin, "===== 搜索操作日志: " .. keyword .. " =====")
        for _, entry in ipairs(entries) do
            local ts = os.date("%Y-%m-%d %H:%M:%S", entry.timestamp)
            reply(playerUin, "[" .. ts .. "] " .. entry.actor .. " " .. entry.action .. " " .. entry.target .. ": " .. entry.desc)
        end
    else
        reply(playerUin, "未知的 log 子命令: " .. sub)
    end
end

local function cmd_verbose(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.verbose") then return end
    local sub = args[3]
    if not sub then
        reply(playerUin, "用法: /perm verbose <on [filter]|off>")
        return
    end
    if sub == "on" then
        local filter = args[4]
        local ok, err = permCore:registerVerboseListener(playerUin, filter)
        if ok then
            if filter then
                reply(playerUin, "实时 verbose 已开启 (过滤器: " .. filter .. ")")
            else
                reply(playerUin, "实时 verbose 已开启 (无过滤器)")
            end
        else
            reply(playerUin, "开启失败: " .. (err or "未知错误"))
        end
    elseif sub == "off" then
        local ok, err = permCore:unregisterVerboseListener(playerUin)
        if ok then
            reply(playerUin, "实时 verbose 已关闭")
        else
            reply(playerUin, "关闭失败: " .. (err or "未知错误"))
        end
    else
        reply(playerUin, "未知的 verbose 子命令: " .. sub .. " (可用: on, off)")
    end
end

local function cmd_pattern(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.pattern") then return end
    local sub = args[3]
    local pattern = args[4]
    local node = args[5]
    if sub ~= "match" or not pattern or not node then
        reply(playerUin, "用法: /perm pattern match <pattern> <node>")
        return
    end
    local ok, err = permCore:matchPattern(pattern, node)
    if ok then
        reply(playerUin, "模式 '" .. pattern .. "' 匹配节点 '" .. node .. "' = true")
    else
        reply(playerUin, "模式 '" .. pattern .. "' 匹配节点 '" .. node .. "' = false (" .. tostring(err) .. ")")
    end
end

local function cmd_search(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.search") then return end

    local searchNode = args[3]
    if not searchNode or searchNode == "" then
        reply(playerUin, "用法: /perm search <node> [page]")
        return
    end

    local userBackend = permCore.userStorageBackend or "table"
    if userBackend == "private_string" or userBackend == "global_kv" then
        reply(playerUin, "该后端不支持 search 功能")
        return
    end

    local page = tonumber(args[4]) or 1
    local PAGE_SIZE = 10

    local results = permCore:searchPermissions(searchNode)

    if #results == 0 then
        reply(playerUin, "未找到匹配节点 '" .. searchNode .. "' 的权限")
        return
    end

    local totalPages = math.ceil(#results / PAGE_SIZE)
    if page < 1 then page = 1 end
    if page > totalPages then page = totalPages end
    local startIdx = (page - 1) * PAGE_SIZE + 1
    local endIdx = math.min(startIdx + PAGE_SIZE - 1, #results)

    reply(playerUin, "=== 搜索节点 '" .. searchNode .. "' (第 " .. page .. "/" .. totalPages .. " 页, 共 " .. #results .. " 条) ===")
    for i = startIdx, endIdx do
        reply(playerUin, results[i])
    end
end

----------------------------------------------------------------------
-- Bulk update command
----------------------------------------------------------------------

local function parse_flag(args, flagName)
    local prefix = "--" .. flagName .. "="
    for _, arg in ipairs(args) do
        if arg:sub(1, #prefix) == prefix then
            return arg:sub(#prefix + 1)
        end
    end
    return nil
end

local function cmd_bulkupdate(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.bulkupdate") then return end

    local target = args[3]
    local action = args[4]
    local node = args[5]
    local groupFilter = parse_flag(args, "group")

    if not target or not action or not node then
        reply(playerUin, "用法: /perm bulkupdate <user|group|all> <add|remove> <node> [--group=<name>]")
        return
    end

    if target ~= "user" and target ~= "group" and target ~= "all" then
        reply(playerUin, "无效的目标类型: " .. target .. " (可选: user, group, all)")
        return
    end

    if action ~= "add" and action ~= "remove" then
        reply(playerUin, "无效的操作: " .. action .. " (可选: add, remove)")
        return
    end

    if type(node) ~= "string" or node == "" then
        reply(playerUin, "节点不能为空")
        return
    end

    local userBackend = permCore.userStorageBackend or "table"
    local groupBackend = permCore.groupStorageBackend or "table"

    if (target == "user" or target == "all") and (userBackend == "private_string" or userBackend == "global_kv") then
        reply(playerUin, "该用户存储后端不支持批量操作: " .. userBackend)
        return
    end

    if (target == "group" or target == "all") and groupBackend == "global_kv" then
        reply(playerUin, "该组存储后端不支持批量操作: " .. groupBackend)
        return
    end

    local actor = tostring(playerUin)
    local userCount = 0
    local groupCount = 0
    local userErrors = 0
    local groupErrors = 0

    if target == "user" or target == "all" then
        local allUsers = permCore:getAllUsers()
        for _, uin in ipairs(allUsers) do
            if groupFilter then
                local groups = permCore:getUserGroups(uin)
                local inGroup = false
                if groups then
                    for _, g in ipairs(groups) do
                        if g == groupFilter then
                            inGroup = true
                            break
                        end
                    end
                end
                if not inGroup then
                    goto continue_user
                end
            end

            local ok
            if action == "add" then
                ok = permCore:addUserNode(uin, node, true, actor)
            else
                ok = permCore:removeUserNode(uin, node, actor)
            end

            if ok then
                userCount = userCount + 1
            else
                userErrors = userErrors + 1
            end

            ::continue_user::
        end
    end

    if target == "group" or target == "all" then
        local allGroups = permCore:getAllGroups()
        for _, groupName in ipairs(allGroups) do
            local ok
            if action == "add" then
                ok = permCore:addGroupNode(groupName, node, actor)
            else
                ok = permCore:removeGroupNode(groupName, node, actor)
            end

            if ok then
                groupCount = groupCount + 1
            else
                groupErrors = groupErrors + 1
            end
        end
    end

    permCore:clearPermCache()

    local parts = {}
    if target == "user" or target == "all" then
        parts[#parts + 1] = "用户: " .. userCount .. " 成功" .. (userErrors > 0 and (", " .. userErrors .. " 失败") or "")
    end
    if target == "group" or target == "all" then
        parts[#parts + 1] = "组: " .. groupCount .. " 成功" .. (groupErrors > 0 and (", " .. groupErrors .. " 失败") or "")
    end
    reply(playerUin, "批量" .. (action == "add" and "添加" or "移除") .. "节点 '" .. node .. "' 完成: " .. table.concat(parts, "; "))
end

----------------------------------------------------------------------
-- Permissions registry command
----------------------------------------------------------------------

local function cmd_permissions(playerUin, args, permCore)
    if not check_perm(playerUin, permCore, "permsys.command.permissions") then return end

    local sub = args[3]

    if not sub or sub == "list" then
        local all = permCore:getRegisteredPermissions()
        if not all then
            reply(playerUin, "暂无已注册权限")
            return
        end

        local byPlugin = {}
        local totalCount = 0
        for node, meta in pairs(all) do
            local p = meta.plugin or "unknown"
            if not byPlugin[p] then byPlugin[p] = {} end
            byPlugin[p][#byPlugin[p] + 1] = { node = node, meta = meta }
            totalCount = totalCount + 1
        end

        if totalCount == 0 then
            reply(playerUin, "暂无已注册权限")
            return
        end

        reply(playerUin, "===== 已注册权限 (共 " .. totalCount .. " 个) =====")
        for plugin, entries in pairs(byPlugin) do
            table.sort(entries, function(a, b) return a.node < b.node end)
            reply(playerUin, "[" .. plugin .. "] (" .. #entries .. " 个)")
            for _, e in ipairs(entries) do
                local desc = e.meta.description ~= "" and (" - " .. e.meta.description) or ""
                local def = e.meta.default ~= nil and (" [default: " .. tostring(e.meta.default) .. "]") or ""
                reply(playerUin, "  " .. e.node .. desc .. def)
            end
        end

    elseif sub == "info" then
        local node = args[4]
        if not node or node == "" then
            reply(playerUin, "用法: /perm permissions info <node>")
            return
        end

        local meta = permCore:getRegisteredPermissions()
        if meta then meta = meta[node] end
        if not meta then
            reply(playerUin, "权限节点 '" .. node .. "' 未注册")
            return
        end

        reply(playerUin, "===== 权限: " .. node .. " =====")
        reply(playerUin, "插件: " .. (meta.plugin or "unknown"))
        reply(playerUin, "描述: " .. (meta.description ~= "" and meta.description or "无"))
        reply(playerUin, "默认: " .. tostring(meta.default ~= nil and meta.default or "无"))
        if meta.children and #meta.children > 0 then
            reply(playerUin, "子权限: " .. table.concat(meta.children, ", "))
        end

    else
        local pluginPerms = permCore:getPermissionsByPlugin(sub)
        if not pluginPerms then
            reply(playerUin, "插件 '" .. sub .. "' 未注册任何权限")
            return
        end

        local entries = {}
        for node, meta in pairs(pluginPerms) do
            entries[#entries + 1] = { node = node, meta = meta }
        end
        if #entries == 0 then
            reply(playerUin, "插件 '" .. sub .. "' 未注册任何权限")
            return
        end

        table.sort(entries, function(a, b) return a.node < b.node end)
        reply(playerUin, "===== 插件 " .. sub .. " 的权限 (" .. #entries .. " 个) =====")
        for _, e in ipairs(entries) do
            local desc = e.meta.description ~= "" and (" - " .. e.meta.description) or ""
            local def = e.meta.default ~= nil and (" [default: " .. tostring(e.meta.default) .. "]") or ""
            reply(playerUin, "  " .. e.node .. desc .. def)
        end
    end
end

----------------------------------------------------------------------
-- Help
----------------------------------------------------------------------

local function show_usage(playerUin)
    reply(playerUin, "===== PermSys 命令帮助 =====")
    reply(playerUin, "")
    reply(playerUin, "--- 用户操作 ---")
    reply(playerUin, "/perm user <user> info")
    reply(playerUin, "/perm user <user> permission set <node> [true|false]")
    reply(playerUin, "/perm user <user> permission unset <node>")
    reply(playerUin, "/perm user <user> parent add <group>")
    reply(playerUin, "/perm user <user> parent remove <group>")
    reply(playerUin, "/perm user <user> parent set <group>")
    reply(playerUin, "/perm user <user> parent addtemp <group> <duration>")
    reply(playerUin, "/perm user <user> parent removetemp <group>")
    reply(playerUin, "/perm user <user> meta set <key> <value>")
    reply(playerUin, "/perm user <user> meta unset <key>")
    reply(playerUin, "/perm user <user> meta setprefix <prefix>")
    reply(playerUin, "/perm user <user> meta setsuffix <suffix>")
    reply(playerUin, "/perm user <source> clone <target>")
    reply(playerUin, "/perm user <user> clear")
    reply(playerUin, "/perm user <user> promote <track>")
    reply(playerUin, "/perm user <user> demote <track>")
    reply(playerUin, "")
    reply(playerUin, "--- 组操作 ---")
    reply(playerUin, "/perm group <group> info")
    reply(playerUin, "/perm group <group> permission set <node>")
    reply(playerUin, "/perm group <group> permission unset <node>")
    reply(playerUin, "/perm group <group> parent add <parent>")
    reply(playerUin, "/perm group <group> parent remove <parent>")
    reply(playerUin, "/perm group <group> meta set <key> <value>")
    reply(playerUin, "/perm group <group> meta unset <key>")
    reply(playerUin, "/perm group <group> meta setprefix <prefix>")
    reply(playerUin, "/perm group <group> meta setsuffix <suffix>")
    reply(playerUin, "/perm group <group> weight <weight>")
    reply(playerUin, "/perm group <group> listmembers [page]")
    reply(playerUin, "/perm group <source> clone <target>")
    reply(playerUin, "/perm group <group> clear")
    reply(playerUin, "/perm group <group> rename <newname>")
    reply(playerUin, "")
    reply(playerUin, "--- 轨道操作 ---")
    reply(playerUin, "/perm track create <name>")
    reply(playerUin, "/perm track delete <name>")
    reply(playerUin, "/perm track info <name>")
    reply(playerUin, "/perm track list")
    reply(playerUin, "/perm track append <track> <group>")
    reply(playerUin, "/perm track insert <track> <index> <group>")
    reply(playerUin, "/perm track remove <track> <group>")
    reply(playerUin, "/perm track clear <track>")
    reply(playerUin, "/perm track rename <oldname> <newname>")
    reply(playerUin, "/perm track clone <source> <target>")
    reply(playerUin, "")
    reply(playerUin, "--- 其他命令 ---")
    reply(playerUin, "/perm creategroup <name> [weight]")
    reply(playerUin, "/perm deletegroup <name>")
    reply(playerUin, "/perm check <user> <node>")
    reply(playerUin, "/perm sync status")
    reply(playerUin, "/perm log <view|enable|disable|recent|search>")
    reply(playerUin, "/perm verbose <on [filter]|off>")
    reply(playerUin, "/perm pattern match <pattern> <node>")
    reply(playerUin, "/perm search <node> [page]")
    reply(playerUin, "/perm bulkupdate <user|group|all> <add|remove> <node> [--group=<name>]")
    reply(playerUin, "/perm permissions [list]")
    reply(playerUin, "/perm permissions <plugin>")
    reply(playerUin, "/perm permissions info <node>")
    reply(playerUin, "/perm help")
end

----------------------------------------------------------------------
-- Main command dispatcher
----------------------------------------------------------------------

function PermCommands:handleCommand(e)
    local content = e.content
    if not content or type(content) ~= "string" then return end
    if string.sub(content, 1, #COMMAND_PREFIX) ~= COMMAND_PREFIX then return end

    local playerUin = e.eventobjid
    if not playerUin then return end

    local permCore = self:GetComponent(PERM_CORE_COMPONENT_ID) --[[@as PermCore]]
    if not permCore or not permCore:IsValid() then
        reply(playerUin, "PermSys 核心组件未就绪")
        return
    end

    local args = split_args(content)
    local selfStr = tostring(playerUin)
    for i = 1, #args do
        if args[i] == "%self%" then
            args[i] = selfStr
        end
    end
    local command = args[2]

    if not command or command == "help" then
        show_usage(playerUin)
    elseif command == "user" then
        cmd_user(playerUin, args, permCore)
    elseif command == "group" then
        cmd_group(playerUin, args, permCore)
    elseif command == "track" then
        cmd_track(playerUin, args, permCore)
    elseif command == "creategroup" then
        cmd_creategroup(playerUin, args, permCore)
    elseif command == "deletegroup" then
        cmd_deletegroup(playerUin, args, permCore)
    elseif command == "check" then
        cmd_check(playerUin, args, permCore)
    elseif command == "sync" then
        cmd_sync(playerUin, args, permCore)
    elseif command == "log" then
        cmd_log(playerUin, args, permCore)
    elseif command == "verbose" then
        cmd_verbose(playerUin, args, permCore)
    elseif command == "pattern" then
        cmd_pattern(playerUin, args, permCore)
    elseif command == "search" then
        cmd_search(playerUin, args, permCore)
    elseif command == "bulkupdate" then
        cmd_bulkupdate(playerUin, args, permCore)
    elseif command == "permissions" then
        cmd_permissions(playerUin, args, permCore)
    else
        reply(playerUin, "未知命令: " .. command)
        show_usage(playerUin)
    end
end

----------------------------------------------------------------------
-- Lifecycle
----------------------------------------------------------------------

function PermCommands:OnStart()
    self:AddTriggerEvent(TriggerEvent.PlayerNewInputContent, self.handleCommand)
    print("[PermSys] PermCommands: registered /perm command handler")
end

return PermCommands
