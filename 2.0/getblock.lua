function dig(e)
    local uin = e.eventobjid
    local id = e.blockid
    local blockx = e.x
    local blocky = e.y
    local blockz = e.z
    local result, itemid = Player:getCurToolID(uin)
    if(itemid == 11070)
    then
        select[uin] = {x=blockx, y=blocky, z=blockz, id=id}
        Chat:sendSystemMsg('[color=#aaffaa]selected block', uin)
        return
    end
    local result, name = Block:GetBlockDefName(id)
    local result, desc = Block:GetBlockDefDesc(id)
    local result, data = Block:getBlockData(blockx,blocky,blockz)
    local result, switched=Block:getBlockSwitchStatus({x=blockx,y=blocky,z=blockz})
    local result, powered=Block:getBlockPowerStatus({x=blockx,y=blocky,z=blockz})
    Chat:sendSystemMsg('[color=#ffaaaa]id: [color=#eeeeee]'..id, uin)
    Chat:sendSystemMsg('[color=#aaffaa]name: [color=#eeeeee]'..name, uin)
    Chat:sendSystemMsg('[color=#aaaaff]desc: [color=#eeeeee]'..desc, uin)
    Chat:sendSystemMsg('[color=#ffffaa]data: [color=#eeeeee]'..tostring(data), uin)
    Chat:sendSystemMsg('[color=#ffaaff]switched: [color=#eeeeee]'..tostring(switched), uin)
    Chat:sendSystemMsg('[color=#aaffff]powered: [color=#eeeeee]'..tostring(powered), uin)
end

function remove(e)
    local id = e.blockid
    if(id == 843 or id == 351 or id == 722) then return end
    local blockx = e.x
    local blocky = e.y
    local blockz = e.z
    local result, name = Block:GetBlockDefName(id)
    Chat:sendSystemMsg('[color=#eeeeee]'..name..'('..id..') [color=#ffaaaa]removed')
end

function place(e)
    local id = e.blockid
    if(id == 843 or id == 351 or id == 722) then return end
    local blockx = e.x
    local blocky = e.y
    local blockz = e.z
    if(id == 200370)
    then
        WorldContainer:addStorageItem(blockx, blocky, blockz, 1, 64)
    end
    local result, name = Block:GetBlockDefName(id)
    Chat:sendSystemMsg('[color=#eeeeee]'..name..'('..id..') [color=#aaffaa]placed')
end

select = {}

function chat(e)
    local uin = e.eventobjid
    local content = e.content
    local code, strs = Game:splitStr(content, ' ')
    if(strs[1] == '/setdata')
    then
        Block:setBlockAll(select[uin].x,select[uin].y,select[uin].z,select[uin].id,tonumber(strs[2]))
        Chat:sendSystemMsg('[color=#aaffaa]setdata ok', uin)
    end
end

UI:Print2WndWithTag('test','2')
ScriptSupportEvent:registerEvent([=[Block.Dig.Begin]=], dig)
ScriptSupportEvent:registerEvent([=[Block.Remove]=], remove)
ScriptSupportEvent:registerEvent([=[Block.Add]=], place)
ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], chat)