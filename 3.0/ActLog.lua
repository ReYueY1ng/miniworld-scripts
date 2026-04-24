local ActLog = {}

ActLog.propertys = {
    version = {
        type = Mini.Number,
        default = 1,
        format = '%.1f',
        hide = true
    }
}

ActLog.openFnArgs = {}

local config = {}
local datatab = {}
local defconfig = {}
defconfig.events = {
    ---Game Event
    ['Game.Start'] = true,
    ['Game.Run'] = false,
    ['Game.Hour'] = false,
    ['Game.RunTime'] = false,
    ['Game.TimeOver'] = true,
    ['Game.End'] = true,
    ---World Event
    ['Backpack.ItemPutIn'] = true,
    ['Backpack.ItemTakeOut'] = true,
    ['Backpack.ItemChange'] = false,
    ['Weather.Changed'] = true,
    ['GroupWeather.Changed'] = true,
    ---Block Event
    ['Block.Add'] = true,
    ['Block.Remove'] = true,
    ['Block.PlaceBy'] = true,
    ['Block.DestroyBy'] = true,
    ['Block.Trigger'] = true,
    ['Block.Fertilize'] = true,
    ['Block.Dig.Begin'] = true,
    ['Block.Dig.Cancel'] = true,
    ['Block.Dig.End'] = true,
    ---Player Event
    ['Game.AnyPlayer.ReadStage'] = true,
    ['Game.AnyPlayer.EnterGame'] = true,
    ['Game.AnyPlayer.Victory'] = true,
    ['Game.AnyPlayer.Defeat'] = true,
    ['Game.AnyPlayer.LeaveGame'] = true,
    ['Player.Init'] = true,
    ['Player.AddBuff'] = true,
    ['Player.ClickBlock'] = true,
    ['Player.ClickActor'] = true,
    ['Player.Attack'] = true,
    ['Player.AttackHit'] = true,
    ['Player.DamageActor'] = true,
    ['Player.DefeatActor'] = true,
    ['Player.BeHurt'] = true,
    ['Player.Die'] = true,
    ['Player.Revive'] = true,
    ['Player.Collide'] = true,
    ['Player.AreaIn'] = true,
    ['Player.AreaOut'] = true,
    ['Player.AddItem'] = true,
    ['Player.ConsumeItem'] = true,
    ['Player.UseItem'] = true,
    ['Player.PickUpItem'] = true,
    ['Player.DiscardItem'] = true,
    ['Player.ShortcutChange'] = true,
    ['Player.EquipChange'] = false,
    ['Player.BackpackChange'] = true,
    ['Player.ChangeAttr'] = true,
    ['Player.InputContent'] = false,
    ['Player.EquipOn'] = true,
    ['Player.EquipOff'] = true,
    ['Player.InputKeyDown'] = false,
    ['Player.InputKeyOnPress'] = false,
    ['Player.InputKeyUp'] = false,
    ['Player.InvateFriend'] = true,
    ['Player.LevelModelUpgrade'] = true,
    ['Player.MotionStateChange'] = true,
    ['Player.MountActor'] = true,
    ['Player.MoveOneBlockSize'] = false,
    ['Player.NewInputContent'] = true,
    ['Player.PlayAction'] = true,
    ['Player.RemoveBuff'] = true,
    ['Player.SelectShortcut'] = false,
    ['Player.UseGiftPack'] = true,
    ---Actor Event
    ['Actor.Collide'] = true,
    ['Actor.AddBuff'] = true,
    ['Actor.RemoveBuff'] = true,
    ['Actor.Projectile.Hit'] = true,
    ['Actor.AreaIn'] = true,
    ['Actor.AreaOut'] = true,
    ['Actor.AttackHit'] = true,
    ['Actor.Attack'] = true,
    ['Actor.BeHurt'] = true,
    ['Actor.Beat'] = true,
    ['Actor.ChangeAttr'] = true,
    ['Actor.ChangeMotion'] = true,
    ['Actor.Damage'] = true,
    ['Actor.Die'] = true,
    ---Item Event
    ['DropItem.AreaIn'] = true,
    ['DropItem.AreaOut'] = true,
    ['Item.Create'] = true,
    ['Item.Destroy'] = true,
    ['Item.Pickup'] = true,
    ['Item.expend'] = true,
    ['Item.Disappear'] = true,
    ['Missile.Create'] = true,
    ['Missile.AreaIn'] = true,
    ['Missile.AreaOut'] = true,
    ['Particle.Item.OnCreate'] = true,
    ---Particle Event
    ['Particle.Pos.OnCreate'] = true,
    ['Particle.Player.OnCreate'] = true,
    ['Particle.Mob.OnCreate'] = true,
    ['Particle.Projectile.OnCreate'] = true,
    ---UI Event
    ['UI.Button.Click'] = false,
    ['UI.Hide'] = false,
    ['UI.Show'] = false,
    ['UI.Button.TouchBegin'] = false,
    ['UI.LostFocus'] = false,
    ['UI.GLoader3D.Click'] = false,
    ['UI.GLoader3D.TouchBegin'] = false,
    ---Other Event
    ['minitimer.change'] = false,
    ['Craft.end'] = true,
    ['Furnace.begin'] = true,
    ['Furnace.end'] = true,
    ['Plot.begin'] = true,
    ['Plot.end'] = true,
    ['BluePrint.BuildBegin'] = true,
    ['Developer.BuyItem'] = true,
    ['MiNiVip_1'] = false,
    ['MiNiVip_3'] = false,
    ['QQMusic.PlayBegin'] = true,
}
defconfig.eventlang = {
    ---Game Event
    ['Game.Load'] = '游戏加载',
    ['Game.Start'] = '游戏开始',
    ['Game.Run'] = '游戏Tick执行',
    ['Game.Hour'] = '游戏内小时变化 %hour%',
    ['Game.RunTime'] = '游戏Tick变化',
    ['Game.TimeOver'] = '游戏时间结束',
    ['Game.End'] = '游戏结束',
    ---World Event
    ['Backpack.ItemPutIn'] = '容器 %ActLog_ETBName% 放入 %ActLog_ETIName% %itemnum% 个',
    ['Backpack.ItemTakeOut'] = '容器 %ActLog_ETBName% 取出 %ActLog_ETIName% %itemnum% 个',
    ['Backpack.ItemChange'] = '容器 %ActLog_ETBName% 改变 %ActLog_ETIName% %itemnum% 个',
    ['Weather.Changed'] = '天气变化',
    ---Block Event
    ['Block.Add'] = '方块 %ActLog_ETBName% 创建',
    ['Block.Remove'] = '方块 %ActLog_ETBName% 移除',
    ['Block.PlaceBy'] = '方块 %ActLog_ETBName% 被 %ActLog_TBPName% 放置',
    ['Block.DestroyBy'] = '方块 %ActLog_ETBName% 被 %ActLog_TBPName% 破坏',
    ['Block.Trigger'] = '方块 %ActLog_ETBName% 活跃/通电',
    ['Block.Fertilize'] = '方块 %ActLog_ETBName% 被施肥',
    ['Block.Dig.Begin'] = '玩家 %ActLog_TBPName% 开始挖掘方块 %ActLog_ETBName%',
    ['Block.Dig.Cancel'] = '玩家 %ActLog_TBPName% 取消挖掘方块 %ActLog_ETBName%',
    ['Block.Dig.End'] = '玩家 %ActLog_TBPName% 挖掘方块结束 %ActLog_ETBName%',
    ---Player Event
    ['Game.AnyPlayer.ReadStage'] = '玩家 %ActLog_TBPName% 读取进度',
    ['Game.AnyPlayer.EnterGame'] = '玩家 %ActLog_TBPName% 进入游戏',
    ['Game.AnyPlayer.Victory'] = '玩家 %ActLog_TBPName% 胜利',
    ['Game.AnyPlayer.Defeat'] = '玩家 %ActLog_TBPName% 失败',
    ['Game.AnyPlayer.LeaveGame'] = '玩家 %ActLog_TBPName% 离开游戏',
    ['Player.Init'] = '玩家 %ActLog_TBPName% 初始化',
    ['Player.AddBuff'] = '玩家 %ActLog_TBPName% 获得效果 %ActLog_EBName%',
    ['Player.ClickBlock'] = '玩家 %ActLog_TBPName% 点击方块 %ActLog_ETBName%',
    ['Player.ClickActor'] = '玩家 %ActLog_TBPName% 点击生物 %ActLog_ETCName%',
    ['Player.Attack'] = '玩家 %ActLog_TBPName% 挥手攻击',
    ['Player.AttackHit'] = '玩家 %ActLog_TBPName% 攻击命中 %ActLog_ETName%',
    ['Player.DamageActor'] = '玩家 %ActLog_TBPName% 对 %ActLog_ETName% 造成伤害 %hurtlv%',
    ['Player.DefeatActor'] = '玩家 %ActLog_TBPName% 击败 %ActLog_ETName%',
    ['Player.BeHurt'] = '玩家 %ActLog_TBPName% 受到伤害 %hurtlv%',
    ['Player.Die'] = '玩家 %ActLog_TBPName% 死亡',
    ['Player.Revive'] = '玩家 %ActLog_TBPName% 重生',
    ['Player.Collide'] = '玩家 %ActLog_TBPName% 碰撞%ActLog_ETType% %ActLog_ETName%',
    ['Player.AreaIn'] = '玩家 %ActLog_TBPName% 进入区域 %areaid%',
    ['Player.AreaOut'] = '玩家 %ActLog_TBPName% 离开区域 %areaid%',
    ['Player.AddItem'] = '玩家 %ActLog_TBPName% 获得道具 %ActLog_ETIName% %itemnum% 个',
    ['Player.ConsumeItem'] = '玩家 %ActLog_TBPName% 消耗道具 %ActLog_ETIName% %itemnum% 个',
    ['Player.UseItem'] = '玩家 %ActLog_TBPName% 使用道具 %ActLog_ETIName%',
    ['Player.PickUpItem'] = '玩家 %ActLog_TBPName% 拾取道具 %ActLog_ETIName% %itemnum% 个',
    ['Player.DiscardItem'] = '玩家 %ActLog_TBPName% 丢弃道具 %ActLog_ETIName% %itemnum% 个',
    ['Player.ShortcutChange'] = '玩家 %ActLog_TBPName% 快捷栏 %itemix% 变化 %ActLog_ETIName% %itemnum% 个',
    ['Player.EquipChange'] = '玩家 %ActLog_TBPName% 装备栏 %itemix% 变化 %ActLog_ETIName% %itemnum% 个',
    ['Player.BackpackChange'] = '玩家 %ActLog_TBPName% 背包栏 %itemix% 变化 %ActLog_ETIName% %itemnum% 个',
    ['Player.ChangeAttr'] = '玩家 %ActLog_TBPName% 属性 %playerattr% 变化 %playerattrval%',
    ['Player.InputContent'] = '玩家 %ActLog_TBPName% 聊天框显示 %content%',
    ['Player.EquipOn'] = '玩家 %ActLog_TBPName% 穿上装备 %ActLog_ETIName% %itemnum% 个 至 %itemix%',
    ['Player.EquipOff'] = '玩家 %ActLog_TBPName% 脱下装备 %ActLog_ETIName% %itemnum% 个 至 %itemix%',
    ['Player.InputKeyDown'] = '玩家 %ActLog_TBPName% 按下按键 %vkey%',
    ['Player.InputKeyOnPress'] = '玩家 %ActLog_TBPName% 长按按键 %vkey%',
    ['Player.InputKeyUp'] = '玩家 %ActLog_TBPName% 松开按键 %vkey%',
    ['Player.InvateFriend'] = '玩家 %ActLog_TBPName% 邀请好友 %ActLog_ETPName% (%toobjid%)',
    ['Player.LevelModelUpgrade'] = '玩家 %ActLog_TBPName% 等级改变',
    ['Player.MotionStateChange'] = '玩家 %ActLog_TBPName% 行为状态变更 %playermotion%',
    ['Player.MountActor'] = '玩家 %ActLog_TBPName% 骑乘生物 %ActLog_ETName%',
    ['Player.MoveOneBlockSize'] = '玩家 %ActLog_TBPName% 移动一格',
    ['Player.NewInputContent'] = '玩家 %ActLog_TBPName% 发送消息 %content%',
    ['Player.PlayAction'] = '玩家 %ActLog_TBPName% 使用表情动作 %act%',
    ['Player.RemoveBuff'] = '玩家 %ActLog_TBPName% 失去效果 %ActLog_EBName%',
    ['Player.SelectShortcut'] = '玩家 %ActLog_TBPName% 快捷栏选择 %ActLog_ETIName%',
    ['Player.UseGiftPack'] = '玩家 %ActLog_TBPName% 使用包裹 %ActLog_ETIName% %itemnum% 个',
    ---Actor Event
    ['Actor.Collide'] = '生物 %ActLog_TBCName% 碰撞%ActLog_ETType% %ActLog_ETName%',
    ['Actor.AddBuff'] = '生物 %ActLog_TBCName% 获得效果 %ActLog_EBName%',
    ['Actor.RemoveBuff'] = '生物 %ActLog_TBCName% 失去效果 %ActLog_EBName%',
    ['Actor.Projectile.Hit'] = '生物 %ActLog_TBCName% 的投掷物 %ActLog_ETIName% 击中%ActLog_ETType% %ActLog_ETName%',
    ['Actor.AreaIn'] = '生物 %ActLog_TBCName% 进入区域 %areaid%',
    ['Actor.AreaOut'] = '生物 %ActLog_TBCName% 离开区域 %areaid%',
    ['Actor.AttackHit'] = '生物 %ActLog_TBCName% 攻击命中 %ActLog_ETName%',
    ['Actor.Attack'] = '生物 %ActLog_TBCName% 挥手攻击',
    ['Actor.BeHurt'] = '生物 %ActLog_TBCName% 受到伤害 %hurtlv%',
    ['Actor.Beat'] = '生物 %ActLog_TBCName% 击败 %ActLog_ETName%',
    ['Actor.ChangeAttr'] = '生物 %ActLog_TBCName% 属性 %actorattr% 变化 %actorattrval%',
    ['Actor.ChangeMotion'] = '生物 %ActLog_TBCName% 行为状态变更 %actormotion%',
    ['Actor.Damage'] = '生物 %ActLog_TBCName% 对 %ActLog_ETName% 造成伤害 %hurtlv%',
    ['Actor.Die'] = '生物 %ActLog_TBCName% 死亡',
    ---Item Event
    ['DropItem.AreaIn'] = '掉落物 %ActLog_ETIName% 进入区域 %areaid%',
    ['DropItem.AreaOut'] = '掉落物 %ActLog_ETIName% 离开区域 %areaid%',
    ['Item.Create'] = '掉落物 %ActLog_ETIName% 创建 %defaultvalue%',
    ['Item.Destroy'] = '物品 %ActLog_ETIName% %itemnum% 个 被破坏',
    ['Item.Pickup'] = '掉落物 %ActLog_ETIName% %itemnum% 个 被 %ActLog_ETName% 捡起',
    ['Item.expend'] = '物品 %ActLog_ETIName% %itemnum% 个 被消耗',
    ['Item.Disappear'] = '掉落物 %ActLog_ETIName% %itemnum% 个 消失',
    ['Missile.Create'] = '投掷物 %ActLog_ETIName% 被 %ActLog_TBPName% 创建',
    ['Missile.AreaIn'] = '投掷物 %ActLog_ETIName%(%ActLog_TBPName%) 进入区域 %areaid%',
    ['Missile.AreaOut'] = '投掷物 %ActLog_ETIName%(%ActLog_TBPName%) 离开区域 %areaid%',
    ['Particle.Item.OnCreate'] = '特效 %effectid% 在掉落物 %ActLog_ETIName% 上创建',
    ---Particle Event
    ['Particle.Pos.OnCreate'] = '特效 %effectid% 在位置 {x=%x%,y=%y%,z=%z%} 上创建',
    ['Particle.Player.OnCreate'] = '特效 %effectid% 在玩家 %ActLog_TBPName% 上创建',
    ['Particle.Mob.OnCreate'] = '特效 %effectid% 在生物 %ActLog_TBCName% 上创建',
    ['Particle.Projectile.OnCreate'] = '特效 %effectid% 在投掷物 %ActLog_ETIName%(%ActLog_TBPName%) 上创建',
    ---UI Event
    ['UI.Button.Click'] = '玩家 %ActLog_TBPName% 点击UI按钮 %uielement%',
    ['UI.Hide'] = '玩家 %ActLog_TBPName% 关闭页面 %CustomUI%',
    ['UI.Show'] = '玩家 %ActLog_TBPName% 打开页面 %CustomUI%',
    ['UI.Button.TouchBegin'] = '玩家 %ActLog_TBPName% 按下UI按钮 %uielement%',
    ['UI.LostFocus'] = '玩家 %ActLog_TBPName% 在UI输入框 %uielement% 输入内容 %content%',
    ['UI.GLoader3D.Click'] = '玩家 %ActLog_TBPName% 点击UI模型 %uielement%',
    ['UI.GLoader3D.TouchBegin'] = '玩家 %ActLog_TBPName% 按下UI模型 %uielement%',
    ---Other Event
    ['minitimer.change'] = '计时器 %timername%(%timerid%) 变化 %timertime% 秒',
    ['Craft.end'] = '玩家 %ActLog_TBPName% 合成 %ActLog_ETIName% %itemnum% 个',
    ['Furnace.begin'] = '熔炼 %furanceid% 开始 {x=%x%,y=%y%,z=%z%}',
    ['Furnace.end'] = '熔炼 %furanceid% 结束 {x=%x%,y=%y%,z=%z%}',
    ['Plot.begin'] = '玩家 %ActLog_TBPName% 与 %ActLog_ETCName% 开始剧情 %plotid%',
    ['Plot.end'] = '玩家 %ActLog_TBPName% 与 %ActLog_ETCName% 结束剧情 %plotid%',
    ['BluePrint.BuildBegin'] = '蓝图开始创建 %areaid%',
    ['Developer.BuyItem'] = '玩家 %ActLog_TBPName% 购买物品 %ActLog_ETIName%',
    ['MiNiVip_1'] = '玩家 %ActLog_TBPName% 购买迷你大会员 1 个月',
    ['MiNiVip_3'] = '玩家 %ActLog_TBPName% 购买迷你大会员 3 个月',
    ['QQMusic.PlayBegin'] = '音乐播放器 播放 %qqMusicId% (%ActLog_TBPName% 点播)',
}

