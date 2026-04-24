AllRandomSkyBlock = {
    version = 0.1
}

function AllRandomSkyBlock:refreshBlock()
    for x = 4, 12 do
        for y = 1, 7 do
            for z = 4, 12 do
                local _, blockid = Block:randomBlockID()
                Block:replaceBlock(blockid, x, y, z, 0)
                threadpool:wait(0.01)
            end
        end
    end
    return true
end

local function onplayerchat(e)
    local uin = e.eventobjid
    local content = string.lower(e.content)
    local _, strs = Game:splitStr(content, " ")
    if strs[1] == "/arsb" or strs[1] == "/ar" or strs[1] == "/allrandomskyblock" then
        if strs[2] == "refresh" then
            AllRandomSkyBlock:refreshBlock()
            Chat:sendSystemMsg("[color=#aaeeaa]刷新完成!", uin)
        end
    end
end

local function init()
    ScriptSupportEvent:registerEvent("Player.NewInputContent", onplayerchat)
end

init()