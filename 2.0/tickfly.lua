playerjoin = function(e)
    local uin = e.eventobjid
    temp_player_data2[uin] = {}
    temp_player_data2[uin]['tickflymode'] = 'actortp'
    temp_player_data2[uin]['horizontalspeed'] = 1
    temp_player_data2[uin]['verticalspeed'] = 1
end

keydown = function(e)
    local uin = e.eventobjid
    local key = e.vkey
    if(key == 'W')
    then
        temp_player_data2[uin]['keyW'] = true
    elseif(key == 'A')
    then
        temp_player_data2[uin]['keyA'] = true
    elseif(key == 'S')
    then
        temp_player_data2[uin]['keyS'] = true
    elseif(key == 'D')
    then
        temp_player_data2[uin]['keyD'] = true
    elseif(key == 'SHIFT')
    then
        temp_player_data2[uin]['keySHIFT'] = true
    elseif(key == 'SPACE')
    then
        temp_player_data2[uin]['keySPACE'] = true
    elseif(key == 'N')
    then
        if(temp_player_data2[uin]['tickfly'])
        then
            temp_player_data2[uin]['tickfly'] = false
            Player:setActionAttrState(uin,1,true)
            Chat:sendSystemMsg('[color=#ffaaaa]disabled', uin)
        else
            temp_player_data2[uin]['tickfly'] = true
            --Player:setActionAttrState(uin,1,false)
            Chat:sendSystemMsg('[color=#aaffaa]enabled', uin)
        end
    end
end

keyup = function(e)
    local uin = e.eventobjid
    local key = e.vkey
    if(key == 'W')
    then
        temp_player_data2[uin]['keyW'] = false
    elseif(key == 'A')
    then
        temp_player_data2[uin]['keyA'] = false
    elseif(key == 'S')
    then
        temp_player_data2[uin]['keyS'] = false
    elseif(key == 'D')
    then
        temp_player_data2[uin]['keyD'] = false
    elseif(key == 'SHIFT')
    then
        temp_player_data2[uin]['keySHIFT'] = false
    elseif(key == 'SPACE')
    then
        temp_player_data2[uin]['keySPACE'] = false
    end
end


playerchat = function(e)
    local uin = e.eventobjid
    local content = e.content
    local code, strs = Game:splitStr(content, ' ')
    if(string.lower(strs[1]) == '/tickflyspeed')
    then
        if(string.lower(strs[2]) == 'h')
        then
            temp_player_data2[uin]['horizontalspeed'] = tonumber(strs[3])
            --local code = VarLib2:setPlayerVarByName(uin, 3, 'horizontalspeed', strs[3])
            if(code)
            then
                Chat:sendSystemMsg('[color=#aaffaa]success', uin)
            else
                Chat:sendSystemMsg('[color=#ffaaaa]fail', uin)
            end
        elseif(string.lower(strs[2]) == 'v')
        then
            temp_player_data2[uin]['verticalspeed'] = tonumber(strs[3])
            --local code = VarLib2:setPlayerVarByName(uin, 3, 'verticalspeed', strs[3])
            if(code)
            then
                Chat:sendSystemMsg('[color=#aaffaa]success', uin)
            else
                Chat:sendSystemMsg('[color=#ffaaaa]fail', uin)
            end
        else
            local horizontalspeed = temp_player_data2[uin]['horizontalspeed']
            local verticalspeed = temp_player_data2[uin]['verticalspeed']
            --local code, horizontalspeed = VarLib2:getPlayerVarByName(uin, 3, 'horizontalspeed')
	        --local code, verticalspeed = VarLib2:getPlayerVarByName(uin, 3, 'verticalspeed')
	        Chat:sendSystemMsg('[color=#aaffaa]horizontalspeed(h) = '..horizontalspeed, uin)
	        Chat:sendSystemMsg('[color=#aaaaff]verticalspeed(v) = '..verticalspeed, uin)
        end
    elseif(string.lower(strs[1]) == '/tickfly')
    then
        if(temp_player_data2[uin]['tickfly'])
        then
            temp_player_data2[uin]['tickfly'] = false
            Player:setActionAttrState(uin,1,true)
            Chat:sendSystemMsg('[color=#ffaaaa]disabled', uin)
        else
            temp_player_data2[uin]['tickfly'] = true
            Chat:sendSystemMsg('[color=#aaffaa]enabled', uin)
        end
    elseif(string.lower(strs[1]) == '/tickflymode')
    then
        if(string.lower(strs[2]) == 'actortp')
        then
            temp_player_data2[uin]['tickflymode'] = 'actortp'
            --local code = VarLib2:setPlayerVarByName(uin, 4, 'tickflymode', 'actortp')
            Chat:sendSystemMsg('[color=#aaffaa]success', uin)
        elseif(string.lower(strs[2]) == 'playertp')
        then
            temp_player_data2[uin]['tickflymode'] = 'playertp'
            --local code = VarLib2:setPlayerVarByName(uin, 4, 'tickflymode', 'playertp')
            Chat:sendSystemMsg('[color=#aaffaa]success', uin)
        elseif(string.lower(strs[2]) == 'fakevanilla')
        then
            temp_player_data2[uin]['tickflymode'] = 'fakevanilla'
            --local code = VarLib2:setPlayerVarByName(uin, 4, 'tickflymode', 'fakevanilla')
            Chat:sendSystemMsg('[color=#aaffaa]success', uin)
        else
            Chat:sendSystemMsg('[color=#aaffff]available modes: actortp, playertp, fakevanilla', uin)
        end
    end
