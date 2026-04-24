local MiniMatica = {}

MiniMatica.openFnArgs = {}

--[[
{
    [uin] = {
        loaded_schematic = {
            [1] = {
                id = 'id',
                data = schematic_data,
                changed_block_data = {},
            }
        },
        projectile_list = {[index] = {projectile_id}}
    }
}
--]]
local temp_player_data = {}

local default_schematic_data = {
        name = "Unnamed",
        description = "",
        uin = -1,
        author = "",
        time = os.time(),
        public = false,
        total_volume = 0,
        total_blocks = 0,
        size = {x = 0, y = 0, z = 0},
        data = {
            blocks = {
            },
        }
    }

local default_player_data = {
    tool_mode = 'selection',
    selection = {
        mode = 'aim',
        aim_mode = 0,
        range = 5,
        begpos = {x = 0, y = 0, z = 0},
        endpos = {x = 0, y = 0, z = 0},
        originpos = {x = 0, y = 0, z = 0},
        render = true,
        autosetoriginpos = true
    },

    schematic = {
        select = 0,
        list = {
        }
    }
}
--[[
schematic_data = {
    name = "",
    description = "",
    uin = -1,
    author = "",
    time = os.time(),
    public = false
    total_volume = 0,
    total_blocks = 0,
    size = {x = 0, y = 0, z = 0},
    data = {
        blocks = {
            -- id, x, y, z, data, storagebox_data
            {1, 0, 0, 0, 0, {}}
        },
    }
}
]]


local default_global_data = {
    schematic_list = {
    }
}


--[[
playerData = {
    [uin] = {
        tool_mode = 'selection' or 'place_schematic'
        selection = {
            mode = "mouse" or 'aim',
            aim_mode = 0 or 1 or 2,
            range = 5,
            begpos = {x = 0, y = 0, z = 0},
            endpos = {x = 0, y = 0, z = 0},
            originpos = {x = 0, y = 0, z = 0},
            render = false,
            aim_mode = 2,
            autosetoriginpos = true
        },

        schematic = {
            select = 1,
            list = {
                [1] = {
                    rotation = 0,
                    mirror = 0,
                    pos = {x = 0, y = 0, z = 0},
                    enabled = true,
                    render = true,
                    index = 1
                }
            }
        }
    }
}
]]

local function Bresenham3D(x1, y1, z1, x2, y2, z2)
    local ListOfPoints = {}
    table.insert(ListOfPoints, {x=x1, y=y1, z=z1})
    
    local dx = math.abs(x2 - x1)
    local dy = math.abs(y2 - y1)
    local dz = math.abs(z2 - z1)
    
    local xs = (x2 > x1) and 1 or -1
    local ys = (y2 > y1) and 1 or -1
    local zs = (z2 > z1) and 1 or -1

    -- Driving axis is X-axis
    if dx >= dy and dx >= dz then
        local p1 = 2 * dy - dx
        local p2 = 2 * dz - dx
        while x1 ~= x2 do
            x1 = x1 + xs
            if p1 >= 0 then
                y1 = y1 + ys
                p1 = p1 - 2 * dx
            end
            if p2 >= 0 then
                z1 = z1 + zs
                p2 = p2 - 2 * dx
            end
            p1 = p1 + 2 * dy
            p2 = p2 + 2 * dz
            table.insert(ListOfPoints, {x=x1, y=y1, z=z1})
        end

    -- Driving axis is Y-axis
    elseif dy >= dx and dy >= dz then
        local p1 = 2 * dx - dy
        local p2 = 2 * dz - dy
        while y1 ~= y2 do
            y1 = y1 + ys
            if p1 >= 0 then
                x1 = x1 + xs
                p1 = p1 - 2 * dy
            end
            if p2 >= 0 then
                z1 = z1 + zs
                p2 = p2 - 2 * dy
            end
            p1 = p1 + 2 * dx
            p2 = p2 + 2 * dz
            table.insert(ListOfPoints, {x=x1, y=y1, z=z1})
        end

    -- Driving axis is Z-axis
    else
        local p1 = 2 * dy - dz
        local p2 = 2 * dx - dz
        while z1 ~= z2 do
            z1 = z1 + zs
            if p1 >= 0 then
                y1 = y1 + ys
                p1 = p1 - 2 * dz
            end
            if p2 >= 0 then
                x1 = x1 + xs
                p2 = p2 - 2 * dz
            end
            p1 = p1 + 2 * dy
            p2 = p2 + 2 * dx
            table.insert(ListOfPoints, {x=x1, y=y1, z=z1})
        end
    end
    
    return ListOfPoints
