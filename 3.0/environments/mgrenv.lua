-- ============================================================================
-- Mini World UGC environment export
-- format: mwenviron/1   generator: dump_env.lua 1.0.0
-- face: mgr
-- game: 1.59.0
-- generated: 2026-10-01 22:13:55
-- stats: tables=213 functions=0 refs=0 userdata=0 unresolved=0 truncated=0 maxdepth=3 bytes=15787
-- exported by: ReYueY1ng
-- source url: https://github.com/ReYueY1ng/miniworld-scripts/3.0/environments
-- licensed under: CC BY 4.0
-- ============================================================================
---@meta
return {
    ["limitcfg"] = {
        ["Actor.WhitList_StopSkill"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Backpack.GetGridGunInfo"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.BluePrintSaveAsNewId"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.BluePrintSetUploadInteral"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.CaptureAndUploadScreenshot"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.CreateObsBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.DeleteBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.GetBluePrintBlockInfo"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.GetObsBluePrintPos"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.GetObsBluePrintStatus"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.LoadObsBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.PlaceBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.SaveBluePrintRegionData"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.StopPlaceObsBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.UnbindBluePrintRegion"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Block.UnloadObsBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["CloudSever.GetRoomCategory"] = {
            [3] = "trigger_api3_MapTagTransfer",
        },
        ["CloudSever.SendSeverMsg"] = {
            [3] = "message_trigger",
            [4] = 15,
        },
        ["CloudSever.SetRoomCategory"] = {
            [3] = "trigger_api3_MapTagTransfer",
            [4] = 5,
        },
        ["CloudSever.TransmitToCategoryRoom"] = {
            [3] = "trigger_api3_MapTagTransfer",
            [4] = 30,
        },
        ["CloudSever.TransmitToCurMapCategoryRoom"] = {
            [3] = "trigger_api3_MapTagTransfer",
            [4] = 30,
        },
        ["CloudSever.TransmitToMap"] = {
            [4] = 30,
        },
        ["CustomUI.GetElementAttrValue"] = {
            [3] = "LuaApi3_CustomUI_GetElementAttrValue",
        },
        ["CustomUI.GetUIViewAttrValue"] = {
            [3] = "LuaApi3_CustomUI_GetUIViewAttrValue",
        },
        ["CustomUI.SetSysSettingBtnVisible"] = {
            [3] = "LuaApi3_CustomUI_SetSysSettingBtnVisible",
        },
        ["CustomUI.SetUrlIcon"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Data.DoPackBluePrint"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.CreateBindItemInBackpack"] = {
            [3] = "LuaApi3_Item_CreateBindItemInBackpack",
        },
        ["Item.CreateItemInstInBackpack"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.EmpowerEquipOrGunForPlayer"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.FreshPowerEquipOrGunForPlayer"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.GetGunBaseDesc"] = {
            [3] = "LuaApi3_Item_GetGunBaseDesc",
        },
        ["Item.GetItemModelComp"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.GetObjData"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.GetObjDataByGrid"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.IsBindItem"] = {
            [3] = "LuaApi3_Item_IsBindItem",
        },
        ["Item.LevelUpEquipOrGunForPlayer"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.SetObjData"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Item.SetObjDataByGrid"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Listen.SetBlockAll"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Monster.SetPersistance"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["OfficeUtils.GetActivateProgress"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["OfficeUtils.GetActivateReward"] = {
            [2] = {
                [1] = 10,
                [2] = "请求频繁,请稍后再试！",
            },
            [3] = "LuaApi3_InternalApi",
        },
        ["OfficeUtils.ReportActivateDataForUin"] = {
            [3] = "trigger_api_UploadActData",
        },
        ["OfficeUtils.ReportOfficeActivateData"] = {
            [3] = "trigger_api_ReportOfficeActivateData",
        },
        ["OfficeUtils.SendClientReportEvent"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.AddMagazine"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.ChangeViewModeForMod"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.GetBlockAtlasInfo"] = {
            [3] = "LuaApi3_Player_GetBlockAtlasInfo",
        },
        ["Player.GetFriendList"] = {
            [2] = {
                [1] = 10,
                [2] = "调用频繁，请稍后尝试！",
            },
        },
        ["Player.GetHorseRealID"] = {
            [3] = "LuaApi3_Player_GetHorseRealID",
        },
        ["Player.GetPersonInfo"] = {
            [2] = {
                [1] = 5,
                [2] = "调用频繁，请稍后尝试！",
            },
            [3] = "LuaApi3_Player_GetPersonInfo",
        },
        ["Player.GetPlayerCostStatic"] = {
            [2] = {
                [1] = 5,
                [2] = "",
            },
        },
        ["Player.GetSkinSeatInfos"] = {
            [3] = "LuaApi3_Player_GetSkinSeatInfos",
        },
        ["Player.GetSkinlist"] = {
            [3] = "LuaApi3_Player_GetSkinlist",
        },
        ["Player.GetVisibleRange"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.GunGetMagazine"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.HasHandheldGun"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.OpenActView"] = {
            [3] = "trigger_api_MiraclesEventsPage",
        },
        ["Player.OpenFriendChatPage"] = {
            [3] = "trigger_api_SendGiftsToFriends",
        },
        ["Player.OpenMiniShopItemPage"] = {
            [3] = "LuaApi3_Player_OpenMiniShopItemPage",
        },
        ["Player.OpenMiniShopPage"] = {
            [3] = "LuaApi3_Player_OpenMiniShopPage",
        },
        ["Player.OpenMiniShopWarehousePage"] = {
            [3] = "LuaApi3_Player_OpenMiniShopWarehousePage",
        },
        ["Player.OpenShopGiveGiftView"] = {
            [3] = "trigger_api_SendGiftsToFriends",
        },
        ["Player.OpenShopSkinBuyDialog"] = {
            [3] = "trigger_api_SkinTrialShop",
        },
        ["Player.OpenShopTryOnView"] = {
            [3] = "trigger_api_SkinTrialShop",
        },
        ["Player.PlayAdvertising"] = {
            [2] = {
                [1] = 90,
                [2] = "调用频繁，请稍后尝试！",
            },
        },
        ["Player.RequestCostCoin"] = {
            [2] = {
                [1] = 3,
                [2] = "",
            },
        },
        ["Player.SendFriendApply"] = {
            [2] = {
                [1] = 10,
                [2] = "",
            },
        },
        ["Player.SetCameraShake"] = {
            [3] = "LuaApi3_Player_SetCameraShake",
        },
        ["Player.SetCrawl"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Player.SetVisibleRange"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["Trigger.TransmitToCategoryRoom"] = {
            [3] = "trigger_api3_MapTagTransfer",
            [4] = 30,
        },
        ["World.AddGameTimes"] = {
            [3] = "LuaApi3_World_AddGameTimes",
        },
        ["World.FindNearActorListByObjType"] = {
            [3] = "LuaApi3_InternalApi",
        },
        ["World.SetChunkRectAlwaysLoaded"] = {
            [3] = "LuaApi3_World_SetChunkRectAlwaysLoaded",
        },
    },
    ["modServices"] = {
        ["Actor"] = {
        },
        ["Area"] = {
        },
        ["Backpack"] = {
        },
        ["Biome"] = {
        },
        ["Block"] = {
        },
        ["Buff"] = {
        },
        ["Chat"] = {
        },
        ["ClientPositive"] = {
        },
        ["CloudSever"] = {
        },
        ["CustomUI"] = {
        },
        ["Data"] = {
            ["Array"] = {
            },
            ["Map"] = {
            },
            ["Table"] = {
            },
        },
        ["Game"] = {
        },
        ["GameEffect"] = {
        },
        ["GameObject"] = {
        },
        ["GameRule"] = {
        },
        ["Graphics"] = {
        },
        ["Item"] = {
        },
        ["Listen"] = {
        },
        ["Log"] = {
        },
        ["Mod"] = {
        },
        ["Monster"] = {
        },
        ["ObjectLib"] = {
        },
        ["OfficeUtils"] = {
        },
        ["Planet"] = {
        },
        ["Player"] = {
        },
        ["Status"] = {
        },
        ["Task"] = {
        },
        ["Team"] = {
        },
        ["Timeline"] = {
        },
        ["Timer"] = {
        },
        ["Trigger"] = {
            ["Actor"] = {
            },
            ["Area"] = {
            },
            ["ArrayTmp"] = {
            },
            ["Backpack"] = {
            },
            ["Block"] = {
            },
            ["Buff"] = {
            },
            ["Component"] = {
            },
            ["CustomUI"] = {
            },
            ["GameObject"] = {
            },
            ["Graphics"] = {
            },
            ["Item"] = {
            },
            ["KvMap"] = {
            },
            ["Math"] = {
            },
            ["Monster"] = {
            },
            ["Player"] = {
            },
            ["Timeline"] = {
            },
            ["World"] = {
            },
        },
        ["World"] = {
        },
        ["WorldContainer"] = {
        },
    },
    ["scriptEnum"] = {
        ["AdaptiveJoin"] = {
            ["isOfficial"] = true,
        },
        ["Aggro"] = {
            ["isOfficial"] = true,
        },
        ["AutoSprinklerBlock"] = {
            ["isOfficial"] = true,
        },
        ["BackpackComponent"] = {
            ["isOfficial"] = true,
        },
        ["BlockEdit"] = {
            ["isOfficial"] = true,
        },
        ["BlockStateEdit"] = {
            ["isOfficial"] = true,
        },
        ["BoxRefresh"] = {
            ["isOfficial"] = true,
        },
        ["Chest"] = {
            ["isOfficial"] = true,
        },
        ["CityGen"] = {
            ["isOfficial"] = true,
        },
        ["Collider"] = {
            ["isOfficial"] = true,
        },
        ["CommonBlockPlace"] = {
            ["isOfficial"] = true,
        },
        ["CraftingEdit"] = {
            ["isOfficial"] = true,
        },
        ["Cropblock"] = {
            ["isOfficial"] = true,
        },
        ["DoExplodeStatus"] = {
            ["isOfficial"] = true,
        },
        ["DoHarmStatus"] = {
            ["isOfficial"] = true,
        },
        ["Door"] = {
            ["isOfficial"] = true,
        },
        ["EmitterEdit"] = {
            ["isOfficial"] = true,
        },
        ["EquipEdit"] = {
            ["isOfficial"] = true,
        },
        ["Feed"] = {
            ["isOfficial"] = true,
        },
        ["Fight"] = {
            ["isOfficial"] = true,
        },
        ["FoodEdit"] = {
            ["isOfficial"] = true,
        },
        ["FurnaceEdit"] = {
            ["isOfficial"] = true,
        },
        ["GenerateBlock"] = {
            ["isOfficial"] = true,
        },
        ["Grow"] = {
            ["isOfficial"] = true,
        },
        ["GunEdit"] = {
            ["isOfficial"] = true,
        },
        ["ItemEdit"] = {
            ["isOfficial"] = true,
        },
        ["LaunchProjectileStatus"] = {
            ["isOfficial"] = true,
        },
        ["LightingFurniture"] = {
            ["isOfficial"] = true,
        },
        ["Model"] = {
            ["isOfficial"] = true,
        },
        ["MonsterEdit"] = {
            ["isOfficial"] = true,
        },
        ["MotionGroup"] = {
            ["isOfficial"] = true,
        },
        ["NPCShop"] = {
            ["isOfficial"] = true,
        },
        ["NewCommonBlockPlace"] = {
            ["isOfficial"] = true,
        },
        ["OldGunEdit"] = {
            ["isOfficial"] = true,
        },
        ["PackEdit"] = {
            ["isOfficial"] = true,
        },
        ["Physics"] = {
            ["isOfficial"] = true,
        },
        ["PlanetAurora"] = {
            ["isOfficial"] = true,
        },
        ["PlanetBaseEnvSetting"] = {
            ["isOfficial"] = true,
        },
        ["PlanetMeteorShower"] = {
            ["isOfficial"] = true,
        },
        ["PlanetStationSetting"] = {
            ["isOfficial"] = true,
        },
        ["Plant"] = {
            ["isOfficial"] = true,
        },
        ["PlayerController"] = {
            ["isOfficial"] = true,
        },
        ["Projectile"] = {
            ["isOfficial"] = true,
        },
        ["ProjectileEdit"] = {
            ["isOfficial"] = true,
        },
        ["RandomAddStatus"] = {
            ["isOfficial"] = true,
        },
        ["RandomChestBlock"] = {
            ["isOfficial"] = true,
        },
        ["RecoverStatus"] = {
            ["isOfficial"] = true,
        },
        ["Reproduction"] = {
            ["isOfficial"] = true,
        },
        ["Ride"] = {
            ["isOfficial"] = true,
        },
        ["Roadblock"] = {
            ["isOfficial"] = true,
        },
        ["ShapeStitch"] = {
            ["isOfficial"] = true,
        },
        ["SkillTrapBlock"] = {
            ["isOfficial"] = true,
        },
        ["Sound"] = {
            ["isOfficial"] = true,
        },
        ["StatusEdit"] = {
            ["isOfficial"] = true,
        },
        ["SurviveComponent"] = {
            ["isOfficial"] = true,
        },
        ["Tame"] = {
            ["isOfficial"] = true,
        },
        ["ToolEdit"] = {
            ["isOfficial"] = true,
        },
        ["TransToPos"] = {
            ["isOfficial"] = true,
        },
        ["UIProjectSet"] = {
            ["isOfficial"] = true,
        },
        ["UseEdit"] = {
            ["isOfficial"] = true,
        },
        ["Villager"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleBaseSetting"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleCloudSetting"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleFightSetting"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleHUDUI"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleRebirth"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleSceneUI"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleSound"] = {
            ["isOfficial"] = true,
        },
        ["WorldRuleStartMode"] = {
            ["isOfficial"] = true,
        },
    },
    ["scriptEnvList"] = {
        ["AgentOfficialEnv"] = {
            ["hasEnv"] = true,
            ["hasGData"] = true,
            ["hasScriptEnv"] = true,
        },
        ["AgentOfficialEnv_3"] = {
            ["evnType"] = 3,
            ["hasEnv"] = true,
            ["hasGData"] = true,
            ["hasScriptEnv"] = true,
        },
        ["map"] = {
            ["hasEnv"] = true,
            ["hasGData"] = true,
            ["hasScriptEnv"] = true,
        },
    },
}