function ActLog:eventLog(e)
    local param = {}
    local cep = e.CurEventParam
    param.time = os.time()

    if cep then
        if cep.TriggerByPlayer then
            param.TBPName = Player:GetNickname(cep.TriggerByPlayer)
            param.TType = '玩家'
        end
        if cep.TriggerByCreature then
            param.TBCName = Actor:GetNickname(cep.TriggerByCreature)
            param.TType = '生物'
        end
        if cep.EventTargetItemID then
            param.ETIName = Item:GetItemName(cep.EventTargetItemID)
        end
        if cep.EventTargetBlock then
            param.ETBName = Item:GetItemName(cep.EventTargetBlock)
            param.ETType = '方块'
        end
        if cep.EventBuffid then
            param.EBName = Buff:GetBuffDefName(cep.EventBuffid)
        end
        if cep.EventTargetCreature then
            param.ETCName = Actor:GetNickname(cep.EventTargetCreature)
            param.ETType = '生物'
        end
        if cep.EventTargetPlayer then
            param.ETPName = Player:GetNickname(cep.EventTargetPlayer)
            param.ETType = '玩家'
        end
    end
    param.ETName = param.ETBName or param.ETCName or param.ETIName or param.ETPName
    param.TBName = param.TBCName or param.TBPName
    e.ActLog = param
    datatab[#datatab+1] = e
end

function ActLog:placeholderReplace(eventtab, str)
    local lastcount = 0
    local strtab = {}
    for _ = 1, 10 do
        local i, j = string.find(str, "%%([%w_]+)%%", lastcount, false)
        if j then
            strtab[#strtab+1] = string.sub(str, lastcount, i-1)
        end
        if not i then
            strtab[#strtab+1] = string.sub(str, lastcount)
            return table.concat(strtab)
        elseif lastcount == 0 then
            lastcount = i
        elseif i + 1 == j then
            strtab[#strtab+1] = '%'
            lastcount = j + 1
        else
            lastcount = j + 1
            local phstr = string.sub(str, i+1, j-1)
            local tab = eventtab
            for _, v in ipairs(phstr:split('_')) do
                tab = tab[v]
            end
            strtab[#strtab+1] = tab
        end
    end
end

function ActLog:getConfig()
    return config
end

function ActLog:getEventLang(msgStr)
    return config.eventlang[msgStr] or msgStr
end

function ActLog:onPlayerChat(e)
   local uin = e.eventobjid
   local content = e.content
   local strs = content:split(' ')
   if strs[1] == '/al' or strs[1] == '/actlog' then
        if strs[2] == 'list' then
            local logtotal = #datatab
            local page = tonumber(strs[3]) or 1
            for i = logtotal - page * 10, logtotal - (page - 1) * 10 do
                if datatab[i] then
                    Chat:SendSystemMsg(os.date('[%H:%M:%S] ', datatab[i].ActLog.time)..self:placeholderReplace(datatab[i], self:getEventLang(datatab[i].msgStr)),uin)
                end
            end
            Chat:SendSystemMsg('------'..page..'/'..math.ceil(logtotal / 10)..'------',uin)
        end
   end
end

function ActLog:OnStart()
    --#region getconfig

    local jsonconfig = Data:GetValue("v750272548600017224963792")
    if not jsonconfig then
        error('Get config failed (invaild type)')
    elseif jsonconfig == '' then
        print('Create config')
        config = defconfig
        Data:SetValue("v750272548600017224963792", nil, json.encode(config))
    else
        local ret, result = pcall(json.decode, jsonconfig)
        if not ret then
            error("Get config failed (decode): "..result)
        else
            config = result
        end
    end

    --#endregion
    --#region regevent

    local count = 0
    for k, v in pairs(config.events) do
        if v then
            self:AddTriggerEvent(k, self.eventLog)
            count = count + 1
        end
    end
    print("Registered "..count.." event(s)")
    self:AddTriggerEvent(TriggerEvent.PlayerNewInputContent, self.onPlayerChat)
    --#endregion
end

return ActLog