end

--#region data

function MiniMatica:readGlobalData()
    local jsondata = Data:GetValue(self.globalDataVarId)
    if jsondata then
        if jsondata == '' then
            self.globalData = copy_table(default_global_data)
            return true
        end
        local result, data = pcall(json.decode, jsondata)
        if result then
            for k, v in pairs(copy_table(default_global_data)) do
                data[k] = data[k] or v
            end
            self.globalData = data
            return true
        else
            printError("[MiniMatica] Failed to decode data: " .. data)
            return false
        end
    else
        printError("[MiniMatica] Failed to get data")
        return false
    end
end

function MiniMatica:saveGlobalData()
    if not self.globalDataSaveTask then
        self.globalDataSaveTask = self:DoTaskInTime(self.saveGlobalDataNow, 60)
    end
end

function MiniMatica:saveGlobalDataNow()
    local result, jsondata = pcall(json.encode, self.globalData)
    if result then
        Data:SetValue(self.globalDataVarId, nil, jsondata)
        return true
    else
        printError("[MiniMatica] Failed to encode data: " .. jsondata)
        return false
    end
end

function MiniMatica:getGlobalData()
    return self.globalData
end

function MiniMatica:getPlayerData(uin)
    return self.playerData[uin]
end

function MiniMatica:getTempPlayerData(uin)
    return temp_player_data[uin]
end

function MiniMatica:readPlayerData(uin)
    local jsondata = Data:GetValue(self.playerDataVarId, uin)
    if jsondata then
        if jsondata == '' then
            self.playerData[uin] = copy_table(default_player_data)
            return true
        end
        local result, data = pcall(json.decode, jsondata)
        if result then
            for k, v in pairs(copy_table(default_player_data)) do
                data[k] = data[k] or v
            end
            self.playerData[uin] = data
            return true
        else
            printError("[MiniMatica] Failed to decode " .. tostring(uin) .. "'s data: " .. data)
            return false
        end
    else
        printError("[MiniMatica] Failed to get " .. tostring(uin) .. "'s data")
        return false
    end
end

function MiniMatica:savePlayerData(uin)
    if not self.playerDataSaveTasks[uin] then
        self.playerDataSaveTasks[uin] = self:DoTaskInTime(function() return self:savePlayerDataNow(uin) end, 60)
    end
end

function MiniMatica:savePlayerDataNow(uin)
    local result, jsondata = pcall(json.encode, self.playerData[uin])
    if result then
        Data:SetValue(self.playerDataVarId, uin, jsondata)
        return true
    else
        printError("[MiniMatica] Failed to encode " .. tostring(uin) .. "'s data: " .. jsondata)
        return false
    end
end

--#endregion

--#region schematic