end


temp_player_data2 = {}
ScriptSupportEvent:registerEvent([=[Player.InputKeyDown]=], keydown)
ScriptSupportEvent:registerEvent([=[Player.InputKeyUp]=], keyup)
ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=], playerjoin)
--ScriptSupportEvent:registerEvent([=[Game.Run]=], ontick)
ScriptSupportEvent:registerEvent([=[Player.NewInputContent]=], playerchat)

return function()
    local result, num, array = World:getAllPlayers(-1)
    for i, uin in ipairs(array) do
	    if(temp_player_data2[uin]['tickfly'])
	    then
	        -- local code, horizontalspeed = VarLib2:getPlayerVarByName(uin, 3, 'horizontalspeed')
	        -- local code, verticalspeed = VarLib2:getPlayerVarByName(uin, 3, 'verticalspeed')
	        -- local code, mode = VarLib2:getPlayerVarByName(uin, 4, 'tickflymode')
	        local horizontalspeed = temp_player_data2[uin]['horizontalspeed']
	        local verticalspeed = temp_player_data2[uin]['verticalspeed']
	        local mode = temp_player_data2[uin]['tickflymode']
	        local xmotion = 0
	        local ymotion = 0
	        local zmotion = 0
	        local origy = temp_player_data2[uin]['origy']
	        local result, yaw = Actor:getFaceYaw(uin)
	        local result, pitch = Actor:getFacePitch(uin)
	        if(temp_player_data2[uin]['keyW']) then
	           zmotion = zmotion + (math.abs(yaw / 90) - 1) * horizontalspeed
	           if(yaw < 0)
	           then
	               xmotion = xmotion + (1 - math.abs(yaw + 90) / 90) * horizontalspeed
	           else
	               xmotion = xmotion + (math.abs(yaw - 90) / 90 - 1) * horizontalspeed
	           end
	        end
	        if(temp_player_data2[uin]['keyA']) then
	           xmotion = xmotion - (math.abs(yaw / 90) - 1) * horizontalspeed
	           if(yaw < 0)
	           then
	               zmotion = zmotion + (1 - math.abs(yaw + 90) / 90) * horizontalspeed
	           else
	               zmotion = zmotion + (math.abs(yaw - 90) / 90 - 1) * horizontalspeed
	           end
	        end
	        if(temp_player_data2[uin]['keyS']) then
	           zmotion = zmotion -(math.abs(yaw / 90) - 1) * horizontalspeed
	           if(yaw < 0)
	           then
	               xmotion = xmotion - (1 - math.abs(yaw + 90) / 90) * horizontalspeed
	           else
	               xmotion = xmotion - (math.abs(yaw - 90) / 90 - 1) * horizontalspeed
	           end
	        end
	        if(temp_player_data2[uin]['keyD']) then
	           xmotion = xmotion + (math.abs(yaw / 90) - 1) * horizontalspeed
	           if(yaw < 0)
	           then
	               zmotion = zmotion - (1 - math.abs(yaw + 90) / 90) * horizontalspeed
	           else
	               zmotion = zmotion - (math.abs(yaw - 90) / 90 - 1) * horizontalspeed
	           end
	        end
	        if(temp_player_data2[uin]['keySPACE'])
	        then
	            ymotion = ymotion + verticalspeed
	        end
	        if(temp_player_data2[uin]['keySHIFT'])
	        then
	            ymotion = ymotion - verticalspeed
	        end
	        local result, x, origy, z = Actor:getPosition(uin)
	        if(mode == 'actortp')
	        then
	            Player:setActionAttrState(uin,1,false)
	            Actor:setPosition(uin, x + xmotion, origy + ymotion, z + zmotion)
	        elseif(mode == 'playertp')
	        then
	            Player:setActionAttrState(uin,1,false)
	            Player:setPosition(uin, x + xmotion, origy + ymotion, z + zmotion)
	        elseif(mode == 'fakevanilla')
	        then
	            Player:setActionAttrState(uin,1,true)
	            Actor:appendSpeed(uin, xmotion, ymotion + 0.0785, zmotion)
	        end
        end
    end
end