function MiniMatica:loadSchematic(uin, id)
    local pdata = self.playerData[uin]
    local tmpdata = temp_player_data[uin]

    tmpdata.loaded_schematic[#tmpdata.loaded_schematic + 1] = {
        id = id,
        data = copy_table(self.globalData.schematic_list[id])
    }
    return self:loadMemorySchematic(uin, #tmpdata.loaded_schematic, id)
end

function MiniMatica:loadMemorySchematic(uin, index, id)
    local pdata = self.playerData[uin]
    local tmpdata = temp_player_data[uin]
    if not tmpdata.loaded_schematic[index] then
        return false
    end
    
    local x, y, z = Actor:GetPosition(uin)
    pdata.schematic.list[#pdata.schematic.list + 1] = {
        rotation = 0,
        mirror = 0,
        pos = {x = math.floor(x), y = math.floor(y), z = math.floor(z)},
        enabled = true,
        render = true,
        locked = false,
        index = index,
        id = id,
        projindex = #tmpdata.projectile_list + 1
    }
    tmpdata.projectile_list[#tmpdata.projectile_list + 1] = {}
    pdata.schematic.select = #pdata.schematic.list
    return true
end

function MiniMatica:saveSchematic(id, schematic_data)
    schematic_data = copy_table(schematic_data)
    for k, v in pairs(default_schematic_data) do
        schematic_data[k] = schematic_data[k] or v
    end
    schematic_data.time = os.time()
    self.globalData.schematic_list[id] = schematic_data
    self:saveGlobalDataNow()
    return true
end

function MiniMatica:saveSchematicFromMemory(uin, index, id, modify_data)
    local tmpdata = temp_player_data[uin]
    local schematic_data = tmpdata.loaded_schematic[index].data
    id = id or tmpdata.loaded_schematic[index].id
    modify_data = modify_data or {}
    for k, v in pairs(modify_data) do
        schematic_data[k] = v
    end

    return self:saveSchematic(id, schematic_data)
end

function MiniMatica:refreshSchematicBlockData(uin, index)
    local pdata = self.playerData[uin]
    local sdata = pdata.schematic.list[index]
    local schematic_data = temp_player_data[uin].loaded_schematic[sdata.index]
    if sdata.rotation == 0 and sdata.mirror == 0 then
        schematic_data.changed_block_data = schematic_data.data.data.blocks
        return true
    end

    local changed_block_data = {}
    for _, bdata in ipairs(schematic_data.data.data.blocks) do
        changed_block_data[#changed_block_data+1] = {bdata[1], bdata[2], bdata[3], bdata[4], bdata[5], bdata[6]}
    end
    for _ = 1, sdata.rotation do
        for k, bdata in ipairs(changed_block_data) do
            changed_block_data[k] = {bdata[1], bdata[4], bdata[3], -bdata[2]}
        end
    end

    if sdata.mirror == 1 then
        for k, bdata in ipairs(changed_block_data) do
            changed_block_data[k] = {bdata[1], bdata[2], bdata[3], -bdata[4]}
        end
    elseif sdata.mirror == 2 then
        for k, bdata in ipairs(changed_block_data) do
            changed_block_data[k] = {bdata[1], -bdata[2], bdata[3], bdata[4]}
        end
    end
    schematic_data.changed_block_data = changed_block_data

    return true
end

function MiniMatica:renderSchematic(uin, index)
    local ssettings = self.playerData[uin].schematic.list[index]
    local sdata = temp_player_data[uin].loaded_schematic[ssettings.index]
    local projectile_list = temp_player_data[uin].projectile_list[ssettings.projindex]

    if not ssettings.render then
        for k, id in ipairs(projectile_list) do
            GameObject:Destroy(id)
            projectile_list[k] = nil
        end
        return true
    end
    
    local count = 0
    local pos = ssettings.pos
    for k, bdata in ipairs(sdata.changed_block_data) do
        count = count + 1
        projectile_list[count] = self:renderOneBlock(pos, bdata, projectile_list[count])
    end
    
    for i = count + 1, #projectile_list do
        if projectile_list[i] then
            GameObject:Destroy(projectile_list[i][1])
        end
        projectile_list[i] = nil
    end
    return true
end

function MiniMatica:renderOneBlock(pos, bdata, projectile_data)
    local x, y, z = pos.x + bdata[2], pos.y + bdata[3], pos.z + bdata[4]
    local blockid = Block:GetBlockID(x, y, z)
    if blockid ~= 0 then
        if projectile_data then
            GameObject:Destroy(projectile_data[1])
        end
        
        if blockid ~= bdata[1] then
            World:PlayParticle({x = x, y = y, z = z}, self.redParticleId, 0, nil, nil, {x = 1.02, y = 1.02, z = 1.02})
        else
            World:StopParticleOnPos(x, y, z, self.redParticleId)
        end
        return false
    end
    
    if projectile_data and Actor:HasActor(projectile_data[1]) then
        Actor:SetPosition(projectile_data[1], x+0.5, y+0.5, z+0.5)
    else
        local objid = World:SpawnProjectile(uin, self.projectileId, x+0.5, y+0.5, z+0.5, 0, 0, 0, 0)
        projectile_data = {objid, x, y, z}
        Actor:SetFaceYaw(objid, 0)
        Actor:SetFacePitch(objid, -90)
    end
    Actor:ChangeCustomModel(projectile_data[1], "block_"..tostring(bdata[1]))
    return projectile_data
end

function MiniMatica:setSchematicPos(uin, index, pos)
    if self:isSchematicLocked(uin, index) then
        return false
    else
        self.playerData[uin].schematic.list[index].pos = pos
        self:renderSchematic(uin, index)
        return true
    end
end

function MiniMatica:setSchematicRotation(uin, index, rotation)
    if not self:isSchematicLocked(uin, index) and rotation >= 0 and rotation <= 3 then
        self.playerData[uin].schematic.list[index].rotation = rotation
        self:refreshSchematicBlockData(uin, index)
        self:renderSchematic(uin, index)
        return true
    else
        return false
    end
end

function MiniMatica:setSchematicMirror(uin, index, mirror)
    if not self:isSchematicLocked(uin, index) and mirror >= 0 and mirror <= 2 then
        self.playerData[uin].schematic.list[index].mirror = mirror
        self:refreshSchematicBlockData(uin, index)
        self:renderSchematic(uin, index)
        return true
    else
        return false
    end
end

function MiniMatica:setSchematicRender(uin, index, render)
    self.playerData[uin].schematic.list[index].render = render
    self:renderSchematic(uin, index)
    return true
end

function MiniMatica:setSchematicEnabled(uin, index, enabled)
    self.playerData[uin].schematic.list[index].enabled = enabled
    self:renderSchematic(uin, index)
    return true
end

function MiniMatica:setSchematicLocked(uin, index, locked)
    self.playerData[uin].schematic.list[index].locked = locked
    return true
end

function MiniMatica:isSchematicEnabled(uin, index)
    return self.playerData[uin].schematic.list[index].enabled
end

function MiniMatica:isSchematicLocked(uin, index)
    return self.playerData[uin].schematic.list[index].locked
end

function MiniMatica:getSchematicSettings(uin, index)
    return self.playerData[uin].schematic.list[index]
end

function MiniMatica:getSchematicPos(uin, index)
    return self.playerData[uin].schematic.list[index].pos
end

function MiniMatica:getSchematicRotation(uin, index)
    return self.playerData[uin].schematic.list[index].rotation
end

function MiniMatica:getSchematicMirror(uin, index)
    return self.playerData[uin].schematic.list[index].mirror
end

function MiniMatica:getLoadedSchematicData(uin, index)
    return temp_player_data[uin].loaded_schematic[index]
end

function MiniMatica:pasteSchematic(uin, index)
    local px, py, pz = Actor:GetPosition(uin)
    local ssettings = self.playerData[uin].schematic.list[index]
    local sdata = temp_player_data[uin].loaded_schematic[ssettings.index]
    local pos = ssettings.pos
    local changed_block_data = sdata.changed_block_data
    
    local movement_enabled = Actor:GetActorPermissions(uin, Ability.Movement)
    Actor:SetActorPermissions(uin, Ability.Movement, false)
    
    for _, blockdata in ipairs(changed_block_data) do
        local id = blockdata[1]
        local x, y, z = blockdata[2] + pos.x, blockdata[3] + pos.y, blockdata[4] + pos.z
        local data, storage = blockdata[5], blockdata[6]
        local fail_count = 0
        
        while true do
            local chunk_loaded = Block:GetBlockID(x, 0, z)
            if chunk_loaded == 0 or chunk_loaded == 4095 then
                Actor:SetPosition(uin, x, 256, z)
                Block:PlaceBlock(1, x, 0, z)
                if Block:GetBlockID(x, 0, z) ~= 1 then
                    fail_count = fail_count + 1
                    if fail_count > 150 then
                        error("[color=#eeaaaa]Failed to read block data")
                        return false
                    else
                        self:ThreadWait(0.1)
                    end
                else
                    Block:DestroyBlock(x, 0, z)
                    break
                end
            else
                break
            end
        end
        
        if Block:GetBlockID(x, y, z) == id and Block:GetBlockData(x, y, z) == data then
            goto continue
        end
        
        Block:SetBlockAll(x, y, z, id, data)
        if Block:GetBlockID(x, y, z) ~= id then
            Chat:SendSystemMsg('[color=#eeeeaa]粘贴某处位置方块失败')
            goto continue
        end
        if storage then
            Player:OpenBoxByPos(uin, x, y, z)
            Backpack:LoadGridInfos(uin, Backpack:EncodeTableGridInfo(storage))
            Player:OpenInnerView(uin, InnerPopUpview.StorageBox, false)
        end
        ::continue::
    end
    
    Actor:SetPosition(uin, px, py, pz)
    Actor:SetActorPermissions(uin, Ability.Movement, movement_enabled)
    return true
end

--#endregion

--#region selection

function MiniMatica:selectionSetBegPos(uin, x, y, z)
    self.playerData[uin].selection.begpos = {x = x, y = y, z = z}
    if self.playerData[uin].selection.autosetoriginpos then
        self:selectionAutoSetOriginPos(uin)
    end
    self:renderSelection(uin)
end

function MiniMatica:selectionSetEndPos(uin, x, y, z)
    self.playerData[uin].selection.endpos = {x = x, y = y, z = z}
    if self.playerData[uin].selection.autosetoriginpos then
        self:selectionAutoSetOriginPos(uin)
    end
    self:renderSelection(uin)
end

function MiniMatica:selectionSetOriginPos(uin, x, y, z)
    self.playerData[uin].selection.originpos = {x = x, y = y, z = z}
end

function MiniMatica:selectionAutoSetOriginPos(uin)
    local begpos = self.playerData[uin].selection.begpos
    local endpos = self.playerData[uin].selection.endpos
    local originpos = {}
    for _, v in ipairs({"x", "y", "z"}) do
        originpos[v] = math.min(begpos[v], endpos[v])
    end
    self.playerData[uin].selection.originpos = originpos
end

function MiniMatica:renderSelection(uin)
    if not self.playerData[uin].selection.render then
        return
    end
    local begpos = self.playerData[uin].selection.begpos
    local endpos = self.playerData[uin].selection.endpos
    
    local plist = temp_player_data[uin].particle_list
    if plist[1] then
        World:StopParticleOnPos(plist[1][1], plist[1][2], plist[1][3], self.redParticleId)
        World:StopParticleOnPos(plist[29][1], plist[29][2], plist[29][3], self.blueParticleId)
    end

    for k, rpos in ipairs(plist) do
        World:StopParticleOnPos(rpos[1], rpos[2], rpos[3], self.particleId)
        plist[k] = nil
    end
    
    if begpos then
        World:PlayParticle({x = plist[1][1], y = plist[1][2], z = plist[1][3]}, self.redParticleId, 0, nil, nil,
            {x = 1.02, y = 1.02, z = 1.02})
    end
    if endpos then
        World:PlayParticle({x = plist[29][1], y = plist[29][2], z = plist[29][3]}, self.blueParticleId, 0, nil, nil,
            {x = 1.02, y = 1.02, z = 1.02})
    end
    
    if not begpos or not endpos then
        plist[1] = begpos and copy_table(begpos)
        plist[29] = endpos and copy_table(endpos)
        return
    end
    
    local dx, dy, dz
    if begpos.x == endpos.x then
        dx = 0
    elseif begpos.x > endpos.x then
        dx = -1
    else
        dx = 1
    end

    if begpos.y == endpos.y then
        dy = 0
    elseif begpos.y > endpos.y then
        dy = -1
    else
        dy = 1
    end

    if begpos.z == endpos.z then
        dz = 0
    elseif begpos.z > endpos.z then
        dz = -1
    else
        dz = 1
    end

    for _, x in ipairs({begpos.x, endpos.x}) do
        for _, y in ipairs({begpos.y, endpos.y}) do
            for _, z in ipairs({begpos.z, endpos.z}) do
                plist[#plist + 1] = {x, y, z}
                plist[#plist + 1] = {x + dx, y, z}
                plist[#plist + 1] = {x, y + dy, z}
                plist[#plist + 1] = {x, y, z + dz}
                dz = -dz
            end
            dy = -dy
        end
        dx = -dx
    end
    for k, rpos in ipairs(plist) do
        World:PlayParticle({x = rpos[1], y = rpos[2], z = rpos[3]}, self.particleId, 0, nil, nil,
            {x = 1.02, y = 1.02, z = 1.02})
    end
end

function MiniMatica:saveSchematicFromSelection(uin, id, metadata)
    local px, py, pz = Actor:GetPosition(uin)
    local result, reason = pcall(function()
    id = tostring(id) or tostring(uin)..tostring(os.time())
    metadata = metadata or {}
    local pdata = self.playerData[uin]
    local schematic_data = copy_table(default_schematic_data)
    for k, v in pairs(metadata) do
        schematic_data[k] = v
    end
    schematic_data.uin = uin
    schematic_data.author = Player:GetNickname(uin)

    local movement_enabled = Actor:GetActorPermissions(uin, Ability.Movement)
    Actor:SetActorPermissions(uin, Ability.Movement, false)
    local blocks = {}

    local begpos = pdata.selection.begpos
    local endpos = pdata.selection.endpos
    local originpos = pdata.selection.originpos
    local dx, dy, dz
    if begpos.x > endpos.x then
        dx = -1
    else
        dx = 1
    end

    if begpos.y > endpos.y then
        dy = -1
    else
        dy = 1
    end

    if begpos.z > endpos.z then
        dz = -1
    else
        dz = 1
    end

    local storagebox_id = {}
    local function isStorageBox(bid, x, y, z)
        if storagebox_id[bid] then
            return true
        elseif storagebox_id[bid] == false then
            return false
        end

        if WorldContainer:CheckStorage(x, y, z) then
            storagebox_id[bid] = true
            return true
        else
            storagebox_id[bid] = false
            return false
        end
    end

    for x = begpos.x, endpos.x, dx do
        for y = begpos.y, endpos.y, dy do
            for z = begpos.z, endpos.z, dz do
                local fail_count = 0
                while true do
                    local chunk_loaded = Block:GetBlockID(x, 0, z)
                    if chunk_loaded == 0 or chunk_loaded == 4095 then
                        Actor:SetPosition(uin, x, 256, z)
                        Block:PlaceBlock(1, x, 0, z)
                        if Block:GetBlockID(x, 0, z) ~= 1 then
                            fail_count = fail_count + 1
                            if fail_count > 150 then
                                error("[color=#eeaaaa]Failed to read block data")
                                return false
                            else
                                self:ThreadWait(0.1)
                            end
                        else
                            Block:DestroyBlock(x, 0, z)
                            break
                        end
                    else
                        break
                    end
                end

                local blockid = Block:GetBlockID(x, y, z)
                if blockid ~= 0 then
                    local blockdata = Block:GetBlockData(x, y, z)
                    local infos
                    if isStorageBox(blockid, x, y, z) then
                        infos = {}
                        Player:OpenBoxByPos(uin, x, y, z)
                        local originfos = Backpack:DecodeGridInfo(Backpack:GetGridInfos(uin, 3000, 3059))
                        for _, v in ipairs(originfos) do
                            if v.itemid then
                                infos[#infos+1] = v
                            end
                        end
                        Player:OpenInnerView(uin, InnerPopUpview.StorageBox, false)
                    end
                    blocks[#blocks+1] = {blockid, x - originpos.x, y - originpos.y, z - originpos.z, blockdata, infos}
                    infos = nil
                end
            end
        end
    end

    schematic_data.data.blocks = blocks
    schematic_data.total_blocks = #blocks
    local size = {x = math.abs(begpos.x - endpos.x), y = math.abs(begpos.y - endpos.y), z = math.abs(begpos.z - endpos.z)}
    schematic_data.size = size
    schematic_data.total_volumes = size.x * size.y * size.z
    self:saveSchematic(id, schematic_data)

    Actor:SetPosition(uin, px, py, pz)
    Actor:SetActorPermissions(uin, Ability.Movement, movement_enabled)
    return true
    end)
    Player:OpenInnerView(uin, InnerPopUpview.StorageBox, false)
    if not result then
        Chat:SendSystemMsg("[color=#eeaaaa]保存原理图时出现错误: "..reason, uin)
        Actor:SetActorPermissions(uin, Ability.Movement, true)
        return result, reason
    end
    return reason
end

function MiniMatica:getAimPos(uin, aimmode)
    local pdata = self.playerData[uin]
    local rx, ry, rz = Player:GetRayOriginPos(uin)
    local dir = Player:GetAimDir(uin)
    local range = pdata.selection.range
    local pos = {x = math.floor(dir.x*range+rx), y = math.floor(dir.y*range+ry), z = math.floor(dir.z*range+rz)}
    aimmode = aimmode or pdata.selection.aim_mode
    if aimmode ~= 2 then
        local points = Bresenham3D(math.floor(rx), math.floor(ry), math.floor(rz), pos.x, pos.y, pos.z)
        --[[ 显示路径用的
        for _, v in ipairs(palist) do
            World:StopParticleOnPos(v.x, v.y, v.z, "s_451695522565181440")
        end
    
        for k, v in ipairs(points) do
            local x, y, z = v.x, v.y, v.z
            World:PlayParticle({x = x, y = y, z = z},  "s_451695522565181440", 0, nil, nil, {x = 1.02, y = 1.02, z = 1.02})
            palist[#palist+1] = {x=x,y=y,z=z}
        end
       ]]
        for k, point in ipairs(points) do
            local is_air_block = Block:IsAirBlock(point.x, point.y, point.z)
       
            if not is_air_block then
                if aimmode == 1 and k > 1 then
                    pos = points[k-1]
                else
                    pos = points[k]
                end        
            break
            end
        end    
    end
    return pos
end

function MiniMatica:renderAim(uin)
    local aim_particle = temp_player_data[uin].aim_particle
    local pdata = self.playerData[uin]
    local pos = self:getAimPos(uin)
    if aim_particle.x == pos.x and aim_particle.y == pos.y and aim_particle.z == pos.z then
        return
    end
    World:StopParticleOnPos(aim_particle.x, aim_particle.y, aim_particle.z, self.particleId)
    World:PlayParticle({x = pos.x, y = pos.y, z = pos.z}, self.particleId, 0, nil, nil,
            {x = 1.02, y = 1.02, z = 1.02})
    temp_player_data[uin].aim_particle = pos
    return true
end

function MiniMatica:startRenderAim(uin)
    self:stopRenderAim(uin)
    temp_player_data[uin].render_aim_task = self:DoPeriodicTask(function()
        return self:renderAim(uin)
    end, 0.05)
    return true
end

function MiniMatica:stopRenderAim(uin)
    if temp_player_data[uin].render_aim_task then
        temp_player_data[uin].render_aim_task:Cancel()
        temp_player_data[uin].render_aim_task = nil
    end
    local aim_particle = temp_player_data[uin].aim_particle
    if aim_particle then
        World:StopParticleOnPos(aim_particle.x, aim_particle.y, aim_particle.z, self.particleId)
    end
    return true
end

function MiniMatica:aimSelection(uin)
    local last_aim_pos = temp_player_data[uin].last_aim_pos
    local pdata = self.playerData[uin]
    local tmpdata = temp_player_data[uin]
    local pos = self:getAimPos(uin)
    if last_aim_pos.x == pos.x and last_aim_pos.y == pos.y and last_aim_pos.z == pos.z then
        return
    end
    if tmpdata.aim_status == 1 then -- 起始点
        self:selectionSetBegPos(pos)
    elseif tmpdata.aim_status == 2 then -- 结束点
        self:selectionSetEndPos(pos)
    end
    temp_player_data[uin].last_aim_pos = pos
    self:renderSelection(uin)
    return true
end

function MiniMatica:startAimSelection(uin)
    self:stopAimSelection(uin)
    temp_player_data[uin].aim_selection_task = self:DoPeriodicTask(function()
        return self:aimSelection(uin)
    end, 0.05)
    return true
end

function MiniMatica:stopAimSelection(uin)
    if temp_player_data[uin].aim_selection_task then
        temp_player_data[uin].aim_selection_task:Cancel()
        temp_player_data[uin].aim_selection_task = nil
    end
    return true
end

--#endregion

--#region event

function MiniMatica:OnMouseEvent(_, uin, key, status)
    if self.playerData[uin].selection.mode == 'mouse' and Player:GetCurToolID(uin) == self.toolId then
        if key == 0 and status == 0 then
            local ray = Player:GetAimDir(uin)
            local x, y, z = Player:GetRayOriginPos(uin)
            local id, pos = World:GetDirRayDetection({x = x, y = y, z = z}, {x = ray.x, y = ray.y, z = ray.z}, 512,
                RayDetectType.Block)
            self:selectionSetBegPos(uin, pos.x, pos.y, pos.z)
        elseif key == 1 and status == 0 then
            local ray = Player:GetAimDir(uin)
            local x, y, z = Player:GetRayOriginPos(uin)
            local id, pos = World:GetDirRayDetection({x = x, y = y, z = z}, {x = ray.x, y = ray.y, z = ray.z}, 512,
                RayDetectType.Block)
            self:selectionSetEndPos(uin, pos.x, pos.y, pos.z)
        end
    end
end

function MiniMatica:OnUseItem(e)
    local uin = e.eventobjid
    local pdata = self.playerData[uin]
    local tmpdata = temp_player_data[uin]
    local tool_mode = pdata.tool_mode
    if e.itemid ~= self.toolId then
        return
    end
    
    if tool_mode == "selection" then
        if pdata.selection.mode == "aim" then
            if tmpdata.aim_status == 0 then --没开始选区
                return
            elseif tmpdata.aim_status == 1 then -- 起始点
                self:aimSelection(uin)
                if pdata.selection.endpos then
                    tmpdata.aim_status = 0
                else
                    tmpdata.aim_status = 2
                end
            elseif tmpdata.aim_status == 2 then -- 结束点
                self:aimSelection(uin)
                tmpdata.aim_status = 0
                self:stopAimSelection(uin)
            end
        end
    else
    
    end
end

function MiniMatica:OnPlayerJoin(e)
    local uin = e.eventobjid
    GameObject:FindObject(uin):AddComponent("c757280086673165026536090")
    --self:readPlayerData(uin)
    temp_player_data[uin] = {
        particle_list = {},
        loaded_schematic = {},
        projectile_list = {},
        aim_particle = {x = 0, y = 0, z = 0}
    }
end

function MiniMatica:OnPlayerLeave(e)
    local uin = e.eventobjid
    self:savePlayerData(uin)
    temp_player_data[uin] = nil
end

function MiniMatica:OnBlockAdd(e)
    print(e)
end

function MiniMatica:OnStart()
    self.toolId = "r2_7572549314792090841_89824"
    self.particleId = "s_451695522565181440"
    self.redParticleId = "s_451934964240470016"
    self.blueParticleId = "s_451941823542317065"
    self.playerDataVarId = 'v757258184057942344989878'
    self.globalDataVarId = 'v757258108466517935389877'
    self.projectileId = "r2_7575160105152244953_36173"
    self.playerData = {
        [273640665] = {
            tool_mode = 'selection',
            selection = {
                mode = 'aim',
                aim_mode = 0,
                range = 5,
                begpos = {x = 10, y = 10, z = 10},
                endpos = {x = 20, y = 20, z = 20},
                render = true,
                autosetoriginpos = true
            },
            schematic = {
                select = 0,
                list = {}
            }
        }
    }
    self.playerDataSaveTasks = {}
    --self:renderSelection(273640665)
    GameObject:FindObject(273640665):AddComponent("c757280086673165026536090")
    self:readGlobalData()
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerEnterGame, self.OnPlayerJoin)
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerLeaveGame, self.OnPlayerLeave)
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerLeaveGame, self.OnPlayerLeave)
    self:AddCustomEvent("MouseEvent", self.OnMouseEvent)
    print(Block:GetBlockID(0, 0, 0))
    self:ThreadWait(0.1)
    self:DoPeriodicTask(function(self) return self:renderAim(273640665) end, 0.1, 0)
    self:ThreadWait(10)
    self:saveSchematicFromSelection(273640665, 'test')
    self:loadSchematic(273640665, 'test')
    self.playerData[273640665].schematic.list[1].rotation = 0
    self.playerData[273640665].schematic.list[1].mirror = 0
    self:refreshSchematicBlockData(273640665, 1)
    --self:renderSchematic(273640665, 1)
    self:pasteSchematic(273640665, 1)
end

--#endregion

for key, value in pairs(MiniMatica) do
    if type(value) == 'function' then
        MiniMatica.openFnArgs[key] = {}
    end
end

return MiniMatica
