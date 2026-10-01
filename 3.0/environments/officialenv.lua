-- ============================================================================
-- Mini World UGC environment export
-- format: mwenviron/1   generator: dump_env.lua 1.0.0
-- face: official
-- game: 1.59.0
-- generated: 2026-10-01 22:13:55
-- stats: tables=1567 functions=2435 refs=208 userdata=0 unresolved=0 truncated=0 maxdepth=7 bytes=604323
-- exported by: ReYueY1ng
-- source url: https://github.com/ReYueY1ng/miniworld-scripts/3.0/environments
-- licensed under: CC BY 4.0
-- ============================================================================
---@meta
return {
    ["$meta"] = {
        ["__index"] = {
            ["$meta"] = {
                ["__index"] = {
                },
                ["__metatable"] = "read only",
            },
            ["ABSOLUTECAMPTYPE"] = {
                ["ANY"] = 999,
                ["ENEMY"] = 201,
                ["NOTEAM"] = 0,
                ["PASSIVE"] = 202,
                ["TEAM_1"] = 1,
                ["TEAM_2"] = 2,
                ["TEAM_3"] = 3,
                ["TEAM_4"] = 4,
                ["TEAM_5"] = 5,
                ["TEAM_6"] = 6,
                ["TEAM_NPC1"] = 101,
                ["TEAM_NPC2"] = 102,
                ["TEAM_NPC3"] = 103,
            },
            ["Ability"] = {
                ["Attack"] = 26,
                ["Break"] = 16,
                ["CanBePickup"] = 32,
                ["CanUseItemWhenBePickup"] = 33,
                ["Cube"] = 1001,
                ["Drop"] = 22,
                ["EnableBeattacked"] = 100001,
                ["EnableBekilled"] = 100002,
                ["EnableDeathdropitem"] = 100003,
                ["EnableInputRotate"] = 200003,
                ["EnableRotatingCamera"] = 200002,
                ["EnableSwitchShortcut"] = 200001,
                ["Flying"] = 1,
                ["Interaction"] = 14,
                ["Item"] = 1002,
                ["Jumping"] = 6,
                ["Movement"] = 1000,
                ["Pick"] = 21,
                ["Place"] = 15,
                ["Sneaking"] = 3,
                ["Sprinting"] = 4,
                ["Swimming"] = 2,
                ["Use"] = 20,
                ["Walking"] = 0,
            },
            ["AbsoluteCampType"] = {
                ["Enemy"] = 201,
                ["Noteam"] = 0,
                ["Passive"] = 202,
                ["Team1"] = 1,
                ["Team2"] = 2,
                ["Team3"] = 3,
                ["Team4"] = 4,
                ["Team5"] = 5,
                ["Team6"] = 6,
                ["TeamNpc1"] = 101,
                ["TeamNpc2"] = 102,
                ["TeamNpc3"] = 103,
            },
            ["Actor"] = {
                ["ActorHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Actor.ActorHurt; @mtype Normal]]
                ["ActorHurtArea"] = function(self, objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end, --[[@service Actor.ActorHurtArea; @mtype Normal]]
                ["AddHp"] = function(self, objid, hp) end, --[[@service Actor.AddHp; @mtype Normal]]
                ["AddModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Actor.AddModAttrib; @mtype Normal]]
                ["AddTags"] = function(self, objid, tags, icount) end, --[[@service Actor.AddTags; @mtype Normal]]
                ["AppendSpeed"] = function(self, objid, vx, vy, vz) end, --[[@service Actor.AppendSpeed; @mtype Normal]]
                ["ChangActorMoveType"] = function(self, objid, moveMode) end, --[[@service Actor.ChangActorMoveType; @mtype Normal]]
                ["ChangeCustomModel"] = function(self, objid, modleName) end, --[[@service Actor.ChangeCustomModel; @mtype Normal]]
                ["ClearActorWithId"] = function(self, actorid, bkill, worldId) end, --[[@service Actor.ClearActorWithId; @mtype Normal]]
                ["ClearTags"] = function(self, objid) end, --[[@service Actor.ClearTags; @mtype Normal]]
                ["CompareMainModel"] = function(self, facade1, facade2) end, --[[@service Actor.CompareMainModel; @mtype Normal]]
                ["DisMountActor"] = function(self, objid) end, --[[@service Actor.DisMountActor; @mtype Normal]]
                ["DropActor"] = function(self, objid, dir, isThrow, speed, hasInertance) end, --[[@service Actor.DropActor; @mtype Normal]]
                ["EmitByShooter"] = function(self, objid, emitid) end, --[[@service Actor.EmitByShooter; @mtype Normal]]
                ["EmitByShooterTarget"] = function(self, objidA, emitid, objidB) end, --[[@service Actor.EmitByShooterTarget; @mtype Normal]]
                ["EmitByShooterTargetPos"] = function(self, objid, emitid, targetPos) end, --[[@service Actor.EmitByShooterTargetPos; @mtype Normal]]
                ["EscapePickup"] = function(self, objid) end, --[[@service Actor.EscapePickup; @mtype Normal]]
                ["FindLevelNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Actor.FindLevelNearestBlock; @mtype Normal]]
                ["FindLevelRandomsortBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Actor.FindLevelRandomsortBlock; @mtype Normal]]
                ["FindNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Actor.FindNearestBlock; @mtype Normal]]
                ["GetActionAttrState"] = function(self, objid, actionattr) end, --[[@service Actor.GetActionAttrState; @mtype Normal]]
                ["GetActorDir"] = function(self, objid, itype) end, --[[@service Actor.GetActorDir; @mtype Normal]]
                ["GetActorFacade"] = function(self, objid, bhasequip) end, --[[@service Actor.GetActorFacade; @mtype Normal]]
                ["GetActorMovementMode"] = function(self, objid) end, --[[@service Actor.GetActorMovementMode; @mtype Normal]]
                ["GetActorPermissions"] = function(self, objid, ability) end, --[[@service Actor.GetActorPermissions; @mtype Normal]]
                ["GetAttr"] = function(self, objid, atttype) end, --[[@service Actor.GetAttr; @mtype Normal]]
                ["GetBodySize"] = function(self, objid, bodySizeType) end, --[[@service Actor.GetBodySize; @mtype Normal]]
                ["GetBoundSzie"] = function(self, objid) end, --[[@service Actor.GetBoundSzie; @mtype Normal]]
                ["GetBtreeVarValue"] = function(self, objid, varid) end, --[[@service Actor.GetBtreeVarValue; @mtype Normal]]
                ["GetChargingMaxNum"] = function(self, objid, slot) end, --[[@service Actor.GetChargingMaxNum; @mtype Normal]]
                ["GetChargingMaxTime"] = function(self, objid, slot) end, --[[@service Actor.GetChargingMaxTime; @mtype Normal]]
                ["GetChargingNum"] = function(self, objid, slot) end, --[[@service Actor.GetChargingNum; @mtype Normal]]
                ["GetChargingTime"] = function(self, objid, slot) end, --[[@service Actor.GetChargingTime; @mtype Normal]]
                ["GetCmpBaseState"] = function(self, objid, actionattr) end, --[[@service Actor.GetCmpBaseState; @mtype Normal]]
                ["GetCurMapId"] = function(self, objid) end, --[[@service Actor.GetCurMapId; @mtype Normal]]
                ["GetCurrMapId"] = function(self, objid) end, --[[@service Actor.GetCurrMapId; @mtype Normal]]
                ["GetDefID"] = function(self, objid) end, --[[@service Actor.GetDefID; @mtype Normal]]
                ["GetDropItemInstanceId"] = function(self, objid) end, --[[@service Actor.GetDropItemInstanceId; @mtype Normal]]
                ["GetDropItemNum"] = function(self, objid) end, --[[@service Actor.GetDropItemNum; @mtype Normal]]
                ["GetEntityFacade"] = function(self, prefab) end, --[[@service Actor.GetEntityFacade; @mtype Normal]]
                ["GetEyeHeight"] = function(self, objid) end, --[[@service Actor.GetEyeHeight; @mtype Normal]]
                ["GetFaceDirection"] = function(self, objid) end, --[[@service Actor.GetFaceDirection; @mtype Normal]]
                ["GetFacePitch"] = function(self, objid) end, --[[@service Actor.GetFacePitch; @mtype Normal]]
                ["GetFaceYaw"] = function(self, objid) end, --[[@service Actor.GetFaceYaw; @mtype Normal]]
                ["GetGunInfo"] = function(self, objid) end, --[[@service Actor.GetGunInfo; @mtype Normal]]
                ["GetItemId"] = function(self, objid) end, --[[@service Actor.GetItemId; @mtype Normal]]
                ["GetLastFallSpeed"] = function(self, objid) end, --[[@service Actor.GetLastFallSpeed; @mtype Normal]]
                ["GetLevelMode"] = function(self) end, --[[@service Actor.GetLevelMode; @mtype Normal]]
                ["GetMainModel"] = function(self, facade) end, --[[@service Actor.GetMainModel; @mtype Normal]]
                ["GetMaxHP"] = function(self, objid) end, --[[@service Actor.GetMaxHP; @mtype Normal]]
                ["GetMotion"] = function(self, objid) end, --[[@service Actor.GetMotion; @mtype Normal]]
                ["GetNickName"] = function(self, objid) end, --[[@service Actor.GetNickName; @mtype Normal]]
                ["GetObjType"] = function(self, objid) end, --[[@service Actor.GetObjType; @mtype Normal]]
                ["GetObjWorldId"] = function(self, objid) end, --[[@service Actor.GetObjWorldId; @mtype Normal]]
                ["GetOrientation"] = function(self, objid) end, --[[@service Actor.GetOrientation; @mtype Normal]]
                ["GetOverlayGravity"] = function(self, objid) end, --[[@service Actor.GetOverlayGravity; @mtype Normal]]
                ["GetPickupObjID"] = function(self, objid, roleType) end, --[[@service Actor.GetPickupObjID; @mtype Normal]]
                ["GetPosition"] = function(self, objid) end, --[[@service Actor.GetPosition; @mtype Normal]]
                ["GetRidingActorObjId"] = function(self, objid) end, --[[@service Actor.GetRidingActorObjId; @mtype Normal]]
                ["GetSkillCD"] = function(self, objid, slot) end, --[[@service Actor.GetSkillCD; @mtype Normal]]
                ["GetSkillMaxCD"] = function(self, objid, slot) end, --[[@service Actor.GetSkillMaxCD; @mtype Normal]]
                ["GetTags"] = function(self, objid) end, --[[@service Actor.GetTags; @mtype Normal]]
                ["GetTeam"] = function(self, objid) end, --[[@service Actor.GetTeam; @mtype Normal]]
                ["HasActor"] = function(self, objid) end, --[[@service Actor.HasActor; @mtype Normal]]
                ["HasTags"] = function(self, objid, tags, mathcmode, bexactmatch) end, --[[@service Actor.HasTags; @mtype Normal]]
                ["IncreasesAttr"] = function(self, objid, atttype, val) end, --[[@service Actor.IncreasesAttr; @mtype Normal]]
                ["InitTriggerGlobalData"] = function(self) end, --[[@service Actor.InitTriggerGlobalData; @mtype Normal]]
                ["IsExist"] = function(self, objid) end, --[[@service Actor.IsExist; @mtype Normal]]
                ["IsHaveSkill"] = function(self, objid, slot) end, --[[@service Actor.IsHaveSkill; @mtype Normal]]
                ["IsMob"] = function(self, objid) end, --[[@service Actor.IsMob; @mtype Normal]]
                ["IsPlayer"] = function(self, objid) end, --[[@service Actor.IsPlayer; @mtype Normal]]
                ["Jump"] = function(self, objid) end, --[[@service Actor.Jump; @mtype Normal]]
                ["KillSelf"] = function(self, objid) end, --[[@service Actor.KillSelf; @mtype Normal]]
                ["MountActor"] = function(self, objid, rideobjid, isContrl, isCloseAI) end, --[[@service Actor.MountActor; @mtype Normal]]
                ["OrganizeFacadeList"] = function(self) end, --[[@service Actor.OrganizeFacadeList; @mtype Normal]]
                ["PauseSoundEffectById"] = function(self, objid, soundId, pause) end, --[[@service Actor.PauseSoundEffectById; @mtype Normal]]
                ["PickupActor"] = function(self, objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end, --[[@service Actor.PickupActor; @mtype Normal]]
                ["PickupItem"] = function(self, objid, itemobjid, bforcepickup) end, --[[@service Actor.PickupItem; @mtype Normal]]
                ["PlayAct"] = function(self, objid, actid) end, --[[@service Actor.PlayAct; @mtype Normal]]
                ["PlayAnim"] = function(self, objid, animid, speed, loop) end, --[[@service Actor.PlayAnim; @mtype Normal]]
                ["PlayAnimById"] = function(self, objid, animid, inputloopmode, playLayer, crossfade) end, --[[@service Actor.PlayAnimById; @mtype Normal]]
                ["PlayAnimByObj"] = function(self, objidA, objidB, breplay) end, --[[@service Actor.PlayAnimByObj; @mtype BoardCast]]
                ["PlayBodyEffect"] = function(self, objid, itype) end, --[[@service Actor.PlayBodyEffect; @mtype Normal]]
                ["PlayBodyEffectByFile"] = function(self, objid, filename, sync) end, --[[@service Actor.PlayBodyEffectByFile; @mtype Normal]]
                ["PlayBodyEffectById"] = function(self, objid, particleId, scale, ptme) end, --[[@service Actor.PlayBodyEffectById; @mtype Normal]]
                ["PlayBodyParticleById"] = function(self, objid, particleId, ptme, offset, rot, scale) end, --[[@service Actor.PlayBodyParticleById; @mtype Normal]]
                ["PlayHandAnim"] = function(self, objid, animid, speed, loop) end, --[[@service Actor.PlayHandAnim; @mtype Normal]]
                ["PlaySkill"] = function(self, objid, slot) end, --[[@service Actor.PlaySkill; @mtype Normal]]
                ["PlaySoundByName"] = function(self, objid, name, volume, pitch, flag) end, --[[@service Actor.PlaySoundByName; @mtype Normal]]
                ["PlaySoundEffectById"] = function(self, objid, soundId, volume, pitch, isLoop) end, --[[@service Actor.PlaySoundEffectById; @mtype Normal]]
                ["PlayerHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Actor.PlayerHurt; @mtype Normal]]
                ["RandomFacadeID"] = function(self) end, --[[@service Actor.RandomFacadeID; @mtype Normal]]
                ["RecoverinitialModel"] = function(self, ishost, objid) end, --[[@service Actor.RecoverinitialModel; @mtype HostAndClient]]
                ["RemoveTags"] = function(self, objid, tags, icount) end, --[[@service Actor.RemoveTags; @mtype Normal]]
                ["RotateFaceToActor"] = function(self, objid, targetid) end, --[[@service Actor.RotateFaceToActor; @mtype Normal]]
                ["SetAblePick"] = function(self, objid, able) end, --[[@service Actor.SetAblePick; @mtype Normal]]
                ["SetActionAttrState"] = function(self, objid, actionattr, switch) end, --[[@service Actor.SetActionAttrState; @mtype Normal]]
                ["SetActorControl"] = function(self, objid, b) end, --[[@service Actor.SetActorControl; @mtype BoardCast]]
                ["SetActorDir"] = function(self, objid, itype, value) end, --[[@service Actor.SetActorDir; @mtype Normal]]
                ["SetActorPermissions"] = function(self, objid, ability, switch) end, --[[@service Actor.SetActorPermissions; @mtype Normal]]
                ["SetAttr"] = function(self, objid, atttype, val) end, --[[@service Actor.SetAttr; @mtype Normal]]
                ["SetBeHurtTarget"] = function(self, objid, targetid) end, --[[@service Actor.SetBeHurtTarget; @mtype Normal]]
                ["SetBehitDisable"] = function(self, objid, value) end, --[[@service Actor.SetBehitDisable; @mtype Normal]]
                ["SetBodyEffectScale"] = function(self, objid, particleId, scale) end, --[[@service Actor.SetBodyEffectScale; @mtype Normal]]
                ["SetBodyEffectScaleByFile"] = function(self, objid, filename, scale) end, --[[@service Actor.SetBodyEffectScaleByFile; @mtype Normal]]
                ["SetBodyParticleTransform"] = function(self, objid, particleId, offset, rot, scale) end, --[[@service Actor.SetBodyParticleTransform; @mtype Normal]]
                ["SetBtreeVarValue"] = function(self, objid, varid, val) end, --[[@service Actor.SetBtreeVarValue; @mtype Normal]]
                ["SetCanCollide"] = function(self, objid, value) end, --[[@service Actor.SetCanCollide; @mtype Normal]]
                ["SetCharging"] = function(self, objid, slot, ischarging) end, --[[@service Actor.SetCharging; @mtype Normal]]
                ["SetChargingValue"] = function(self, objid, slot, value) end, --[[@service Actor.SetChargingValue; @mtype Normal]]
                ["SetCharginginfo"] = function(self, objid, slot, max, num, maxnum, isauto) end, --[[@service Actor.SetCharginginfo; @mtype Normal]]
                ["SetCmpBaseState"] = function(self, objid, actionattr, switch) end, --[[@service Actor.SetCmpBaseState; @mtype Normal]]
                ["SetFaceDirection"] = function(self, objid, x, y, z) end, --[[@service Actor.SetFaceDirection; @mtype Normal]]
                ["SetFacePitch"] = function(self, objid, pitch) end, --[[@service Actor.SetFacePitch; @mtype Normal]]
                ["SetFaceYaw"] = function(self, objid, yaw) end, --[[@service Actor.SetFaceYaw; @mtype Normal]]
                ["SetFirstSearch"] = function(self, objid, firstsearch) end, --[[@service Actor.SetFirstSearch; @mtype Normal]]
                ["SetImmuneType"] = function(self, objid, immunetype, isadd) end, --[[@service Actor.SetImmuneType; @mtype Normal]]
                ["SetModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Actor.SetModAttrib; @mtype Normal]]
                ["SetMotionChange"] = function(self, objid, x, y, z) end, --[[@service Actor.SetMotionChange; @mtype Normal]]
                ["SetMountActorAttr"] = function(self, objid, isRote, isPlayerContrl, isCloseAI) end, --[[@service Actor.SetMountActorAttr; @mtype Normal]]
                ["SetNickName"] = function(self, objid, nickname) end, --[[@service Actor.SetNickName; @mtype Normal]]
                ["SetOrientation"] = function(self, objid, x, y, z) end, --[[@service Actor.SetOrientation; @mtype Normal]]
                ["SetOverlayGravity"] = function(self, objid, val) end, --[[@service Actor.SetOverlayGravity; @mtype BoardCast]]
                ["SetPosition"] = function(self, objid, x, y, z) end, --[[@service Actor.SetPosition; @mtype Normal]]
                ["SetRidePosition"] = function(self, objid, x, y, z) end, --[[@service Actor.SetRidePosition; @mtype Normal]]
                ["SetScale"] = function(self, objid, x, y, z) end, --[[@service Actor.SetScale; @mtype Normal]]
                ["SetSkillCD"] = function(self, objid, slot, cd) end, --[[@service Actor.SetSkillCD; @mtype Normal]]
                ["SetSkillCDInfo"] = function(self, objid, slot, maxcd, isauto) end, --[[@service Actor.SetSkillCDInfo; @mtype Normal]]
                ["SetTeam"] = function(self, objid, teamid, bResetAttr) end, --[[@service Actor.SetTeam; @mtype Normal]]
                ["ShowNickName"] = function(self, objid, bshow) end, --[[@service Actor.ShowNickName; @mtype BoardCast]]
                ["SkillIsCharging"] = function(self, objid, slot) end, --[[@service Actor.SkillIsCharging; @mtype Normal]]
                ["StopAllAnim"] = function(self, objid) end, --[[@service Actor.StopAllAnim; @mtype Normal]]
                ["StopBodyEffect"] = function(self, objid, itype) end, --[[@service Actor.StopBodyEffect; @mtype Normal]]
                ["StopBodyEffectById"] = function(self, objid, particleId) end, --[[@service Actor.StopBodyEffectById; @mtype Normal]]
                ["StopSoundEffectById"] = function(self, objid, soundId) end, --[[@service Actor.StopSoundEffectById; @mtype Normal]]
                ["TriggerAttrChangeEvent"] = function(self, objid, atttype, val) end, --[[@service Actor.TriggerAttrChangeEvent; @mtype Normal]]
                ["TriggerSkillCall"] = function(self, objid, skillName, growPatchName) end, --[[@service Actor.TriggerSkillCall; @mtype Normal]]
                ["TryMoveToActor"] = function(self, objid, targetObjid, speed) end, --[[@service Actor.TryMoveToActor; @mtype Normal]]
                ["TryMoveToNoSearch"] = function(self, objid, x, y, z) end, --[[@service Actor.TryMoveToNoSearch; @mtype Normal]]
                ["TryMoveToPos"] = function(self, objid, x, y, z, cancontrol, bshowtip) end, --[[@service Actor.TryMoveToPos; @mtype Normal]]
                ["TryPickupActorForward"] = function(self, objid, distance) end, --[[@service Actor.TryPickupActorForward; @mtype Normal]]
                ["WhitList_StopSkill"] = function(self, objid, skillid) end, --[[@service Actor.WhitList_StopSkill; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
            },
            ["ActorBodyEffect"] = {
                ["Accumfire"] = 3,
                ["AiAngry"] = 27,
                ["AiHungry"] = 36,
                ["AiNeedreeds"] = 10,
                ["AiSleep"] = 28,
                ["BallCharge"] = 37,
                ["BallShoot"] = 38,
                ["Conceal"] = 31,
                ["Dance"] = 21,
                ["DeadProtect"] = 14,
                ["Disappear"] = 19,
                ["Dizzy"] = 33,
                ["DragonDie0"] = 15,
                ["DragonDie1"] = 16,
                ["DragonDie2"] = 17,
                ["Dragonfire"] = 4,
                ["Dragonsummon"] = 5,
                ["EnchFall"] = 39,
                ["Fear"] = 11,
                ["Fire"] = 1,
                ["Forbidden"] = 30,
                ["Headshot"] = 24,
                ["HorseBenteng"] = 20,
                ["HorseFly"] = 18,
                ["Hurt"] = 0,
                ["Interaction"] = 23,
                ["Jetpack2"] = 22,
                ["MakeTrouble"] = 34,
                ["Milking"] = 26,
                ["Normalshot"] = 25,
                ["Portal"] = 2,
                ["RoleCollect"] = 12,
                ["RoleJump"] = 13,
                ["TameFailed"] = 7,
                ["TameFood"] = 8,
                ["TameNofood"] = 9,
                ["TameSucceed"] = 6,
                ["TrainMove"] = 35,
                ["Transport"] = 29,
                ["WeaponFire"] = 32,
            },
            ["AdaptiveJoin"] = {
                ["ModeType"] = {
                    ["$meta"] = {
                        ["__index"] = {
                            ["$meta"] = {
                                ["__call"] = function(cls, ...) end, --[[@lua]]
                            },
                            ["GetDef"] = function(self) end, --[[@lua]]
                            ["GetDefault"] = function(self) end, --[[@lua]]
                            ["GetDes"] = function(self, key) end, --[[@lua]]
                            ["GetSort"] = function(self, key) end, --[[@lua]]
                            ["Init"] = function(self, tab) end, --[[@lua]]
                            ["IsValue"] = function(self, value) end, --[[@lua]]
                            ["Serialize"] = function(value) end, --[[@lua]]
                            ["ToTable"] = function(self) end, --[[@lua]]
                            ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                            ["UnSerialize"] = function(value) end, --[[@lua]]
                            ["__className_"] = "Enum",
                        },
                    },
                    ["HorizontalJoin"] = 1,
                    ["WallDecoration"] = 2,
                    ["__info"] = {
                        ["HorizontalJoin"] = {
                            ["name"] = "水平拼接",
                            ["sort"] = 1,
                        },
                        ["WallDecoration"] = {
                            ["name"] = "墙壁装饰",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["Aggro"] = {
                ["CampRelation"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CAMP_RELATION_ANY"] = 999,
                    ["CAMP_RELATION_ENEMY"] = 2,
                    ["CAMP_RELATION_FRIENDLY"] = 1,
                    ["CAMP_RELATION_NATURE"] = 3,
                    ["__info"] = {
                        ["CAMP_RELATION_ANY"] = {
                            ["name"] = "任何",
                            ["sort"] = 1,
                        },
                        ["CAMP_RELATION_ENEMY"] = {
                            ["name"] = "敌方",
                            ["sort"] = 3,
                        },
                        ["CAMP_RELATION_FRIENDLY"] = {
                            ["name"] = "友方",
                            ["sort"] = 2,
                        },
                        ["CAMP_RELATION_NATURE"] = {
                            ["name"] = "中立",
                            ["sort"] = 4,
                        },
                    },
                },
                ["SearchRangeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["RANGE_BEHIND"] = 3,
                    ["RANGE_FRONT"] = 2,
                    ["RANGE_ROUND"] = 1,
                    ["__info"] = {
                        ["RANGE_BEHIND"] = {
                            ["name"] = "后面",
                            ["sort"] = 3,
                        },
                        ["RANGE_FRONT"] = {
                            ["name"] = "前面",
                            ["sort"] = 2,
                        },
                        ["RANGE_ROUND"] = {
                            ["name"] = "周围",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["AliveState"] = {
                ["Alive"] = 1,
                ["All"] = -1,
                ["Dead"] = 0,
            },
            ["AnimMode"] = {
                ["Default"] = 3,
                ["Loop"] = 0,
                ["Once"] = 1,
                ["OnceStop"] = 2,
            },
            ["Area"] = {
                ["BlockInArea"] = function(self, areaid, blockid) end, --[[@service Area.BlockInArea; @mtype Normal]]
                ["BlockInAreaRange"] = function(self, blockid, posbeg, posend, worldId) end, --[[@service Area.BlockInAreaRange; @mtype Normal]]
                ["CheckRangeCanPlace"] = function(self, posbeg, posend, blockid, worldId) end, --[[@service Area.CheckRangeCanPlace; @mtype Normal]]
                ["ClearAllBlock"] = function(self, areaid, blockid, num, btriggerevent) end, --[[@service Area.ClearAllBlock; @mtype Normal]]
                ["ClearAllBlockAreaRange"] = function(self, posbeg, posend, blockid, btriggerevent, worldId) end, --[[@service Area.ClearAllBlockAreaRange; @mtype Normal]]
                ["CloneAreaBlock"] = function(self, areaid, pos) end, --[[@service Area.CloneAreaBlock; @mtype Normal]]
                ["CloneAreaRange"] = function(self, posbeg, posend, deststartpos, itype, worldId) end, --[[@service Area.CloneAreaRange; @mtype Normal]]
                ["CreateAreaPrefab"] = function(self, pos, size, worldId) end, --[[@service Area.CreateAreaPrefab; @mtype Normal]]
                ["CreateAreaRect"] = function(self, pos, dim, btmp, worldId) end, --[[@service Area.CreateAreaRect; @mtype Normal]]
                ["CreateAreaRectByLen"] = function(self, pos, lenx, leny, lenz, worldId) end, --[[@service Area.CreateAreaRectByLen; @mtype Normal]]
                ["CreateAreaRectByRange"] = function(self, posBeg, posEnd, btmp, worldId) end, --[[@service Area.CreateAreaRectByRange; @mtype Normal]]
                ["DestroyAllBlock"] = function(self, areaid, blockid, n, candrop, btriggerevent) end, --[[@service Area.DestroyAllBlock; @mtype Normal]]
                ["DestroyArea"] = function(self, areaid) end, --[[@service Area.DestroyArea; @mtype Normal]]
                ["DestroyBlockAreaRange"] = function(self, posbeg, posend, blockid, n, candrop, btriggerevent, worldId) end, --[[@service Area.DestroyBlockAreaRange; @mtype Normal]]
                ["DestroyRangeBlock"] = function(self, posbeg, posend, blockid, n, dropCount, btriggerevent, worldId) end, --[[@service Area.DestroyRangeBlock; @mtype Normal]]
                ["ExpandArea"] = function(self, areaid, x, y, z) end, --[[@service Area.ExpandArea; @mtype Normal]]
                ["FillBlockAreaRange"] = function(self, posbeg, posend, blockid, face, color, switch, filltype, worldId) end, --[[@service Area.FillBlockAreaRange; @mtype Normal]]
                ["GetActorsByTags"] = function(self, posbeg, posend, tags, actortype, mathcmode, bexactmatch, worldId) end, --[[@service Area.GetActorsByTags; @mtype Normal]]
                ["GetAllCreaturesInAreaRange"] = function(self, posbeg, posend, worldId) end, --[[@service Area.GetAllCreaturesInAreaRange; @mtype Normal]]
                ["GetAllObjsInAreaRangByTypes"] = function(self, posbeg, posend, objtypeidxs) end, --[[@service Area.GetAllObjsInAreaRangByTypes; @mtype Normal]]
                ["GetAllObjsInAreaRange"] = function(self, posbeg, posend, objtype, worldId) end, --[[@service Area.GetAllObjsInAreaRange; @mtype Normal]]
                ["GetAllObjsInAreaRangeByObjTypes"] = function(self, posbeg, posend, objtypes, worldId) end, --[[@service Area.GetAllObjsInAreaRangeByObjTypes; @mtype Normal]]
                ["GetAllPlayersInAreaRange"] = function(self, posbeg, posend, worldId) end, --[[@service Area.GetAllPlayersInAreaRange; @mtype Normal]]
                ["GetAreaBlockTypes"] = function(self, areaid) end, --[[@service Area.GetAreaBlockTypes; @mtype Normal]]
                ["GetAreaByPos"] = function(self, pos, worldId) end, --[[@service Area.GetAreaByPos; @mtype Normal]]
                ["GetAreaCenter"] = function(self, areaid) end, --[[@service Area.GetAreaCenter; @mtype Normal]]
                ["GetAreaCreatures"] = function(self, areaid) end, --[[@service Area.GetAreaCreatures; @mtype Normal]]
                ["GetAreaPlayers"] = function(self, areaid) end, --[[@service Area.GetAreaPlayers; @mtype Normal]]
                ["GetAreaRectLength"] = function(self, areaid) end, --[[@service Area.GetAreaRectLength; @mtype Normal]]
                ["GetAreaRectRange"] = function(self, areaid) end, --[[@service Area.GetAreaRectRange; @mtype Normal]]
                ["GetAreaUuidByObjId"] = function(self, objId) end, --[[@service Area.GetAreaUuidByObjId; @mtype Normal]]
                ["GetBlockNum"] = function(self, areaid, blockid) end, --[[@service Area.GetBlockNum; @mtype Normal]]
                ["GetPosOffset"] = function(self, srcpos, dim) end, --[[@service Area.GetPosOffset; @mtype Normal]]
                ["GetRandomAirPos"] = function(self, posbeg, posend, worldId) end, --[[@service Area.GetRandomAirPos; @mtype Normal]]
                ["GetRandomPos"] = function(self, areaid) end, --[[@service Area.GetRandomPos; @mtype Normal]]
                ["GetRelativeActors"] = function(self, posbeg, posend, uin, relativing, actortype, worldId) end, --[[@service Area.GetRelativeActors; @mtype Normal]]
                ["ObjInArea"] = function(self, areaid, objid) end, --[[@service Area.ObjInArea; @mtype Normal]]
                ["OffsetArea"] = function(self, areaid, x, y, z) end, --[[@service Area.OffsetArea; @mtype Normal]]
                ["PosInArea"] = function(self, areaid, pos, worldId) end, --[[@service Area.PosInArea; @mtype Normal]]
                ["ReplaceAreaBlock"] = function(self, areaid, srcblockid, destblockid, face, color) end, --[[@service Area.ReplaceAreaBlock; @mtype Normal]]
                ["ReplaceAreaRangeBlock"] = function(self, posbeg, posend, srcblockid, destblockid, face, inair, worldId) end, --[[@service Area.ReplaceAreaRangeBlock; @mtype Normal]]
            },
            ["AreaCloneType"] = {
                ["ExcludeAir"] = 0,
                ["ExcludeAirAndMove"] = 2,
                ["IncludeAir"] = 1,
                ["IncludeAirAndMove"] = 3,
            },
            ["AreaFillType"] = {
                ["Delete"] = 1,
                ["Destroy"] = 2,
            },
            ["AreaSimilarity"] = {
                ["Cmpblock"] = 1,
                ["Ignblock"] = 0,
            },
            ["AutoSprinklerBlock"] = {
                ["State"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Normal"] = 2000,
                    ["Unline"] = 2001,
                    ["__info"] = {
                        ["Normal"] = {
                            ["name"] = "2000",
                        },
                        ["Unline"] = {
                            ["name"] = "2001",
                        },
                    },
                },
            },
            ["AvtPart"] = {
                ["BackOrnament"] = 8,
                ["BgEffect"] = 18,
                ["Body"] = 0,
                ["EquipBreast"] = 21,
                ["EquipCustom1"] = 26,
                ["EquipCustom2"] = 27,
                ["EquipCustom3"] = 28,
                ["EquipHead"] = 20,
                ["EquipLegging"] = 22,
                ["EquipPifeng"] = 24,
                ["EquipShoe"] = 23,
                ["EquipWeapon"] = 25,
                ["Face"] = 2,
                ["FaceEffect"] = 14,
                ["FaceOrnament"] = 3,
                ["Footprint"] = 9,
                ["HandEffect"] = 16,
                ["HandOrnament"] = 5,
                ["Head"] = 1,
                ["HeadEffect"] = 13,
                ["Jacket"] = 4,
                ["Max"] = 29,
                ["RightHand"] = 11,
                ["RightShoe"] = 12,
                ["Shoe"] = 7,
                ["Skin"] = 10,
                ["TrailingEffect"] = 17,
                ["Trousers"] = 6,
                ["WholeBodyEffect"] = 15,
                ["WingEffect"] = 19,
            },
            ["BACKPACK_TYPE"] = {
                ["EQUIP"] = 3,
                ["EXTEND"] = 4,
                ["INVENTORY"] = 2,
                ["SHORTCUT"] = 1,
            },
            ["Backpack"] = {
                ["ActCreateEquip"] = function(self, playerid, itemid) end, --[[@service Backpack.ActCreateEquip; @mtype Normal]]
                ["ActDestructEquip"] = function(self, playerid, grid) end, --[[@service Backpack.ActDestructEquip; @mtype Normal]]
                ["ActEquipOffByEquipID"] = function(self, playerid, grid, togrid) end, --[[@service Backpack.ActEquipOffByEquipID; @mtype Normal]]
                ["ActEquipUpByResID"] = function(self, playerid, itemid, frompos) end, --[[@service Backpack.ActEquipUpByResID; @mtype Normal]]
                ["AddItem"] = function(self, playerid, itemid, num, prioritytype) end, --[[@service Backpack.AddItem; @mtype Normal]]
                ["AutoMoveGridItem"] = function(self, playerid, gridid, gridtype) end, --[[@service Backpack.AutoMoveGridItem; @mtype Normal]]
                ["CalcSpaceNumForItem"] = function(self, playerid, itemid) end, --[[@service Backpack.CalcSpaceNumForItem; @mtype Normal]]
                ["ClearAllPack"] = function(self, playerid) end, --[[@service Backpack.ClearAllPack; @mtype Normal]]
                ["ClearGrids"] = function(self, playerid, begingridId, endgridId) end, --[[@service Backpack.ClearGrids; @mtype Normal]]
                ["ClearPack"] = function(self, playerid, bartype) end, --[[@service Backpack.ClearPack; @mtype Normal]]
                ["CreateGunInBackpack"] = function(self, playerid, itemid, gridIndex) end, --[[@service Backpack.CreateGunInBackpack; @mtype Normal]]
                ["CreateItem"] = function(self, objid, itemid, itemnum, ipos) end, --[[@service Backpack.CreateItem; @mtype Normal]]
                ["CreateItemInstInBackpack"] = function(self, playerid, itemid, gridIndex) end, --[[@service Backpack.CreateItemInstInBackpack; @mtype Normal]]
                ["DecodeGridInfo"] = function(self, str) end, --[[@service Backpack.DecodeGridInfo; @mtype Normal]]
                ["DiscardItem"] = function(self, playerid, gridid, num, ablePick) end, --[[@service Backpack.DiscardItem; @mtype Normal]]
                ["DiscardItemByID"] = function(self, playerid, itemid, itemnum) end, --[[@service Backpack.DiscardItemByID; @mtype Normal]]
                ["EncodeTableGridInfo"] = function(self, infos) end, --[[@service Backpack.EncodeTableGridInfo; @mtype Normal]]
                ["EnoughGridForItemMaxNum"] = function(self, playerid, itemid, num) end, --[[@service Backpack.EnoughGridForItemMaxNum; @mtype Normal]]
                ["EnoughSpaceForItem"] = function(self, playerid, itemid, num) end, --[[@service Backpack.EnoughSpaceForItem; @mtype Normal]]
                ["GetAllBackPackInstanceIds"] = function(self, playerid, bartype) end, --[[@service Backpack.GetAllBackPackInstanceIds; @mtype Normal]]
                ["GetBackpackBarEmptyGridList"] = function(self, playerid, bartype) end, --[[@service Backpack.GetBackpackBarEmptyGridList; @mtype Normal]]
                ["GetBackpackBarIDRange"] = function(self, bartype, objid) end, --[[@service Backpack.GetBackpackBarIDRange; @mtype Normal]]
                ["GetBackpackBarItemList"] = function(self, playerid, bartype) end, --[[@service Backpack.GetBackpackBarItemList; @mtype Normal]]
                ["GetBackpackBarSize"] = function(self, bartype, objid) end, --[[@service Backpack.GetBackpackBarSize; @mtype Normal]]
                ["GetBackpackBarValidList"] = function(self, playerid, bartype) end, --[[@service Backpack.GetBackpackBarValidList; @mtype Normal]]
                ["GetBackpackBarValidListExtend"] = function(self, playerid, bartype) end, --[[@service Backpack.GetBackpackBarValidListExtend; @mtype Normal]]
                ["GetBackpackNum"] = function(self, playerid) end, --[[@service Backpack.GetBackpackNum; @mtype Normal]]
                ["GetGridAttr"] = function(self, playerid, gridid, attr) end, --[[@service Backpack.GetGridAttr; @mtype Normal]]
                ["GetGridDurability"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridDurability; @mtype Normal]]
                ["GetGridEnchantList"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridEnchantList; @mtype Normal]]
                ["GetGridGunInfo"] = function(self, itemid, num) end, --[[@service Backpack.GetGridGunInfo; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetGridInfoByIndex"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridInfoByIndex; @mtype Normal]]
                ["GetGridInfoByItemidAndNum"] = function(self, itemid, num) end, --[[@service Backpack.GetGridInfoByItemidAndNum; @mtype Normal]]
                ["GetGridInfos"] = function(self, playerid, begingridId, endgridId) end, --[[@service Backpack.GetGridInfos; @mtype Normal]]
                ["GetGridItemID"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridItemID; @mtype Normal]]
                ["GetGridItemName"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridItemName; @mtype Normal]]
                ["GetGridNum"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridNum; @mtype Normal]]
                ["GetGridStack"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridStack; @mtype Normal]]
                ["GetGridToolType"] = function(self, playerid, gridid) end, --[[@service Backpack.GetGridToolType; @mtype Normal]]
                ["GetGunInstIdInBackpack"] = function(self, playerid) end, --[[@service Backpack.GetGunInstIdInBackpack; @mtype Normal]]
                ["GetInstIdByGridIndex"] = function(self, playerid, gridIndex) end, --[[@service Backpack.GetInstIdByGridIndex; @mtype Normal]]
                ["GetItemCountInNormalPack"] = function(self, playerid, itemId) end, --[[@service Backpack.GetItemCountInNormalPack; @mtype Normal]]
                ["GetItemNum"] = function(self, playerid, itemid, isAddEquip) end, --[[@service Backpack.GetItemNum; @mtype Normal]]
                ["GetItemNumByBackpackBar"] = function(self, playerid, bartype, itemid) end, --[[@service Backpack.GetItemNumByBackpackBar; @mtype Normal]]
                ["GetItemUsrerExp"] = function(self, iteminfo) end, --[[@service Backpack.GetItemUsrerExp; @mtype Normal]]
                ["GetItemUsrerinfo"] = function(self, iteminfo) end, --[[@service Backpack.GetItemUsrerinfo; @mtype Normal]]
                ["GetMouseAttchedGridId"] = function(self) end, --[[@service Backpack.GetMouseAttchedGridId; @mtype Normal]]
                ["GetNotRodResIdGridId"] = function(self, playerid, bartype) end, --[[@service Backpack.GetNotRodResIdGridId; @mtype Normal]]
                ["GetRodResIdList"] = function(self, playerid, bartype) end, --[[@service Backpack.GetRodResIdList; @mtype Normal]]
                ["GetUserDataByGridId"] = function(self, playerid, gridId) end, --[[@service Backpack.GetUserDataByGridId; @mtype Normal]]
                ["GridInfoToString"] = function(self, gridinfo) end, --[[@service Backpack.GridInfoToString; @mtype Normal]]
                ["HasItemByBackpackBar"] = function(self, playerid, bartype, itemid) end, --[[@service Backpack.HasItemByBackpackBar; @mtype Normal]]
                ["IsLock"] = function(self, playerid, gridIndex) end, --[[@service Backpack.IsLock; @mtype Normal]]
                ["LoadGridInfos"] = function(self, playerid, gridinfo) end, --[[@service Backpack.LoadGridInfos; @mtype Normal]]
                ["MoveGridItem"] = function(self, playerid, gridsrc, griddst, num) end, --[[@service Backpack.MoveGridItem; @mtype Normal]]
                ["PlayShortCutItemEffect"] = function(self, playerid, itemid, effectid, scale) end, --[[@service Backpack.PlayShortCutItemEffect; @mtype Normal]]
                ["PlayShortCutItemParticle"] = function(self, playerid, itemid, effectids, offset, rot, scale) end, --[[@service Backpack.PlayShortCutItemParticle; @mtype Normal]]
                ["PlayShortCutIxEffect"] = function(self, playerid, effectid, scale) end, --[[@service Backpack.PlayShortCutIxEffect; @mtype Normal]]
                ["PlayShortCutIxParticle"] = function(self, playerid, effectids, offset, rot, scale) end, --[[@service Backpack.PlayShortCutIxParticle; @mtype Normal]]
                ["RemoveGridItem"] = function(self, playerid, gridid, num) end, --[[@service Backpack.RemoveGridItem; @mtype Normal]]
                ["RemoveGridItemByItemID"] = function(self, playerid, itemid, num) end, --[[@service Backpack.RemoveGridItemByItemID; @mtype Normal]]
                ["SetBackPackNum"] = function(self, playerid, num) end, --[[@service Backpack.SetBackPackNum; @mtype Normal]]
                ["SetGridAttr"] = function(self, playerid, gridid, attr, value) end, --[[@service Backpack.SetGridAttr; @mtype Normal]]
                ["SetGridInfoByIndex"] = function(self, playerid, gridid, gridinfo) end, --[[@service Backpack.SetGridInfoByIndex; @mtype Normal]]
                ["SetGridItem"] = function(self, playerid, gridid, itemid, num, durability) end, --[[@service Backpack.SetGridItem; @mtype Normal]]
                ["SetGridsLock"] = function(self, playerid, begingridId, endgridId, lock) end, --[[@service Backpack.SetGridsLock; @mtype Normal]]
                ["SetItemUsrerinfo"] = function(self, iteminfo, name, desc, exp) end, --[[@service Backpack.SetItemUsrerinfo; @mtype Normal]]
                ["SetUserDataByGridId"] = function(self, playerid, gridId, userData) end, --[[@service Backpack.SetUserDataByGridId; @mtype Normal]]
                ["SortPack"] = function(self, playerid, gridid) end, --[[@service Backpack.SortPack; @mtype Normal]]
                ["StopShortCutItemEffect"] = function(self, playerid, itemid, effectids) end, --[[@service Backpack.StopShortCutItemEffect; @mtype Normal]]
                ["StopShortCutIxEffect"] = function(self, playerid, effectids) end, --[[@service Backpack.StopShortCutIxEffect; @mtype Normal]]
                ["StringToGridInfo"] = function(self, str) end, --[[@service Backpack.StringToGridInfo; @mtype Normal]]
                ["SwapGridItem"] = function(self, playerid, gridsrc, griddst) end, --[[@service Backpack.SwapGridItem; @mtype Normal]]
            },
            ["BackpackBeginIndex"] = {
                ["Equip"] = 8000,
                ["ExtBackpack"] = 58000,
                ["Inventory"] = 0,
                ["Shortcut"] = 1000,
            },
            ["BackpackComponent"] = {
                ["InteractMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Interact"] = 0,
                    ["__info"] = {
                        ["Interact"] = {
                            ["name"] = "交互模式",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["BackpackStartIndex"] = 0,
            ["BackpackType"] = {
                ["Equip"] = 3,
                ["Extend"] = 4,
                ["Inventory"] = 2,
                ["Shortcut"] = 1,
            },
            ["BeaconClampType"] = {
                ["Circle"] = 1,
                ["None"] = 0,
                ["Rectangle"] = 2,
            },
            ["BeaconMapType"] = {
                ["Object"] = 1,
                ["Position"] = 0,
            },
            ["Biome"] = {
                ["FindNearCity"] = function(self, uin, range) end, --[[@service Biome.FindNearCity; @mtype Normal]]
                ["GenCityPrecious"] = function(self, uin) end, --[[@service Biome.GenCityPrecious; @mtype Normal]]
                ["GetBiomeId"] = function(self, x, z, worldId) end, --[[@service Biome.GetBiomeId; @mtype Normal]]
            },
            ["BiomeType"] = {
                ["AirShipFleet"] = 89,
                ["AirShipPlain"] = 88,
                ["Airland"] = 22,
                ["AirlandAir"] = 41,
                ["AirlandGround"] = 40,
                ["AirlandShine"] = 74,
                ["Basin"] = 23,
                ["BasinBamboo"] = 25,
                ["BasinEdge"] = 24,
                ["BasinLake"] = 84,
                ["BasinPeach"] = 26,
                ["BasinRice"] = 72,
                ["Beach"] = 19,
                ["Canyon"] = 64,
                ["CanyonEage"] = 65,
                ["CatDogVillage"] = 103,
                ["City"] = 78,
                ["Cliff"] = 4,
                ["CliffEdge"] = 20,
                ["CliffGinkgo"] = 82,
                ["CliffMaple"] = 81,
                ["CliffPlum"] = 75,
                ["CloverStream"] = 99,
                ["ConiferousForest"] = 6,
                ["ConiferousForestHills"] = 15,
                ["ConiferousForestLake"] = 86,
                ["CorruptededRuins"] = 104,
                ["CrystalIsland"] = 95,
                ["DarkWoods"] = 102,
                ["DeepSea"] = 49,
                ["Desert"] = 2,
                ["DesertHills"] = 13,
                ["DesertLake"] = 48,
                ["DesertOasis"] = 47,
                ["DesertPopulusEuphratica"] = 79,
                ["Earthcore"] = 21,
                ["EyedStarAirlands"] = 33,
                ["EyedStarAirlandsEdge"] = 38,
                ["EyedStarAirlandsSub1"] = 34,
                ["EyedStarAirlandsSub2"] = 35,
                ["EyedStarAirlandsSub3"] = 36,
                ["EyedStarAirlandsSub4"] = 37,
                ["EyedStarGround"] = 27,
                ["EyedStarGroundHills"] = 28,
                ["EyedStarGroundHills2"] = 31,
                ["EyedStarGroundMountain"] = 30,
                ["EyedStarGroundPlain"] = 29,
                ["Forest"] = 3,
                ["ForestChrysanth"] = 71,
                ["ForestFoxtail"] = 70,
                ["ForestHills"] = 14,
                ["ForestLake"] = 85,
                ["ForestLavender"] = 69,
                ["FrozenRiver"] = 10,
                ["FrozenSea"] = 9,
                ["GrassLand"] = 1,
                ["GrassLandArid"] = 66,
                ["GrassLandDandelion"] = 67,
                ["GrassLandRapeseed"] = 68,
                ["IceMountains"] = 16,
                ["IceSheet"] = 8,
                ["IceSheetConiferousForest"] = 56,
                ["IceSheetFrizebLake"] = 63,
                ["IceSheetHighestPeak"] = 57,
                ["IceSheetMountain"] = 59,
                ["IceSheetMountainSide"] = 60,
                ["IceSheetPeakPlain"] = 61,
                ["IceSheetSecondMountainSide"] = 62,
                ["IceSheetSecondPeak"] = 58,
                ["IslandLandDesert"] = 51,
                ["IslandLandRedsoil"] = 53,
                ["IslandLandReef"] = 55,
                ["IslandLandTulip"] = 76,
                ["IslandShoreDesert"] = 50,
                ["IslandShoreRedsoil"] = 52,
                ["IslandShoreReef"] = 54,
                ["IslandShoreTulip"] = 77,
                ["Jungle"] = 7,
                ["JungleBlueJacaranda"] = 80,
                ["JungleHills"] = 17,
                ["MushroomForest"] = 92,
                ["MushroomHills"] = 97,
                ["MushroomPlain"] = 90,
                ["MushroomPlainEdge"] = 98,
                ["MushroomVillage"] = 105,
                ["PlainsLake"] = 83,
                ["RainForest"] = 39,
                ["RainForestLake"] = 87,
                ["RedSoil"] = 11,
                ["RedSoilShore"] = 12,
                ["River"] = 18,
                ["RuneRelic"] = 100,
                ["Sea"] = 0,
                ["ShatteredIsles"] = 96,
                ["StarForest"] = 93,
                ["StarForestEdge"] = 94,
                ["StarForestHills"] = 101,
                ["StarLakeLake"] = 91,
                ["Swamp"] = 5,
                ["SwampRiverSide"] = 73,
                ["Void"] = 106,
                ["Volcano"] = 42,
                ["VolcanoCore"] = 46,
                ["VolcanoMountain"] = 44,
                ["VolcanoPlain"] = 43,
                ["VolcanoRiver"] = 45,
            },
            ["Block"] = {
                ["BluePrintSaveAsNewId"] = function(self, blueprintid, targetBlueprintid) end, --[[@service Block.BluePrintSaveAsNewId; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["BluePrintSetUploadInteral"] = function(self, interval) end, --[[@service Block.BluePrintSetUploadInteral; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["CaptureAndUploadScreenshot"] = function(self, objid, width, height, hideUI) end, --[[@service Block.CaptureAndUploadScreenshot; @mtype Sync; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["ConvertBlockDirToData"] = function(self, blockid, data, dir) end, --[[@service Block.ConvertBlockDirToData; @mtype Normal]]
                ["CreateNormalBluePrintByName"] = function(self, pos, dim, name, worldId) end, --[[@service Block.CreateNormalBluePrintByName; @mtype Normal]]
                ["CreateObsBluePrint"] = function(self, uin, x, y, z, worldId) end, --[[@service Block.CreateObsBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["DeleteBluePrint"] = function(self, blueprintid) end, --[[@service Block.DeleteBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["DestroyBlock"] = function(self, x, y, z, dropitem, worldId, btrigger) end, --[[@service Block.DestroyBlock; @mtype Normal]]
                ["GetBlockCfgID"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockCfgID; @mtype Normal]]
                ["GetBlockData"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockData; @mtype Normal]]
                ["GetBlockDataByDir"] = function(self, blockid, dir) end, --[[@service Block.GetBlockDataByDir; @mtype Normal]]
                ["GetBlockDefDesc"] = function(self, blockid) end, --[[@service Block.GetBlockDefDesc; @mtype Normal]]
                ["GetBlockDefName"] = function(self, blockid) end, --[[@service Block.GetBlockDefName; @mtype Normal]]
                ["GetBlockDefType"] = function(self, blockid) end, --[[@service Block.GetBlockDefType; @mtype Normal]]
                ["GetBlockDir"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockDir; @mtype Normal]]
                ["GetBlockDropExp"] = function(self, blockid) end, --[[@service Block.GetBlockDropExp; @mtype Normal]]
                ["GetBlockDropItemType"] = function(self, blockid, itype) end, --[[@service Block.GetBlockDropItemType; @mtype Normal]]
                ["GetBlockID"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockID; @mtype Normal]]
                ["GetBlockPowerStatus"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockPowerStatus; @mtype Normal]]
                ["GetBlockSettingAttState"] = function(self, blockid, atttype, worldId) end, --[[@service Block.GetBlockSettingAttState; @mtype Normal]]
                ["GetBlockSwitchStatus"] = function(self, x, y, z, worldId) end, --[[@service Block.GetBlockSwitchStatus; @mtype Normal]]
                ["GetBlockToolType"] = function(self, blockid) end, --[[@service Block.GetBlockToolType; @mtype Normal]]
                ["GetBluePrintBlockInfo"] = function(self, blueprintid) end, --[[@service Block.GetBluePrintBlockInfo; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetBluePrintManager"] = function(self, uin) end, --[[@service Block.GetBluePrintManager; @mtype Normal]]
                ["GetFacade"] = function(self, blockid) end, --[[@service Block.GetFacade; @mtype Normal]]
                ["GetObsBluePrintPos"] = function(self, blueprintid) end, --[[@service Block.GetObsBluePrintPos; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetObsBluePrintStatus"] = function(self, blueprintid) end, --[[@service Block.GetObsBluePrintStatus; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["IsAirBlock"] = function(self, x, y, z, worldId) end, --[[@service Block.IsAirBlock; @mtype Normal]]
                ["IsLiquidBlock"] = function(self, x, y, z, worldId) end, --[[@service Block.IsLiquidBlock; @mtype Normal]]
                ["IsSolidBlock"] = function(self, x, y, z, worldId) end, --[[@service Block.IsSolidBlock; @mtype Normal]]
                ["LoadObsBluePrint"] = function(self, blueprintid) end, --[[@service Block.LoadObsBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["PlaceBlock"] = function(self, blockid, x, y, z, face, color, worldId, btrigger) end, --[[@service Block.PlaceBlock; @mtype Normal]]
                ["PlaceBluePrint"] = function(self, pos, blueprintid, bPosInBPArea, direction, placeSpeed, blockFilter, worldId) end, --[[@service Block.PlaceBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["PlayAct"] = function(self, x, y, z, animid, playmode) end, --[[@service Block.PlayAct; @mtype Normal]]
                ["PlayAnim"] = function(self, pos, animid, speed, loop, worldId) end, --[[@service Block.PlayAnim; @mtype Normal]]
                ["PlayCrackEffect"] = function(self, x, y, z, process, worldId) end, --[[@service Block.PlayCrackEffect; @mtype Normal]]
                ["PlayDestroyEffect"] = function(self, x, y, z, worldId) end, --[[@service Block.PlayDestroyEffect; @mtype Normal]]
                ["PlayParticleEffect"] = function(self, x, y, z, particleId, scale, ptime) end, --[[@service Block.PlayParticleEffect; @mtype Normal]]
                ["PlayParticleEffectWorld"] = function(self, x, y, z, particleId, scale, ptime) end, --[[@service Block.PlayParticleEffectWorld; @mtype Normal]]
                ["RandomBlockID"] = function(self) end, --[[@service Block.RandomBlockID; @mtype Normal]]
                ["ReplaceBlock"] = function(self, blockid, x, y, z, face, color, worldId, btrigger) end, --[[@service Block.ReplaceBlock; @mtype Normal]]
                ["ReplaceBluePrint"] = function(self, x, y, z, blueprint, angle, mirror, placeMode, worldId) end, --[[@service Block.ReplaceBluePrint; @mtype Normal]]
                ["SaveBluePrintRegionData"] = function(self, pos1, pos2, blueprintid, worldId) end, --[[@service Block.SaveBluePrintRegionData; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetBlockAll"] = function(self, x, y, z, blockid, data, worldId, btrigger) end, --[[@service Block.SetBlockAll; @mtype Normal]]
                ["SetBlockColor"] = function(self, x, y, z, color, worldId) end, --[[@service Block.SetBlockColor; @mtype Normal]]
                ["SetBlockData"] = function(self, x, y, z, data, worldId) end, --[[@service Block.SetBlockData; @mtype Normal]]
                ["SetBlockDir"] = function(self, x, y, z, dir, worldId) end, --[[@service Block.SetBlockDir; @mtype Normal]]
                ["SetBlockSettingAttState"] = function(self, blockid, atttype, switch, worldId) end, --[[@service Block.SetBlockSettingAttState; @mtype Normal]]
                ["SetBlockSwichState"] = function(self, x, y, z, isactive, worldId) end, --[[@service Block.SetBlockSwichState; @mtype Normal]]
                ["SetBlockSwitchStatus"] = function(self, x, y, z, isactive, worldId) end, --[[@service Block.SetBlockSwitchStatus; @mtype Normal]]
                ["SetBlockTextureColor"] = function(self, blockid, color, alpha, slotindex) end, --[[@service Block.SetBlockTextureColor; @mtype BoardCast]]
                ["StopParticleEffectOnPos"] = function(self, x, y, z, particleId) end, --[[@service Block.StopParticleEffectOnPos; @mtype Normal]]
                ["StopParticleEffectWorld"] = function(self, x, y, z, particleId) end, --[[@service Block.StopParticleEffectWorld; @mtype Normal]]
                ["StopPlaceObsBluePrint"] = function(self, blueprintid) end, --[[@service Block.StopPlaceObsBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["UnbindBluePrintRegion"] = function(self, blueprintid) end, --[[@service Block.UnbindBluePrintRegion; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["UnloadObsBluePrint"] = function(self, blueprintid) end, --[[@service Block.UnloadObsBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
            },
            ["BlockAttr"] = {
                ["BepushedDropItem"] = 16,
                ["BurningProbability"] = 5,
                ["BurningSpeed"] = 4,
                ["EnableBeoperated"] = 2,
                ["EnableBepushed"] = 4,
                ["EnableDestroyed"] = 1,
                ["EnableDropItem"] = 8,
                ["ExplodeResistance"] = 1,
                ["Glissade"] = 3,
                ["Hardness"] = 2,
                ["Lightness"] = 6,
            },
            ["BlockEdit"] = {
                ["BlockFlowType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Status1"] = 0,
                    ["Status2"] = 1,
                    ["__info"] = {
                        ["Status1"] = {
                            ["name"] = "不阻挡",
                            ["sort"] = 1,
                        },
                        ["Status2"] = {
                            ["name"] = "阻挡",
                            ["sort"] = 2,
                        },
                    },
                },
                ["BuiltInType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Chair"] = 1,
                    ["Chest"] = 2,
                    ["None"] = 0,
                    ["__info"] = {
                        ["Chair"] = {
                            ["name"] = "椅子",
                            ["sort"] = 2,
                        },
                        ["Chest"] = {
                            ["name"] = "箱子",
                            ["sort"] = 3,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                    },
                },
                ["ColliderBoxType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 0,
                    ["Slope"] = 1,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 1,
                        },
                        ["Slope"] = {
                            ["name"] = "斜坡",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ColliderModeSelect"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ChangeLess"] = 0,
                    ["Custom"] = 1,
                    ["__info"] = {
                        ["ChangeLess"] = {
                            ["name"] = "单个碰撞盒",
                            ["sort"] = 1,
                        },
                        ["Custom"] = {
                            ["name"] = "可切换碰撞盒",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ColliderShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["Default"] = 0,
                    ["Mesh"] = 2,
                    ["UseMultiBlock"] = 3,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 1,
                        },
                        ["Default"] = {
                            ["name"] = "默认",
                            ["sort"] = 0,
                        },
                        ["Mesh"] = {
                            ["name"] = "跟随模型",
                            ["sort"] = 2,
                        },
                        ["UseMultiBlock"] = {
                            ["name"] = "跟随多格方块",
                            ["sort"] = 3,
                        },
                    },
                },
                ["ColliderState"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CustomCollider"] = 0,
                    ["SubMesh"] = 1,
                    ["__info"] = {
                        ["CustomCollider"] = {
                            ["name"] = "自定义碰撞状态",
                            ["sort"] = 1,
                        },
                        ["SubMesh"] = {
                            ["name"] = "子模型状态",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ColliderType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Air"] = 0,
                    ["Fluid"] = 2,
                    ["ObstructBullet"] = 4,
                    ["PassBullet"] = 3,
                    ["Solid"] = 1,
                    ["__info"] = {
                        ["Air"] = {
                            ["name"] = "空气",
                            ["sort"] = 1,
                        },
                        ["Fluid"] = {
                            ["name"] = "液体",
                            ["sort"] = 3,
                        },
                        ["ObstructBullet"] = {
                            ["name"] = "阻挡投掷物, 不阻挡人物",
                            ["sort"] = 5,
                        },
                        ["PassBullet"] = {
                            ["name"] = "不阻挡投掷物",
                            ["sort"] = 4,
                        },
                        ["Solid"] = {
                            ["name"] = "固体",
                            ["sort"] = 2,
                        },
                    },
                },
                ["CoverNeighborType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Null"] = 0,
                    ["SameMaterial"] = 3,
                    ["Thickness"] = 2,
                    ["Whole"] = 1,
                    ["__info"] = {
                        ["Null"] = {
                            ["name"] = "不遮挡",
                            ["sort"] = 1,
                        },
                        ["SameMaterial"] = {
                            ["name"] = "遮挡相同材质",
                            ["sort"] = 4,
                        },
                        ["Thickness"] = {
                            ["name"] = "根据厚度来定",
                            ["sort"] = 3,
                        },
                        ["Whole"] = {
                            ["name"] = "遮挡",
                            ["sort"] = 2,
                        },
                    },
                },
                ["DrawType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["DrawTypeDefault"] = 0,
                    ["DrawTypeGold"] = 29,
                    ["DrawTypeGrass"] = 1,
                    ["DrawTypeIce"] = 28,
                    ["DrawTypeLava"] = 22,
                    ["DrawTypeXParent"] = 3,
                    ["__info"] = {
                        ["DrawTypeDefault"] = {
                            ["name"] = "默认",
                            ["sort"] = 1,
                        },
                        ["DrawTypeGold"] = {
                            ["name"] = "黄金",
                            ["sort"] = 5,
                        },
                        ["DrawTypeGrass"] = {
                            ["name"] = "草",
                            ["sort"] = 2,
                        },
                        ["DrawTypeIce"] = {
                            ["name"] = "冰晶",
                            ["sort"] = 4,
                        },
                        ["DrawTypeLava"] = {
                            ["name"] = "熔岩",
                            ["sort"] = 6,
                        },
                        ["DrawTypeXParent"] = {
                            ["name"] = "透明",
                            ["sort"] = 3,
                        },
                    },
                },
                ["GravityEffectType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Null"] = 0,
                    ["SameMaterial"] = 3,
                    ["__info"] = {
                        ["Null"] = {
                            ["name"] = "不影响",
                            ["sort"] = 1,
                        },
                        ["SameMaterial"] = {
                            ["name"] = "花草会破坏",
                            ["sort"] = 2,
                        },
                    },
                },
                ["InteractSwitch"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Interact"] = 1,
                    ["NoInteract"] = 0,
                    ["__info"] = {
                        ["Interact"] = {
                            ["name"] = "触发交互",
                            ["sort"] = 2,
                        },
                        ["NoInteract"] = {
                            ["name"] = "不触发交互",
                            ["sort"] = 1,
                        },
                    },
                },
                ["InteractType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Click"] = 0,
                    ["ClickAndUseBtn"] = 2,
                    ["UseBtn"] = 1,
                    ["__info"] = {
                        ["Click"] = {
                            ["name"] = "直接点击",
                            ["sort"] = 1,
                        },
                        ["ClickAndUseBtn"] = {
                            ["name"] = "点击+使用按钮",
                            ["sort"] = 3,
                        },
                        ["UseBtn"] = {
                            ["name"] = "使用按钮",
                            ["sort"] = 2,
                        },
                    },
                },
                ["LodType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Lod0"] = 0,
                    ["Lod1"] = 1,
                    ["Lod2"] = 2,
                    ["Lod3"] = 3,
                    ["Lod4"] = 4,
                    ["__info"] = {
                        ["Lod0"] = {
                            ["name"] = "0",
                            ["sort"] = 1,
                        },
                        ["Lod1"] = {
                            ["name"] = "1",
                            ["sort"] = 2,
                        },
                        ["Lod2"] = {
                            ["name"] = "2",
                            ["sort"] = 3,
                        },
                        ["Lod3"] = {
                            ["name"] = "3",
                            ["sort"] = 4,
                        },
                        ["Lod4"] = {
                            ["name"] = "4",
                            ["sort"] = 5,
                        },
                    },
                },
                ["MineToolType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Axe"] = 1,
                    ["Harrow"] = 4,
                    ["Null"] = 0,
                    ["Pickax"] = 2,
                    ["Shovel"] = 3,
                    ["__info"] = {
                        ["Axe"] = {
                            ["name"] = "斧",
                            ["sort"] = 2,
                        },
                        ["Harrow"] = {
                            ["name"] = "耙",
                            ["sort"] = 5,
                        },
                        ["Null"] = {
                            ["name"] = "空手",
                            ["sort"] = 1,
                        },
                        ["Pickax"] = {
                            ["name"] = "镐",
                            ["sort"] = 3,
                        },
                        ["Shovel"] = {
                            ["name"] = "铲",
                            ["sort"] = 4,
                        },
                    },
                },
                ["MiniColorDisplayType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Hide"] = 1,
                    ["Show"] = 0,
                    ["__info"] = {
                        ["Hide"] = {
                            ["name"] = "不显示",
                            ["sort"] = 2,
                        },
                        ["Show"] = {
                            ["name"] = "显示颜色",
                            ["sort"] = 1,
                        },
                    },
                },
                ["PhyCollideType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Door"] = 3,
                    ["FromData"] = 6,
                    ["Full"] = 1,
                    ["Half"] = 2,
                    ["Null"] = 0,
                    ["__info"] = {
                        ["Door"] = {
                            ["name"] = "自定义",
                            ["sort"] = 4,
                        },
                        ["FromData"] = {
                            ["name"] = "FromData",
                            ["sort"] = 5,
                        },
                        ["Full"] = {
                            ["name"] = "满1格",
                            ["sort"] = 2,
                        },
                        ["Half"] = {
                            ["name"] = "不满1格",
                            ["sort"] = 3,
                        },
                        ["Null"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                    },
                },
                ["PlaceDirType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["DirXYZ"] = 4,
                    ["DirXZ"] = 3,
                    ["DirXZ8"] = 5,
                    ["Null"] = 0,
                    ["__info"] = {
                        ["DirXYZ"] = {
                            ["name"] = "上下各四方向",
                            ["sort"] = 6,
                        },
                        ["DirXZ"] = {
                            ["name"] = "四方向",
                            ["sort"] = 4,
                        },
                        ["DirXZ8"] = {
                            ["name"] = "八方向（水平面）",
                            ["sort"] = 5,
                        },
                        ["Null"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                    },
                },
                ["PushFlagType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Can"] = 0,
                    ["CanNot"] = 2,
                    ["Destroy"] = 1,
                    ["__info"] = {
                        ["Can"] = {
                            ["name"] = "可推动",
                            ["sort"] = 1,
                        },
                        ["CanNot"] = {
                            ["name"] = "不能推动",
                            ["sort"] = 3,
                        },
                        ["Destroy"] = {
                            ["name"] = "推动破坏",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ToolLevel"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Level1"] = 1,
                    ["Level2"] = 2,
                    ["Level3"] = 3,
                    ["Level4"] = 4,
                    ["Level5"] = 5,
                    ["__info"] = {
                        ["Level1"] = {
                            ["name"] = "石头",
                            ["sort"] = 1,
                        },
                        ["Level2"] = {
                            ["name"] = "黄铜",
                            ["sort"] = 2,
                        },
                        ["Level3"] = {
                            ["name"] = "秘银",
                            ["sort"] = 3,
                        },
                        ["Level4"] = {
                            ["name"] = "钛金",
                            ["sort"] = 4,
                        },
                        ["Level5"] = {
                            ["name"] = "钨金",
                            ["sort"] = 5,
                        },
                    },
                },
            },
            ["BlockId"] = {
                ["Air"] = 0,
            },
            ["BlockLimits"] = {
                ["BepushedDropItem"] = 16,
                ["EnableBeoperated"] = 2,
                ["EnableBepushed"] = 4,
                ["EnableDestroyed"] = 1,
                ["EnableDropItem"] = 8,
            },
            ["BlockStateEdit"] = {
                ["CustomColliderState"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ColliderState0"] = 0,
                    ["ColliderState8"] = 32,
                    ["__info"] = {
                        ["ColliderState0"] = {
                            ["name"] = "无",
                            ["sort"] = 0,
                        },
                        ["ColliderState8"] = {
                            ["name"] = "8",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SubMeshDataType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["SubMesh0"] = 0,
                    ["SubMesh16"] = 16,
                    ["SubMesh32"] = 32,
                    ["SubMesh8"] = 8,
                    ["__info"] = {
                        ["SubMesh0"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["SubMesh16"] = {
                            ["name"] = "16",
                            ["sort"] = 3,
                        },
                        ["SubMesh32"] = {
                            ["name"] = "32",
                            ["sort"] = 4,
                        },
                        ["SubMesh8"] = {
                            ["name"] = "8",
                            ["sort"] = 2,
                        },
                    },
                },
                ["TextureVariantState"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["TextureVariant0"] = 0,
                    ["TextureVariant8"] = 128,
                    ["__info"] = {
                        ["TextureVariant0"] = {
                            ["name"] = "无",
                            ["sort"] = 0,
                        },
                        ["TextureVariant8"] = {
                            ["name"] = "8",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["BlockStateType"] = {
                ["CoreBlock"] = 1,
                ["CustomCollider"] = 32,
                ["Occupied"] = 64,
                ["SecondaryDirection"] = 512,
                ["Switch"] = 2,
                ["TextureVariant"] = 128,
            },
            ["BlockStatus"] = {
                ["Active"] = 1,
                ["Inactive"] = 2,
            },
            ["BoxRefresh"] = {
                ["RefreshNumType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Finite"] = 1,
                    ["Infinity"] = 2,
                    ["__info"] = {
                        ["Finite"] = {
                            ["name"] = "有限",
                            ["sort"] = 1,
                        },
                        ["Infinity"] = {
                            ["name"] = "无限",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RefreshType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["OnBegin"] = 1,
                    ["OnEvent"] = 2,
                    ["__info"] = {
                        ["OnBegin"] = {
                            ["name"] = "游戏启动后",
                            ["sort"] = 1,
                        },
                        ["OnEvent"] = {
                            ["name"] = "收到广播",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["BtreeRangeType"] = {
                ["Around"] = 1,
                ["Behind"] = 3,
                ["Front"] = 2,
            },
            ["Buff"] = {
                ["AddBuff"] = function(self, objid, buffid, customticks) end, --[[@service Buff.AddBuff; @mtype Normal]]
                ["ClearAllBadBuff"] = function(self, objid) end, --[[@service Buff.ClearAllBadBuff; @mtype Normal]]
                ["ClearAllBuff"] = function(self, objid) end, --[[@service Buff.ClearAllBuff; @mtype Normal]]
                ["ClearAllGoodBuff"] = function(self, objid) end, --[[@service Buff.ClearAllGoodBuff; @mtype Normal]]
                ["GetBuffCfgId"] = function(self, buffid) end, --[[@service Buff.GetBuffCfgId; @mtype Normal]]
                ["GetBuffDefDesc"] = function(self, buffid) end, --[[@service Buff.GetBuffDefDesc; @mtype Normal]]
                ["GetBuffDefName"] = function(self, buffid) end, --[[@service Buff.GetBuffDefName; @mtype Normal]]
                ["GetBuffDefTicks"] = function(self, buffid) end, --[[@service Buff.GetBuffDefTicks; @mtype Normal]]
                ["GetBuffIdAndLv"] = function(self, buffid) end, --[[@service Buff.GetBuffIdAndLv; @mtype Normal]]
                ["GetBuffLeftTime"] = function(self, objid, buffid) end, --[[@service Buff.GetBuffLeftTime; @mtype Normal]]
                ["GetBuffList"] = function(self, objid) end, --[[@service Buff.GetBuffList; @mtype Normal]]
                ["GetBuffName"] = function(self, objid, buffid) end, --[[@service Buff.GetBuffName; @mtype Normal]]
                ["GetBuffNumByBuffid"] = function(self, objid, buffid) end, --[[@service Buff.GetBuffNumByBuffid; @mtype Normal]]
                ["GetToCBuffId"] = function(self, buffid) end, --[[@service Buff.GetToCBuffId; @mtype Normal]]
                ["HasBuff"] = function(self, objid, buffid) end, --[[@service Buff.HasBuff; @mtype Normal]]
                ["RefreshAllBuffTick"] = function(self, objid) end, --[[@service Buff.RefreshAllBuffTick; @mtype Normal]]
                ["RemoveBuff"] = function(self, objid, buffid) end, --[[@service Buff.RemoveBuff; @mtype Normal]]
                ["ReplaceBuff"] = function(self, objid, buffsrc, buffdst, customticks) end, --[[@service Buff.ReplaceBuff; @mtype Normal]]
            },
            ["CREATUREATTR"] = {
                ["ATK_MAGIC"] = 29,
                ["ATK_MELEE"] = 17,
                ["ATK_PHYSICAL"] = 28,
                ["ATK_REMOTE"] = 18,
                ["BODY_LERP_SPEED"] = 27,
                ["CUR_GRAVITY"] = 34,
                ["CUR_HP"] = 2,
                ["CUR_HUNGER"] = 6,
                ["CUR_OXYGEN"] = 8,
                ["CUR_STRENGTH"] = 35,
                ["DEF_CHAOS"] = 24,
                ["DEF_MAGIC"] = 31,
                ["DEF_MELEE"] = 19,
                ["DEF_PHYSICAL"] = 30,
                ["DEF_REMOTE"] = 20,
                ["DIMENSION"] = 21,
                ["DODGE"] = 16,
                ["ENABLE_ATTACK"] = 32,
                ["ENABLE_BEATTACKED"] = 64,
                ["ENABLE_BEKILLED"] = 128,
                ["ENABLE_DEATHDROPITEM"] = 512,
                ["ENABLE_MOVE"] = 1,
                ["ENABLE_PICKUP"] = 256,
                ["EXTRA_HP"] = 32,
                ["HP_RECOVER"] = 3,
                ["JUMP_POWER"] = 14,
                ["LEVEL"] = 23,
                ["MAX_HP"] = 1,
                ["MAX_HUNGER"] = 5,
                ["MAX_OXYGEN"] = 7,
                ["MAX_STRENGTH"] = 36,
                ["PACK_SIZE"] = 25,
                ["RECOVER_OXYGEN"] = 9,
                ["RUN_SPEED"] = 11,
                ["SWIN_SPEED"] = 13,
                ["TOUGHNESS"] = 33,
                ["VIEW_DISTANCE"] = 26,
                ["WALK_SPEED"] = 10,
                ["WEIGHT"] = 15,
            },
            ["CameraEditState"] = {
                ["Edit"] = 1,
                ["Null"] = 0,
                ["Test"] = 2,
            },
            ["CameraModel"] = {
                ["Autoindent"] = 3,
                ["MoveFollow"] = 1,
                ["RelativeRotate"] = 4,
                ["RoleTranslucent"] = 5,
                ["RotateFollow"] = 2,
            },
            ["CameraRotate"] = {
                ["AllDir"] = 1,
                ["NoTurn"] = 4,
                ["OnlyPitch"] = 3,
                ["OnlyYaw"] = 2,
            },
            ["Chat"] = {
                ["SendChat"] = function(self, content, playerID) end, --[[@service Chat.SendChat; @mtype Normal]]
                ["SendSystemMsg"] = function(self, content, playerID) end, --[[@service Chat.SendSystemMsg; @mtype Normal]]
            },
            ["Chest"] = {
                ["MaxGridCountType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CountType1"] = 5,
                    ["CountType2"] = 10,
                    ["CountType3"] = 30,
                    ["CountType4"] = 60,
                    ["__info"] = {
                        ["CountType1"] = {
                            ["name"] = "5",
                            ["sort"] = 1,
                        },
                        ["CountType2"] = {
                            ["name"] = "10",
                            ["sort"] = 2,
                        },
                        ["CountType3"] = {
                            ["name"] = "30",
                            ["sort"] = 3,
                        },
                        ["CountType4"] = {
                            ["name"] = "60",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["CityGen"] = {
                ["CityGenerateMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["OldCity"] = 0,
                    ["SpecialOfficialCity"] = 1,
                    ["__info"] = {
                        ["OldCity"] = {
                            ["name"] = "老城镇生成",
                            ["sort"] = 1,
                        },
                        ["SpecialOfficialCity"] = {
                            ["name"] = "特殊官方城镇生成",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["Class"] = function(className, super, isSingle) end, --[[@lua]]
            ["ClientPositive"] = {
                ["DealAutoTestCmd"] = function(self, reportid, uin, cmpName, fnName, ...) end, --[[@service ClientPositive.DealAutoTestCmd; @mtype ClientData]]
                ["ExportReportV2"] = function(self, uin, runResults, logs) end, --[[@service ClientPositive.ExportReportV2; @mtype Sync]]
                ["OnDispathTriggerNomalEvent"] = function(self, content) end, --[[@service ClientPositive.OnDispathTriggerNomalEvent; @mtype Normal]]
                ["OnSyncInscriptionTableUnlockSpellList"] = function(self, uin, unlockSpellList) end, --[[@service ClientPositive.OnSyncInscriptionTableUnlockSpellList; @mtype Sync]]
                ["OnSyncServerTime"] = function(self, uin, data) end, --[[@service ClientPositive.OnSyncServerTime; @mtype Sync]]
            },
            ["CloudSever"] = {
                ["AutomaticByKey"] = function(self, libvarid, key, value) end, --[[@service CloudSever.AutomaticByKey; @mtype Normal]]
                ["CheckVarable"] = function(self, libvarid) end, --[[@service CloudSever.CheckVarable; @mtype Normal]]
                ["ClearDataList"] = function(self, libvarid) end, --[[@service CloudSever.ClearDataList; @mtype Normal]]
                ["ClearList"] = function(self, libvarid) end, --[[@service CloudSever.ClearList; @mtype Normal]]
                ["ClearOrderData"] = function(self, libvarid) end, --[[@service CloudSever.ClearOrderData; @mtype Normal]]
                ["CloseCurRoom"] = function(self, countdown, msg) end, --[[@service CloudSever.CloseCurRoom; @mtype Normal]]
                ["GetAnyValueByIndex"] = function(self, libvar, index, eventname, globaldata) end, --[[@service CloudSever.GetAnyValueByIndex; @mtype Normal]]
                ["GetAnyValueByKey"] = function(self, libvarid, key, eventname, globaldata) end, --[[@service CloudSever.GetAnyValueByKey; @mtype Normal]]
                ["GetDataListByKey"] = function(self, libvarid, key, callback) end, --[[@service CloudSever.GetDataListByKey; @mtype Normal]]
                ["GetOrderDataByKey"] = function(self, libvarid, key, callback) end, --[[@service CloudSever.GetOrderDataByKey; @mtype Normal]]
                ["GetOrderDataIndexArea"] = function(self, libvarid, icount, callback) end, --[[@service CloudSever.GetOrderDataIndexArea; @mtype Normal]]
                ["GetOrderDataIndexValue"] = function(self, libvarid, index, callback) end, --[[@service CloudSever.GetOrderDataIndexValue; @mtype Normal]]
                ["GetOrderDataValueArea"] = function(self, libvarid, icount, minvalue, maxvalue, callback) end, --[[@service CloudSever.GetOrderDataValueArea; @mtype Normal]]
                ["GetRoomCategory"] = function(self) end, --[[@service CloudSever.GetRoomCategory; @mtype Normal; @rtype WhiteList="trigger_api3_MapTagTransfer"]]
                ["GetRoomID"] = function(self) end, --[[@service CloudSever.GetRoomID; @mtype Normal]]
                ["NotifyPlayerTransmitMsg"] = function(self, players, msg) end, --[[@service CloudSever.NotifyPlayerTransmitMsg; @mtype Normal]]
                ["RemoveDataListByKey"] = function(self, libvarid, key) end, --[[@service CloudSever.RemoveDataListByKey; @mtype Normal]]
                ["RemoveDataListValue"] = function(self, libvarid, key) end, --[[@service CloudSever.RemoveDataListValue; @mtype Normal]]
                ["RemoveOrderDataByKey"] = function(self, libvarid, key) end, --[[@service CloudSever.RemoveOrderDataByKey; @mtype Normal]]
                ["SendSeverMsg"] = function(self, msg, customdata, roomids) end, --[[@service CloudSever.SendSeverMsg; @mtype Normal; @rtype TimeLimit=15; @rtype WhiteList="message_trigger"]]
                ["SetDataListBykey"] = function(self, libvarid, key, value) end, --[[@service CloudSever.SetDataListBykey; @mtype Normal]]
                ["SetDataListValue"] = function(self, libvarid, key, value) end, --[[@service CloudSever.SetDataListValue; @mtype Normal]]
                ["SetForbidJoin"] = function(self, seconds) end, --[[@service CloudSever.SetForbidJoin; @mtype Normal]]
                ["SetOrderDataBykey"] = function(self, libvarid, Key, value) end, --[[@service CloudSever.SetOrderDataBykey; @mtype Normal]]
                ["SetRoomCategory"] = function(self, category) end, --[[@service CloudSever.SetRoomCategory; @mtype Normal; @rtype TimeLimit=5; @rtype WhiteList="trigger_api3_MapTagTransfer"]]
                ["TransmitOtherRoom"] = function(self, playerid, msg, notFollow) end, --[[@service CloudSever.TransmitOtherRoom; @mtype Normal]]
                ["TransmitToCategoryRoom"] = function(self, playerids, mapid, categorys, teleportmsg, notFollow) end, --[[@service CloudSever.TransmitToCategoryRoom; @mtype Normal; @rtype TimeLimit=30; @rtype WhiteList="trigger_api3_MapTagTransfer"]]
                ["TransmitToCurMapCategoryRoom"] = function(self, playerids, categorys) end, --[[@service CloudSever.TransmitToCurMapCategoryRoom; @mtype Normal; @rtype TimeLimit=30; @rtype WhiteList="trigger_api3_MapTagTransfer"]]
                ["TransmitToMap"] = function(self, playerid, mapid, msg, reportData, noConfirm, notFollow) end, --[[@service CloudSever.TransmitToMap; @mtype Normal; @rtype TimeLimit=30]]
                ["TransmitToRoom"] = function(self, playerid, roomid, msg, notFollow) end, --[[@service CloudSever.TransmitToRoom; @mtype Normal]]
                ["UpdateDataListByKey"] = function(self, libvarid, key, callback) end, --[[@service CloudSever.UpdateDataListByKey; @mtype Normal]]
                ["__GetMapInfo"] = function(self, mapid) end, --[[@service CloudSever.__GetMapInfo; @mtype Normal]]
            },
            ["CmpProPermission"] = {
                ["Private"] = 2,
                ["Public"] = 1,
                ["Read"] = 3,
            },
            ["CmpUIPermission"] = {
                ["Hide"] = 0,
                ["OfficialShow"] = 2,
                ["Show"] = 1,
            },
            ["Collider"] = {
                ["ColliderType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Controller"] = 0,
                    ["Dynamic"] = 1,
                    ["None"] = 2,
                    ["__info"] = {
                        ["Controller"] = {
                            ["name"] = "角色控制器",
                            ["sort"] = 1,
                        },
                        ["Dynamic"] = {
                            ["name"] = "动态刚体",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "基础物理",
                            ["sort"] = 3,
                        },
                    },
                },
                ["NoPhyscColliderShap"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 1,
                        },
                    },
                },
                ["PhysicColliderShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Capsule"] = 2,
                    ["__info"] = {
                        ["Capsule"] = {
                            ["name"] = "胶囊体",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["CommonBlockPlace"] = {
                ["PlaceTypeGroup"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CustomBlock"] = 5,
                    ["Farmland"] = 1,
                    ["NoBlock"] = 6,
                    ["Pit"] = 2,
                    ["RiceField"] = 3,
                    ["TrellisFeld"] = 4,
                    ["__info"] = {
                        ["CustomBlock"] = {
                            ["name"] = "自定义方块作物",
                            ["sort"] = 5,
                        },
                        ["Farmland"] = {
                            ["name"] = "耕地作物",
                            ["sort"] = 1,
                        },
                        ["NoBlock"] = {
                            ["name"] = "无需种植方块作物",
                            ["sort"] = 6,
                        },
                        ["Pit"] = {
                            ["name"] = "土坑作物",
                            ["sort"] = 2,
                        },
                        ["RiceField"] = {
                            ["name"] = "水田作物",
                            ["sort"] = 3,
                        },
                        ["TrellisFeld"] = {
                            ["name"] = "藤蔓作物",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["ComponentUIPermissions"] = {
                ["Hide"] = 0,
                ["OfficialShow"] = 2,
                ["Show"] = 1,
            },
            ["ComponentUIStyle"] = {
                ["AIModelArray"] = "AIModelArray",
                ["AIModelItem"] = "AIModelItem",
                ["ActionArray"] = "ActionArray",
                ["ActionButton"] = "ActionButton",
                ["ActionItem"] = "ActionItem",
                ["AnchorMeshGroup"] = "AnchorMeshGroup",
                ["AnchorMeshGroupItem"] = "AnchorMeshGroupItem",
                ["ArrayAI"] = "ArrayAI",
                ["ArrayBiomeMonster"] = "ArrayBiomeMonster",
                ["ArrayBlockMaterial"] = "ArrayBlockMaterial",
                ["ArrayBuff"] = "ArrayBuff",
                ["ArrayBurstItem"] = "ArrayBurstItem",
                ["ArrayCommonItem"] = "ArrayCommonItem",
                ["ArrayDropItem"] = "ArrayDropItem",
                ["ArrayEmitterId"] = "ArrayEmitterId",
                ["ArrayFeedItem"] = "ArrayFeedItem",
                ["ArrayForItems"] = "ArrayForItems",
                ["ArrayForItemsOffsetPos"] = "ArrayForItemsOffsetPos",
                ["ArrayForTags"] = "ArrayForTags",
                ["ArrayImportAnimation"] = "ArrayImportAnimation",
                ["ArrayItem"] = "ArrayItem",
                ["ArrayMonsterItem"] = "ArrayMonsterItem",
                ["ArrayParticleBrusts"] = "ArrayParticleBrusts",
                ["ArraySkill"] = "ArraySkill",
                ["ArrayStatus"] = "ArrayStatus",
                ["ArrayStatusEffect"] = "ArrayStatusEffect",
                ["ArrayStatusEffectInst"] = "ArrayStatusEffectInst",
                ["AvatarPart"] = "AvatarPart",
                ["BlockModel"] = "BlockModel",
                ["BlockTemp"] = "BlockTemp",
                ["BossGroupArray"] = "BossGroupArray",
                ["BossGroupArrayItem"] = "BossGroupArrayItem",
                ["Bullet"] = "Bullet",
                ["ColorGradient"] = "ColorGradient",
                ["CommonItem"] = "CommonItem",
                ["Curve"] = "Curve",
                ["CustomCommonItem"] = "CustomCommonItem",
                ["CustomDropItem"] = "CustomDropItem",
                ["CustomFeedItem"] = "CustomFeedItem",
                ["CustomItemAI"] = "CustomItemAI",
                ["CustomItemStatus"] = "CustomItemStatus",
                ["CustomItemStatusEffect"] = "CustomItemStatusEffect",
                ["CustomItemUseEdit"] = "CustomItemUseEdit",
                ["CustomMaterial"] = "CustomMaterial",
                ["CustomRewardItem"] = "CustomRewardItem",
                ["CustomSkillItem"] = "CustomSkillItem",
                ["DropItem"] = "DropItem",
                ["EffectMaterial"] = "EffectMaterial",
                ["EnumController"] = "EnumController",
                ["EnumControllerHideValue"] = "EnumControllerHideValue",
                ["EnumDrapdown"] = "EnumDrapdown",
                ["EnumList"] = "EnumList",
                ["FilterPicture"] = "FilterPicture",
                ["GalaxyTexture"] = "GalaxyTexture",
                ["Icon"] = "Icon",
                ["ItemEquip"] = "ItemEquip",
                ["ItemModel"] = "ItemModel",
                ["Jump"] = "Jump",
                ["MaterialGroup"] = "MaterialGroup",
                ["MaterialGroupItem"] = "MaterialGroupItem",
                ["MaterialGroupItemNew"] = "MaterialGroupItemNew",
                ["ModelAttrArray"] = "ModelAttrArray",
                ["Number"] = "Number",
                ["NumberButton"] = "NumberButton",
                ["NumberOnlyInput"] = "NumberOnlyInput",
                ["NumberOnlyRandom"] = "NumberOnlyRandom",
                ["NumberSlider"] = "NumberSlider",
                ["OnlyCustomPicture"] = "OnlyCustomPicture",
                ["ParticleModuleItem"] = "ParticleModuleItem",
                ["PathPoint"] = "PathPoint",
                ["Paths"] = "Paths",
                ["PreViewButton"] = "PreViewButton",
                ["Projectile"] = "Projectile",
                ["SinglePicture"] = "SinglePicture",
                ["SkyPicture"] = "SkyPicture",
                ["SkyTexture"] = "SkyTexture",
                ["SunMoonTexture"] = "SunMoonTexture",
                ["Switch"] = "Switch",
                ["Tag"] = "Tag",
                ["Title"] = "Title",
                ["TitleParticleEdit"] = "TitleParticleEdit",
                ["Vector3AnchorPoint"] = "Vector3AnchorPoint",
                ["Vector3Input"] = "Vector3Input",
                ["Vector3Selector"] = "Vector3Selector",
            },
            ["CraftingEdit"] = {
                ["RequirementToolsEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["completeWorker"] = {
                            ["name"] = "工匠台",
                            ["sort"] = 3,
                        },
                        ["emptyHand"] = {
                            ["name"] = "空手",
                            ["sort"] = 1,
                        },
                        ["silverPot"] = {
                            ["name"] = "烹饪台",
                            ["sort"] = 4,
                        },
                        ["stonePot"] = {
                            ["name"] = "石锅",
                            ["sort"] = 5,
                        },
                    },
                    ["completeWorker"] = 797,
                    ["emptyHand"] = 11000,
                    ["silverPot"] = 795,
                    ["stonePot"] = 794,
                },
                ["SubTypeEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["subType128"] = {
                            ["name"] = "薄板",
                            ["sort"] = 3,
                        },
                        ["subType134"] = {
                            ["name"] = "楼梯",
                            ["sort"] = 4,
                        },
                        ["subType14"] = {
                            ["name"] = "冶炼台",
                            ["sort"] = 2,
                        },
                        ["subType2"] = {
                            ["name"] = "木板",
                            ["sort"] = 1,
                        },
                        ["subType21500"] = {
                            ["name"] = "工具",
                            ["sort"] = 17,
                        },
                        ["subType21501"] = {
                            ["name"] = "战斗",
                            ["sort"] = 18,
                        },
                        ["subType21502"] = {
                            ["name"] = "常用合成",
                            ["sort"] = 19,
                        },
                        ["subType21503"] = {
                            ["name"] = "装饰",
                            ["sort"] = 20,
                        },
                        ["subType21504"] = {
                            ["name"] = "头盔",
                            ["sort"] = 21,
                        },
                        ["subType21505"] = {
                            ["name"] = "胸甲",
                            ["sort"] = 22,
                        },
                        ["subType21506"] = {
                            ["name"] = "护腿",
                            ["sort"] = 23,
                        },
                        ["subType21507"] = {
                            ["name"] = "靴子",
                            ["sort"] = 24,
                        },
                        ["subType21508"] = {
                            ["name"] = "斧",
                            ["sort"] = 25,
                        },
                        ["subType21509"] = {
                            ["name"] = "镐",
                            ["sort"] = 26,
                        },
                        ["subType21510"] = {
                            ["name"] = "铲",
                            ["sort"] = 27,
                        },
                        ["subType21511"] = {
                            ["name"] = "耙",
                            ["sort"] = 28,
                        },
                        ["subType21512"] = {
                            ["name"] = "剑",
                            ["sort"] = 29,
                        },
                        ["subType21513"] = {
                            ["name"] = "矛",
                            ["sort"] = 30,
                        },
                        ["subType21514"] = {
                            ["name"] = "锤",
                            ["sort"] = 31,
                        },
                        ["subType21515"] = {
                            ["name"] = "盾",
                            ["sort"] = 32,
                        },
                        ["subType21516"] = {
                            ["name"] = "背部",
                            ["sort"] = 33,
                        },
                        ["subType21517"] = {
                            ["name"] = "弓箭",
                            ["sort"] = 34,
                        },
                        ["subType21518"] = {
                            ["name"] = "法杖",
                            ["sort"] = 35,
                        },
                        ["subType21519"] = {
                            ["name"] = "恢复品",
                            ["sort"] = 36,
                        },
                        ["subType21520"] = {
                            ["name"] = "生产工具",
                            ["sort"] = 37,
                        },
                        ["subType21521"] = {
                            ["name"] = "养殖装置",
                            ["sort"] = 38,
                        },
                        ["subType21522"] = {
                            ["name"] = "照明工具",
                            ["sort"] = 39,
                        },
                        ["subType21523"] = {
                            ["name"] = "乐器",
                            ["sort"] = 40,
                        },
                        ["subType21524"] = {
                            ["name"] = "运动品",
                            ["sort"] = 41,
                        },
                        ["subType21525"] = {
                            ["name"] = "颜料",
                            ["sort"] = 42,
                        },
                        ["subType21526"] = {
                            ["name"] = "制氧装置",
                            ["sort"] = 43,
                        },
                        ["subType21527"] = {
                            ["name"] = "基础材料",
                            ["sort"] = 44,
                        },
                        ["subType21528"] = {
                            ["name"] = "矿物材料",
                            ["sort"] = 45,
                        },
                        ["subType21529"] = {
                            ["name"] = "种子",
                            ["sort"] = 46,
                        },
                        ["subType21530"] = {
                            ["name"] = "特殊材料",
                            ["sort"] = 47,
                        },
                        ["subType21531"] = {
                            ["name"] = "储存箱",
                            ["sort"] = 48,
                        },
                        ["subType21532"] = {
                            ["name"] = "床",
                            ["sort"] = 49,
                        },
                        ["subType21533"] = {
                            ["name"] = "门",
                            ["sort"] = 50,
                        },
                        ["subType21534"] = {
                            ["name"] = "围栏",
                            ["sort"] = 51,
                        },
                        ["subType21535"] = {
                            ["name"] = "窗户",
                            ["sort"] = 52,
                        },
                        ["subType21536"] = {
                            ["name"] = "墙饰",
                            ["sort"] = 53,
                        },
                        ["subType21537"] = {
                            ["name"] = "石砖",
                            ["sort"] = 54,
                        },
                        ["subType21538"] = {
                            ["name"] = "图腾",
                            ["sort"] = 55,
                        },
                        ["subType21539"] = {
                            ["name"] = "旗帜",
                            ["sort"] = 56,
                        },
                        ["subType21540"] = {
                            ["name"] = "创造锤",
                            ["sort"] = 57,
                        },
                        ["subType21541"] = {
                            ["name"] = "玻璃",
                            ["sort"] = 58,
                        },
                        ["subType21542"] = {
                            ["name"] = "机械装置",
                            ["sort"] = 59,
                        },
                        ["subType21543"] = {
                            ["name"] = "星能装置",
                            ["sort"] = 60,
                        },
                        ["subType21544"] = {
                            ["name"] = "装饰方块",
                            ["sort"] = 61,
                        },
                        ["subType21545"] = {
                            ["name"] = "字牌",
                            ["sort"] = 62,
                        },
                        ["subType21546"] = {
                            ["name"] = "音乐装置",
                            ["sort"] = 63,
                        },
                        ["subType21547"] = {
                            ["name"] = "树枝",
                            ["sort"] = 64,
                        },
                        ["subType21548"] = {
                            ["name"] = "地饰",
                            ["sort"] = 65,
                        },
                        ["subType21549"] = {
                            ["name"] = "交通工具",
                            ["sort"] = 66,
                        },
                        ["subType21550"] = {
                            ["name"] = "特殊工具",
                            ["sort"] = 67,
                        },
                        ["subType21551"] = {
                            ["name"] = "投掷物",
                            ["sort"] = 68,
                        },
                        ["subType21552"] = {
                            ["name"] = "特殊武器",
                            ["sort"] = 69,
                        },
                        ["subType21553"] = {
                            ["name"] = "花盆",
                            ["sort"] = 70,
                        },
                        ["subType21554"] = {
                            ["name"] = "衣柜",
                            ["sort"] = 71,
                        },
                        ["subType21555"] = {
                            ["name"] = "铁块",
                            ["sort"] = 72,
                        },
                        ["subType21556"] = {
                            ["name"] = "鱼竿",
                            ["sort"] = 73,
                        },
                        ["subType21557"] = {
                            ["name"] = "展示架",
                            ["sort"] = 74,
                        },
                        ["subType21558"] = {
                            ["name"] = "自定义",
                            ["sort"] = 75,
                        },
                        ["subType21559"] = {
                            ["name"] = "城防",
                            ["sort"] = 76,
                        },
                        ["subType21560"] = {
                            ["name"] = "特殊道具",
                            ["sort"] = 77,
                        },
                        ["subType21561"] = {
                            ["name"] = "武器库",
                            ["sort"] = 78,
                        },
                        ["subType21562"] = {
                            ["name"] = "果汁",
                            ["sort"] = 79,
                        },
                        ["subType21563"] = {
                            ["name"] = "食物",
                            ["sort"] = 80,
                        },
                        ["subType21564"] = {
                            ["name"] = "武器库",
                            ["sort"] = 81,
                        },
                        ["subType256"] = {
                            ["name"] = "椅子",
                            ["sort"] = 5,
                        },
                        ["subType257"] = {
                            ["name"] = "桌子",
                            ["sort"] = 6,
                        },
                        ["subType686"] = {
                            ["name"] = "竖薄板",
                            ["sort"] = 7,
                        },
                        ["subType709"] = {
                            ["name"] = "斜板",
                            ["sort"] = 8,
                        },
                        ["subType731"] = {
                            ["name"] = "薄斜板",
                            ["sort"] = 9,
                        },
                        ["subType753"] = {
                            ["name"] = "竖薄斜板",
                            ["sort"] = 10,
                        },
                        ["subType775"] = {
                            ["name"] = "竖板",
                            ["sort"] = 11,
                        },
                        ["subType888"] = {
                            ["name"] = "三棱柱",
                            ["sort"] = 12,
                        },
                        ["subType915"] = {
                            ["name"] = "弧板",
                            ["sort"] = 13,
                        },
                        ["subType942"] = {
                            ["name"] = "薄弧板",
                            ["sort"] = 14,
                        },
                        ["subType969"] = {
                            ["name"] = "竖薄弧板",
                            ["sort"] = 15,
                        },
                        ["subType996"] = {
                            ["name"] = "棱锥",
                            ["sort"] = 16,
                        },
                    },
                    ["subType128"] = 128,
                    ["subType134"] = 134,
                    ["subType14"] = 14,
                    ["subType2"] = 2,
                    ["subType21500"] = 21500,
                    ["subType21501"] = 21501,
                    ["subType21502"] = 21502,
                    ["subType21503"] = 21503,
                    ["subType21504"] = 21504,
                    ["subType21505"] = 21505,
                    ["subType21506"] = 21506,
                    ["subType21507"] = 21507,
                    ["subType21508"] = 21508,
                    ["subType21509"] = 21509,
                    ["subType21510"] = 21510,
                    ["subType21511"] = 21511,
                    ["subType21512"] = 21512,
                    ["subType21513"] = 21513,
                    ["subType21514"] = 21514,
                    ["subType21515"] = 21515,
                    ["subType21516"] = 21516,
                    ["subType21517"] = 21517,
                    ["subType21518"] = 21518,
                    ["subType21519"] = 21519,
                    ["subType21520"] = 21520,
                    ["subType21521"] = 21521,
                    ["subType21522"] = 21522,
                    ["subType21523"] = 21523,
                    ["subType21524"] = 21524,
                    ["subType21525"] = 21525,
                    ["subType21526"] = 21526,
                    ["subType21527"] = 21527,
                    ["subType21528"] = 21528,
                    ["subType21529"] = 21529,
                    ["subType21530"] = 21530,
                    ["subType21531"] = 21531,
                    ["subType21532"] = 21532,
                    ["subType21533"] = 21533,
                    ["subType21534"] = 21534,
                    ["subType21535"] = 21535,
                    ["subType21536"] = 21536,
                    ["subType21537"] = 21537,
                    ["subType21538"] = 21538,
                    ["subType21539"] = 21539,
                    ["subType21540"] = 21540,
                    ["subType21541"] = 21541,
                    ["subType21542"] = 21542,
                    ["subType21543"] = 21543,
                    ["subType21544"] = 21544,
                    ["subType21545"] = 21545,
                    ["subType21546"] = 21546,
                    ["subType21547"] = 21547,
                    ["subType21548"] = 21548,
                    ["subType21549"] = 21549,
                    ["subType21550"] = 21550,
                    ["subType21551"] = 21551,
                    ["subType21552"] = 21552,
                    ["subType21553"] = 21553,
                    ["subType21554"] = 21554,
                    ["subType21555"] = 21555,
                    ["subType21556"] = 21556,
                    ["subType21557"] = 21557,
                    ["subType21558"] = 21558,
                    ["subType21559"] = 21559,
                    ["subType21560"] = 21560,
                    ["subType21561"] = 21561,
                    ["subType21562"] = 21562,
                    ["subType21563"] = 21563,
                    ["subType21564"] = 21564,
                    ["subType256"] = 256,
                    ["subType257"] = 257,
                    ["subType686"] = 686,
                    ["subType709"] = 709,
                    ["subType731"] = 731,
                    ["subType753"] = 753,
                    ["subType775"] = 775,
                    ["subType888"] = 888,
                    ["subType915"] = 915,
                    ["subType942"] = 942,
                    ["subType969"] = 969,
                    ["subType996"] = 996,
                },
                ["TypeEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["base"] = {
                            ["name"] = "基础",
                            ["sort"] = 1,
                        },
                        ["building"] = {
                            ["name"] = "建筑",
                            ["sort"] = 5,
                        },
                        ["equipment"] = {
                            ["name"] = "装备",
                            ["sort"] = 2,
                        },
                        ["machine"] = {
                            ["name"] = "机械",
                            ["sort"] = 7,
                        },
                        ["material"] = {
                            ["name"] = "材料",
                            ["sort"] = 4,
                        },
                        ["tool"] = {
                            ["name"] = "道具",
                            ["sort"] = 3,
                        },
                    },
                    ["base"] = 0,
                    ["building"] = 4,
                    ["equipment"] = 1,
                    ["machine"] = 6,
                    ["material"] = 3,
                    ["tool"] = 2,
                },
            },
            ["CreatureAttr"] = {
                ["Atk"] = 42,
                ["AtkMagic"] = 29,
                ["AtkMelee"] = 17,
                ["AtkPhysical"] = 28,
                ["AtkRemote"] = 18,
                ["AttackDis"] = 41,
                ["BodyLerpSpeed"] = 27,
                ["CurHp"] = 2,
                ["CurHunger"] = 6,
                ["CurOxygen"] = 8,
                ["DefChaos"] = 24,
                ["DefMagic"] = 31,
                ["DefMelee"] = 19,
                ["DefPhysical"] = 30,
                ["DefRemote"] = 20,
                ["Dimension"] = 21,
                ["Dodge"] = 16,
                ["EnableAttack"] = 32,
                ["EnableBeattacked"] = 64,
                ["EnableBekilled"] = 128,
                ["EnableDeathdropitem"] = 512,
                ["EnableMove"] = 1,
                ["EnablePickup"] = 256,
                ["ExtraHp"] = 32,
                ["FlySpeed"] = 39,
                ["HpRecover"] = 3,
                ["JumpPower"] = 14,
                ["Level"] = 23,
                ["MaxHp"] = 1,
                ["MaxHunger"] = 5,
                ["MaxOxygen"] = 7,
                ["PackSize"] = 25,
                ["RecoverOxygen"] = 9,
                ["RunSpeed"] = 11,
                ["SwinSpeed"] = 13,
                ["Toughness"] = 33,
                ["ViewDis"] = 40,
                ["ViewDistance"] = 26,
                ["WalkSpeed"] = 10,
                ["Weight"] = 15,
            },
            ["CreatureMotion"] = {
                ["AtkMelee"] = 4,
                ["AtkRemote"] = 5,
                ["Beattracted"] = 10,
                ["Copulation"] = 11,
                ["Follow"] = 6,
                ["Idle"] = 1,
                ["RunAway"] = 8,
                ["SelfBomb"] = 9,
                ["Standby"] = 2,
                ["Stroll"] = 3,
                ["Swim"] = 7,
            },
            ["Cropblock"] = {
                ["AbundantType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Multiple"] = 3,
                    ["Not"] = 1,
                    ["Single"] = 2,
                    ["__info"] = {
                        ["Multiple"] = {
                            ["name"] = "多格丰硕",
                            ["sort"] = 3,
                        },
                        ["Not"] = {
                            ["name"] = "不会丰硕",
                            ["sort"] = 1,
                        },
                        ["Single"] = {
                            ["name"] = "单格丰硕",
                            ["sort"] = 2,
                        },
                    },
                },
                ["CropState"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CycleGrowing"] = 1002,
                    ["Growing"] = 1000,
                    ["Mature"] = 1001,
                    ["Unline"] = 1003,
                    ["__info"] = {
                        ["CycleGrowing"] = {
                            ["name"] = "1002",
                        },
                        ["Growing"] = {
                            ["name"] = "1000",
                        },
                        ["Mature"] = {
                            ["name"] = "1001",
                        },
                        ["Unline"] = {
                            ["name"] = "1003",
                        },
                    },
                },
                ["CropType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["BornMatureType"] = 6,
                    ["BuryType"] = 2,
                    ["ClimbingType"] = 3,
                    ["CustomType"] = 5,
                    ["FarmlandType"] = 1,
                    ["PaddyType"] = 4,
                    ["__info"] = {
                        ["BornMatureType"] = {
                            ["name"] = "无需种植作物",
                            ["sort"] = 6,
                        },
                        ["BuryType"] = {
                            ["name"] = "土坑作物",
                            ["sort"] = 2,
                        },
                        ["ClimbingType"] = {
                            ["name"] = "攀藤作物",
                            ["sort"] = 3,
                        },
                        ["CustomType"] = {
                            ["name"] = "自定义作物",
                            ["sort"] = 5,
                        },
                        ["FarmlandType"] = {
                            ["name"] = "耕地作物",
                            ["sort"] = 1,
                        },
                        ["PaddyType"] = {
                            ["name"] = "水田作物",
                            ["sort"] = 4,
                        },
                    },
                },
                ["HarvestType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Cycle"] = 2,
                    ["OneTime"] = 1,
                    ["__info"] = {
                        ["Cycle"] = {
                            ["name"] = "循环收获",
                            ["sort"] = 2,
                        },
                        ["OneTime"] = {
                            ["name"] = "一次性收获",
                            ["sort"] = 1,
                        },
                    },
                },
                ["WetAffectType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["BonusByWet"] = 1,
                    ["GrowInWet"] = 2,
                    ["IgnoreWet"] = 3,
                    ["__info"] = {
                        ["BonusByWet"] = {
                            ["name"] = "受湿度影响",
                            ["sort"] = 1,
                        },
                        ["GrowInWet"] = {
                            ["name"] = "只在湿润下生长",
                            ["sort"] = 2,
                        },
                        ["IgnoreWet"] = {
                            ["name"] = "不受湿度影响",
                            ["sort"] = 3,
                        },
                    },
                },
            },
            ["CustomModType"] = {
                ["Actor"] = 7,
                ["Biome"] = 6,
                ["Block"] = 0,
                ["Furnace"] = 4,
                ["Item"] = 2,
                ["Monster"] = 1,
                ["Recipe"] = 3,
                ["Rule"] = 9,
                ["Status"] = 5,
                ["UI"] = 8,
            },
            ["CustomUI"] = {
                ["AddLoaderModelAvatarPart"] = function(self, playerid, uiid, elementid, idModel, ePart) end, --[[@service CustomUI.AddLoaderModelAvatarPart; @mtype Normal]]
                ["AlterLoaderModelAvatarPartColor"] = function(self, playerid, uiid, elementid, idModel, ePart, aMaskToColors) end, --[[@service CustomUI.AlterLoaderModelAvatarPartColor; @mtype Normal]]
                ["ChangeAvatorModel"] = function(self, avatorval) end, --[[@service CustomUI.ChangeAvatorModel; @mtype Normal]]
                ["ChangeParent"] = function(self, playerid, uiid, elementid, parentElementid) end, --[[@service CustomUI.ChangeParent; @mtype SyncPack]]
                ["CloneElement"] = function(self, ishost, playerid, uiid, elementid) end, --[[@service CustomUI.CloneElement; @mtype HostAndClient]]
                ["CreateElement"] = function(self, ishost, playerid, uiid, elementType) end, --[[@service CustomUI.CreateElement; @mtype HostAndClient]]
                ["DeleteElement"] = function(self, playerid, uiid, elementid) end, --[[@service CustomUI.DeleteElement; @mtype SyncPack]]
                ["EnableSetGunMagazine"] = function(self, playerid, b) end, --[[@service CustomUI.EnableSetGunMagazine; @mtype SyncPack]]
                ["GetAvatarPartColors"] = function(self, ePart) end, --[[@service CustomUI.GetAvatarPartColors; @mtype Normal]]
                ["GetBlockIcon"] = function(self, blockid) end, --[[@service CustomUI.GetBlockIcon; @mtype Normal]]
                ["GetElementAttrValue"] = function(self, reportid, objid, elementid, attrIdx) end, --[[@service CustomUI.GetElementAttrValue; @mtype ClientData; @rtype WhiteList="LuaApi3_CustomUI_GetElementAttrValue"]]
                ["GetHorsePreviewIcon"] = function(self, horseid) end, --[[@service CustomUI.GetHorsePreviewIcon; @mtype Normal]]
                ["GetItemIcon"] = function(self, itemid) end, --[[@service CustomUI.GetItemIcon; @mtype Normal]]
                ["GetMonsterIcon"] = function(self, actorid) end, --[[@service CustomUI.GetMonsterIcon; @mtype Normal]]
                ["GetMonsterObjIcon"] = function(self, objid) end, --[[@service CustomUI.GetMonsterObjIcon; @mtype Normal]]
                ["GetPlayerByUin"] = function(self, objid) end, --[[@service CustomUI.GetPlayerByUin; @mtype Normal]]
                ["GetProgressBarValue"] = function(self, reportid, playerid, uiid, elementid) end, --[[@service CustomUI.GetProgressBarValue; @mtype ClientData]]
                ["GetRoleHeadIcon"] = function(self, playerid) end, --[[@service CustomUI.GetRoleHeadIcon; @mtype Normal]]
                ["GetRoleIcon"] = function(self, playerid) end, --[[@service CustomUI.GetRoleIcon; @mtype Normal]]
                ["GetScreenSize"] = function(self, reportid, playerid) end, --[[@service CustomUI.GetScreenSize; @mtype ClientData]]
                ["GetShortcutIcon"] = function(self, playerid, ix) end, --[[@service CustomUI.GetShortcutIcon; @mtype Normal]]
                ["GetSkinDefIcon"] = function(self, skinid) end, --[[@service CustomUI.GetSkinDefIcon; @mtype Normal]]
                ["GetSkinPreviewIcon"] = function(self, skinid) end, --[[@service CustomUI.GetSkinPreviewIcon; @mtype Normal]]
                ["GetStatusIcon"] = function(self, buffid) end, --[[@service CustomUI.GetStatusIcon; @mtype Normal]]
                ["GetUIViewAttrValue"] = function(self, reportid, objid, uiid, attrIdx) end, --[[@service CustomUI.GetUIViewAttrValue; @mtype ClientData; @rtype WhiteList="LuaApi3_CustomUI_GetUIViewAttrValue"]]
                ["GlobalToLocal"] = function(self, reportid, playerid, uiid, elementid, x, y) end, --[[@service CustomUI.GlobalToLocal; @mtype ClientData]]
                ["HideElement"] = function(self, objid, uiid, elementid, effectid, time) end, --[[@service CustomUI.HideElement; @mtype SyncPack]]
                ["IsValidTarget"] = function(self, objid) end, --[[@service CustomUI.IsValidTarget; @mtype Normal]]
                ["PlayElementAnim"] = function(self, playerid, uiid, elementid, animid, time, mode, easetype, delaytime, endvalue) end, --[[@service CustomUI.PlayElementAnim; @mtype SyncPack]]
                ["RemovePositionBandBlock"] = function(self, objid, uiid, elementid) end, --[[@service CustomUI.RemovePositionBandBlock; @mtype SyncPack]]
                ["RemovePositionBindActor"] = function(self, objid, uiid, elementid) end, --[[@service CustomUI.RemovePositionBindActor; @mtype SyncPack]]
                ["RotateElement"] = function(self, objid, uiid, elementid, rotate) end, --[[@service CustomUI.RotateElement; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetAlpha"] = function(self, objid, uiid, elementid, alpha) end, --[[@service CustomUI.SetAlpha; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetBeaconBandPos"] = function(self, playerid, elementid, bandPosX, bandPosY, bandPosZ) end, --[[@service CustomUI.SetBeaconBandPos; @mtype SyncPack]]
                ["SetBeaconClampType"] = function(self, playerid, elementid, clampType) end, --[[@service CustomUI.SetBeaconClampType; @mtype SyncPack]]
                ["SetBeaconMapType"] = function(self, playerid, elementid, mapType) end, --[[@service CustomUI.SetBeaconMapType; @mtype Normal]]
                ["SetBeaconMargin"] = function(self, playerid, elementid, horizontalMargin, verticalMargin) end, --[[@service CustomUI.SetBeaconMargin; @mtype SyncPack]]
                ["SetBeaconObjId"] = function(self, playerid, elementid, objId) end, --[[@service CustomUI.SetBeaconObjId; @mtype SyncPack]]
                ["SetBeaconOffset"] = function(self, playerid, elementid, offsetX, offsetY, offsetZ) end, --[[@service CustomUI.SetBeaconOffset; @mtype SyncPack]]
                ["SetBeaconRadius"] = function(self, playerid, elementid, radius) end, --[[@service CustomUI.SetBeaconRadius; @mtype SyncPack]]
                ["SetBounceback"] = function(self, playerid, uiid, elementid, bOpen) end, --[[@service CustomUI.SetBounceback; @mtype SyncPack]]
                ["SetColor"] = function(self, objid, uiid, elementid, color) end, --[[@service CustomUI.SetColor; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetFloatDamageTxt"] = function(self, playerid, elementid, objid, text, color, offsetx, offsety, movex, movey, showtime, movex2, movey2, showtime2) end, --[[@service CustomUI.SetFloatDamageTxt; @mtype SyncPack]]
                ["SetFloatDamageTxtEx"] = function(self, playerid, elementid, x, y, text, offsetx, offsety, movex, movey, showtime, movex2, movey2, showtime2) end, --[[@service CustomUI.SetFloatDamageTxtEx; @mtype SyncPack]]
                ["SetFontSize"] = function(self, objid, uiid, elementid, size) end, --[[@service CustomUI.SetFontSize; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetLoaderModel"] = function(self, ishost, playerid, uiid, elementid, modleName) end, --[[@service CustomUI.SetLoaderModel; @mtype HostAndClient]]
                ["SetLoaderModelAct"] = function(self, playerid, uiid, elementid, animid, playmode, speed) end, --[[@service CustomUI.SetLoaderModelAct; @mtype SyncPack]]
                ["SetLoaderModelDir"] = function(self, playerid, uiid, elementid, yaw) end, --[[@service CustomUI.SetLoaderModelDir; @mtype SyncPack]]
                ["SetLoaderModelPosition"] = function(self, playerid, uiid, elementid, x, y, z) end, --[[@service CustomUI.SetLoaderModelPosition; @mtype SyncPack]]
                ["SetLoaderModelScale"] = function(self, playerid, uiid, elementid, modlescale) end, --[[@service CustomUI.SetLoaderModelScale; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetPosition"] = function(self, objid, uiid, elementid, x, y) end, --[[@service CustomUI.SetPosition; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110027,110012,110013)]]
                ["SetPositionBandBlock"] = function(self, objid, uiid, elementid, blockPos) end, --[[@service CustomUI.SetPositionBandBlock; @mtype SyncPack]]
                ["SetPositionBindActor"] = function(self, objid, uiid, elementid, actorId, offset) end, --[[@service CustomUI.SetPositionBindActor; @mtype SyncPack]]
                ["SetProgressBarData"] = function(self, playerid, uiid, elementid, min, max, value) end, --[[@service CustomUI.SetProgressBarData; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110032,110037)]]
                ["SetProgressBarResId"] = function(self, playerid, uiid, elementid, itype, url) end, --[[@service CustomUI.SetProgressBarResId; @mtype SyncPack]]
                ["SetProgressBarValue"] = function(self, playerid, uiid, elementid, itype, value) end, --[[@service CustomUI.SetProgressBarValue; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110033,110037)]]
                ["SetRelationPosition"] = function(self, playerid, uiid, elementid, v, xOffset, xUnits, h, yOffset, yUnits) end, --[[@service CustomUI.SetRelationPosition; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110011,110013,110012)]]
                ["SetRelationSize"] = function(self, playerid, uiid, elementid, width, widthUnits, height, heightUnits) end, --[[@service CustomUI.SetRelationSize; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110003,110046,110015,110014)]]
                ["SetScale"] = function(self, objid, uiid, elementid, x, y) end, --[[@service CustomUI.SetScale; @mtype SyncPack]]
                ["SetSize"] = function(self, objid, uiid, elementid, width, height) end, --[[@service CustomUI.SetSize; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110028,110046,110015,110014)]]
                ["SetSliderBarImg"] = function(self, playerid, uiid, elementid, url) end, --[[@service CustomUI.SetSliderBarImg; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetSliderDir"] = function(self, playerid, uiid, elementid, dir) end, --[[@service CustomUI.SetSliderDir; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetSpineAnimID"] = function(self, playerid, uiid, elementid, animid, animindex, playmode) end, --[[@service CustomUI.SetSpineAnimID; @mtype SyncPack]]
                ["SetSpineTouch"] = function(self, playerid, uiid, elementid, bOpen) end, --[[@service CustomUI.SetSpineTouch; @mtype SyncPack]]
                ["SetState"] = function(self, objid, uiid, pageIndex, easeType, time) end, --[[@service CustomUI.SetState; @mtype SyncPack; @rtype ResetCompareParam=(3)]]
                ["SetSysSettingBtnVisible"] = function(self, objid, visible) end, --[[@service CustomUI.SetSysSettingBtnVisible; @mtype SyncPack; @rtype WhiteList="LuaApi3_CustomUI_SetSysSettingBtnVisible"]]
                ["SetText"] = function(self, ishost, objid, uiid, elementid, text, animid, time, mode, exstr) end, --[[@service CustomUI.SetText; @mtype HostAndClient; @rtype CompareParam=(3,5)]]
                ["SetTexture"] = function(self, objid, uiid, elementid, url) end, --[[@service CustomUI.SetTexture; @mtype SyncPack; @rtype CompareParam=(3)]]
                ["SetUrlIcon"] = function(self, objid, uiid, elementid, url) end, --[[@service CustomUI.SetUrlIcon; @mtype SyncPack; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["ShowElement"] = function(self, objid, uiid, elementid, effectid, time) end, --[[@service CustomUI.ShowElement; @mtype SyncPack]]
                ["SmoothChangeProgress"] = function(self, playerid, uiid, elementid, bval, eval, time) end, --[[@service CustomUI.SmoothChangeProgress; @mtype SyncPack]]
                ["SmoothIncreaseProgress"] = function(self, playerid, uiid, elementid, time, ptype, value) end, --[[@service CustomUI.SmoothIncreaseProgress; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,110032,110037)]]
                ["SmoothMoveBy"] = function(self, playerid, uiid, elementid, time, x, y) end, --[[@service CustomUI.SmoothMoveBy; @mtype SyncPack; @rtype ResetCompareParam=(3,110011,110027,110012)]]
                ["SmoothMoveTo"] = function(self, playerid, uiid, elementid, time, x, y) end, --[[@service CustomUI.SmoothMoveTo; @mtype SyncPack; @rtype ResetCompareParam=(3,110011,110027,110013)]]
                ["SmoothRotateBy"] = function(self, playerid, uiid, elementid, time, angle) end, --[[@service CustomUI.SmoothRotateBy; @mtype SyncPack; @rtype ResetCompareParam=(3,110008,110016)]]
                ["SmoothRotateTo"] = function(self, playerid, uiid, elementid, time, angle) end, --[[@service CustomUI.SmoothRotateTo; @mtype SyncPack; @rtype ResetCompareParam=(3,110008,110017)]]
                ["SmoothScaleBy"] = function(self, playerid, uiid, elementid, time, w, h) end, --[[@service CustomUI.SmoothScaleBy; @mtype SyncPack; @rtype ResetCompareParam=(3,110003,110028,110046,110014)]]
                ["SmoothScaleByEx"] = function(self, playerid, uiid, elementid, time, x, y, delayTime, easeType) end, --[[@service CustomUI.SmoothScaleByEx; @mtype SyncPack]]
                ["SmoothScaleTo"] = function(self, playerid, uiid, elementid, time, w, h) end, --[[@service CustomUI.SmoothScaleTo; @mtype SyncPack; @rtype ResetCompareParam=(3,110003,110028,110046,110015)]]
                ["StopAnim"] = function(self, playerid, uiid, elementid, itype) end, --[[@service CustomUI.StopAnim; @mtype SyncPack]]
                ["SyncPicCheckStatus"] = function(self, playerid, uin, photoInfos) end, --[[@service CustomUI.SyncPicCheckStatus; @mtype SyncPack]]
                ["TurnSliderToIndex"] = function(self, playerid, uiid, elementid, index) end, --[[@service CustomUI.TurnSliderToIndex; @mtype SyncPack]]
                ["TurnSliderToPos"] = function(self, playerid, uiid, elementid, x, y) end, --[[@service CustomUI.TurnSliderToPos; @mtype SyncPack]]
            },
            ["Data"] = {
                ["Array"] = {
                    ["Clear"] = function(self, varId, playerId) end, --[[@service Data.Array.Clear; @mtype Normal]]
                    ["ClearNilValue"] = function(self, varId, playerId) end, --[[@service Data.Array.ClearNilValue; @mtype Normal]]
                    ["ConvertNomalArray"] = function(self, array) end, --[[@service Data.Array.ConvertNomalArray; @mtype Normal]]
                    ["CreateTmpArray"] = function(self, varType, data) end, --[[@service Data.Array.CreateTmpArray; @mtype Normal]]
                    ["DealArrayData"] = function(self, data, itemType) end, --[[@service Data.Array.DealArrayData; @mtype Normal]]
                    ["DealTagToArrayData"] = function(self, tags, isToC, varType, outval) end, --[[@service Data.Array.DealTagToArrayData; @mtype Normal]]
                    ["GetAllValue"] = function(self, varId, playerId) end, --[[@service Data.Array.GetAllValue; @mtype Normal]]
                    ["GetCountByValue"] = function(self, varId, playerId, value) end, --[[@service Data.Array.GetCountByValue; @mtype Normal]]
                    ["GetIndexByValue"] = function(self, varId, playerId, value) end, --[[@service Data.Array.GetIndexByValue; @mtype Normal]]
                    ["GetMax"] = function(self, varId, playerId) end, --[[@service Data.Array.GetMax; @mtype Normal]]
                    ["GetMin"] = function(self, varId, playerId) end, --[[@service Data.Array.GetMin; @mtype Normal]]
                    ["GetSize"] = function(self, varId, playerId) end, --[[@service Data.Array.GetSize; @mtype Normal]]
                    ["GetValue"] = function(self, varId, playerId, index) end, --[[@service Data.Array.GetValue; @mtype Normal]]
                    ["HasIntersectionByTags"] = function(self, strsA, mathcmode, strsB, bexactmatch) end, --[[@service Data.Array.HasIntersectionByTags; @mtype Normal]]
                    ["HasValue"] = function(self, varId, playerId, value) end, --[[@service Data.Array.HasValue; @mtype Normal]]
                    ["HasValueByNo"] = function(self, varId, playerId, ix) end, --[[@service Data.Array.HasValueByNo; @mtype Normal]]
                    ["IncreasesValue"] = function(self, varId, playerId, value, index) end, --[[@service Data.Array.IncreasesValue; @mtype Normal]]
                    ["InsertValue"] = function(self, varId, playerId, value, index) end, --[[@service Data.Array.InsertValue; @mtype Normal]]
                    ["InsertValues"] = function(self, varId1, playerId1, index, varId2, playerId2) end, --[[@service Data.Array.InsertValues; @mtype Normal]]
                    ["RandomValue"] = function(self, varId, playerId) end, --[[@service Data.Array.RandomValue; @mtype Normal]]
                    ["Remove"] = function(self, varId, playerId, index) end, --[[@service Data.Array.Remove; @mtype Normal]]
                    ["RemoveByValue"] = function(self, varId, playerId, value) end, --[[@service Data.Array.RemoveByValue; @mtype Normal]]
                    ["RemoveByValues"] = function(self, varId1, playerId1, varId2, playerId2) end, --[[@service Data.Array.RemoveByValues; @mtype Normal]]
                    ["ReplaceValue"] = function(self, varId, playerId, value, oldValue) end, --[[@service Data.Array.ReplaceValue; @mtype Normal]]
                    ["SetValue"] = function(self, varId, playerId, value, index) end, --[[@service Data.Array.SetValue; @mtype Normal]]
                    ["Sort"] = function(self, varId, playerId, isUp) end, --[[@service Data.Array.Sort; @mtype Normal]]
                },
                ["DoPackBluePrint"] = function(self, varId, playerId, x, y, z, x2, y2, z2, worldId) end, --[[@service Data.DoPackBluePrint; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetRowByColIndex"] = function(self, filename, col, value) end, --[[@service Data.GetRowByColIndex; @mtype Normal]]
                ["GetRowByColName"] = function(self, filename, name, value) end, --[[@service Data.GetRowByColName; @mtype Normal]]
                ["GetRowByIndex"] = function(self, filename, row) end, --[[@service Data.GetRowByIndex; @mtype Normal]]
                ["GetRows"] = function(self, filename) end, --[[@service Data.GetRows; @mtype Normal]]
                ["GetValue"] = function(self, varId, playerId) end, --[[@service Data.GetValue; @mtype Normal]]
                ["GetVarID"] = function(self, varname) end, --[[@service Data.GetVarID; @mtype Normal]]
                ["IncreasesValue"] = function(self, varId, playerId, value) end, --[[@service Data.IncreasesValue; @mtype Normal]]
                ["LoadCsv2Table"] = function(self, filename, colkey, istartrow, istartcol, ingnoremask) end, --[[@service Data.LoadCsv2Table; @mtype Normal]]
                ["Map"] = {
                    ["ClearData"] = function(self, varId, playerId) end, --[[@service Data.Map.ClearData; @mtype Normal]]
                    ["CreateTmpMap"] = function(self, varType, data) end, --[[@service Data.Map.CreateTmpMap; @mtype Normal]]
                    ["GetAllValue"] = function(self, varId, playerId) end, --[[@service Data.Map.GetAllValue; @mtype Normal]]
                    ["GetIndexValueAndBlock"] = function(self, call_back, varId, playerId, index, ascending) end, --[[@service Data.Map.GetIndexValueAndBlock; @mtype Block]]
                    ["GetIndexValueAndCallback"] = function(self, varId, playerId, index, ascending, callback) end, --[[@service Data.Map.GetIndexValueAndCallback; @mtype Normal]]
                    ["GetMapValue"] = function(self, varId, playerId, key) end, --[[@service Data.Map.GetMapValue; @mtype Normal]]
                    ["GetNumValuesAndCallback"] = function(self, varId, playerId, num, ascending, callback) end, --[[@service Data.Map.GetNumValuesAndCallback; @mtype Normal]]
                    ["GetRangeIndexsAndCallback"] = function(self, varId, playerId, min, max, ascending, callback) end, --[[@service Data.Map.GetRangeIndexsAndCallback; @mtype Normal]]
                    ["GetRangeValuesAndCallback"] = function(self, varId, playerId, min, max, ascending, pagesize, callback) end, --[[@service Data.Map.GetRangeValuesAndCallback; @mtype Normal]]
                    ["GetShowRunData"] = function(self, varId, playerId) end, --[[@service Data.Map.GetShowRunData; @mtype Normal]]
                    ["GetUserDataValue"] = function(self, key) end, --[[@service Data.Map.GetUserDataValue; @mtype Normal]]
                    ["GetUserDataValueInMap"] = function(self, key) end, --[[@service Data.Map.GetUserDataValueInMap; @mtype Normal]]
                    ["GetValueAndBlock"] = function(self, call_back, varId, playerId, key) end, --[[@service Data.Map.GetValueAndBlock; @mtype Block]]
                    ["GetValueAndCallBack"] = function(self, varId, playerId, key, callback) end, --[[@service Data.Map.GetValueAndCallBack; @mtype Normal]]
                    ["IncreasesRankValueAndBlock"] = function(self, call_back, varId, playerId, key, value, extendvalue) end, --[[@service Data.Map.IncreasesRankValueAndBlock; @mtype Block]]
                    ["IncreasesRankValueAndCallback"] = function(self, varId, playerId, key, value, extendvalue, call_back) end, --[[@service Data.Map.IncreasesRankValueAndCallback; @mtype Normal]]
                    ["RemoveMapValue"] = function(self, varId, playerId, key) end, --[[@service Data.Map.RemoveMapValue; @mtype Normal]]
                    ["RemoveValueAndBlock"] = function(self, call_back, varId, playerId, key) end, --[[@service Data.Map.RemoveValueAndBlock; @mtype Block]]
                    ["RemoveValueAndCallBack"] = function(self, varId, playerId, key, callback) end, --[[@service Data.Map.RemoveValueAndCallBack; @mtype Normal]]
                    ["SetMapValue"] = function(self, varId, playerId, key, value) end, --[[@service Data.Map.SetMapValue; @mtype Normal]]
                    ["SetRankValueAndBlock"] = function(self, call_back, varId, playerId, key, value, extendvalue) end, --[[@service Data.Map.SetRankValueAndBlock; @mtype Block]]
                    ["SetUserDataValue"] = function(self, key, value) end, --[[@service Data.Map.SetUserDataValue; @mtype Normal]]
                    ["SetUserDataValueInMap"] = function(self, key, value) end, --[[@service Data.Map.SetUserDataValueInMap; @mtype Normal]]
                    ["SetValueAndBlock"] = function(self, call_back, varId, playerId, key, value) end, --[[@service Data.Map.SetValueAndBlock; @mtype Block]]
                    ["SetValueAndCallBack"] = function(self, varId, playerId, key, value, callback) end, --[[@service Data.Map.SetValueAndCallBack; @mtype Normal]]
                    ["UpdateValueAndCallback"] = function(self, varId, playerId, key, callback) end, --[[@service Data.Map.UpdateValueAndCallback; @mtype Normal]]
                    ["__CheckKey"] = function(self, key) end, --[[@service Data.Map.__CheckKey; @mtype Normal]]
                },
                ["ReadPlayerData"] = function(self, uin, filename) end, --[[@service Data.ReadPlayerData; @mtype Normal]]
                ["ReadPlayerDataToMap"] = function(self, uin, filename) end, --[[@service Data.ReadPlayerDataToMap; @mtype Normal]]
                ["SavePlayerData"] = function(self, uin, filename, tabval) end, --[[@service Data.SavePlayerData; @mtype Normal]]
                ["SavePlayerDataToMap"] = function(self, uin, filename, tabval) end, --[[@service Data.SavePlayerDataToMap; @mtype Normal]]
                ["SetValue"] = function(self, varId, playerId, value) end, --[[@service Data.SetValue; @mtype Normal]]
                ["Table"] = {
                    ["Clear"] = function(self, varId, playerId) end, --[[@service Data.Table.Clear; @mtype Normal]]
                    ["GetAllValue"] = function(self, varId, playerId) end, --[[@service Data.Table.GetAllValue; @mtype Normal]]
                    ["GetColIndex"] = function(self, varId, playerId, key) end, --[[@service Data.Table.GetColIndex; @mtype Normal]]
                    ["GetCols"] = function(self, varId, playerId) end, --[[@service Data.Table.GetCols; @mtype Normal]]
                    ["GetRowIndex"] = function(self, varId, playerId, col, value, cmp) end, --[[@service Data.Table.GetRowIndex; @mtype Normal]]
                    ["GetRowIndexs"] = function(self, varId, playerId, col, value, cmp) end, --[[@service Data.Table.GetRowIndexs; @mtype Normal]]
                    ["GetRows"] = function(self, varId, playerId) end, --[[@service Data.Table.GetRows; @mtype Normal]]
                    ["GetTableColKeys"] = function(self, varId) end, --[[@service Data.Table.GetTableColKeys; @mtype Normal]]
                    ["GetValue"] = function(self, varId, playerId, row, col) end, --[[@service Data.Table.GetValue; @mtype Normal]]
                    ["GetValuesByCol"] = function(self, varId, playerId, col) end, --[[@service Data.Table.GetValuesByCol; @mtype Normal]]
                    ["InsertValue"] = function(self, varId, playerId, ...) end, --[[@service Data.Table.InsertValue; @mtype Normal]]
                    ["InsertValueByRow"] = function(self, varId, playerId, value, row) end, --[[@service Data.Table.InsertValueByRow; @mtype Normal]]
                    ["RemoveRow"] = function(self, varId, playerId, row) end, --[[@service Data.Table.RemoveRow; @mtype Normal]]
                    ["SetValue"] = function(self, varId, playerId, row, col, value) end, --[[@service Data.Table.SetValue; @mtype Normal]]
                    ["UpdateAllValue"] = function(self, varId, playerId, value) end, --[[@service Data.Table.UpdateAllValue; @mtype Normal]]
                    ["UpdateLineValues"] = function(self, varId, playerId, value) end, --[[@service Data.Table.UpdateLineValues; @mtype Normal]]
                },
            },
            ["DevComponentDebug"] = false,
            ["DeviceType"] = {
                ["Android"] = 2,
                ["IOS"] = 3,
                ["Other"] = 0,
                ["PC"] = 1,
            },
            ["DoExplodeStatus"] = {
                ["DestroyBlock"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "是",
                        },
                        ["second"] = {
                            ["name"] = "否",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["ExplodeRangeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "全向爆炸",
                        },
                        ["second"] = {
                            ["name"] = "向上爆炸",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["HarmType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "物理",
                        },
                    },
                    ["first"] = 0,
                },
            },
            ["DoHarmStatus"] = {
                ["AttackType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "近战",
                        },
                        ["second"] = {
                            ["name"] = "远战",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["HarmInherit"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "不继承",
                        },
                        ["second"] = {
                            ["name"] = "自动",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["HarmType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "物理",
                        },
                        ["fiveth"] = {
                            ["name"] = "混乱",
                        },
                        ["fourth"] = {
                            ["name"] = "毒素",
                        },
                        ["second"] = {
                            ["name"] = "元素",
                        },
                        ["seventh"] = {
                            ["name"] = "冰冻",
                        },
                        ["sixth"] = {
                            ["name"] = "闪电",
                        },
                        ["third"] = {
                            ["name"] = "燃烧",
                        },
                    },
                    ["first"] = 0,
                    ["fiveth"] = 6,
                    ["fourth"] = 5,
                    ["second"] = 1,
                    ["seventh"] = 8,
                    ["sixth"] = 7,
                    ["third"] = 4,
                },
            },
            ["Door"] = {
                ["ControlModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Manual"] = 0,
                    ["Power"] = 1,
                    ["__info"] = {
                        ["Manual"] = {
                            ["name"] = "手动控制",
                            ["sort"] = 1,
                        },
                        ["Power"] = {
                            ["name"] = "星能控制",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["DropMode"] = {
                ["ChangePlayMode"] = 7,
                ["DefeatMob"] = 4,
                ["DestroyBlock"] = 5,
                ["DestroyBox"] = 3,
                ["DiscardItem"] = 2,
                ["SpawnItem"] = 6,
            },
            ["Easing"] = {
                ["BackIn"] = 25,
                ["BackInOut"] = 27,
                ["BackOut"] = 26,
                ["BounceIn"] = 28,
                ["BounceInOut"] = 30,
                ["BounceOut"] = 29,
                ["CircIn"] = 19,
                ["CircInOut"] = 21,
                ["CircOut"] = 20,
                ["CubicIn"] = 7,
                ["CubicInOut"] = 9,
                ["CubicOut"] = 8,
                ["Custom"] = 31,
                ["ElasticIn"] = 22,
                ["ElasticInOut"] = 24,
                ["ElasticOut"] = 23,
                ["ExpoIn"] = 16,
                ["ExpoInOut"] = 18,
                ["ExpoOut"] = 17,
                ["Linear"] = 0,
                ["None"] = -1,
                ["QuadIn"] = 4,
                ["QuadInOut"] = 6,
                ["QuadOut"] = 5,
                ["QuartIn"] = 10,
                ["QuartInOut"] = 12,
                ["QuartOut"] = 11,
                ["QuintIn"] = 13,
                ["QuintInOut"] = 15,
                ["QuintOut"] = 14,
                ["SineIn"] = 1,
                ["SineInOut"] = 3,
                ["SineOut"] = 2,
            },
            ["ElementAttr"] = {
                ["Angle"] = 10,
                ["Color"] = 5,
                ["GlobalPos"] = 106,
                ["GlobalPosX"] = 14,
                ["GlobalPosY"] = 15,
                ["Height"] = 6,
                ["Id"] = 2,
                ["Name"] = 1,
                ["Position"] = 103,
                ["PositionX"] = 3,
                ["PositionY"] = 4,
                ["ScrollPosition"] = 105,
                ["ScrollX"] = 12,
                ["ScrollY"] = 13,
                ["Size"] = 104,
                ["Text"] = 8,
                ["Texture"] = 16,
                ["Transparency"] = 9,
                ["Visibility"] = 11,
                ["Width"] = 7,
            },
            ["ElementType"] = {
                ["Button"] = 2,
                ["InputText"] = 4,
                ["Loader3D"] = 5,
                ["SlidingContainer"] = 6,
                ["Text"] = 3,
                ["Texture"] = 1,
            },
            ["EmitterEdit"] = {
                ["AngleMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Fixed"] = 1,
                    ["FollowView"] = 0,
                    ["Model"] = 3,
                    ["Target"] = 2,
                    ["__info"] = {
                        ["Fixed"] = {
                            ["name"] = "固定角度",
                            ["sort"] = 2,
                        },
                        ["FollowView"] = {
                            ["name"] = "跟随视角",
                            ["sort"] = 1,
                        },
                        ["Model"] = {
                            ["name"] = "跟随模型朝向",
                            ["sort"] = 4,
                        },
                        ["Target"] = {
                            ["name"] = "朝向目标",
                            ["sort"] = 3,
                        },
                    },
                },
                ["BindPoint"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Breast"] = 105,
                    ["FootDown"] = 109,
                    ["Head"] = 106,
                    ["LeftFoot"] = 102,
                    ["LeftHand"] = 100,
                    ["RightFoot"] = 103,
                    ["RightHand"] = 101,
                    ["__info"] = {
                        ["Breast"] = {
                            ["name"] = "胸部",
                            ["sort"] = 5,
                        },
                        ["FootDown"] = {
                            ["name"] = "脚底",
                            ["sort"] = 7,
                        },
                        ["Head"] = {
                            ["name"] = "头部",
                            ["sort"] = 6,
                        },
                        ["LeftFoot"] = {
                            ["name"] = "左脚",
                            ["sort"] = 3,
                        },
                        ["LeftHand"] = {
                            ["name"] = "左手",
                            ["sort"] = 1,
                        },
                        ["RightFoot"] = {
                            ["name"] = "右脚",
                            ["sort"] = 4,
                        },
                        ["RightHand"] = {
                            ["name"] = "右手",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ColliderType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Controller"] = 0,
                    ["Dynamic"] = 1,
                    ["None"] = 2,
                    ["__info"] = {
                        ["Controller"] = {
                            ["name"] = "角色控制器",
                            ["sort"] = 1,
                        },
                        ["Dynamic"] = {
                            ["name"] = "动态刚体",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "基础物理",
                            ["sort"] = 3,
                        },
                    },
                },
                ["EmitShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Fan"] = 1,
                    ["Focus"] = 0,
                    ["RandomCircle"] = 2,
                    ["__info"] = {
                        ["Fan"] = {
                            ["name"] = "平面扇形",
                            ["sort"] = 2,
                        },
                        ["Focus"] = {
                            ["name"] = "聚焦",
                            ["sort"] = 1,
                        },
                        ["RandomCircle"] = {
                            ["name"] = "圆形随机",
                            ["sort"] = 3,
                        },
                    },
                },
                ["EmitTiming"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Sequential"] = 1,
                    ["Simultaneous"] = 0,
                    ["__info"] = {
                        ["Sequential"] = {
                            ["name"] = "序列发射",
                            ["sort"] = 2,
                        },
                        ["Simultaneous"] = {
                            ["name"] = "同时发射",
                            ["sort"] = 1,
                        },
                    },
                },
                ["EmitterType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Projectile"] = 0,
                    ["Ray"] = 1,
                    ["Shockwave"] = 2,
                    ["__info"] = {
                        ["Projectile"] = {
                            ["name"] = "投掷物",
                            ["sort"] = 1,
                        },
                        ["Ray"] = {
                            ["name"] = "射线",
                            ["sort"] = 2,
                        },
                        ["Shockwave"] = {
                            ["name"] = "冲击波",
                            ["sort"] = 3,
                        },
                    },
                },
                ["HitBehaviour"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AttachTarget"] = 3,
                    ["Destroy"] = 1,
                    ["None"] = 0,
                    ["Penetrate"] = 2,
                    ["__info"] = {
                        ["AttachTarget"] = {
                            ["name"] = "附着",
                            ["sort"] = 4,
                        },
                        ["Destroy"] = {
                            ["name"] = "销毁",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["Penetrate"] = {
                            ["name"] = "穿透",
                            ["sort"] = 3,
                        },
                    },
                },
                ["HitTriggerMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Both"] = 2,
                    ["End"] = 1,
                    ["Process"] = 0,
                    ["__info"] = {
                        ["Both"] = {
                            ["name"] = "两者都触发",
                            ["sort"] = 3,
                        },
                        ["End"] = {
                            ["name"] = "结束时命中",
                            ["sort"] = 2,
                        },
                        ["Process"] = {
                            ["name"] = "过程中命中",
                            ["sort"] = 1,
                        },
                    },
                },
                ["LaunchCost"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Attribute"] = 2,
                    ["Item"] = 1,
                    ["Nothing"] = 0,
                    ["__info"] = {
                        ["Attribute"] = {
                            ["name"] = "属性消耗",
                            ["sort"] = 3,
                        },
                        ["Item"] = {
                            ["name"] = "道具消耗",
                            ["sort"] = 2,
                        },
                        ["Nothing"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                    },
                },
                ["LockType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Point"] = 0,
                    ["Target"] = 1,
                    ["__info"] = {
                        ["Point"] = {
                            ["name"] = "锁定点",
                            ["sort"] = 1,
                        },
                        ["Target"] = {
                            ["name"] = "锁定对象",
                            ["sort"] = 2,
                        },
                    },
                },
                ["NoPhyscColliderShap"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 1,
                        },
                    },
                },
                ["OriginType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["BindPoint"] = 0,
                    ["Custom"] = 1,
                    ["LastTriggerPosition"] = 3,
                    ["PlayerRayCenter"] = 2,
                    ["__info"] = {
                        ["BindPoint"] = {
                            ["name"] = "角色绑点",
                            ["sort"] = 1,
                        },
                        ["Custom"] = {
                            ["name"] = "自定义位置",
                            ["sort"] = 2,
                        },
                        ["LastTriggerPosition"] = {
                            ["name"] = "上次触发位置",
                            ["sort"] = 4,
                        },
                        ["PlayerRayCenter"] = {
                            ["name"] = "玩家射线中心位置",
                            ["sort"] = 3,
                        },
                    },
                },
                ["PhysicColliderShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Capsule"] = 2,
                    ["__info"] = {
                        ["Capsule"] = {
                            ["name"] = "胶囊体",
                            ["sort"] = 1,
                        },
                    },
                },
                ["ProjectHitCheckType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Ray"] = 0,
                    ["RayAndBox"] = 1,
                    ["__info"] = {
                        ["Ray"] = {
                            ["name"] = "射线检测",
                            ["sort"] = 1,
                        },
                        ["RayAndBox"] = {
                            ["name"] = "盒子(对象)+射线(方块)",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RayHitBehaviour"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Chain"] = 1,
                    ["None"] = 0,
                    ["__info"] = {
                        ["Chain"] = {
                            ["name"] = "链式",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                    },
                },
                ["RayTrajectoryType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Straight"] = 0,
                    ["__info"] = {
                        ["Straight"] = {
                            ["name"] = "直线",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SelectPolicy"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Random"] = 0,
                    ["__info"] = {
                        ["Random"] = {
                            ["name"] = "随机",
                            ["sort"] = 1,
                        },
                    },
                },
                ["ShockwaveRectDirection"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["All"] = 7,
                    ["Backward"] = 4,
                    ["Forward"] = 3,
                    ["ForwardAndBackward"] = 6,
                    ["__info"] = {
                        ["All"] = {
                            ["name"] = "所有",
                            ["sort"] = 7,
                        },
                        ["Backward"] = {
                            ["name"] = "后",
                            ["sort"] = 4,
                        },
                        ["Forward"] = {
                            ["name"] = "前",
                            ["sort"] = 3,
                        },
                        ["ForwardAndBackward"] = {
                            ["name"] = "前后",
                            ["sort"] = 6,
                        },
                        ["left"] = {
                            ["name"] = "左",
                            ["sort"] = 1,
                        },
                        ["leftAndright"] = {
                            ["name"] = "左右",
                            ["sort"] = 5,
                        },
                        ["right"] = {
                            ["name"] = "右",
                            ["sort"] = 2,
                        },
                    },
                    ["left"] = 1,
                    ["leftAndright"] = 5,
                    ["right"] = 2,
                },
                ["ShockwaveShapeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Fan"] = 1,
                    ["Rectangle"] = 2,
                    ["__info"] = {
                        ["Fan"] = {
                            ["name"] = "扇形",
                            ["sort"] = 1,
                        },
                        ["Rectangle"] = {
                            ["name"] = "矩形",
                            ["sort"] = 2,
                        },
                    },
                },
                ["TargetLostAction"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Destroy"] = 0,
                    ["KeepStraight"] = 1,
                    ["__info"] = {
                        ["Destroy"] = {
                            ["name"] = "自毁",
                            ["sort"] = 1,
                        },
                        ["KeepStraight"] = {
                            ["name"] = "直飞",
                            ["sort"] = 2,
                        },
                    },
                },
                ["TrajectoryType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Orbit"] = 2,
                    ["Parabola"] = 1,
                    ["Straight"] = 0,
                    ["Track"] = 3,
                    ["__info"] = {
                        ["Orbit"] = {
                            ["name"] = "环绕",
                            ["sort"] = 3,
                        },
                        ["Parabola"] = {
                            ["name"] = "抛物线",
                            ["sort"] = 2,
                        },
                        ["Straight"] = {
                            ["name"] = "直线",
                            ["sort"] = 1,
                        },
                        ["Track"] = {
                            ["name"] = "跟踪",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["EquipEdit"] = {
                ["AnchorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Back"] = 1105,
                    ["Chest"] = 105,
                    ["Head"] = 106,
                    ["LeftFoot"] = 102,
                    ["LeftHandle"] = 100,
                    ["RightFoot"] = 103,
                    ["RightHandle"] = 101,
                    ["__info"] = {
                        ["Back"] = {
                            ["name"] = "特殊",
                        },
                        ["Chest"] = {
                            ["name"] = "胸部",
                        },
                        ["Head"] = {
                            ["name"] = "头部",
                        },
                        ["LeftFoot"] = {
                            ["name"] = "左脚",
                        },
                        ["LeftHandle"] = {
                            ["name"] = "左手",
                        },
                        ["RightFoot"] = {
                            ["name"] = "右脚",
                        },
                        ["RightHandle"] = {
                            ["name"] = "右手",
                        },
                    },
                },
                ["PartModelType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Avatar"] = 1,
                    ["Normal"] = 0,
                    ["__info"] = {
                        ["Avatar"] = {
                            ["name"] = "Avatar部件",
                            ["sort"] = 2,
                        },
                        ["Normal"] = {
                            ["name"] = "普通部件",
                            ["sort"] = 1,
                        },
                    },
                },
                ["slotType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Breast"] = 1,
                    ["Cloak"] = 4,
                    ["Custom1"] = 6,
                    ["Custom2"] = 7,
                    ["Custom3"] = 8,
                    ["Head"] = 0,
                    ["Leg"] = 2,
                    ["Shoes"] = 3,
                    ["__info"] = {
                        ["Breast"] = {
                            ["name"] = "胸甲",
                            ["sort"] = 2,
                        },
                        ["Cloak"] = {
                            ["name"] = "背部（特殊）",
                            ["sort"] = 5,
                        },
                        ["Custom1"] = {
                            ["name"] = "扩展1",
                            ["sort"] = 6,
                        },
                        ["Custom2"] = {
                            ["name"] = "扩展2",
                            ["sort"] = 7,
                        },
                        ["Custom3"] = {
                            ["name"] = "扩展3",
                            ["sort"] = 8,
                        },
                        ["Head"] = {
                            ["name"] = "头盔",
                            ["sort"] = 1,
                        },
                        ["Leg"] = {
                            ["name"] = "护腿",
                            ["sort"] = 3,
                        },
                        ["Shoes"] = {
                            ["name"] = "靴子",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["EquipSlotType"] = {
                ["Breast"] = 1,
                ["Custom1"] = 6,
                ["Custom2"] = 7,
                ["Custom3"] = 8,
                ["Head"] = 0,
                ["Legging"] = 2,
                ["MaxSlots"] = 9,
                ["Pifeng"] = 4,
                ["Shoe"] = 3,
                ["Weapon"] = 5,
            },
            ["EquipStartIndex"] = 8000,
            ["ErrorCode"] = {
                ["FAILED"] = 1001,
                ["KV_OP_CD_LMT"] = 100,
                ["KV_OP_INVALID_VAL"] = 5,
                ["KV_OP_NO_VAL"] = 4,
                ["KV_OP_QPM_LMT"] = 101,
                ["KV_UPDATE_GET"] = 1,
                ["KV_UPDATE_SET"] = 2,
                ["OK"] = 0,
            },
            ["EventDate"] = {
                ["Day"] = 2,
                ["Dayofweek"] = 7,
                ["Hour"] = 3,
                ["Minute"] = 4,
                ["Month"] = 1,
                ["Second"] = 5,
                ["Timestamp"] = 6,
                ["Year"] = 0,
            },
            ["ExplodeDmgType"] = {
                ["Chaos"] = 3,
                ["Electric"] = 4,
                ["Fire"] = 1,
                ["Ice"] = 5,
                ["Physical"] = 0,
                ["Poison"] = 2,
                ["Void"] = 6,
            },
            ["Export"] = function(name, data) end, --[[@lua]]
            ["ExtBackpackStartIndex"] = 58000,
            ["FaceDir"] = {
                ["NegX"] = 0,
                ["NegY"] = 4,
                ["NegZ"] = 2,
                ["None"] = -1,
                ["PosX"] = 1,
                ["PosY"] = 5,
                ["PosZ"] = 3,
            },
            ["FaceType"] = {
                ["Pitch"] = 2,
                ["Yaw"] = 1,
            },
            ["Feed"] = {
                ["BubbleType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ID"] = 0,
                    ["IDs"] = 1,
                    ["__info"] = {
                        ["ID"] = {
                            ["name"] = "气泡ID",
                            ["sort"] = 1,
                        },
                        ["IDs"] = {
                            ["name"] = "气泡组ID",
                            ["sort"] = 2,
                        },
                    },
                },
                ["FeedReactType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AddHPAttrs"] = 0,
                    ["Mutation"] = 2,
                    ["ReturnRewards"] = 1,
                    ["__info"] = {
                        ["AddHPAttrs"] = {
                            ["name"] = "恢复属性",
                            ["sort"] = 1,
                        },
                        ["Mutation"] = {
                            ["name"] = "喂食变异",
                            ["sort"] = 3,
                        },
                        ["ReturnRewards"] = {
                            ["name"] = "兑换道具",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RewardItemType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Buff"] = 1,
                    ["Item"] = 0,
                    ["__info"] = {
                        ["Buff"] = {
                            ["name"] = "BUFF",
                            ["sort"] = 2,
                        },
                        ["Item"] = {
                            ["name"] = "道具",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Fight"] = {
                ["AnimationName"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Attack"] = 0,
                    ["__info"] = {
                        ["Attack"] = {
                            ["name"] = "攻击",
                            ["sort"] = 1,
                        },
                    },
                },
                ["AttackMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Type0"] = 0,
                    ["Type1"] = 1,
                    ["__info"] = {
                        ["Type0"] = {
                            ["name"] = "主动攻击",
                            ["sort"] = 1,
                        },
                        ["Type1"] = {
                            ["name"] = "被动攻击",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ColliderShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 2,
                        },
                    },
                },
                ["NoPhyscColliderShap"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 1,
                        },
                    },
                },
                ["Team"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Eight"] = 5,
                    ["Five"] = 2,
                    ["Four"] = 1,
                    ["Nine"] = 6,
                    ["One"] = 201,
                    ["Seven"] = 4,
                    ["Six"] = 3,
                    ["Three"] = 0,
                    ["Two"] = 202,
                    ["__info"] = {
                        ["Eight"] = {
                            ["name"] = "队伍5橙",
                            ["sort"] = 8,
                        },
                        ["Five"] = {
                            ["name"] = "队伍2蓝",
                            ["sort"] = 5,
                        },
                        ["Four"] = {
                            ["name"] = "队伍1红",
                            ["sort"] = 4,
                        },
                        ["Nine"] = {
                            ["name"] = "队伍6紫",
                            ["sort"] = 9,
                        },
                        ["One"] = {
                            ["name"] = "敌对生物",
                            ["sort"] = 1,
                        },
                        ["Seven"] = {
                            ["name"] = "队伍4黄",
                            ["sort"] = 7,
                        },
                        ["Six"] = {
                            ["name"] = "队伍3绿",
                            ["sort"] = 6,
                        },
                        ["Three"] = {
                            ["name"] = "无队伍",
                            ["sort"] = 3,
                        },
                        ["Two"] = {
                            ["name"] = "中立生物",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["FoodEdit"] = {
                ["BarbecueType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Burned"] = 3,
                    ["Cooked"] = 2,
                    ["No"] = 0,
                    ["Raw"] = 1,
                    ["__info"] = {
                        ["Burned"] = {
                            ["name"] = "烧焦",
                            ["sort"] = 4,
                        },
                        ["Cooked"] = {
                            ["name"] = "熟食",
                            ["sort"] = 3,
                        },
                        ["No"] = {
                            ["name"] = "不可烧烤",
                            ["sort"] = 1,
                        },
                        ["Raw"] = {
                            ["name"] = "生食",
                            ["sort"] = 2,
                        },
                    },
                },
                ["FoodTIngredientsType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Food"] = 0,
                    ["NotFood"] = 1,
                    ["__info"] = {
                        ["Food"] = {
                            ["name"] = "食材",
                            ["sort"] = 1,
                        },
                        ["NotFood"] = {
                            ["name"] = "非食材",
                            ["sort"] = 2,
                        },
                    },
                },
                ["Time"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Forever"] = 1,
                    ["NotForever"] = 0,
                    ["__info"] = {
                        ["Forever"] = {
                            ["name"] = "无限时间",
                            ["sort"] = 2,
                        },
                        ["NotForever"] = {
                            ["name"] = "有限时间",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["FurnaceEdit"] = {
                ["FurnaceType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Bonfire"] = 2,
                    ["Furnace"] = 0,
                    ["__info"] = {
                        ["Bonfire"] = {
                            ["name"] = "篝火",
                            ["sort"] = 2,
                        },
                        ["Furnace"] = {
                            ["name"] = "冶炼",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["FurnaceType"] = {
                ["Copper"] = 799,
                ["Iron"] = 798,
                ["Stone"] = 802,
            },
            ["GRAPHICS"] = {
                ["GRAPHICS_ARROW_ACTOR"] = 5,
                ["GRAPHICS_ARROW_POS"] = 4,
                ["GRAPHICS_BUBBLE"] = 12,
                ["GRAPHICS_HORNBOOK"] = 1,
                ["GRAPHICS_IMAGE"] = 10,
                ["GRAPHICS_LINE_ACTOR"] = 7,
                ["GRAPHICS_LINE_POS"] = 6,
                ["GRAPHICS_NAVPATH_POS"] = 11,
                ["GRAPHICS_PROGRESS"] = 3,
                ["GRAPHICS_SURFACE_ACTOR"] = 9,
                ["GRAPHICS_SURFACE_POS"] = 8,
                ["GRAPHICS_SUSPENDBOOK"] = 2,
            },
            ["GSoundType"] = {
                ["Destroy"] = 1,
                ["Dig"] = 0,
                ["FallGround"] = 3,
                ["Place"] = 2,
                ["Walk"] = 4,
            },
            ["Game"] = {
                ["ShowMsgBox"] = function(self, msg) end, --[[@service Game.ShowMsgBox; @mtype Normal]]
            },
            ["GameActorType"] = {
                ["ACTORTYPE_AQUATICMONSTER"] = 43,
                ["ACTORTYPE_ARROW"] = 9,
                ["ACTORTYPE_BLOCK_AWAKEN"] = 155,
                ["ACTORTYPE_BLOCK_LASER"] = 39,
                ["ACTORTYPE_BOAT"] = 21,
                ["ACTORTYPE_BOOKEDITORTABLE"] = 53,
                ["ACTORTYPE_BOSS"] = 31,
                ["ACTORTYPE_BUILDBLUEPRINT"] = 45,
                ["ACTORTYPE_COBBLE"] = 27,
                ["ACTORTYPE_COLLIDER"] = 48,
                ["ACTORTYPE_CRAB"] = 102,
                ["ACTORTYPE_CREATURE"] = 4,
                ["ACTORTYPE_DESERTBUSINESSMAN"] = 90,
                ["ACTORTYPE_DESERTBUSINESSMANGUARD"] = 91,
                ["ACTORTYPE_DESERTVILLAGER"] = 92,
                ["ACTORTYPE_DRAGON"] = 41,
                ["ACTORTYPE_DROPITEM"] = 2,
                ["ACTORTYPE_EFFECT"] = 25,
                ["ACTORTYPE_EMITTER"] = 23,
                ["ACTORTYPE_ENDEREYE"] = 17,
                ["ACTORTYPE_FALLSAND"] = 11,
                ["ACTORTYPE_FIREBALL"] = 32,
                ["ACTORTYPE_FIREWORK"] = 20,
                ["ACTORTYPE_FISHERMAN"] = 98,
                ["ACTORTYPE_FISHINGVILLAGER"] = 97,
                ["ACTORTYPE_FLYBLOCK"] = 12,
                ["ACTORTYPE_FLYMONSTER"] = 42,
                ["ACTORTYPE_FLYSNAKEGOD"] = 69,
                ["ACTORTYPE_FUNNEL"] = 22,
                ["ACTORTYPE_GAMEOBJECT"] = 9999,
                ["ACTORTYPE_GAMEOBJECT_AREA"] = 10000,
                ["ACTORTYPE_GIANT"] = 40,
                ["ACTORTYPE_HIPPOCAMPUS"] = 103,
                ["ACTORTYPE_HIPPOCAMPUS_HORSE"] = 105,
                ["ACTORTYPE_HOOK"] = 47,
                ["ACTORTYPE_HORSE"] = 24,
                ["ACTORTYPE_INTERPRETERUNIT"] = 38,
                ["ACTORTYPE_ITEMEXPO"] = 26,
                ["ACTORTYPE_LASER"] = 46,
                ["ACTORTYPE_MECHA_DRIVER"] = 30,
                ["ACTORTYPE_MECHA_UNIT"] = 29,
                ["ACTORTYPE_MOBSPAWNER"] = 18,
                ["ACTORTYPE_MODELCRAFT"] = 50,
                ["ACTORTYPE_MONSTER"] = 0,
                ["ACTORTYPE_NPC"] = 3,
                ["ACTORTYPE_OTHERPROJECTILE"] = 28,
                ["ACTORTYPE_PACKHORSE"] = 93,
                ["ACTORTYPE_PIRATE_SHIP"] = 106,
                ["ACTORTYPE_PISTON"] = 15,
                ["ACTORTYPE_RADIOUNIT"] = 37,
                ["ACTORTYPE_RAILKNOT"] = 34,
                ["ACTORTYPE_REGIONREPLICATOR"] = 44,
                ["ACTORTYPE_ROCKET"] = 36,
                ["ACTORTYPE_ROLE"] = 5,
                ["ACTORTYPE_SANDMAN"] = 94,
                ["ACTORTYPE_SANDWORM"] = 89,
                ["ACTORTYPE_SEASPIRITGUARDING"] = 96,
                ["ACTORTYPE_SENSOR"] = 33,
                ["ACTORTYPE_SIGNS"] = 19,
                ["ACTORTYPE_SMALL_HIPPOCAMPUS"] = 104,
                ["ACTORTYPE_STRING"] = 14,
                ["ACTORTYPE_THROWABLE"] = 16,
                ["ACTORTYPE_THROWBLOCK"] = 35,
                ["ACTORTYPE_TNT"] = 10,
                ["ACTORTYPE_TRANSFER"] = 52,
                ["ACTORTYPE_TRIXENIE"] = 85,
                ["ACTORTYPE_VACANTBOSS"] = 66,
                ["ACTORTYPE_VALUE"] = 13,
                ["ACTORTYPE_VEHICLE"] = 49,
                ["ACTORTYPE_VILLAGER"] = 62,
                ["ACTORTYPE_WHEEL"] = 54,
                ["ACTORTYPE_WORKSHOP"] = 51,
            },
            ["GameEffect"] = {
                ["ApplyPsychedelicVisionClient"] = function(self, content) end, --[[@service GameEffect.ApplyPsychedelicVisionClient; @mtype Normal]]
                ["ClosePsychedelicVision"] = function(self, uin, token) end, --[[@service GameEffect.ClosePsychedelicVision; @mtype Normal]]
                ["CloseScreenEffect"] = function(self, uin) end, --[[@service GameEffect.CloseScreenEffect; @mtype Normal]]
                ["ShowPsychedelicVision"] = function(self, uin, content) end, --[[@service GameEffect.ShowPsychedelicVision; @mtype Normal]]
                ["ShowScreenEffect"] = function(self, uin, ctype, isloop, incspeed) end, --[[@service GameEffect.ShowScreenEffect; @mtype Normal]]
            },
            ["GameObject"] = {
                ["CreateEditEmptyActor"] = function(self) end, --[[@service GameObject.CreateEditEmptyActor; @mtype Normal]]
                ["CreatePrefab"] = function(self, objectType, prefabId, x, y, z, num, trigger, worldId) end, --[[@service GameObject.CreatePrefab; @mtype Normal]]
                ["CreatePrefabInst"] = function(self, prefabId, worldId, x, y, z, trigger) end, --[[@service GameObject.CreatePrefabInst; @mtype Normal]]
                ["Destroy"] = function(self, objId) end, --[[@service GameObject.Destroy; @mtype Normal]]
                ["FindBlockObject"] = function(self, id) end, --[[@service GameObject.FindBlockObject; @mtype Normal]]
                ["FindBlockObjectForInternal"] = function(self, id) end, --[[@service GameObject.FindBlockObjectForInternal; @mtype Normal]]
                ["FindObject"] = function(self, id) end, --[[@service GameObject.FindObject; @mtype Normal]]
                ["FindPlanet"] = function(self, id) end, --[[@service GameObject.FindPlanet; @mtype Normal]]
                ["FindUIObject"] = function(self, id) end, --[[@service GameObject.FindUIObject; @mtype Normal]]
                ["GetObjInstanceID"] = function(self, uuid) end, --[[@service GameObject.GetObjInstanceID; @mtype Normal]]
                ["GetObjType"] = function(self, objId) end, --[[@service GameObject.GetObjType; @mtype Normal]]
                ["GetObjectPrefab"] = function(self, objId) end, --[[@service GameObject.GetObjectPrefab; @mtype Normal]]
                ["GetWorld"] = function(self) end, --[[@service GameObject.GetWorld; @mtype Normal]]
            },
            ["GameRule"] = {
                ["GetAllowMidwayJoin"] = function(self) end, --[[@service GameRule.GetAllowMidwayJoin; @mtype Normal]]
                ["GetCountDown"] = function(self) end, --[[@service GameRule.GetCountDown; @mtype Normal]]
                ["GetDisplayScore"] = function(self) end, --[[@service GameRule.GetDisplayScore; @mtype Normal]]
                ["GetGameRuleValue"] = function(self, ruleId) end, --[[@service GameRule.GetGameRuleValue; @mtype Normal]]
                ["GetKillNotify"] = function(self) end, --[[@service GameRule.GetKillNotify; @mtype Normal]]
                ["GetLifeNum"] = function(self) end, --[[@service GameRule.GetLifeNum; @mtype Normal]]
                ["GetMobGen"] = function(self) end, --[[@service GameRule.GetMobGen; @mtype Normal]]
                ["IsDevBuild"] = function(self) end, --[[@service GameRule.IsDevBuild; @mtype Normal]]
                ["RefreshLevelModeUI"] = function(self) end, --[[@service GameRule.RefreshLevelModeUI; @mtype Normal]]
                ["SetAllowMidwayJoin"] = function(self, set) end, --[[@service GameRule.SetAllowMidwayJoin; @mtype Normal]]
                ["SetCountDown"] = function(self, val) end, --[[@service GameRule.SetCountDown; @mtype Normal]]
                ["SetDisplayScore"] = function(self, set) end, --[[@service GameRule.SetDisplayScore; @mtype Normal]]
                ["SetGameRuleValue"] = function(self, ruleId, val) end, --[[@service GameRule.SetGameRuleValue; @mtype Normal]]
                ["SetKillNotify"] = function(self, set) end, --[[@service GameRule.SetKillNotify; @mtype Normal]]
                ["SetLifeNum"] = function(self, lifenum) end, --[[@service GameRule.SetLifeNum; @mtype Normal]]
                ["SetMobGen"] = function(self, set) end, --[[@service GameRule.SetMobGen; @mtype Normal]]
                ["SetPlayerAttrState"] = function(self, option, value) end, --[[@service GameRule.SetPlayerAttrState; @mtype Normal]]
                ["SetPlayerGamePermits"] = function(self, uin, mode, val) end, --[[@service GameRule.SetPlayerGamePermits; @mtype Normal]]
                ["SetReviveCostBtnIcon"] = function(self, url) end, --[[@service GameRule.SetReviveCostBtnIcon; @mtype Normal]]
            },
            ["GameSetting"] = {
                ["AutoJump"] = 3,
                ["CameraShake"] = 2,
                ["FixedMap"] = 4,
                ["ScopeMode"] = 1,
            },
            ["GamemakerRule"] = {
                ["AllowMidwayJoin"] = 38,
                ["AttackPlayer"] = 13,
                ["Behurt"] = 46,
                ["BgMusicMode"] = 25,
                ["BlockDestroy"] = 5,
                ["BlockPlace"] = 6,
                ["BlockUse"] = 7,
                ["Camera"] = 9,
                ["Countdown"] = 42,
                ["Curtime"] = 1,
                ["DisplayName"] = 21,
                ["DisplayScore"] = 30,
                ["EndScore"] = 15,
                ["EndTime"] = 14,
                ["EndtimeWinlose"] = 22,
                ["GpoisonSafed0"] = 36,
                ["GpoisonSafet0"] = 37,
                ["GpoisonSwitch"] = 35,
                ["GravityFactor"] = 8,
                ["HurtInterval"] = 45,
                ["KillNotify"] = 24,
                ["LifeNum"] = 31,
                ["LifenumTeamShare"] = 39,
                ["MaxPlayers"] = 4,
                ["MiniMapTeams"] = 28,
                ["MobGen"] = 26,
                ["PlayerDieDrops"] = 29,
                ["ResetScore"] = 44,
                ["ReviveInvulnerable"] = 20,
                ["ReviveMode"] = 19,
                ["RoleShadow"] = 52,
                ["SaveMode"] = 23,
                ["ScoreCollectStar"] = 18,
                ["ScoreColorChange"] = 33,
                ["ScoreKillMob"] = 17,
                ["ScoreKillPlayer"] = 16,
                ["ScoreResetRound"] = 43,
                ["SetViewMode"] = 40,
                ["SetViewType"] = 41,
                ["ShowSight"] = 32,
                ["SpawnPtMode"] = 27,
                ["StartMode"] = 10,
                ["StartPlayers"] = 11,
                ["TeamNum"] = 12,
                ["Timelocked"] = 2,
                ["Weather"] = 3,
            },
            ["GenerateBlock"] = {
                ["GenerateNumType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Fixed"] = 1,
                    ["Random"] = 0,
                    ["__info"] = {
                        ["Fixed"] = {
                            ["name"] = "固定数量",
                            ["sort"] = 2,
                        },
                        ["Random"] = {
                            ["name"] = "随机",
                            ["sort"] = 1,
                        },
                    },
                },
                ["RandomType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Independent"] = 0,
                    ["Weight"] = 1,
                    ["__info"] = {
                        ["Independent"] = {
                            ["name"] = "独立随机",
                            ["sort"] = 1,
                        },
                        ["Weight"] = {
                            ["name"] = "权重随机",
                            ["sort"] = 2,
                        },
                    },
                },
                ["SpawnMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Continuous"] = 1,
                    ["Single"] = 0,
                    ["__info"] = {
                        ["Continuous"] = {
                            ["name"] = "持续刷怪",
                            ["sort"] = 2,
                        },
                        ["Single"] = {
                            ["name"] = "单次刷怪",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["GetInst"] = function(className) end, --[[@lua]]
            ["GetModId"] = function() end, --[[@lua]]
            ["GetS"] = function(id, ...) end, --[[@lua]]
            ["GetWorld"] = function() end, --[[@lua]]
            ["Graphics"] = {
                ["CreateBrushByPos"] = function(self, pos, dim, color, showuin, itype, worldId) end, --[[@service Graphics.CreateBrushByPos; @mtype Normal]]
                ["CreateGraphicsArrowByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsArrowByActorToActor; @mtype Normal]]
                ["CreateGraphicsArrowByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsArrowByActorToPos; @mtype Normal]]
                ["CreateGraphicsArrowByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsArrowByPosToActor; @mtype Normal]]
                ["CreateGraphicsArrowByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsArrowByPosToPos; @mtype Normal]]
                ["CreateGraphicsImageByActor"] = function(self, objid, info, dir, offest, x2, y2) end, --[[@service Graphics.CreateGraphicsImageByActor; @mtype Normal]]
                ["CreateGraphicsImageByPos"] = function(self, x, y, z, info, x2, y2, worldId) end, --[[@service Graphics.CreateGraphicsImageByPos; @mtype Normal]]
                ["CreateGraphicsLineByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsLineByActorToActor; @mtype Normal]]
                ["CreateGraphicsLineByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsLineByActorToPos; @mtype Normal]]
                ["CreateGraphicsLineByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsLineByPosToActor; @mtype Normal]]
                ["CreateGraphicsLineByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsLineByPosToPos; @mtype Normal]]
                ["CreateGraphicsNavPathByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsNavPathByActorToPos; @mtype Normal]]
                ["CreateGraphicsProgressByActor"] = function(self, objid, info, dir, offest, x2, y2) end, --[[@service Graphics.CreateGraphicsProgressByActor; @mtype Normal]]
                ["CreateGraphicsProgressByPos"] = function(self, x, y, z, info, x2, y2, worldId) end, --[[@service Graphics.CreateGraphicsProgressByPos; @mtype Normal]]
                ["CreateGraphicsSurfaceByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsSurfaceByActorToActor; @mtype Normal]]
                ["CreateGraphicsSurfaceByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Graphics.CreateGraphicsSurfaceByActorToPos; @mtype Normal]]
                ["CreateGraphicsSurfaceByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsSurfaceByPosToActor; @mtype Normal]]
                ["CreateGraphicsSurfaceByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Graphics.CreateGraphicsSurfaceByPosToPos; @mtype Normal]]
                ["CreateGraphicsTxtByActor"] = function(self, objid, info, dir, offest, x2, y2) end, --[[@service Graphics.CreateGraphicsTxtByActor; @mtype Normal]]
                ["CreateGraphicsTxtByPos"] = function(self, x, y, z, graphicInfo, x2, y2, worldId) end, --[[@service Graphics.CreateGraphicsTxtByPos; @mtype Normal]]
                ["CreateflotageTextByActor"] = function(self, objid, info, dir, offest, x2, y2) end, --[[@service Graphics.CreateflotageTextByActor; @mtype Normal]]
                ["CreateflotageTextByPos"] = function(self, x, y, z, info, x2, y2, worldId) end, --[[@service Graphics.CreateflotageTextByPos; @mtype Normal]]
                ["FindGraphics"] = function(self, x, y, z, playerid, itype) end, --[[@service Graphics.FindGraphics; @mtype Normal]]
                ["GetInnerGraphicsOffset"] = function(self, tuin, itype, callback) end, --[[@service Graphics.GetInnerGraphicsOffset; @mtype Normal]]
                ["GetInnerGraphicsOffset_OnClient"] = function(self, reportid, objid, tuin, itype) end, --[[@service Graphics.GetInnerGraphicsOffset_OnClient; @mtype ClientData]]
                ["MakeGraphicsArrowToActor"] = function(self, objid, size, color, itype) end, --[[@service Graphics.MakeGraphicsArrowToActor; @mtype Normal]]
                ["MakeGraphicsArrowToPos"] = function(self, x, y, z, size, color, itype) end, --[[@service Graphics.MakeGraphicsArrowToPos; @mtype Normal]]
                ["MakeGraphicsImage"] = function(self, imgid, scale, apha, itype) end, --[[@service Graphics.MakeGraphicsImage; @mtype Normal]]
                ["MakeGraphicsLineToActor"] = function(self, objid, size, color, itype) end, --[[@service Graphics.MakeGraphicsLineToActor; @mtype Normal]]
                ["MakeGraphicsLineToPos"] = function(self, x, y, z, size, color, itype) end, --[[@service Graphics.MakeGraphicsLineToPos; @mtype Normal]]
                ["MakeGraphicsNavPathToPos"] = function(self, x, y, z, itype, tCanSeePlayers) end, --[[@service Graphics.MakeGraphicsNavPathToPos; @mtype Normal]]
                ["MakeGraphicsProgress"] = function(self, v1, v2, color, itype) end, --[[@service Graphics.MakeGraphicsProgress; @mtype Normal]]
                ["MakeGraphicsSurfaceToActor"] = function(self, objid, size, color, itype) end, --[[@service Graphics.MakeGraphicsSurfaceToActor; @mtype Normal]]
                ["MakeGraphicsSurfaceToPos"] = function(self, x, y, z, size, color, itype) end, --[[@service Graphics.MakeGraphicsSurfaceToPos; @mtype Normal]]
                ["MakeGraphicsText"] = function(self, title, font, apha, itype, autoWrap) end, --[[@service Graphics.MakeGraphicsText; @mtype Normal]]
                ["MakeflotageText"] = function(self, title, font, itype) end, --[[@service Graphics.MakeflotageText; @mtype Normal]]
                ["RemoveGraphicsByGraphicsID"] = function(self, objid) end, --[[@service Graphics.RemoveGraphicsByGraphicsID; @mtype BoardCast]]
                ["RemoveGraphicsByObjID"] = function(self, objid, itype, graphType) end, --[[@service Graphics.RemoveGraphicsByObjID; @mtype Normal]]
                ["RemoveGraphicsByPos"] = function(self, x, y, z, itype, graphType, worldId) end, --[[@service Graphics.RemoveGraphicsByPos; @mtype Normal]]
                ["ReplaceAllGraphics"] = function(self, srcObjid, desObjid) end, --[[@service Graphics.ReplaceAllGraphics; @mtype Normal]]
                ["SnycGraphicsInfo2Client"] = function(self) end, --[[@service Graphics.SnycGraphicsInfo2Client; @mtype Normal]]
                ["UpdateGraphicsProgressById"] = function(self, graphid, val1, val2, isync) end, --[[@service Graphics.UpdateGraphicsProgressById; @mtype Normal]]
                ["UpdateGraphicsTextById"] = function(self, graphid, title, fontsize, apha, isync) end, --[[@service Graphics.UpdateGraphicsTextById; @mtype Normal]]
            },
            ["GraphicsType"] = {
                ["ArrowActor"] = 5,
                ["ArrowPos"] = 4,
                ["Brush"] = 12,
                ["Bubble"] = 13,
                ["Hornbook"] = 1,
                ["Image"] = 10,
                ["LineActor"] = 7,
                ["LinePos"] = 6,
                ["NavPathPos"] = 11,
                ["Progress"] = 3,
                ["SurfaceActor"] = 9,
                ["SurfacePos"] = 8,
                ["Suspendbook"] = 2,
            },
            ["GridAttr"] = {
                ["Durable"] = 2,
                ["ItemNum"] = 1,
                ["Toughness"] = 3,
            },
            ["GroupWeatherType"] = {
                ["Aurora"] = 10,
                ["Bad"] = 4,
                ["Blizzard"] = 8,
                ["MeteorShower"] = 9,
                ["Rain"] = 2,
                ["Sandduststorm"] = 6,
                ["Shine"] = 1,
                ["ShineAndRain"] = 0,
                ["Snow"] = 5,
                ["Tempest"] = 7,
                ["Thunder"] = 3,
                ["VoidFog"] = 11,
            },
            ["Grow"] = {
                ["BubbleType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ID"] = 0,
                    ["IDs"] = 1,
                    ["__info"] = {
                        ["ID"] = {
                            ["name"] = "气泡ID",
                            ["sort"] = 1,
                        },
                        ["IDs"] = {
                            ["name"] = "气泡组ID",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["GunAction"] = {
                ["Aim"] = 6,
                ["AimFire"] = 7,
                ["AimLoad"] = 8,
                ["Equip"] = 1,
                ["Fire"] = 3,
                ["Idle"] = 2,
                ["Inspect"] = 11,
                ["Load"] = 4,
                ["Reload"] = 9,
                ["ReloadEmpty"] = 10,
                ["Run"] = 5,
            },
            ["GunActionBan"] = {
                ["Aim"] = 5,
                ["AimFire"] = 6,
                ["AimLoad"] = 7,
                ["Equip"] = 1,
                ["Fire"] = 2,
                ["Inspect"] = 10,
                ["Load"] = 3,
                ["Reload"] = 8,
                ["ReloadEmpty"] = 9,
                ["Run"] = 4,
            },
            ["GunActionState"] = {
                ["Aim"] = 6,
                ["Fire"] = 3,
                ["Inspect"] = 11,
                ["Reload"] = 9,
            },
            ["GunAttr"] = {
                ["AdsMoveSpeedBonus"] = "adsMoveSpeedBonus",
                ["AdsOffsetX"] = "adsOffsetX",
                ["AdsOffsetY"] = "adsOffsetY",
                ["AdsOffsetZ"] = "adsOffsetZ",
                ["AdsSpreadMax"] = "adsSpreadMax",
                ["AdsSpreadMin"] = "adsSpreadMin",
                ["AdsSpreadStep"] = "adsSpreadStep",
                ["AdsSpreadType"] = "adsSpreadType",
                ["AdsSwitchTime"] = "adsSwitchTime",
                ["AdsSwitchTimeBonus"] = "adsSwitchTimeBonus",
                ["AdsXFunction"] = "adsXFunction",
                ["AdsXScale"] = "adsXScale",
                ["BaseDamage"] = "baseDamage",
                ["BaseDamageBonus"] = "baseDamageBonus",
                ["BodyDamage"] = "bodyDamage",
                ["BulletConsume"] = "bulletConsume",
                ["BulletId"] = "bulletId",
                ["BulletShrapnel"] = "bulletShrapnel",
                ["ControlValue"] = "controlValue",
                ["DamageType"] = "damageType",
                ["DecayFinish"] = "decayFinish",
                ["DecayLiquid"] = "dacayLiquid",
                ["DecayMin"] = "decayMin",
                ["DecayStart"] = "decayStart",
                ["EquipTime"] = "equipTime",
                ["FireType"] = "fireType",
                ["GunLevel"] = "gunLevel",
                ["HeadDamage"] = "headDamage",
                ["HipAccValue"] = "hipAccValue",
                ["HipMoveSpeedBonus"] = "hipMoveSpeedBonus",
                ["HipSpreadMax"] = "hipSpreadMax",
                ["HipSpreadMin"] = "hipSpreadMin",
                ["HipSpreadStep"] = "hipSpreadStep",
                ["HipSpreadType"] = "hipSpreadType",
                ["HittedCameraAngle"] = "hittedCameraAngle",
                ["JumpSpreadBonus"] = "jumpSpreadBonus",
                ["MaxAmmo"] = "maxAmmo",
                ["MoveSpreadBonus"] = "moveSpreadBonus",
                ["Penetration"] = "penetration",
                ["Range"] = "range",
                ["RangeBonus"] = "rangeBonus",
                ["RecoilBonus"] = "recoilBonus",
                ["RecoilPitchBonus"] = "recoilPitchBonus",
                ["RecoilValue"] = "recoilValue",
                ["RecoilYawBonus"] = "recoilYawBonus",
                ["ReloadPhase2Time"] = "reloadPhase2Time",
                ["ReloadPhase2TimeEmpty"] = "reloadPhase2TimeEmpty",
                ["ReloadTimeBonus"] = "reloadTimeBonus",
                ["RepelDistance"] = "repelDistance",
                ["Rpm"] = "rpm",
                ["RpmBonus"] = "rpmBonus",
                ["RunSpreadBonus"] = "runSpreadBonus",
                ["ScopeMagnification"] = "scopeMagnification",
                ["ScopeXPic"] = "scopeXPic",
                ["ShiftMoveSpreadBonus"] = "shiftMoveSpreadBonus",
                ["ShiftSpreadBonus"] = "shiftSpreadBonus",
                ["SpreadAdsBonus"] = "spreadAdsBonus",
                ["SpreadBonus"] = "spreadBonus",
                ["SpreadBonusResetSpeed"] = "spreadBonusResetSpeed",
                ["SpreadHipBonus"] = "spreadHipBonus",
                ["SpreadResetSpeed"] = "spreadResetSpeed",
                ["SpreadStepSpeed"] = "spreadStepSpeed",
                ["TouReduce"] = "touReduce",
            },
            ["GunDamageType"] = {
                ["Fire"] = 4,
                ["Ice"] = 8,
                ["Physics"] = 1,
                ["Poison"] = 5,
            },
            ["GunEdit"] = {
                ["AutoFireType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Type0"] = 0,
                    ["Type1"] = 1,
                    ["__info"] = {
                        ["Type0"] = {
                            ["name"] = "开火时开镜",
                            ["sort"] = 1,
                        },
                        ["Type1"] = {
                            ["name"] = "按下开火键开镜，松开时开火",
                            ["sort"] = 2,
                        },
                    },
                },
                ["DamageType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Fire"] = 4,
                    ["Ice"] = 8,
                    ["Physics"] = 1,
                    ["Poison"] = 5,
                    ["__info"] = {
                        ["Fire"] = {
                            ["name"] = "燃烧伤害",
                            ["sort"] = 3,
                        },
                        ["Ice"] = {
                            ["name"] = "冰冻伤害",
                            ["sort"] = 7,
                        },
                        ["Physics"] = {
                            ["name"] = "物理伤害",
                            ["sort"] = 1,
                        },
                        ["Poison"] = {
                            ["name"] = "毒素伤害",
                            ["sort"] = 4,
                        },
                    },
                },
                ["FireType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Auto"] = 0,
                    ["Manual"] = 2,
                    ["SemiAuto"] = 1,
                    ["__info"] = {
                        ["Auto"] = {
                            ["name"] = "全自动",
                            ["sort"] = 1,
                        },
                        ["Manual"] = {
                            ["name"] = "手动",
                            ["sort"] = 3,
                        },
                        ["SemiAuto"] = {
                            ["name"] = "半自动",
                            ["sort"] = 2,
                        },
                    },
                },
                ["GunHandSlot"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Left"] = 1,
                    ["Right"] = 0,
                    ["__info"] = {
                        ["Left"] = {
                            ["name"] = "左手",
                            ["sort"] = 2,
                        },
                        ["Right"] = {
                            ["name"] = "右手",
                            ["sort"] = 1,
                        },
                    },
                },
                ["GunType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Machine"] = 6,
                    ["Pistol"] = 1,
                    ["Rifle"] = 4,
                    ["Shotgun"] = 3,
                    ["SniperRifle"] = 5,
                    ["Special"] = 7,
                    ["Submachine"] = 2,
                    ["__info"] = {
                        ["Machine"] = {
                            ["name"] = "重机枪",
                            ["sort"] = 6,
                        },
                        ["Pistol"] = {
                            ["name"] = "手枪",
                            ["sort"] = 1,
                        },
                        ["Rifle"] = {
                            ["name"] = "步枪",
                            ["sort"] = 4,
                        },
                        ["Shotgun"] = {
                            ["name"] = "霰弹枪",
                            ["sort"] = 3,
                        },
                        ["SniperRifle"] = {
                            ["name"] = "狙击枪",
                            ["sort"] = 5,
                        },
                        ["Special"] = {
                            ["name"] = "特殊武器",
                            ["sort"] = 7,
                        },
                        ["Submachine"] = {
                            ["name"] = "冲锋枪",
                            ["sort"] = 2,
                        },
                    },
                },
                ["PointLooksType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Offical"] = 0,
                    ["__info"] = {
                        ["Offical"] = {
                            ["name"] = "官方准星",
                            ["sort"] = 1,
                        },
                    },
                },
                ["ReloadType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["DanCang"] = 1,
                    ["DanCang2"] = 2,
                    ["DanJia"] = 0,
                    ["__info"] = {
                        ["DanCang"] = {
                            ["name"] = "盒式弹仓",
                            ["sort"] = 2,
                        },
                        ["DanCang2"] = {
                            ["name"] = "筒式弹仓",
                            ["sort"] = 3,
                        },
                        ["DanJia"] = {
                            ["name"] = "弹匣",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SightLooksType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Offical"] = 0,
                    ["__info"] = {
                        ["Offical"] = {
                            ["name"] = "官方准星",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SightMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Dynamic"] = 0,
                    ["Static"] = 1,
                    ["__info"] = {
                        ["Dynamic"] = {
                            ["name"] = "动态",
                            ["sort"] = 1,
                        },
                        ["Static"] = {
                            ["name"] = "静态",
                            ["sort"] = 2,
                        },
                    },
                },
                ["SightType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Point"] = 1,
                    ["Sight"] = 0,
                    ["__info"] = {
                        ["Point"] = {
                            ["name"] = "中心点",
                            ["sort"] = 2,
                        },
                        ["Sight"] = {
                            ["name"] = "十字准星",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SpreadSet"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["High"] = 1,
                    ["Normal"] = 0,
                    ["__info"] = {
                        ["High"] = {
                            ["name"] = "高级",
                            ["sort"] = 2,
                        },
                        ["Normal"] = {
                            ["name"] = "基础",
                            ["sort"] = 1,
                        },
                    },
                },
                ["SpreadType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Circle"] = 1,
                    ["NoRightDown"] = 2,
                    ["RightUp"] = 0,
                    ["__info"] = {
                        ["Circle"] = {
                            ["name"] = "圆",
                            ["sort"] = 2,
                        },
                        ["NoRightDown"] = {
                            ["name"] = "无右下",
                            ["sort"] = 3,
                        },
                        ["RightUp"] = {
                            ["name"] = "右上",
                            ["sort"] = 1,
                        },
                    },
                },
                ["TrajectoryType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["line"] = {
                            ["name"] = "射线",
                            ["sort"] = 1,
                        },
                        ["projectile"] = {
                            ["name"] = "投掷物",
                            ["sort"] = 2,
                        },
                    },
                    ["line"] = 0,
                    ["projectile"] = 1,
                },
                ["TweenFuncName"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["cubicIn"] = {
                            ["name"] = "cubicIn",
                        },
                        ["cubicInOut"] = {
                            ["name"] = "cubicInOut",
                        },
                        ["cubicOut"] = {
                            ["name"] = "cubicOut",
                        },
                        ["linear"] = {
                            ["name"] = "linear",
                        },
                        ["quadIn"] = {
                            ["name"] = "quadIn",
                        },
                        ["quadInOut"] = {
                            ["name"] = "quadInOut",
                        },
                        ["quadOut"] = {
                            ["name"] = "quadOut",
                        },
                        ["sineIn"] = {
                            ["name"] = "sineIn",
                        },
                        ["sineInOut"] = {
                            ["name"] = "sineInOut",
                        },
                        ["sineOut"] = {
                            ["name"] = "sineOut",
                        },
                    },
                    ["cubicIn"] = "cubicIn",
                    ["cubicInOut"] = "cubicInOut",
                    ["cubicOut"] = "cubicOut",
                    ["linear"] = "linear",
                    ["quadIn"] = "quadIn",
                    ["quadInOut"] = "quadInOut",
                    ["quadOut"] = "quadOut",
                    ["sineIn"] = "sineIn",
                    ["sineInOut"] = "sineInOut",
                    ["sineOut"] = "sineOut",
                },
            },
            ["GunFireType"] = {
                ["Auto"] = 0,
                ["Manual"] = 2,
                ["SemiAuto"] = 1,
            },
            ["GunSpreadType"] = {
                ["Circle"] = 1,
                ["NoRightDown"] = 2,
                ["RightUp"] = 0,
            },
            ["GunState"] = {
                ["Entry"] = 1,
                ["Exit"] = 2,
            },
            ["HURTTYPE"] = {
                ["ANTIINJURY"] = 15,
                ["ANVIL"] = 10,
                ["ASPHYXIA"] = 12,
                ["BOMB"] = 2,
                ["BURNING"] = 3,
                ["CACTUS"] = 11,
                ["DROWN"] = 13,
                ["FALL"] = 9,
                ["FIXED"] = 17,
                ["FLASH"] = 6,
                ["ICE"] = 7,
                ["LASER"] = 16,
                ["MAGIC"] = 8,
                ["MELEE"] = 0,
                ["PHYSICS"] = 3,
                ["REMOTE"] = 1,
                ["SUFFOCATE"] = 14,
                ["SUN"] = 8,
                ["TOXIN"] = 4,
                ["WITHER"] = 5,
            },
            ["HorizontalOffset"] = {
                ["Centered"] = 2,
                ["Left"] = 1,
                ["Right"] = 3,
            },
            ["HumanBodyAnchorId"] = {
                ["Breast"] = 105,
                ["FootDown"] = 109,
                ["Head"] = 106,
                ["LeftFoot"] = 102,
                ["LeftHand"] = 100,
                ["RightFoot"] = 103,
                ["RightHand"] = 101,
            },
            ["HurtType"] = {
                ["All"] = -1,
                ["Antiinjury"] = 15,
                ["Anvil"] = 10,
                ["Asphyxia"] = 12,
                ["Bomb"] = 2,
                ["Burning"] = 3,
                ["Cactus"] = 11,
                ["Drown"] = 13,
                ["Fall"] = 9,
                ["Fixed"] = 17,
                ["Flash"] = 6,
                ["Ice"] = 7,
                ["Laser"] = 16,
                ["Magic"] = 8,
                ["Melee"] = 0,
                ["Physics"] = 3,
                ["Remote"] = 1,
                ["Suffocate"] = 14,
                ["Sun"] = 8,
                ["Toxin"] = 4,
                ["Wither"] = 5,
            },
            ["ITEMATTR"] = {
                ["ATTACK"] = 1,
                ["DURATION"] = 9,
                ["EXPLODEDEFENSE"] = 5,
                ["FIREDEFENSE"] = 6,
                ["FIREINTERVAL"] = 10,
                ["ITEMTYPE"] = 13,
                ["LONGDEFENSE"] = 4,
                ["MAGAZINES"] = 11,
                ["POISONDEFENSE"] = 7,
                ["QUALITY"] = 12,
                ["SHORTDEFENSE"] = 3,
                ["STACKMAX"] = 2,
                ["WITHERDEFENSE"] = 8,
            },
            ["Import"] = function(name, importModId) end, --[[@lua]]
            ["InnerPopUpview"] = {
                ["AdventureHandBook"] = 18,
                ["AnimView"] = 13,
                ["Atlas"] = 16,
                ["BackPackEra"] = 11,
                ["BackPackRole"] = 12,
                ["BackPackTask"] = 10,
                ["BuffStatus"] = 7,
                ["CollectMaps"] = 2,
                ["EvaluateMaps"] = 3,
                ["FollowTheAuthor"] = 1,
                ["InscriptionTable"] = 17,
                ["InviteFriend"] = 4,
                ["ItemProcessing"] = 9,
                ["ItemTips"] = 6,
                ["MiniMap"] = 14,
                ["MiniShop"] = 15,
                ["Specialty"] = 8,
                ["StorageBox"] = 5,
            },
            ["Instance"] = function(className) end, --[[@lua]]
            ["Item"] = {
                ["AddModelPart"] = function(self, playerid, instId, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.AddModelPart; @mtype Normal]]
                ["AddModelPartByGrid"] = function(self, playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.AddModelPartByGrid; @mtype Normal]]
                ["AddSubModelPart"] = function(self, instId, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.AddSubModelPart; @mtype Normal]]
                ["CreateBindItemInBackpack"] = function(self, playerid, itemid) end, --[[@service Item.CreateBindItemInBackpack; @mtype Normal; @rtype WhiteList="LuaApi3_Item_CreateBindItemInBackpack"]]
                ["CreateGunInBackpack"] = function(self, playerid, itemid, gridIndex) end, --[[@service Item.CreateGunInBackpack; @mtype Normal]]
                ["CreateGunInWorld"] = function(self, itemid, pos, worldId) end, --[[@service Item.CreateGunInWorld; @mtype Normal]]
                ["CreateItemInstInBackpack"] = function(self, playerid, itemid, gridIndex) end, --[[@service Item.CreateItemInstInBackpack; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["CreateItemInstInWorld"] = function(self, itemid, pos, worldId) end, --[[@service Item.CreateItemInstInWorld; @mtype Normal]]
                ["DeleteModelPart"] = function(self, playerid, instId, partName) end, --[[@service Item.DeleteModelPart; @mtype Normal]]
                ["DeleteModelPartByGrid"] = function(self, playerid, gridIndex, partName) end, --[[@service Item.DeleteModelPartByGrid; @mtype Normal]]
                ["DeleteSubModelPart"] = function(self, instId, partName) end, --[[@service Item.DeleteSubModelPart; @mtype Normal]]
                ["EmpowerEquipOrGunForPlayer"] = function(self, playerid, gridIndex, data) end, --[[@service Item.EmpowerEquipOrGunForPlayer; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["FreshPowerEquipOrGunForPlayer"] = function(self, playerid, gridIndex) end, --[[@service Item.FreshPowerEquipOrGunForPlayer; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetArrayCustomData"] = function(self, instId, key) end, --[[@service Item.GetArrayCustomData; @mtype Normal]]
                ["GetArrayData"] = function(self, playerid, instId, key) end, --[[@service Item.GetArrayData; @mtype Normal]]
                ["GetArrayDataByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetArrayDataByGrid; @mtype Normal]]
                ["GetAttr"] = function(self, itemid, attr) end, --[[@service Item.GetAttr; @mtype Normal]]
                ["GetBoolCustomData"] = function(self, instId, key) end, --[[@service Item.GetBoolCustomData; @mtype Normal]]
                ["GetBoolData"] = function(self, playerid, instId, key) end, --[[@service Item.GetBoolData; @mtype Normal]]
                ["GetBoolDataByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetBoolDataByGrid; @mtype Normal]]
                ["GetCraftDef"] = function(self, idCraft) end, --[[@service Item.GetCraftDef; @mtype Normal]]
                ["GetCraftDefByIndex"] = function(self, iCraft) end, --[[@service Item.GetCraftDefByIndex; @mtype Normal]]
                ["GetCraftDefCount"] = function(self) end, --[[@service Item.GetCraftDefCount; @mtype Normal]]
                ["GetCraftIDNum"] = function(self, itemid) end, --[[@service Item.GetCraftIDNum; @mtype Normal]]
                ["GetCraftMaterialAndNum"] = function(self, itemid, index) end, --[[@service Item.GetCraftMaterialAndNum; @mtype Normal]]
                ["GetCustomGunAttr"] = function(self, itemid, attrname) end, --[[@service Item.GetCustomGunAttr; @mtype Normal]]
                ["GetDropItemNum"] = function(self, objid) end, --[[@service Item.GetDropItemNum; @mtype Normal]]
                ["GetEquipBaseDesc"] = function(self, itemid) end, --[[@service Item.GetEquipBaseDesc; @mtype Normal]]
                ["GetEquipItemGridID"] = function(self, itemid) end, --[[@service Item.GetEquipItemGridID; @mtype Normal]]
                ["GetFacade"] = function(self, itemid) end, --[[@service Item.GetFacade; @mtype Normal]]
                ["GetFoodAddFoodVal"] = function(self, itemid) end, --[[@service Item.GetFoodAddFoodVal; @mtype Normal]]
                ["GetGridAttr"] = function(self, objid, attr) end, --[[@service Item.GetGridAttr; @mtype Normal]]
                ["GetGridIndexByInstId"] = function(self, playerid, instId) end, --[[@service Item.GetGridIndexByInstId; @mtype Normal]]
                ["GetGunAttr"] = function(self, playerid, instId, key) end, --[[@service Item.GetGunAttr; @mtype Normal]]
                ["GetGunAttrByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetGunAttrByGrid; @mtype Normal]]
                ["GetGunAttribute"] = function(self, instId, key) end, --[[@service Item.GetGunAttribute; @mtype Normal]]
                ["GetGunBaseDesc"] = function(self, itemid) end, --[[@service Item.GetGunBaseDesc; @mtype Normal; @rtype WhiteList="LuaApi3_Item_GetGunBaseDesc"]]
                ["GetGunGridIndexInBackpack"] = function(self, playerid) end, --[[@service Item.GetGunGridIndexInBackpack; @mtype Normal]]
                ["GetGunInstIdInBackpack"] = function(self, playerid) end, --[[@service Item.GetGunInstIdInBackpack; @mtype Normal]]
                ["GetGunPrefabAttr"] = function(self, playerid, instId, key) end, --[[@service Item.GetGunPrefabAttr; @mtype Normal]]
                ["GetGunPrefabAttrByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetGunPrefabAttrByGrid; @mtype Normal]]
                ["GetGunPrefabAttribute"] = function(self, instId, key) end, --[[@service Item.GetGunPrefabAttribute; @mtype Normal]]
                ["GetInstIdByGridIndex"] = function(self, playerid, gridIndex) end, --[[@service Item.GetInstIdByGridIndex; @mtype Normal]]
                ["GetItemDesc"] = function(self, itemid) end, --[[@service Item.GetItemDesc; @mtype Normal]]
                ["GetItemId"] = function(self, objid) end, --[[@service Item.GetItemId; @mtype Normal]]
                ["GetItemIdByGrid"] = function(self, playerid, gridIndex) end, --[[@service Item.GetItemIdByGrid; @mtype Normal]]
                ["GetItemIdByInstId"] = function(self, playerid, instId) end, --[[@service Item.GetItemIdByInstId; @mtype Normal]]
                ["GetItemIdByInstanceId"] = function(self, instId) end, --[[@service Item.GetItemIdByInstanceId; @mtype Normal]]
                ["GetItemInstFacade"] = function(self, instId) end, --[[@service Item.GetItemInstFacade; @mtype Normal]]
                ["GetItemModelComp"] = function(self, itemid) end, --[[@service Item.GetItemModelComp; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetItemName"] = function(self, itemid) end, --[[@service Item.GetItemName; @mtype Normal]]
                ["GetItemStackMax"] = function(self, itemid) end, --[[@service Item.GetItemStackMax; @mtype Normal]]
                ["GetItemType"] = function(self, itemid) end, --[[@service Item.GetItemType; @mtype Normal]]
                ["GetNumberCustomData"] = function(self, instId, key) end, --[[@service Item.GetNumberCustomData; @mtype Normal]]
                ["GetNumberData"] = function(self, playerid, instId, key) end, --[[@service Item.GetNumberData; @mtype Normal]]
                ["GetNumberDataByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetNumberDataByGrid; @mtype Normal]]
                ["GetObjCustomData"] = function(self, instId, key) end, --[[@service Item.GetObjCustomData; @mtype Normal]]
                ["GetObjData"] = function(self, playerid, instId, key) end, --[[@service Item.GetObjData; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetObjDataByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetObjDataByGrid; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetPrefabModelPart"] = function(self, playerid, instId) end, --[[@service Item.GetPrefabModelPart; @mtype Normal]]
                ["GetPrefabModelPartByGrid"] = function(self, playerid, gridIndex) end, --[[@service Item.GetPrefabModelPartByGrid; @mtype Normal]]
                ["GetResIdByGrid"] = function(self, playerid, gridIndex) end, --[[@service Item.GetResIdByGrid; @mtype Normal]]
                ["GetResIdByInstId"] = function(self, playerid, instId) end, --[[@service Item.GetResIdByInstId; @mtype Normal]]
                ["GetResIdByInstanceId"] = function(self, instId) end, --[[@service Item.GetResIdByInstanceId; @mtype Normal]]
                ["GetStringCustomData"] = function(self, instId, key) end, --[[@service Item.GetStringCustomData; @mtype Normal]]
                ["GetStringData"] = function(self, playerid, instId, key) end, --[[@service Item.GetStringData; @mtype Normal]]
                ["GetStringDataByGrid"] = function(self, playerid, gridIndex, key) end, --[[@service Item.GetStringDataByGrid; @mtype Normal]]
                ["GetTags"] = function(self, itemid) end, --[[@service Item.GetTags; @mtype Normal]]
                ["GetToolBaseDesc"] = function(self, itemid) end, --[[@service Item.GetToolBaseDesc; @mtype Normal]]
                ["GetToolType"] = function(self, itemid) end, --[[@service Item.GetToolType; @mtype Normal]]
                ["IsBindItem"] = function(self, itemid) end, --[[@service Item.IsBindItem; @mtype Normal; @rtype WhiteList="LuaApi3_Item_IsBindItem"]]
                ["LevelUpEquipOrGunForPlayer"] = function(self, playerid, gridIndex) end, --[[@service Item.LevelUpEquipOrGunForPlayer; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["ModifyGunAttr"] = function(self, playerid, instId, key, value) end, --[[@service Item.ModifyGunAttr; @mtype Normal]]
                ["ModifyGunAttrByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.ModifyGunAttrByGrid; @mtype Normal]]
                ["ModifyGunAttribute"] = function(self, instId, key, value) end, --[[@service Item.ModifyGunAttribute; @mtype Normal]]
                ["ModifyModelPart"] = function(self, playerid, instId, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.ModifyModelPart; @mtype Normal]]
                ["ModifyModelPartByGrid"] = function(self, playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.ModifyModelPartByGrid; @mtype Normal]]
                ["PlayAct"] = function(self, objid, animid, playmode) end, --[[@service Item.PlayAct; @mtype Normal]]
                ["RandomItemID"] = function(self) end, --[[@service Item.RandomItemID; @mtype Normal]]
                ["RandomProjectileID"] = function(self) end, --[[@service Item.RandomProjectileID; @mtype Normal]]
                ["ReplaceSubModelPart"] = function(self, instId, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item.ReplaceSubModelPart; @mtype Normal]]
                ["SetArrayCustomData"] = function(self, instId, key, value) end, --[[@service Item.SetArrayCustomData; @mtype Normal]]
                ["SetArrayData"] = function(self, playerid, instId, key, value) end, --[[@service Item.SetArrayData; @mtype Normal]]
                ["SetArrayDataByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.SetArrayDataByGrid; @mtype Normal]]
                ["SetBoolCustomData"] = function(self, instId, key, value) end, --[[@service Item.SetBoolCustomData; @mtype Normal]]
                ["SetBoolData"] = function(self, playerid, instId, key, value) end, --[[@service Item.SetBoolData; @mtype Normal]]
                ["SetBoolDataByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.SetBoolDataByGrid; @mtype Normal]]
                ["SetGridAttr"] = function(self, objid, attr, value) end, --[[@service Item.SetGridAttr; @mtype Normal]]
                ["SetNumberCustomData"] = function(self, instId, key, value) end, --[[@service Item.SetNumberCustomData; @mtype Normal]]
                ["SetNumberData"] = function(self, playerid, instId, key, value) end, --[[@service Item.SetNumberData; @mtype Normal]]
                ["SetNumberDataByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.SetNumberDataByGrid; @mtype Normal]]
                ["SetObjCustomData"] = function(self, instId, key, value) end, --[[@service Item.SetObjCustomData; @mtype Normal]]
                ["SetObjData"] = function(self, playerid, instId, key, value) end, --[[@service Item.SetObjData; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetObjDataByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.SetObjDataByGrid; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetStringCustomData"] = function(self, instId, key, value) end, --[[@service Item.SetStringCustomData; @mtype Normal]]
                ["SetStringData"] = function(self, playerid, instId, key, value) end, --[[@service Item.SetStringData; @mtype Normal]]
                ["SetStringDataByGrid"] = function(self, playerid, gridIndex, key, value) end, --[[@service Item.SetStringDataByGrid; @mtype Normal]]
                ["_AddModelPartByGrid"] = function(self, grid, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item._AddModelPartByGrid; @mtype Normal]]
                ["_BeginModifyItemByGrid"] = function(self, grid) end, --[[@service Item._BeginModifyItemByGrid; @mtype Normal]]
                ["_DeleteModelPartByGrid"] = function(self, grid, partName) end, --[[@service Item._DeleteModelPartByGrid; @mtype Normal]]
                ["_GetArrayDataByGrid"] = function(self, grid, key) end, --[[@service Item._GetArrayDataByGrid; @mtype Normal]]
                ["_GetBoolDataByGrid"] = function(self, grid, key) end, --[[@service Item._GetBoolDataByGrid; @mtype Normal]]
                ["_GetGridByInstId"] = function(self, instanceId) end, --[[@service Item._GetGridByInstId; @mtype Normal]]
                ["_GetGunAttrByGrid"] = function(self, grid, key) end, --[[@service Item._GetGunAttrByGrid; @mtype Normal]]
                ["_GetGunPrefabAttrByGrid"] = function(self, grid, key) end, --[[@service Item._GetGunPrefabAttrByGrid; @mtype Normal]]
                ["_GetItemIdByGrid"] = function(self, grid) end, --[[@service Item._GetItemIdByGrid; @mtype Normal]]
                ["_GetNumberDataByGrid"] = function(self, grid, key) end, --[[@service Item._GetNumberDataByGrid; @mtype Normal]]
                ["_GetObjDataByGrid"] = function(self, grid, key) end, --[[@service Item._GetObjDataByGrid; @mtype Normal]]
                ["_GetResIdByGrid"] = function(self, grid) end, --[[@service Item._GetResIdByGrid; @mtype Normal]]
                ["_GetStringDataByGrid"] = function(self, grid, key) end, --[[@service Item._GetStringDataByGrid; @mtype Normal]]
                ["_ModifyGunAttributeByGrid"] = function(self, grid, key, value) end, --[[@service Item._ModifyGunAttributeByGrid; @mtype Normal]]
                ["_ModifyModelPartByGrid"] = function(self, grid, partName, boneName, modelStr, offset, rot, scale) end, --[[@service Item._ModifyModelPartByGrid; @mtype Normal]]
                ["_SetArrayDataByGrid"] = function(self, grid, key, value) end, --[[@service Item._SetArrayDataByGrid; @mtype Normal]]
                ["_SetBoolDataByGrid"] = function(self, grid, key, value) end, --[[@service Item._SetBoolDataByGrid; @mtype Normal]]
                ["_SetNumberDataByGrid"] = function(self, grid, key, value) end, --[[@service Item._SetNumberDataByGrid; @mtype Normal]]
                ["_SetObjDataByGrid"] = function(self, grid, key, value) end, --[[@service Item._SetObjDataByGrid; @mtype Normal]]
                ["_SetStringDataByGrid"] = function(self, grid, key, value) end, --[[@service Item._SetStringDataByGrid; @mtype Normal]]
                ["__TransformCraftingDefToTable"] = function(self, craftingDef) end, --[[@service Item.__TransformCraftingDefToTable; @mtype Normal]]
            },
            ["ItemAbility"] = {
                ["Drop"] = 2,
                ["Throw"] = 1,
            },
            ["ItemAttr"] = {
                ["Attack"] = 1,
                ["Duration"] = 9,
                ["ExplodeDefense"] = 5,
                ["FireDefense"] = 6,
                ["FireInterval"] = 10,
                ["ItemType"] = 13,
                ["LongDefense"] = 4,
                ["Magazines"] = 11,
                ["PoisonDefense"] = 7,
                ["Quality"] = 12,
                ["ShortDefense"] = 3,
                ["Stackmax"] = 2,
                ["WitherDefense"] = 8,
            },
            ["ItemEdit"] = {
                ["DropItemEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "通用掉落物模板",
                        },
                        ["second"] = {
                            ["name"] = "指定实体预制",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["ProductType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Advertisement"] = 3,
                    ["BindItem"] = 5,
                    ["Lottery"] = 4,
                    ["MiniBean"] = 2,
                    ["MiniCoin"] = 1,
                    ["Normal"] = 0,
                    ["__info"] = {
                        ["Advertisement"] = {
                            ["name"] = "广告道具",
                        },
                        ["BindItem"] = {
                            ["name"] = "绑定道具",
                        },
                        ["Lottery"] = {
                            ["name"] = "抽奖道具",
                        },
                        ["MiniBean"] = {
                            ["name"] = "迷你豆道具",
                        },
                        ["MiniCoin"] = {
                            ["name"] = "迷你币道具",
                        },
                        ["Normal"] = {
                            ["name"] = "普通道具",
                        },
                    },
                },
                ["QualityLevel"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["L0"] = 0,
                    ["L1"] = 1,
                    ["L2"] = 2,
                    ["L3"] = 3,
                    ["L4"] = 4,
                    ["L5"] = 5,
                    ["L6"] = 6,
                    ["L7"] = 7,
                    ["__info"] = {
                        ["L0"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["L1"] = {
                            ["name"] = "浅灰色",
                            ["sort"] = 2,
                        },
                        ["L2"] = {
                            ["name"] = "绿色",
                            ["sort"] = 3,
                        },
                        ["L3"] = {
                            ["name"] = "蓝色",
                            ["sort"] = 4,
                        },
                        ["L4"] = {
                            ["name"] = "紫色",
                            ["sort"] = 5,
                        },
                        ["L5"] = {
                            ["name"] = "橙色",
                            ["sort"] = 6,
                        },
                        ["L6"] = {
                            ["name"] = "红色",
                            ["sort"] = 7,
                        },
                        ["L7"] = {
                            ["name"] = "白金",
                            ["sort"] = 8,
                        },
                    },
                },
                ["UseType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["clickBlock"] = {
                            ["name"] = "点击方块",
                        },
                        ["clickUseButton"] = {
                            ["name"] = "点击使用按钮",
                        },
                    },
                    ["clickBlock"] = 0,
                    ["clickUseButton"] = 1,
                },
            },
            ["ItemEffectType"] = {
                ["After_Charge"] = 5,
                ["Auto_Charge"] = 6,
                ["Food"] = 1,
                ["Inter_Charge"] = 4,
                ["Max"] = 7,
                ["No_Charge"] = 3,
                ["Projectile"] = 2,
                ["Use"] = 0,
            },
            ["KeyCode"] = {
                ["A"] = "A",
                ["Alt"] = "ALT",
                ["B"] = "B",
                ["C"] = "C",
                ["Ctrl"] = "CTRL",
                ["D"] = "D",
                ["Down"] = "DOWN",
                ["E"] = "E",
                ["F"] = "F",
                ["G"] = "G",
                ["H"] = "H",
                ["I"] = "I",
                ["J"] = "J",
                ["K"] = "K",
                ["L"] = "L",
                ["Left"] = "LEFT",
                ["LeftButton"] = "LEFTBUTTON",
                ["M"] = "M",
                ["N"] = "N",
                ["Number0"] = "0",
                ["Number1"] = "1",
                ["Number2"] = "2",
                ["Number3"] = "3",
                ["Number4"] = "4",
                ["Number5"] = "5",
                ["Number6"] = "6",
                ["Number7"] = "7",
                ["Number8"] = "8",
                ["Number9"] = "9",
                ["O"] = "O",
                ["P"] = "P",
                ["Q"] = "Q",
                ["R"] = "R",
                ["Right"] = "RIGHT",
                ["RightButton"] = "RIGHTBUTTON",
                ["S"] = "S",
                ["Shift"] = "SHIFT",
                ["Space"] = "SPACE",
                ["T"] = "T",
                ["U"] = "U",
                ["Up"] = "UP",
                ["V"] = "V",
                ["W"] = "W",
                ["X"] = "X",
                ["Y"] = "Y",
                ["Z"] = "Z",
            },
            ["LaunchProjectileStatus"] = {
                ["LaunchDir"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "正前方向",
                        },
                        ["fiveth"] = {
                            ["name"] = "正上方向",
                        },
                        ["fourth"] = {
                            ["name"] = "正右方向",
                        },
                        ["second"] = {
                            ["name"] = "正后方向",
                        },
                        ["sixth"] = {
                            ["name"] = "正下方向",
                        },
                        ["third"] = {
                            ["name"] = "正左方向",
                        },
                    },
                    ["first"] = 0,
                    ["fiveth"] = 4,
                    ["fourth"] = 3,
                    ["second"] = 1,
                    ["sixth"] = 5,
                    ["third"] = 2,
                },
                ["LaunchDirType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "准心方向",
                        },
                        ["second"] = {
                            ["name"] = "指定方向",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["LaunchType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "基础",
                        },
                    },
                    ["first"] = 0,
                },
            },
            ["LightingFurniture"] = {
                ["ControlMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Click"] = 1,
                    ["PowerContinuous"] = 3,
                    ["PowerPulse"] = 2,
                    ["__info"] = {
                        ["Click"] = {
                            ["name"] = "点击互动",
                            ["sort"] = 1,
                        },
                        ["PowerContinuous"] = {
                            ["name"] = "星能控制——持续",
                            ["sort"] = 3,
                        },
                        ["PowerPulse"] = {
                            ["name"] = "星能控制——脉冲",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["LinearTransformation"] = {
                ["BackIn"] = 25,
                ["BackInOut"] = 27,
                ["BackOut"] = 26,
                ["BounceIn"] = 28,
                ["BounceInOut"] = 30,
                ["BounceOut"] = 29,
                ["CircIn"] = 19,
                ["CircInOut"] = 21,
                ["CircOut"] = 20,
                ["CubicIn"] = 7,
                ["CubicInOut"] = 9,
                ["CubicOut"] = 8,
                ["Custom"] = 31,
                ["ElasticIn"] = 22,
                ["ElasticInOut"] = 24,
                ["ElasticOut"] = 23,
                ["ExpoIn"] = 16,
                ["ExpoInOut"] = 18,
                ["ExpoOut"] = 17,
                ["Linear"] = 0,
                ["None"] = -1,
                ["QuadIn"] = 4,
                ["QuadInOut"] = 6,
                ["QuadOut"] = 5,
                ["QuartIn"] = 10,
                ["QuartInOut"] = 12,
                ["QuartOut"] = 11,
                ["QuintIn"] = 13,
                ["QuintInOut"] = 15,
                ["QuintOut"] = 14,
                ["SineIn"] = 1,
                ["SineInOut"] = 3,
                ["SineOut"] = 2,
            },
            ["Listen"] = {
                ["AddGraphicsListenParam"] = function(self, objid, funcs, param) end, --[[@service Listen.AddGraphicsListenParam; @mtype Normal]]
                ["GetVarRunDataForInnerUI"] = function(self, varid, playerid) end, --[[@service Listen.GetVarRunDataForInnerUI; @mtype Normal]]
                ["GetVarTabColID"] = function(self, varid, index) end, --[[@service Listen.GetVarTabColID; @mtype Normal]]
                ["InsertVarLinsten"] = function(self, varid, callback, colids, sync, filtertxtcolids) end, --[[@service Listen.InsertVarLinsten; @mtype Normal]]
                ["IsListen"] = function(self, varid) end, --[[@service Listen.IsListen; @mtype Normal]]
                ["OnGraphicsParamParamChange"] = function(self, objid, data) end, --[[@service Listen.OnGraphicsParamParamChange; @mtype Normal]]
                ["RemoveVarLinsten"] = function(self, varid) end, --[[@service Listen.RemoveVarLinsten; @mtype Normal]]
                ["SnycGraphicsInfo2Client"] = function(self) end, --[[@service Listen.SnycGraphicsInfo2Client; @mtype Normal]]
                ["VarRunDataRecord"] = function(self, playerId, varid, code, value, index1, index2) end, --[[@service Listen.VarRunDataRecord; @mtype SyncPack]]
            },
            ["Log"] = {
                ["GetAllMessage"] = function(self, ...) end, --[[@service Log.GetAllMessage; @mtype Normal]]
                ["Print"] = function(self, ...) end, --[[@service Log.Print; @mtype Normal]]
                ["PrintTable"] = function(self, ...) end, --[[@service Log.PrintTable; @mtype Normal]]
                ["RefreshOpenLog"] = function(self, isOpen) end, --[[@service Log.RefreshOpenLog; @mtype Normal]]
                ["ReportError"] = function(self, modId, msg) end, --[[@service Log.ReportError; @mtype Normal]]
                ["TableToString"] = function(self, value, maxItems, indent) end, --[[@service Log.TableToString; @mtype Normal]]
            },
            ["LogLevel"] = {
                ["Error"] = 3,
                ["Print"] = 1,
                ["Warn"] = 2,
            },
            ["LuaPanda"] = {
                ["BP"] = function() end, --[[@lua]]
            },
            ["MODATTRIB_TYPE"] = {
                ["MAX_MOB_MODATTR"] = 29,
                ["MAX_MOD_ATTRIB"] = 36,
                ["MAX_PLAYER_MODATTR"] = 36,
                ["MOBATTR_ATTACK_GUN"] = 35,
                ["MOBATTR_DAMAGED_ZOMBIE"] = 34,
                ["MODATTR_ACTOR_SCALE"] = 28,
                ["MODATTR_ARMOR_EXPLODE"] = 22,
                ["MODATTR_ARMOR_PUNCH"] = 20,
                ["MODATTR_ARMOR_RANGE"] = 21,
                ["MODATTR_ATTACK_ANIMAL"] = 11,
                ["MODATTR_ATTACK_EXPLODE"] = 5,
                ["MODATTR_ATTACK_FIRE"] = 6,
                ["MODATTR_ATTACK_ICE"] = 12,
                ["MODATTR_ATTACK_PLAYER"] = 9,
                ["MODATTR_ATTACK_POISON"] = 7,
                ["MODATTR_ATTACK_PUNCH"] = 3,
                ["MODATTR_ATTACK_RANGE"] = 4,
                ["MODATTR_ATTACK_UNDEAD"] = 10,
                ["MODATTR_ATTACK_WITHER"] = 8,
                ["MODATTR_CRITICAL_HIT"] = 24,
                ["MODATTR_DAMAGED_EXPLODE"] = 15,
                ["MODATTR_DAMAGED_FALLING"] = 19,
                ["MODATTR_DAMAGED_FIRE"] = 16,
                ["MODATTR_DAMAGED_POISON"] = 17,
                ["MODATTR_DAMAGED_PUNCH"] = 13,
                ["MODATTR_DAMAGED_RANGE"] = 14,
                ["MODATTR_DAMAGED_WITHER"] = 18,
                ["MODATTR_DAMAGE_ABSORB"] = 23,
                ["MODATTR_DIG_SPEED"] = 29,
                ["MODATTR_JUMP_SPEED"] = 2,
                ["MODATTR_KNOCK"] = 25,
                ["MODATTR_KNOCK_RESIST"] = 26,
                ["MODATTR_KNOCK_RESIST_PROB"] = 27,
                ["MODATTR_LUCK_DIG"] = 30,
                ["MODATTR_LUCK_KILLMOB"] = 31,
                ["MODATTR_MOVE_SPEED"] = 0,
                ["MODATTR_OXYGEN_SUPPLY"] = 33,
                ["MODATTR_SWIM_SPEED"] = 1,
                ["MODATTR_VIEW_BRIGHT"] = 32,
            },
            ["MapMarkType"] = {
                ["Circle"] = 2,
                ["Line"] = 0,
                ["Rect"] = 1,
            },
            ["MapShopOrder"] = {
                ["NpcShop"] = "npcshop",
                ["WorldBluePrint"] = "worldblueprint",
            },
            ["MatchMode"] = {
                ["All"] = 1,
                ["Any"] = 2,
            },
            ["Mini"] = {
                ["Action"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["ActionType"] = {
                        ["Circle"] = 2,
                        ["Line"] = 1,
                        ["Path"] = 4,
                        ["Pendulum"] = 3,
                        ["Scale"] = 5,
                        ["ScaleAll"] = 6,
                    },
                    ["BeginType"] = {
                        ["Msg"] = 2,
                        ["Now"] = 1,
                        ["PreActionBegin"] = 3,
                        ["PreActionEnd"] = 4,
                    },
                    ["Copy"] = function(self) end, --[[@lua]]
                    ["DealOldData"] = function(data) end, --[[@lua]]
                    ["GoBackType"] = {
                        ["GoBack"] = 3,
                        ["GoToBegin"] = 4,
                        ["None"] = 1,
                        ["ToBeginNow"] = 2,
                    },
                    ["Init"] = function(self, data) end, --[[@lua]]
                    ["RelativeType"] = {
                        ["Local"] = 1,
                        ["World"] = 2,
                    },
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["SetProperty"] = function(self, key, value, extraData) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Action",
                },
                ["Area"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Area",
                },
                ["Array"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                        ["__metatable"] = "read only",
                        ["__newindex"] = function() end, --[[@lua]]
                    },
                    ["AddEvent"] = function(private, self, fn, isAll) end, --[[@lua]]
                    ["Clear"] = function(private, self) end, --[[@lua]]
                    ["ClearEvent"] = function(private, self) end, --[[@lua]]
                    ["Copy"] = function(private, self) end, --[[@lua]]
                    ["EventType"] = {
                        ["Add"] = 1,
                        ["Clear"] = 4,
                        ["Edit"] = 3,
                        ["Remove"] = 2,
                        ["Reset"] = 5,
                    },
                    ["GetAllValue"] = function(private, self) end, --[[@lua]]
                    ["GetCountByValue"] = function(private, self, value) end, --[[@lua]]
                    ["GetIndexByValue"] = function(private, self, value) end, --[[@lua]]
                    ["GetItemType"] = function(private, self) end, --[[@lua]]
                    ["GetMax"] = function(private, self) end, --[[@lua]]
                    ["GetMin"] = function(private, self) end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["GetValue"] = function(private, self, index) end, --[[@lua]]
                    ["HasValue"] = function(private, self, value) end, --[[@lua]]
                    ["IncreasesValue"] = function(private, self, value, index) end, --[[@lua]]
                    ["Init"] = function(private, self, itemType, ...) end, --[[@lua]]
                    ["InitData"] = function(private, self, datas) end, --[[@lua]]
                    ["Insert"] = function(private, self, value, index) end, --[[@lua]]
                    ["InsertValues"] = function(private, self, values, index) end, --[[@lua]]
                    ["IsInstance"] = function(private, self) end, --[[@lua]]
                    ["IsValid"] = function(private, self) end, --[[@lua]]
                    ["MoveTo"] = function(private, self, oldIdx, newIdx) end, --[[@lua]]
                    ["RandomValue"] = function(private, self) end, --[[@lua]]
                    ["Remove"] = function(private, self, index) end, --[[@lua]]
                    ["RemoveByValue"] = function(private, self, value) end, --[[@lua]]
                    ["RemoveByValues"] = function(private, self, values) end, --[[@lua]]
                    ["Replace"] = function(private, self, index, value, isTriggerEvent) end, --[[@lua]]
                    ["ReplaceValue"] = function(private, self, valueNew, valueOld) end, --[[@lua]]
                    ["Serialize"] = function(array) end, --[[@lua]]
                    ["SetIsTriggerEvent"] = function(private, self, isTriggerEvent, isAll) end, --[[@lua]]
                    ["SetValue"] = function(private, self, value, index) end, --[[@lua]]
                    ["Size"] = function(private) end, --[[@lua]]
                    ["Sort"] = function(private, self, isUp) end, --[[@lua]]
                    ["ToTable"] = function(private, self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(data) end, --[[@lua]]
                    ["__className_"] = "Array",
                },
                ["BiomeType"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "BiomeType",
                },
                ["Block"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Block",
                },
                ["Blueprint"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Blueprint",
                },
                ["Bool"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Bool",
                },
                ["Buff"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Buff",
                },
                ["CheckList"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["Init"] = function(self, data) end, --[[@lua]]
                    ["IsCheck"] = function(self, key) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["SetCheck"] = function(self, key, isCheck) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "CheckList",
                },
                ["Color"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                        ["__index"] = function(t, key) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Init"] = function(self, r, g, b, a) end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Color",
                },
                ["ColorGrandient"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "ColorGrandient",
                },
                ["ComponentType"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "ComponentType",
                },
                ["Creature"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Mob",
                },
                ["CreatureType"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "MobType",
                },
                ["CustomData"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                        ["__metatable"] = "read only",
                        ["__newindex"] = function() end, --[[@lua]]
                    },
                    ["AddEvent"] = function(private, self, fn, isAll) end, --[[@lua]]
                    ["ClearEvent"] = function(private, self) end, --[[@lua]]
                    ["Copy"] = function(private, self) end, --[[@lua]]
                    ["CopyToTable"] = function(private, self) end, --[[@lua]]
                    ["GetKeys"] = function(private, self) end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Init"] = function(private, self, data) end, --[[@lua]]
                    ["Serialize"] = function(data) end, --[[@lua]]
                    ["SetIsTriggerEvent"] = function(private, self, isTriggerEvent, isAll) end, --[[@lua]]
                    ["ToTable"] = function(private, self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(tb) end, --[[@lua]]
                    ["__className_"] = "CustomData",
                },
                ["CustomMsg"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "CustomMsg",
                },
                ["DropItem"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "DropItem",
                },
                ["Effect"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Effect",
                },
                ["Emitter"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Emitter",
                },
                ["Entity"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Entity",
                },
                ["EntityType"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "EntityType",
                },
                ["Enum"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["GetDef"] = function(self) end, --[[@lua]]
                    ["GetDefault"] = function(self) end, --[[@lua]]
                    ["GetDes"] = function(self, key) end, --[[@lua]]
                    ["GetSort"] = function(self, key) end, --[[@lua]]
                    ["Init"] = function(self, tab) end, --[[@lua]]
                    ["IsValue"] = function(self, value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Enum",
                },
                ["GroupView"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls) end, --[[@lua]]
                    },
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["__className_"] = "GroupView",
                },
                ["Item"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Item",
                },
                ["LineAnimation"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "LineAnimation",
                },
                ["Material"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Material",
                },
                ["Mob"] = { ["$ref"] = {"$meta", "__index", "Mini", "Creature"} },
                ["MobType"] = { ["$ref"] = {"$meta", "__index", "Mini", "CreatureType"} },
                ["Model"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Model",
                },
                ["ModelAction"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "ModelAction",
                },
                ["Number"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Number",
                },
                ["Object"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Object",
                },
                ["PathPoint"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["Init"] = function(self, data) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["TreeJsonUnSerialize"] = function(data) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "PathPoint",
                },
                ["Picture"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Picture",
                },
                ["Player"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Player",
                },
                ["PlayerType"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "PlayerType",
                },
                ["Prefab"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Prefab",
                },
                ["Role"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Role",
                },
                ["Rotation"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Init"] = function(self, x, y, z) end, --[[@lua]]
                    ["Lenght"] = function(self) end, --[[@lua]]
                    ["Normalized"] = function(self) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Rotation",
                    ["lerp"] = function(self, posOrigin, posTarget, t) end, --[[@lua]]
                },
                ["Scale"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Init"] = function(self, x, y, z) end, --[[@lua]]
                    ["Lenght"] = function(self) end, --[[@lua]]
                    ["Normalized"] = function(self) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Scale",
                    ["lerp"] = function(self, posOrigin, posTarget, t) end, --[[@lua]]
                },
                ["SkeletonPoint"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "SkeletonPoint",
                },
                ["SkyBox"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "SkyBox",
                },
                ["SkyBoxFilter"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "SkyBoxFilter",
                },
                ["Sound"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Sound",
                },
                ["String"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "String",
                },
                ["Tag"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Tag",
                },
                ["ThrowItem"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "ThrowItem",
                },
                ["UiElement"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "UiElement",
                },
                ["UiState"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, value) end, --[[@lua]]
                    },
                    ["CreateDefault"] = function() end, --[[@lua]]
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["IsValueOfType"] = function(value) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "UiState",
                },
                ["Vec2"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["Init"] = function(self, x, y) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Vec2",
                },
                ["Vec3"] = {
                    ["$meta"] = {
                        ["__call"] = function(cls, ...) end, --[[@lua]]
                    },
                    ["GetRefType"] = function() end, --[[@lua]]
                    ["Init"] = function(self, x, y, z) end, --[[@lua]]
                    ["Lenght"] = function(self) end, --[[@lua]]
                    ["Normalized"] = function(self) end, --[[@lua]]
                    ["Serialize"] = function(value) end, --[[@lua]]
                    ["ToTable"] = function(self) end, --[[@lua]]
                    ["UnSerialize"] = function(value) end, --[[@lua]]
                    ["__className_"] = "Vec3",
                    ["lerp"] = function(self, posOrigin, posTarget, t) end, --[[@lua]]
                },
            },
            ["MiniCurrency"] = {
                ["MiniBean"] = 1,
                ["MiniCoin"] = 2,
                ["MiniPoint"] = 3,
                ["Star"] = 4,
            },
            ["MiniMapMarkType"] = {
                ["DevMark"] = 1,
                ["Player"] = 2,
            },
            ["MiniShopData"] = {
                ["AllMountLevel"] = 4,
                ["Avt"] = 2,
                ["Mount"] = 3,
                ["Skin"] = 1,
            },
            ["MiniShopDetail"] = {
                ["ActionAdvanced"] = 40,
                ["ActionPersonal"] = 39,
                ["Advert"] = 11,
                ["AuxiliaryHorse"] = 4,
                ["AuxiliaryMore"] = 51,
                ["AuxiliarySpray"] = 18,
                ["AuxiliaryWeapon"] = 17,
                ["GiftCrystalSpirit"] = 47,
                ["GiftDreamBox"] = 19,
                ["GiftMiniBeanJourney"] = 26,
                ["MarketCollection"] = 25,
                ["MarketIntegral"] = 24,
                ["Member"] = 13,
                ["MiniBeanStoreRoleAppearance"] = 44,
                ["MiniBeanStoreSpray"] = 46,
                ["MiniBeanStoreWeapon"] = 45,
                ["Recharge"] = 7,
                ["Recommend"] = 1,
                ["RoleAppearance"] = 2,
                ["Special"] = 12,
            },
            ["MiniShopPage"] = {
                ["Convert"] = 3,
                ["CustomCoin"] = 7,
                ["Item"] = 1,
                ["MiniVip"] = 5,
                ["Skin"] = 2,
                ["WareHouse"] = 6,
                ["Welfare"] = 4,
            },
            ["MiniShopWarehouse"] = {
                ["ActionAdvanced"] = 42,
                ["ActionPersonal"] = 41,
                ["Appearance"] = 28,
                ["AuxiliaryHorse"] = 30,
                ["AuxiliaryMore"] = 50,
                ["AuxiliarySpray"] = 32,
                ["AuxiliaryWeapon"] = 31,
                ["ItemWarehouse"] = 35,
            },
            ["MiniViewSecondTab"] = {
                ["Avt"] = 2,
                ["FashionSeat"] = 4,
                ["Mount"] = 3,
                ["Skin"] = 1,
                ["StarFashionSeat"] = 5,
            },
            ["MobType"] = {
                ["Fly"] = 8,
                ["Hostile"] = 0,
                ["Passive"] = 1,
                ["Rare"] = 2,
                ["Trixenie"] = 11,
                ["Water"] = 3,
            },
            ["Mod"] = {
                ["GetAssetIdByCfg"] = function(self, objType, cfgId) end, --[[@service Mod.GetAssetIdByCfg; @mtype Normal]]
                ["GetAssetIdByObjId"] = function(self, objid) end, --[[@service Mod.GetAssetIdByObjId; @mtype Normal]]
                ["GetAvatarHeadInfo"] = function(self, avatarInfo, cacheId, filename) end, --[[@service Mod.GetAvatarHeadInfo; @mtype Normal]]
                ["GetCfgIdByAssetId"] = function(self, assetId) end, --[[@service Mod.GetCfgIdByAssetId; @mtype Normal]]
                ["GetCustomAssetId"] = function(self, objType, cfgId) end, --[[@service Mod.GetCustomAssetId; @mtype Normal]]
                ["GetCustomAssetIdByObjId"] = function(self, objid, objType) end, --[[@service Mod.GetCustomAssetIdByObjId; @mtype Normal]]
                ["GetDefIdByCfg"] = function(self, inputId) end, --[[@service Mod.GetDefIdByCfg; @mtype Normal]]
                ["SetWeatherType"] = function(self, wtype) end, --[[@service Mod.SetWeatherType; @mtype Normal]]
            },
            ["ModAttribType"] = {
                ["ActorScale"] = 28,
                ["ArmorExplode"] = 22,
                ["ArmorPunch"] = 20,
                ["ArmorRange"] = 21,
                ["AttackAnimal"] = 11,
                ["AttackExplode"] = 5,
                ["AttackFire"] = 6,
                ["AttackGun"] = 35,
                ["AttackIce"] = 12,
                ["AttackPlayer"] = 9,
                ["AttackPoison"] = 7,
                ["AttackPunch"] = 3,
                ["AttackRange"] = 4,
                ["AttackUndead"] = 10,
                ["AttackWither"] = 8,
                ["CriticalHit"] = 24,
                ["DamageAbsorb"] = 23,
                ["DamagedExplode"] = 15,
                ["DamagedFalling"] = 19,
                ["DamagedFire"] = 16,
                ["DamagedPoison"] = 17,
                ["DamagedPunch"] = 13,
                ["DamagedRange"] = 14,
                ["DamagedWither"] = 18,
                ["DamagedZombie"] = 34,
                ["DigSpeed"] = 29,
                ["JumpSpeed"] = 2,
                ["Knock"] = 25,
                ["KnockResist"] = 26,
                ["KnockResistProb"] = 27,
                ["LuckDig"] = 30,
                ["LuckKillmob"] = 31,
                ["MoveSpeed"] = 0,
                ["OxygenSupply"] = 33,
                ["SwimSpeed"] = 1,
                ["ViewBright"] = 32,
                ["maxAttrib"] = 36,
            },
            ["Model"] = {
                ["AvatarAnchorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Back_Ornament"] = 8,
                    ["Body"] = 0,
                    ["Face"] = 2,
                    ["Face_Ornament"] = 3,
                    ["FootPrint"] = 9,
                    ["Hand_Ornament"] = 5,
                    ["Head"] = 1,
                    ["Jacket"] = 4,
                    ["Shoe"] = 7,
                    ["Skin"] = 10,
                    ["Trousers"] = 6,
                    ["__info"] = {
                        ["Back_Ornament"] = {
                            ["name"] = "背饰",
                            ["sort"] = 5,
                        },
                        ["Body"] = {
                            ["name"] = "装饰",
                            ["sort"] = 10,
                        },
                        ["Face"] = {
                            ["name"] = "表情",
                            ["sort"] = 6,
                        },
                        ["Face_Ornament"] = {
                            ["name"] = "面饰",
                            ["sort"] = 7,
                        },
                        ["FootPrint"] = {
                            ["name"] = "脚印",
                            ["sort"] = 11,
                        },
                        ["Hand_Ornament"] = {
                            ["name"] = "手饰",
                            ["sort"] = 9,
                        },
                        ["Head"] = {
                            ["name"] = "头饰",
                            ["sort"] = 1,
                        },
                        ["Jacket"] = {
                            ["name"] = "上衣",
                            ["sort"] = 2,
                        },
                        ["Shoe"] = {
                            ["name"] = "鞋子",
                            ["sort"] = 4,
                        },
                        ["Skin"] = {
                            ["name"] = "肤色",
                            ["sort"] = 8,
                        },
                        ["Trousers"] = {
                            ["name"] = "裤子",
                            ["sort"] = 3,
                        },
                    },
                },
                ["GunAnchorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Butt"] = 1005,
                    ["Clip"] = 1003,
                    ["FishBone"] = 1008,
                    ["FrontSight"] = 1013,
                    ["Grip"] = 1004,
                    ["Laser"] = 1002,
                    ["LeftRail"] = 1011,
                    ["LowerRail"] = 1010,
                    ["Muzzle"] = 1001,
                    ["RearSight"] = 1014,
                    ["RightRail"] = 1012,
                    ["Sight1"] = 1006,
                    ["Sight2"] = 1007,
                    ["UpperRail"] = 1009,
                    ["__info"] = {
                        ["Butt"] = {
                            ["name"] = "枪托",
                        },
                        ["Clip"] = {
                            ["name"] = "弹夹",
                        },
                        ["FishBone"] = {
                            ["name"] = "鱼骨",
                        },
                        ["FrontSight"] = {
                            ["name"] = "准星",
                        },
                        ["Grip"] = {
                            ["name"] = "握把",
                        },
                        ["Laser"] = {
                            ["name"] = "镭射",
                        },
                        ["LeftRail"] = {
                            ["name"] = "左导轨",
                        },
                        ["LowerRail"] = {
                            ["name"] = "下导轨",
                        },
                        ["Muzzle"] = {
                            ["name"] = "枪口",
                        },
                        ["RearSight"] = {
                            ["name"] = "照门",
                        },
                        ["RightRail"] = {
                            ["name"] = "右导轨",
                        },
                        ["Sight1"] = {
                            ["name"] = "瞄准镜1",
                        },
                        ["Sight2"] = {
                            ["name"] = "瞄准镜2",
                        },
                        ["UpperRail"] = {
                            ["name"] = "上导轨",
                        },
                    },
                },
                ["PartType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Avatar"] = 1,
                    ["Normal"] = 0,
                    ["__info"] = {
                        ["Avatar"] = {
                            ["name"] = "Avatar部件",
                        },
                        ["Normal"] = {
                            ["name"] = "普通部件",
                        },
                    },
                },
            },
            ["Monster"] = {
                ["ActorHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Monster.ActorHurt; @mtype Normal]]
                ["ActorHurtArea"] = function(self, objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end, --[[@service Monster.ActorHurtArea; @mtype Normal]]
                ["AddHp"] = function(self, objid, hp) end, --[[@service Monster.AddHp; @mtype Normal]]
                ["AddModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Monster.AddModAttrib; @mtype Normal]]
                ["AddTags"] = function(self, objid, tags, icount) end, --[[@service Monster.AddTags; @mtype Normal]]
                ["AppendSpeed"] = function(self, objid, vx, vy, vz) end, --[[@service Monster.AppendSpeed; @mtype Normal]]
                ["AquaticMobAISet"] = function(self, objid) end, --[[@service Monster.AquaticMobAISet; @mtype Normal]]
                ["CanSee"] = function(self, objid, targetObjid) end, --[[@service Monster.CanSee; @mtype Normal]]
                ["ChangActorMoveType"] = function(self, objid, moveMode) end, --[[@service Monster.ChangActorMoveType; @mtype Normal]]
                ["ChangeAI"] = function(self, objid, treeid) end, --[[@service Monster.ChangeAI; @mtype Normal]]
                ["ChangeCustomModel"] = function(self, objid, modleName) end, --[[@service Monster.ChangeCustomModel; @mtype Normal]]
                ["ChangeTree"] = function(self, objid, treeid) end, --[[@service Monster.ChangeTree; @mtype Normal]]
                ["CheckSyncAction"] = function(self, actor) end, --[[@service Monster.CheckSyncAction; @mtype Normal]]
                ["ClearActorWithId"] = function(self, actorid, bkill, worldId) end, --[[@service Monster.ClearActorWithId; @mtype Normal]]
                ["ClearTags"] = function(self, objid) end, --[[@service Monster.ClearTags; @mtype Normal]]
                ["CompareMainModel"] = function(self, facade1, facade2) end, --[[@service Monster.CompareMainModel; @mtype Normal]]
                ["DisMountActor"] = function(self, objid) end, --[[@service Monster.DisMountActor; @mtype Normal]]
                ["DropActor"] = function(self, objid, dir, isThrow, speed, hasInertance) end, --[[@service Monster.DropActor; @mtype Normal]]
                ["EmitByShooter"] = function(self, objid, emitid) end, --[[@service Monster.EmitByShooter; @mtype Normal]]
                ["EmitByShooterTarget"] = function(self, objidA, emitid, objidB) end, --[[@service Monster.EmitByShooterTarget; @mtype Normal]]
                ["EmitByShooterTargetPos"] = function(self, objid, emitid, targetPos) end, --[[@service Monster.EmitByShooterTargetPos; @mtype Normal]]
                ["EscapePickup"] = function(self, objid) end, --[[@service Monster.EscapePickup; @mtype Normal]]
                ["FindLevelNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Monster.FindLevelNearestBlock; @mtype Normal]]
                ["FindLevelRandomsortBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Monster.FindLevelRandomsortBlock; @mtype Normal]]
                ["FindNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Monster.FindNearestBlock; @mtype Normal]]
                ["GetActionAttrState"] = function(self, objid, actionattr) end, --[[@service Monster.GetActionAttrState; @mtype Normal]]
                ["GetActorDir"] = function(self, objid, itype) end, --[[@service Monster.GetActorDir; @mtype Normal]]
                ["GetActorFacade"] = function(self, objid, bhasequip) end, --[[@service Monster.GetActorFacade; @mtype Normal]]
                ["GetActorID"] = function(self, objid) end, --[[@service Monster.GetActorID; @mtype Normal]]
                ["GetActorMovementMode"] = function(self, objid) end, --[[@service Monster.GetActorMovementMode; @mtype Normal]]
                ["GetActorName"] = function(self, objid) end, --[[@service Monster.GetActorName; @mtype Normal]]
                ["GetActorPermissions"] = function(self, objid, ability) end, --[[@service Monster.GetActorPermissions; @mtype Normal]]
                ["GetAttr"] = function(self, objid, atttype) end, --[[@service Monster.GetAttr; @mtype Normal]]
                ["GetBodySize"] = function(self, objid, bodySizeType) end, --[[@service Monster.GetBodySize; @mtype Normal]]
                ["GetBoundSzie"] = function(self, objid) end, --[[@service Monster.GetBoundSzie; @mtype Normal]]
                ["GetBtreeVarValue"] = function(self, objid, varid) end, --[[@service Monster.GetBtreeVarValue; @mtype Normal]]
                ["GetChargingMaxNum"] = function(self, objid, slot) end, --[[@service Monster.GetChargingMaxNum; @mtype Normal]]
                ["GetChargingMaxTime"] = function(self, objid, slot) end, --[[@service Monster.GetChargingMaxTime; @mtype Normal]]
                ["GetChargingNum"] = function(self, objid, slot) end, --[[@service Monster.GetChargingNum; @mtype Normal]]
                ["GetChargingTime"] = function(self, objid, slot) end, --[[@service Monster.GetChargingTime; @mtype Normal]]
                ["GetCmpBaseState"] = function(self, objid, actionattr) end, --[[@service Monster.GetCmpBaseState; @mtype Normal]]
                ["GetCurMapId"] = function(self, objid) end, --[[@service Monster.GetCurMapId; @mtype Normal]]
                ["GetCurrMapId"] = function(self, objid) end, --[[@service Monster.GetCurrMapId; @mtype Normal]]
                ["GetDefID"] = function(self, objid) end, --[[@service Monster.GetDefID; @mtype Normal]]
                ["GetDropItemInfo"] = function(self, actorid) end, --[[@service Monster.GetDropItemInfo; @mtype Normal]]
                ["GetDropItemInstanceId"] = function(self, objid) end, --[[@service Monster.GetDropItemInstanceId; @mtype Normal]]
                ["GetDropItemNum"] = function(self, objid) end, --[[@service Monster.GetDropItemNum; @mtype Normal]]
                ["GetEntityFacade"] = function(self, prefab) end, --[[@service Monster.GetEntityFacade; @mtype Normal]]
                ["GetEyeHeight"] = function(self, objid) end, --[[@service Monster.GetEyeHeight; @mtype Normal]]
                ["GetFacade"] = function(self, monsterid) end, --[[@service Monster.GetFacade; @mtype Normal]]
                ["GetFaceDirection"] = function(self, objid) end, --[[@service Monster.GetFaceDirection; @mtype Normal]]
                ["GetFacePitch"] = function(self, objid) end, --[[@service Monster.GetFacePitch; @mtype Normal]]
                ["GetFaceYaw"] = function(self, objid) end, --[[@service Monster.GetFaceYaw; @mtype Normal]]
                ["GetGunInfo"] = function(self, objid) end, --[[@service Monster.GetGunInfo; @mtype Normal]]
                ["GetItemId"] = function(self, objid) end, --[[@service Monster.GetItemId; @mtype Normal]]
                ["GetLastFallSpeed"] = function(self, objid) end, --[[@service Monster.GetLastFallSpeed; @mtype Normal]]
                ["GetLevelMode"] = function(self) end, --[[@service Monster.GetLevelMode; @mtype Normal]]
                ["GetMainModel"] = function(self, facade) end, --[[@service Monster.GetMainModel; @mtype Normal]]
                ["GetMaxHP"] = function(self, objid) end, --[[@service Monster.GetMaxHP; @mtype Normal]]
                ["GetMonsterDefDesc"] = function(self, actorid) end, --[[@service Monster.GetMonsterDefDesc; @mtype Normal]]
                ["GetMonsterDefLevelExp"] = function(self, actorid) end, --[[@service Monster.GetMonsterDefLevelExp; @mtype Normal]]
                ["GetMonsterDefName"] = function(self, actorid) end, --[[@service Monster.GetMonsterDefName; @mtype Normal]]
                ["GetMonsterIcon"] = function(self, monsterid) end, --[[@service Monster.GetMonsterIcon; @mtype Normal]]
                ["GetMonsterMass"] = function(self, actorid) end, --[[@service Monster.GetMonsterMass; @mtype Normal]]
                ["GetMonsterType"] = function(self, monsterid) end, --[[@service Monster.GetMonsterType; @mtype Normal]]
                ["GetMotion"] = function(self, objid) end, --[[@service Monster.GetMotion; @mtype Normal]]
                ["GetNickName"] = function(self, objid) end, --[[@service Monster.GetNickName; @mtype Normal]]
                ["GetObjType"] = function(self, objid) end, --[[@service Monster.GetObjType; @mtype Normal]]
                ["GetObjWorldId"] = function(self, objid) end, --[[@service Monster.GetObjWorldId; @mtype Normal]]
                ["GetOrientation"] = function(self, objid) end, --[[@service Monster.GetOrientation; @mtype Normal]]
                ["GetOverlayGravity"] = function(self, objid) end, --[[@service Monster.GetOverlayGravity; @mtype Normal]]
                ["GetPickupObjID"] = function(self, objid, roleType) end, --[[@service Monster.GetPickupObjID; @mtype Normal]]
                ["GetPosition"] = function(self, objid) end, --[[@service Monster.GetPosition; @mtype Normal]]
                ["GetRidingActorObjId"] = function(self, objid) end, --[[@service Monster.GetRidingActorObjId; @mtype Normal]]
                ["GetSkillCD"] = function(self, objid, slot) end, --[[@service Monster.GetSkillCD; @mtype Normal]]
                ["GetSkillMaxCD"] = function(self, objid, slot) end, --[[@service Monster.GetSkillMaxCD; @mtype Normal]]
                ["GetTags"] = function(self, actorid) end, --[[@service Monster.GetTags; @mtype Normal]]
                ["GetTamedOwnerID"] = function(self, objid) end, --[[@service Monster.GetTamedOwnerID; @mtype Normal]]
                ["GetTeam"] = function(self, objid) end, --[[@service Monster.GetTeam; @mtype Normal]]
                ["GetTickForever"] = function(self, objid) end, --[[@service Monster.GetTickForever; @mtype Normal]]
                ["HasActor"] = function(self, objid) end, --[[@service Monster.HasActor; @mtype Normal]]
                ["HasTags"] = function(self, objid, tags, mathcmode, bexactmatch) end, --[[@service Monster.HasTags; @mtype Normal]]
                ["IncreasesAttr"] = function(self, objid, atttype, val) end, --[[@service Monster.IncreasesAttr; @mtype Normal]]
                ["InitTriggerGlobalData"] = function(self) end, --[[@service Monster.InitTriggerGlobalData; @mtype Normal]]
                ["IsExist"] = function(self, objid) end, --[[@service Monster.IsExist; @mtype Normal]]
                ["IsHaveSkill"] = function(self, objid, slot) end, --[[@service Monster.IsHaveSkill; @mtype Normal]]
                ["IsMob"] = function(self, objid) end, --[[@service Monster.IsMob; @mtype Normal]]
                ["IsPlayer"] = function(self, objid) end, --[[@service Monster.IsPlayer; @mtype Normal]]
                ["Jump"] = function(self, objid) end, --[[@service Monster.Jump; @mtype Normal]]
                ["KillSelf"] = function(self, objid) end, --[[@service Monster.KillSelf; @mtype Normal]]
                ["MountActor"] = function(self, objid, rideobjid, isContrl, isCloseAI) end, --[[@service Monster.MountActor; @mtype Normal]]
                ["OrganizeFacadeList"] = function(self) end, --[[@service Monster.OrganizeFacadeList; @mtype Normal]]
                ["PauseSoundEffectById"] = function(self, objid, soundId, pause) end, --[[@service Monster.PauseSoundEffectById; @mtype Normal]]
                ["PickupActor"] = function(self, objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end, --[[@service Monster.PickupActor; @mtype Normal]]
                ["PickupItem"] = function(self, objid, itemobjid, bforcepickup) end, --[[@service Monster.PickupItem; @mtype Normal]]
                ["PlayAct"] = function(self, objid, actid) end, --[[@service Monster.PlayAct; @mtype Normal]]
                ["PlayAnim"] = function(self, objid, animid, speed, loop) end, --[[@service Monster.PlayAnim; @mtype Normal]]
                ["PlayAnimById"] = function(self, objid, animid, inputloopmode, playLayer, crossfade) end, --[[@service Monster.PlayAnimById; @mtype Normal]]
                ["PlayAnimByObj"] = function(self, objidA, objidB, breplay) end, --[[@service Monster.PlayAnimByObj; @mtype Normal]]
                ["PlayBodyEffect"] = function(self, objid, itype) end, --[[@service Monster.PlayBodyEffect; @mtype Normal]]
                ["PlayBodyEffectByFile"] = function(self, objid, filename, sync) end, --[[@service Monster.PlayBodyEffectByFile; @mtype Normal]]
                ["PlayBodyEffectById"] = function(self, objid, particleId, scale, ptme) end, --[[@service Monster.PlayBodyEffectById; @mtype Normal]]
                ["PlayBodyParticleById"] = function(self, objid, particleId, ptme, offset, rot, scale) end, --[[@service Monster.PlayBodyParticleById; @mtype Normal]]
                ["PlayHandAnim"] = function(self, objid, animid, speed, loop) end, --[[@service Monster.PlayHandAnim; @mtype Normal]]
                ["PlaySkill"] = function(self, objid, slot) end, --[[@service Monster.PlaySkill; @mtype Normal]]
                ["PlaySoundByName"] = function(self, objid, name, volume, pitch, flag) end, --[[@service Monster.PlaySoundByName; @mtype Normal]]
                ["PlaySoundEffectById"] = function(self, objid, soundId, volume, pitch, isLoop) end, --[[@service Monster.PlaySoundEffectById; @mtype Normal]]
                ["PlayerHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Monster.PlayerHurt; @mtype Normal]]
                ["RandomActorID"] = function(self) end, --[[@service Monster.RandomActorID; @mtype Normal]]
                ["RandomFacadeID"] = function(self) end, --[[@service Monster.RandomFacadeID; @mtype Normal]]
                ["RandomName"] = function(self) end, --[[@service Monster.RandomName; @mtype Normal]]
                ["RecoverinitialModel"] = function(self, ishost, objid) end, --[[@service Monster.RecoverinitialModel; @mtype Normal]]
                ["RemoveTags"] = function(self, objid, tags, icount) end, --[[@service Monster.RemoveTags; @mtype Normal]]
                ["ReplaceActor"] = function(self, objidSrc, actorid, replacehp) end, --[[@service Monster.ReplaceActor; @mtype Normal]]
                ["RotateFaceToActor"] = function(self, objid, targetid) end, --[[@service Monster.RotateFaceToActor; @mtype Normal]]
                ["SetAIActive"] = function(self, objid, active) end, --[[@service Monster.SetAIActive; @mtype Normal]]
                ["SetAblePick"] = function(self, objid, able) end, --[[@service Monster.SetAblePick; @mtype Normal]]
                ["SetActionAttrState"] = function(self, objid, actionattr, switch) end, --[[@service Monster.SetActionAttrState; @mtype Normal]]
                ["SetActorControl"] = function(self, objid, b) end, --[[@service Monster.SetActorControl; @mtype Normal]]
                ["SetActorDir"] = function(self, objid, itype, value) end, --[[@service Monster.SetActorDir; @mtype Normal]]
                ["SetActorPermissions"] = function(self, objid, ability, switch) end, --[[@service Monster.SetActorPermissions; @mtype Normal]]
                ["SetAttr"] = function(self, objid, atttype, val) end, --[[@service Monster.SetAttr; @mtype Normal]]
                ["SetBeHurtTarget"] = function(self, objid, targetid) end, --[[@service Monster.SetBeHurtTarget; @mtype Normal]]
                ["SetBehitDisable"] = function(self, objid, value) end, --[[@service Monster.SetBehitDisable; @mtype Normal]]
                ["SetBodyEffectScale"] = function(self, objid, particleId, scale) end, --[[@service Monster.SetBodyEffectScale; @mtype Normal]]
                ["SetBodyEffectScaleByFile"] = function(self, objid, filename, scale) end, --[[@service Monster.SetBodyEffectScaleByFile; @mtype Normal]]
                ["SetBodyParticleTransform"] = function(self, objid, particleId, offset, rot, scale) end, --[[@service Monster.SetBodyParticleTransform; @mtype Normal]]
                ["SetBtreeVarValue"] = function(self, objid, varid, val) end, --[[@service Monster.SetBtreeVarValue; @mtype Normal]]
                ["SetCanCollide"] = function(self, objid, value) end, --[[@service Monster.SetCanCollide; @mtype Normal]]
                ["SetCharging"] = function(self, objid, slot, ischarging) end, --[[@service Monster.SetCharging; @mtype Normal]]
                ["SetChargingValue"] = function(self, objid, slot, value) end, --[[@service Monster.SetChargingValue; @mtype Normal]]
                ["SetCharginginfo"] = function(self, objid, slot, max, num, maxnum, isauto) end, --[[@service Monster.SetCharginginfo; @mtype Normal]]
                ["SetCmpBaseState"] = function(self, objid, actionattr, switch) end, --[[@service Monster.SetCmpBaseState; @mtype Normal]]
                ["SetFaceDirection"] = function(self, objid, x, y, z) end, --[[@service Monster.SetFaceDirection; @mtype Normal]]
                ["SetFacePitch"] = function(self, objid, pitch) end, --[[@service Monster.SetFacePitch; @mtype Normal]]
                ["SetFaceYaw"] = function(self, objid, yaw) end, --[[@service Monster.SetFaceYaw; @mtype Normal]]
                ["SetFirstSearch"] = function(self, objid, firstsearch) end, --[[@service Monster.SetFirstSearch; @mtype Normal]]
                ["SetImmuneType"] = function(self, objid, immunetype, isadd) end, --[[@service Monster.SetImmuneType; @mtype Normal]]
                ["SetModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Monster.SetModAttrib; @mtype Normal]]
                ["SetMonsterDefLevelExp"] = function(self, actorid, levelExp) end, --[[@service Monster.SetMonsterDefLevelExp; @mtype Normal]]
                ["SetMotionChange"] = function(self, objid, x, y, z) end, --[[@service Monster.SetMotionChange; @mtype Normal]]
                ["SetMountActorAttr"] = function(self, objid, isRote, isPlayerContrl, isCloseAI) end, --[[@service Monster.SetMountActorAttr; @mtype Normal]]
                ["SetNickName"] = function(self, objid, nickname) end, --[[@service Monster.SetNickName; @mtype Normal]]
                ["SetOrientation"] = function(self, objid, x, y, z) end, --[[@service Monster.SetOrientation; @mtype Normal]]
                ["SetOverlayGravity"] = function(self, objid, val) end, --[[@service Monster.SetOverlayGravity; @mtype Normal]]
                ["SetPersistance"] = function(self, objid, b) end, --[[@service Monster.SetPersistance; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetPosition"] = function(self, objid, x, y, z) end, --[[@service Monster.SetPosition; @mtype Normal]]
                ["SetRidePosition"] = function(self, objid, x, y, z) end, --[[@service Monster.SetRidePosition; @mtype Normal]]
                ["SetScale"] = function(self, objid, x, y, z) end, --[[@service Monster.SetScale; @mtype Normal]]
                ["SetSkillCD"] = function(self, objid, slot, cd) end, --[[@service Monster.SetSkillCD; @mtype Normal]]
                ["SetSkillCDInfo"] = function(self, objid, slot, maxcd, isauto) end, --[[@service Monster.SetSkillCDInfo; @mtype Normal]]
                ["SetTameTarget"] = function(self, objidA, objidB) end, --[[@service Monster.SetTameTarget; @mtype Normal]]
                ["SetTeam"] = function(self, objid, teamid, bResetAttr) end, --[[@service Monster.SetTeam; @mtype Normal]]
                ["SetTickForever"] = function(self, objid, tickForever) end, --[[@service Monster.SetTickForever; @mtype Normal]]
                ["ShowNickName"] = function(self, objid, bshow) end, --[[@service Monster.ShowNickName; @mtype Normal]]
                ["SkillIsCharging"] = function(self, objid, slot) end, --[[@service Monster.SkillIsCharging; @mtype Normal]]
                ["StopAllAnim"] = function(self, objid) end, --[[@service Monster.StopAllAnim; @mtype Normal]]
                ["StopBodyEffect"] = function(self, objid, itype) end, --[[@service Monster.StopBodyEffect; @mtype Normal]]
                ["StopBodyEffectById"] = function(self, objid, particleId) end, --[[@service Monster.StopBodyEffectById; @mtype Normal]]
                ["StopSoundEffectById"] = function(self, objid, soundId) end, --[[@service Monster.StopSoundEffectById; @mtype Normal]]
                ["TriggerAttrChangeEvent"] = function(self, objid, atttype, val) end, --[[@service Monster.TriggerAttrChangeEvent; @mtype Normal]]
                ["TriggerSkillCall"] = function(self, objid, skillName, growPatchName) end, --[[@service Monster.TriggerSkillCall; @mtype Normal]]
                ["TryMoveToActor"] = function(self, objid, targetObjid, speed) end, --[[@service Monster.TryMoveToActor; @mtype Normal]]
                ["TryMoveToNoSearch"] = function(self, objid, x, y, z) end, --[[@service Monster.TryMoveToNoSearch; @mtype Normal]]
                ["TryMoveToPos"] = function(self, objid, x, y, z, cancontrol, bshowtip) end, --[[@service Monster.TryMoveToPos; @mtype Normal]]
                ["TryPickupActorForward"] = function(self, objid, distance) end, --[[@service Monster.TryPickupActorForward; @mtype Normal]]
                ["WhitList_StopSkill"] = function(self, objid, skillid) end, --[[@service Monster.WhitList_StopSkill; @mtype Normal]]
                ["_GenVarids"] = function(self, varmgr) end, --[[@service Monster._GenVarids; @mtype Normal]]
            },
            ["MonsterEdit"] = {
                ["Type"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Animal"] = 1,
                    ["Monster"] = 0,
                    ["__info"] = {
                        ["Animal"] = {
                            ["name"] = "动物",
                            ["sort"] = 1,
                        },
                        ["Monster"] = {
                            ["name"] = "怪物",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["MotionGroup"] = {
                ["BeginType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Event"] = 2,
                    ["Now"] = 1,
                    ["PreMotionBegin"] = 3,
                    ["PreMotionStop"] = 4,
                    ["__info"] = {
                        ["Event"] = {
                            ["name"] = "接收广播开始",
                            ["sort"] = 2,
                        },
                        ["Now"] = {
                            ["name"] = "立即开始",
                            ["sort"] = 1,
                        },
                        ["PreMotionBegin"] = {
                            ["name"] = "上一个运动开始",
                            ["sort"] = 3,
                        },
                        ["PreMotionStop"] = {
                            ["name"] = "上一个运动结束",
                            ["sort"] = 4,
                        },
                    },
                },
                ["RelativeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Local"] = 1,
                    ["World"] = 2,
                    ["__info"] = {
                        ["Local"] = {
                            ["name"] = "局部",
                            ["sort"] = 1,
                        },
                        ["World"] = {
                            ["name"] = "世界",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["MoveType"] = {
                ["Auto"] = 128,
                ["Flying"] = 1,
                ["Swimming"] = 2,
                ["Walking"] = 0,
            },
            ["NPCShop"] = {
                ["CostType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["MiniBean"] = 1,
                    ["MiniCoin"] = 2,
                    ["MiniPoint"] = 3,
                    ["Star"] = 4,
                    ["__info"] = {
                        ["MiniBean"] = {
                            ["name"] = "迷你豆",
                            ["sort"] = 1,
                        },
                        ["MiniCoin"] = {
                            ["name"] = "迷你币",
                            ["sort"] = 2,
                        },
                        ["MiniPoint"] = {
                            ["name"] = "迷你点",
                            ["sort"] = 3,
                        },
                        ["Star"] = {
                            ["name"] = "星星",
                            ["sort"] = 4,
                        },
                    },
                },
                ["DialogScene"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CurrencyNotEnough"] = 5,
                    ["Greeting"] = 1,
                    ["MaterialNotEnough"] = 6,
                    ["NotSoldOut"] = 3,
                    ["Refresh"] = 7,
                    ["SoldOut"] = 2,
                    ["Success"] = 4,
                    ["__info"] = {
                        ["CurrencyNotEnough"] = {
                            ["name"] = "货币不足",
                            ["sort"] = 5,
                        },
                        ["Greeting"] = {
                            ["name"] = "问候语",
                            ["sort"] = 1,
                        },
                        ["MaterialNotEnough"] = {
                            ["name"] = "所需材料不足",
                            ["sort"] = 6,
                        },
                        ["NotSoldOut"] = {
                            ["name"] = "选择商品-未售罄",
                            ["sort"] = 3,
                        },
                        ["Refresh"] = {
                            ["name"] = "列表刷新",
                            ["sort"] = 7,
                        },
                        ["SoldOut"] = {
                            ["name"] = "选择商品-售罄",
                            ["sort"] = 2,
                        },
                        ["Success"] = {
                            ["name"] = "购买成功",
                            ["sort"] = 4,
                        },
                    },
                },
                ["GoodsQuality"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Common"] = 1,
                    ["Epic"] = 3,
                    ["Legendary"] = 4,
                    ["Rare"] = 2,
                    ["__info"] = {
                        ["Common"] = {
                            ["name"] = "普通",
                            ["sort"] = 1,
                        },
                        ["Epic"] = {
                            ["name"] = "史诗",
                            ["sort"] = 3,
                        },
                        ["Legendary"] = {
                            ["name"] = "传说",
                            ["sort"] = 4,
                        },
                        ["Rare"] = {
                            ["name"] = "稀有",
                            ["sort"] = 2,
                        },
                    },
                },
                ["PayType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Currency"] = 3,
                    ["Item"] = 1,
                    ["ItemAndTag"] = 2,
                    ["__info"] = {
                        ["Currency"] = {
                            ["name"] = "货币支付",
                            ["sort"] = 3,
                        },
                        ["Item"] = {
                            ["name"] = "以物易物",
                            ["sort"] = 1,
                        },
                        ["ItemAndTag"] = {
                            ["name"] = "以物易物-标签",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RefreshType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Currency"] = 2,
                    ["Item"] = 1,
                    ["__info"] = {
                        ["Currency"] = {
                            ["name"] = "货币刷新",
                            ["sort"] = 2,
                        },
                        ["Item"] = {
                            ["name"] = "道具刷新",
                            ["sort"] = 1,
                        },
                    },
                },
                ["ShopType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Auction"] = 2,
                    ["Shop"] = 1,
                    ["__info"] = {
                        ["Auction"] = {
                            ["name"] = "开发者商店",
                            ["sort"] = 2,
                        },
                        ["Shop"] = {
                            ["name"] = "自定义商店",
                            ["sort"] = 1,
                        },
                    },
                },
                ["TagMatchMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["All"] = 1,
                    ["Any"] = 2,
                    ["__info"] = {
                        ["All"] = {
                            ["name"] = "全部匹配",
                            ["sort"] = 1,
                        },
                        ["Any"] = {
                            ["name"] = "部分匹配",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["NewCommonBlockPlace"] = {
                ["PlaceTypeGroup"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CustomBlock"] = 5,
                    ["Farmland"] = 1,
                    ["NoBlock"] = 6,
                    ["Pit"] = 2,
                    ["RiceField"] = 3,
                    ["TrellisFeld"] = 4,
                    ["__info"] = {
                        ["CustomBlock"] = {
                            ["name"] = "自定义方块作物",
                            ["sort"] = 5,
                        },
                        ["Farmland"] = {
                            ["name"] = "耕地作物",
                            ["sort"] = 1,
                        },
                        ["NoBlock"] = {
                            ["name"] = "无需种植方块作物",
                            ["sort"] = 6,
                        },
                        ["Pit"] = {
                            ["name"] = "土坑作物",
                            ["sort"] = 2,
                        },
                        ["RiceField"] = {
                            ["name"] = "水田作物",
                            ["sort"] = 3,
                        },
                        ["TrellisFeld"] = {
                            ["name"] = "藤蔓作物",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["ObjType"] = {
                ["Actor"] = 0,
                ["Area"] = 14,
                ["BiomeEdit"] = 9,
                ["Block"] = 5,
                ["BlockMaterial"] = 12,
                ["Crafting"] = 11,
                ["DropItem"] = 17,
                ["Empty"] = 4,
                ["Entity"] = 0,
                ["Furnace"] = 13,
                ["Item"] = 7,
                ["Mob"] = 1,
                ["Planet"] = 19,
                ["Player"] = 2,
                ["Pos"] = 16,
                ["Projectile"] = 15,
                ["Status"] = 8,
                ["StatusEffect"] = 1001,
                ["StatusEffectInst"] = 1002,
                ["UI"] = 6,
                ["World"] = 3,
            },
            ["ObjectEvent"] = {
                ["ActorAddBuff"] = "Actor.AddBuff",
                ["ActorAreaIn"] = "Actor.AreaIn",
                ["ActorAreaOut"] = "Actor.AreaOut",
                ["ActorAttack"] = "Object.Attack",
                ["ActorAttackHit"] = "Actor.AttackHit",
                ["ActorBeHurt"] = "Actor.BeHurt",
                ["ActorBeat"] = "Actor.Beat",
                ["ActorChangeAttr"] = "Actor.ChangeAttr",
                ["ActorChangeMotion"] = "Actor.ChangeMotion",
                ["ActorClickActor"] = "Actor.ClickActor",
                ["ActorCollide"] = "Actor.Collide.Begin",
                ["ActorCreate"] = "Actor.Create",
                ["ActorDamage"] = "Actor.Damage",
                ["ActorDie"] = "Actor.Die",
                ["ActorEnterAOI"] = 14,
                ["ActorPickupActor"] = "Actor.PickupActor",
                ["ActorProjectileHit"] = "Actor.Projectile.Hit",
                ["ActorRClickUp"] = 7,
                ["ActorRemoveBuff"] = "Actor.RemoveBuff",
                ["BlockAdd"] = 21,
                ["BlockBeTouched"] = "Block.BeTouched",
                ["BlockChangeColor"] = 30,
                ["BlockChangeDir"] = "Block.BlockChangeDir",
                ["BlockClicked"] = 33,
                ["BlockContainerChange"] = 27,
                ["BlockContainerPutIn"] = 28,
                ["BlockContainerTakeOut"] = 29,
                ["BlockDestroy"] = 23,
                ["BlockDigBegin"] = 24,
                ["BlockDigCancel"] = 25,
                ["BlockDigEnd"] = 26,
                ["BlockPlaceBy"] = 20,
                ["BlockRemove"] = 22,
                ["CanPlayerPickUpItem"] = "Player.CanPlayerPickUpItem",
                ["CaptureAndUploadScreenshot"] = "Game.CaptureAndUploadScreenshot",
                ["DeveloperBuyItem"] = "Developer.BuyItem",
                ["EntityCreate"] = "Entity.Create",
                ["EquipItemEvent"] = "Player.EquipItemEvent",
                ["InteractBlock2Place"] = "Player.InteractBlock2Place",
                ["ItemAddDuration"] = "Item.AddDuration",
                ["MobAddBuff"] = "Actor.AddBuff",
                ["MobAreaIn"] = "Actor.AreaIn",
                ["MobAreaOut"] = "Actor.AreaOut",
                ["MobAttack"] = "Actor.Attack",
                ["MobAttackHit"] = "Actor.AttackHit",
                ["MobAttrStateChange"] = "Mob.AttrStateChange",
                ["MobBeClick"] = "Actor.ClickActor",
                ["MobBeHurt"] = "Actor.BeHurt",
                ["MobBeInteract"] = "Mob.BeInteract",
                ["MobBeat"] = "Actor.Beat",
                ["MobChangeAttr"] = "Actor.ChangeAttr",
                ["MobChangeMotion"] = "Actor.ChangeMotion",
                ["MobCollide"] = "Actor.Collide.Begin",
                ["MobCreate"] = "Actor.Create",
                ["MobDamage"] = "Actor.Damage",
                ["MobDie"] = "Actor.Die",
                ["MobDismountActor"] = "Actor.DismountActor",
                ["MobMotionStateChange"] = "Mob.MotionStateChange",
                ["MobMountActor"] = "Actor.MountActor",
                ["MobProjectileHit"] = "Actor.Projectile.Hit",
                ["MobRClickUp"] = 7,
                ["MobRemoveBuff"] = "Actor.RemoveBuff",
                ["MobUseItem"] = "Actor.UseItem",
                ["MouseEvent"] = 8,
                ["ObjBeTouched"] = "Obj.BeTouched",
                ["ObjectAddBuff"] = "ObjectAddBuff",
                ["ObjectAttack"] = "ObjectAttack",
                ["ObjectAttackHit"] = "ObjectAttackHit",
                ["ObjectAttrStateChange"] = "ObjectAttrStateChange",
                ["ObjectBeClick"] = "Actor.ClickActor",
                ["ObjectBeHurt"] = "ObjectBeHurt",
                ["ObjectChangeAttr"] = "ObjectChangeAttr",
                ["ObjectCollide"] = "ObjectCollide",
                ["ObjectCollideByAreaObj"] = "Object.CollideAreaObj",
                ["ObjectCollideByDropItem"] = "Object.CollideDropItem",
                ["ObjectCollideByEntity"] = "Object.CollideEntity",
                ["ObjectCollideByMissile"] = "Object.CollideMissile",
                ["ObjectCollideByMob"] = "Object.CollideMob",
                ["ObjectCollideByPlayer"] = "Object.CollidePlayer",
                ["ObjectDamage"] = "ObjectDamage",
                ["ObjectDefeat"] = "ObjectDefeat",
                ["ObjectDie"] = "ObjectDie",
                ["ObjectDismountActor"] = "ObjectDismountActor",
                ["ObjectMotionStateChange"] = "ObjectMotionStateChange",
                ["ObjectMotionStateChangeEnd"] = "ObjectMotionStateChangeEnd",
                ["ObjectMountActor"] = "ObjectMountActor",
                ["ObjectPlayAnim"] = "Actor.PlayAnim",
                ["ObjectRemoveBuff"] = "ObjectRemoveBuff",
                ["OnBeDeadlyHurt"] = 19,
                ["OnBeforeLeaveWorld"] = 35,
                ["OnBlockAdd"] = 21,
                ["OnBlockDestroy"] = 23,
                ["OnBlockPlaceBy"] = 20,
                ["OnBlockRemove"] = 22,
                ["OnCollide"] = 4,
                ["OnCollideBegin"] = 3,
                ["OnCollideEnd"] = 5,
                ["OnEnterWorld"] = 1,
                ["OnInteract"] = 6,
                ["OnInteractLowPriority"] = 38,
                ["OnLeaveWorld"] = 2,
                ["OnModelChange"] = 10004,
                ["OnNotify"] = 34,
                ["OnPropertyChange"] = "OnPropertyChange",
                ["OnSoundAction"] = 10003,
                ["OnTame"] = 37,
                ["OnThrowActor"] = 36,
                ["PayMapShopOrder"] = "Game.PayMapShopOrder",
                ["PlayerAddBuff"] = "Player.AddBuff",
                ["PlayerAddItem"] = "Player.AddItem",
                ["PlayerAreaIn"] = "Player.AreaIn",
                ["PlayerAreaOut"] = "Player.AreaOut",
                ["PlayerArmEntryMsg"] = "Player.ArmEntryMsg",
                ["PlayerAttack"] = "Player.Attack",
                ["PlayerAttackHit"] = "Player.AttackHit",
                ["PlayerAttrStateChange"] = "Player.AttrStateChange",
                ["PlayerBackPackAddItem"] = "Player.BackPackAddItem",
                ["PlayerBackPackChange"] = "Player.BackPackChange",
                ["PlayerBackPackRemItem"] = "Player.BackPackRemItem",
                ["PlayerBeHurt"] = "Player.BeHurt",
                ["PlayerChangeAttr"] = "Player.ChangeAttr",
                ["PlayerChangeCoin"] = "Player.ChangeCoin",
                ["PlayerChargeItemBegin"] = "Player.ChargeItem.Begin",
                ["PlayerChargeItemEnd"] = "Player.ChargeItem.End",
                ["PlayerClickActor"] = "Player.ClickActor",
                ["PlayerClickBlock"] = "Player.ClickBlock",
                ["PlayerClickDropItem"] = "Player.ClickDropItem",
                ["PlayerClickEntity"] = "Player.ClickEntity",
                ["PlayerClickMob"] = "Player.ClickMob",
                ["PlayerClickPlayer"] = "Player.ClickPlayer",
                ["PlayerClickProjectile"] = "Player.ClickProjectile",
                ["PlayerCollide"] = "Player.Collide.Begin",
                ["PlayerConsumeItem"] = "Player.ConsumeItem",
                ["PlayerDamageActor"] = "Player.DamageActor",
                ["PlayerDefeat"] = "Game.AnyPlayer.Defeat",
                ["PlayerDefeatActor"] = "Player.DefeatActor",
                ["PlayerDestroyBlock"] = "Player.PlayerDestroyBlock",
                ["PlayerDie"] = "Player.Die",
                ["PlayerDiscardItem"] = "Player.DiscardItem",
                ["PlayerDismountActor"] = "Player.DismountActor",
                ["PlayerDodge"] = 15,
                ["PlayerEnterGame"] = "Game.AnyPlayer.EnterGame",
                ["PlayerEquipAddItem"] = "Player.EquipAddItem",
                ["PlayerEquipChange"] = "Player.EquipChange",
                ["PlayerEquipOff"] = "Player.EquipOff",
                ["PlayerEquipOn"] = "Player.EquipOn",
                ["PlayerEquipRemItem"] = "Player.EquipRemItem",
                ["PlayerFire"] = 11,
                ["PlayerFireBefore"] = 16,
                ["PlayerGunRecovering"] = 18,
                ["PlayerGunRecoveryCD"] = 17,
                ["PlayerHeadShot"] = 13,
                ["PlayerInputContent"] = "Player.InputContent",
                ["PlayerInputKeyClick"] = "Player.InputKeyClick",
                ["PlayerInputKeyDown"] = "Player.InputKeyDown",
                ["PlayerInputKeyOnPress"] = "Player.InputKeyOnPress",
                ["PlayerInputKeyUp"] = "Player.InputKeyUp",
                ["PlayerInvateFriend"] = "Player.InvateFriend",
                ["PlayerLeaveGame"] = "Game.AnyPlayer.LeaveGame",
                ["PlayerLevelModelUpgrade"] = "Player.LevelModelUpgrade",
                ["PlayerMotionStateChange"] = "Player.MotionStateChange",
                ["PlayerMotionStateChangeEnd"] = "Player.MotionStateChangeEnd",
                ["PlayerMountActor"] = "Player.MountActor",
                ["PlayerMoveOneBlockSize"] = "Player.MoveOneBlockSize",
                ["PlayerNewInputContent"] = "Player.NewInputContent",
                ["PlayerPickUpItem"] = "Player.PickUpItem",
                ["PlayerPlayAction"] = "Player.PlayAction",
                ["PlayerReload"] = 12,
                ["PlayerRemoveBuff"] = "Player.RemoveBuff",
                ["PlayerRevive"] = "Player.Revive",
                ["PlayerSelectShortcut"] = "Player.SelectShortcut",
                ["PlayerShortcutAddItem"] = "Player.ShortcutAddItem",
                ["PlayerShortcutChange"] = "Player.ShortcutChange",
                ["PlayerShortcutRemItem"] = "Player.ShortcutRemItem",
                ["PlayerSkillTriggerInput"] = "Player.SkillTriggerInput",
                ["PlayerTouchBlock"] = "Player.TouchBlock",
                ["PlayerTouchObj"] = "Player.TouchObj",
                ["PlayerUseGiftPack"] = "Player.UseGiftPack",
                ["PlayerUseItem"] = "Player.UseItem",
                ["PlayerVictory"] = "Game.AnyPlayer.Victory",
                ["UIEquitChange"] = 10,
                ["UIGridChange"] = 9,
                ["UseItemScriptEvent"] = "Player.UseItemScriptEvent",
            },
            ["ObjectLib"] = {
                ["GetAreaData"] = function(self, libobjid) end, --[[@service ObjectLib.GetAreaData; @mtype Normal]]
                ["GetItemData"] = function(self, libobjid) end, --[[@service ObjectLib.GetItemData; @mtype Normal]]
                ["GetLivingData"] = function(self, libobjid) end, --[[@service ObjectLib.GetLivingData; @mtype Normal]]
                ["GetPositionData"] = function(self, libobjid) end, --[[@service ObjectLib.GetPositionData; @mtype Normal]]
            },
            ["ObsBluePrintStatus"] = {
                ["Binded"] = 2,
                ["Loaded"] = 1,
                ["Unloaded"] = 0,
            },
            ["OfficeUtils"] = {
                ["CheckSummerActActivate"] = function(self, callback, actid) end, --[[@service OfficeUtils.CheckSummerActActivate; @mtype Normal]]
                ["DecodeBase64"] = function(self, str_) end, --[[@service OfficeUtils.DecodeBase64; @mtype Normal]]
                ["FishReq"] = function(self, querytype, param, callfun) end, --[[@service OfficeUtils.FishReq; @mtype Normal]]
                ["GeneralTaskReported"] = function(self, uin, t, id1, id2, id3) end, --[[@service OfficeUtils.GeneralTaskReported; @mtype Sync]]
                ["GetActivateProgress"] = function(self, reportid, uin, taskid) end, --[[@service OfficeUtils.GetActivateProgress; @mtype ClientData; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetActivateReward"] = function(self, reportid, uin, taskid) end, --[[@service OfficeUtils.GetActivateReward; @mtype ClientData; @rtype Uin_TimeLimit=(10,"请求频繁,请稍后再试！"); @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetGlobalTaskCfg"] = function(self, callback) end, --[[@service OfficeUtils.GetGlobalTaskCfg; @mtype Normal]]
                ["GetShopItemInfo"] = function(self, itype, itemid) end, --[[@service OfficeUtils.GetShopItemInfo; @mtype Normal]]
                ["MunReq"] = function(self, querytype, params, callfun) end, --[[@service OfficeUtils.MunReq; @mtype Normal]]
                ["ReportActivateData"] = function(self, actid, ...) end, --[[@service OfficeUtils.ReportActivateData; @mtype Normal]]
                ["ReportActivateDataForUin"] = function(self, uin, eventid, ...) end, --[[@service OfficeUtils.ReportActivateDataForUin; @mtype Normal; @rtype WhiteList="trigger_api_UploadActData"]]
                ["ReportEvent"] = function(self, sID, cID, oID, event, eventTb, uin) end, --[[@service OfficeUtils.ReportEvent; @mtype Normal]]
                ["ReportOfficeActivateData"] = function(self, uin, eventid, ...) end, --[[@service OfficeUtils.ReportOfficeActivateData; @mtype Normal; @rtype WhiteList="trigger_api_ReportOfficeActivateData"]]
                ["SendClientReportEvent"] = function(self, uin, sID, cID, oID, event, eventTb) end, --[[@service OfficeUtils.SendClientReportEvent; @mtype SyncPack; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetActivateData"] = function(self, actid, ...) end, --[[@service OfficeUtils.SetActivateData; @mtype Normal]]
                ["ZombieKill"] = function(self, uin) end, --[[@service OfficeUtils.ZombieKill; @mtype Normal]]
                ["ZombieReportData"] = function(self, uin) end, --[[@service OfficeUtils.ZombieReportData; @mtype Normal]]
            },
            ["OldGunEdit"] = {
                ["BulletType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Limited"] = 1,
                    ["Noneed"] = 2,
                    ["Unlimited"] = 0,
                    ["__info"] = {
                        ["Limited"] = {
                            ["name"] = "有限子弹",
                            ["sort"] = 2,
                        },
                        ["Noneed"] = {
                            ["name"] = "不需要子弹",
                            ["sort"] = 3,
                        },
                        ["Unlimited"] = {
                            ["name"] = "无限子弹",
                            ["sort"] = 1,
                        },
                    },
                },
                ["FireType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Auto"] = 1,
                    ["Manual"] = 2,
                    ["SemiAuto"] = 0,
                    ["__info"] = {
                        ["Auto"] = {
                            ["name"] = "全自动",
                            ["sort"] = 2,
                        },
                        ["Manual"] = {
                            ["name"] = "手动",
                            ["sort"] = 3,
                        },
                        ["SemiAuto"] = {
                            ["name"] = "半自动",
                            ["sort"] = 1,
                        },
                    },
                },
                ["GunType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Machine"] = 10108,
                    ["Pistol"] = 10105,
                    ["SniperRifle"] = 10107,
                    ["Submachine"] = 10106,
                    ["__info"] = {
                        ["Machine"] = {
                            ["name"] = "重机枪",
                            ["sort"] = 4,
                        },
                        ["Pistol"] = {
                            ["name"] = "手枪",
                            ["sort"] = 1,
                        },
                        ["SniperRifle"] = {
                            ["name"] = "狙击枪",
                            ["sort"] = 3,
                        },
                        ["Submachine"] = {
                            ["name"] = "冲锋枪",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["PLAYERATTR"] = {
                ["ATK_FIREARM"] = 38,
                ["ATK_MAGIC"] = 32,
                ["ATK_MELEE"] = 17,
                ["ATK_PHYSICAL"] = 31,
                ["ATK_REMOTE"] = 18,
                ["CUR_ARMOR"] = 35,
                ["CUR_GRAVITY"] = 39,
                ["CUR_HP"] = 2,
                ["CUR_HUNGER"] = 6,
                ["CUR_LEVEL"] = 27,
                ["CUR_LEVELEXP"] = 26,
                ["CUR_OXYGEN"] = 8,
                ["CUR_STRENGTH"] = 28,
                ["DAMAGED_ZOMBIE"] = 37,
                ["DEF_CHAOS"] = 24,
                ["DEF_MAGIC"] = 34,
                ["DEF_MELEE"] = 19,
                ["DEF_PHYSICAL"] = 33,
                ["DEF_REMOTE"] = 20,
                ["DIMENSION"] = 21,
                ["DODGE"] = 16,
                ["ENABLE_ATTACK"] = 32,
                ["ENABLE_BEATTACKED"] = 64,
                ["ENABLE_BEKILLED"] = 128,
                ["ENABLE_DEATHDROPITEM"] = 512,
                ["ENABLE_DESTROYBLOCK"] = 8,
                ["ENABLE_DISCARDITEM"] = 2048,
                ["ENABLE_FORBIDDODGEANIM"] = 4194304,
                ["ENABLE_FORBIFIRE"] = 2097152,
                ["ENABLE_MOVE"] = 1,
                ["ENABLE_OPERATEBLOCK"] = 4,
                ["ENABLE_PICKUP"] = 256,
                ["ENABLE_PLACEBLOCK"] = 2,
                ["ENABLE_ROTATINGCAMERA"] = 5,
                ["ENABLE_SWITCHSHORTCUT"] = 3,
                ["ENABLE_USEITEM"] = 16,
                ["ENABLE_VEHICLEAUTOFORWARD"] = 1024,
                ["HP_RECOVER"] = 3,
                ["ITEM_DISABLE_DROP"] = 2,
                ["ITEM_DISABLE_THROW"] = 1,
                ["JUMP_POWER"] = 14,
                ["LEVEL"] = 23,
                ["LIFE_NUM"] = 4,
                ["MAX_ARMOR"] = 36,
                ["MAX_HP"] = 1,
                ["MAX_HUNGER"] = 5,
                ["MAX_OXYGEN"] = 7,
                ["MAX_STRENGTH"] = 29,
                ["PACK_SIZE"] = 25,
                ["RECOVER_OXYGEN"] = 9,
                ["RUN_SPEED"] = 11,
                ["SCORE"] = 22,
                ["SNEAK_SPEED"] = 12,
                ["STRENGTH_RECOVER"] = 30,
                ["SWIN_SPEED"] = 13,
                ["WALK_SPEED"] = 10,
                ["WEIGHT"] = 15,
            },
            ["PackEdit"] = {
                ["PackType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["FixedOutput"] = 0,
                    ["RandomOutput"] = 1,
                    ["__info"] = {
                        ["FixedOutput"] = {
                            ["name"] = "固定产出",
                            ["sort"] = 1,
                        },
                        ["RandomOutput"] = {
                            ["name"] = "随机产出",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["Physics"] = {
                ["ColliderShape"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Box"] = 1,
                    ["Capsule"] = 2,
                    ["Mesh"] = 3,
                    ["Sphere"] = 0,
                    ["__info"] = {
                        ["Box"] = {
                            ["name"] = "立方体",
                            ["sort"] = 2,
                        },
                        ["Capsule"] = {
                            ["name"] = "胶囊体",
                            ["sort"] = 4,
                        },
                        ["Mesh"] = {
                            ["name"] = "跟随模型",
                            ["sort"] = 1,
                        },
                        ["Sphere"] = {
                            ["name"] = "球体",
                            ["sort"] = 3,
                        },
                    },
                },
                ["LayerType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                    },
                },
                ["PhysicsType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Dynamic"] = 1,
                    ["None"] = 0,
                    ["Static"] = 2,
                    ["Trigger"] = 3,
                    ["__info"] = {
                        ["Dynamic"] = {
                            ["name"] = "可动物体",
                            ["sort"] = 3,
                        },
                        ["None"] = {
                            ["name"] = "无物理效果",
                            ["sort"] = 4,
                        },
                        ["Static"] = {
                            ["name"] = "静态物",
                            ["sort"] = 2,
                        },
                        ["Trigger"] = {
                            ["name"] = "区域",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["PickupActionType"] = {
                ["Drop"] = 2,
                ["Pickup"] = 1,
                ["Throw"] = 3,
                ["Unbind"] = 4,
            },
            ["PixelUnits"] = {
                ["Percentage"] = 1,
                ["Value"] = 2,
            },
            ["Planet"] = {
                ["CreatePlanet"] = function(self, prefabId, pos, ttlSec) end, --[[@service Planet.CreatePlanet; @mtype Normal]]
                ["PreloadPlanet"] = function(self, prefabId, pos, ttlSec) end, --[[@service Planet.PreloadPlanet; @mtype Normal]]
                ["ReleasePreloadedPlanet"] = function(self, mapId, pos) end, --[[@service Planet.ReleasePreloadedPlanet; @mtype Normal]]
                ["TeleportToPlanet"] = function(self, uin, prefabId, pos) end, --[[@service Planet.TeleportToPlanet; @mtype Normal]]
            },
            ["PlanetAurora"] = {
                ["WeatherType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Aurora"] = 10,
                    ["__info"] = {
                        ["Aurora"] = {
                            ["name"] = "极光天",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["PlanetBaseEnvSetting"] = {
                ["WeatherType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Aurora"] = 10,
                    ["Bad"] = 4,
                    ["Blizzard"] = 8,
                    ["MeteorShower"] = 9,
                    ["Rain"] = 2,
                    ["Sandduststorm"] = 6,
                    ["Shine"] = 1,
                    ["ShineAndRain"] = 0,
                    ["Snow"] = 5,
                    ["Tempest"] = 7,
                    ["Thunder"] = 3,
                    ["VoidFog"] = 11,
                    ["__info"] = {
                        ["Aurora"] = {
                            ["name"] = "极光天",
                            ["sort"] = 12,
                        },
                        ["Bad"] = {
                            ["name"] = "恶劣天气",
                            ["sort"] = 6,
                        },
                        ["Blizzard"] = {
                            ["name"] = "暴风雪",
                            ["sort"] = 10,
                        },
                        ["MeteorShower"] = {
                            ["name"] = "流星雨",
                            ["sort"] = 11,
                        },
                        ["Rain"] = {
                            ["name"] = "雨天",
                            ["sort"] = 4,
                        },
                        ["Sandduststorm"] = {
                            ["name"] = "沙尘暴",
                            ["sort"] = 8,
                        },
                        ["Shine"] = {
                            ["name"] = "晴天",
                            ["sort"] = 3,
                        },
                        ["ShineAndRain"] = {
                            ["name"] = "随机天气",
                            ["sort"] = 2,
                        },
                        ["Snow"] = {
                            ["name"] = "雪天",
                            ["sort"] = 7,
                        },
                        ["Tempest"] = {
                            ["name"] = "暴风雨",
                            ["sort"] = 9,
                        },
                        ["Thunder"] = {
                            ["name"] = "雷暴",
                            ["sort"] = 5,
                        },
                        ["VoidFog"] = {
                            ["name"] = "虚空浓雾",
                            ["sort"] = 13,
                        },
                    },
                },
            },
            ["PlanetMeteorShower"] = {
                ["DirectionMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["FixedWorldYaw"] = 1,
                    ["PlayerForward"] = 0,
                    ["__info"] = {
                        ["FixedWorldYaw"] = {
                            ["name"] = "固定世界方向",
                            ["sort"] = 2,
                        },
                        ["PlayerForward"] = {
                            ["name"] = "跟随玩家朝向",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["PlanetStationSetting"] = {
                ["TeleportCostType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Item"] = 2,
                    ["None"] = 0,
                    ["Star"] = 1,
                    ["__info"] = {
                        ["Item"] = {
                            ["name"] = "道具",
                            ["sort"] = 3,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["Star"] = {
                            ["name"] = "星星",
                            ["sort"] = 2,
                        },
                    },
                },
                ["UnlockType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ConsumeItem"] = 2,
                    ["Default"] = 0,
                    ["OwnItem"] = 1,
                    ["__info"] = {
                        ["ConsumeItem"] = {
                            ["name"] = "消耗道具",
                            ["sort"] = 2,
                        },
                        ["Default"] = {
                            ["name"] = "无需解锁",
                            ["sort"] = 0,
                        },
                        ["OwnItem"] = {
                            ["name"] = "拥有道具",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Plant"] = {
                ["MagicModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Magic"] = 2,
                    ["Normal"] = 1,
                    ["__info"] = {
                        ["Magic"] = {
                            ["name"] = "魔法模式",
                            ["sort"] = 2,
                        },
                        ["Normal"] = {
                            ["name"] = "普通模式",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Player"] = {
                ["ActorHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Player.ActorHurt; @mtype Normal]]
                ["ActorHurtArea"] = function(self, objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end, --[[@service Player.ActorHurtArea; @mtype Normal]]
                ["AddHp"] = function(self, objid, hp) end, --[[@service Player.AddHp; @mtype Normal]]
                ["AddMagazine"] = function(self, uin, num) end, --[[@service Player.AddMagazine; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["AddModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Player.AddModAttrib; @mtype Normal]]
                ["AddTags"] = function(self, objid, tags, icount) end, --[[@service Player.AddTags; @mtype Normal]]
                ["AppendSpeed"] = function(self, objid, x, y, z) end, --[[@service Player.AppendSpeed; @mtype Normal]]
                ["BanUseStrength"] = function(self, objid) end, --[[@service Player.BanUseStrength; @mtype Normal]]
                ["CapturePlayer"] = function(self, playerid, targetId, x, y, z) end, --[[@service Player.CapturePlayer; @mtype Normal]]
                ["ChangActorMoveType"] = function(self, objid, moveMode) end, --[[@service Player.ChangActorMoveType; @mtype Normal]]
                ["ChangPlayerMoveType"] = function(self, uin, moveType) end, --[[@service Player.ChangPlayerMoveType; @mtype Normal]]
                ["ChangeCustomModel"] = function(self, objid, modleName) end, --[[@service Player.ChangeCustomModel; @mtype Normal]]
                ["ChangeSkinTextureForMod"] = function(self, playerid, skinPath, partModelName, hideFace, isAvatar) end, --[[@service Player.ChangeSkinTextureForMod; @mtype BoardCast]]
                ["ChangeViewMode"] = function(self, objid, viewmode, islock) end, --[[@service Player.ChangeViewMode; @mtype Normal]]
                ["ChangeViewModeForMod"] = function(self, objid, viewmode, islock) end, --[[@service Player.ChangeViewModeForMod; @mtype Sync; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["ChangeViewModeSurvive"] = function(self, objid, viewmode, islock) end, --[[@service Player.ChangeViewModeSurvive; @mtype Normal]]
                ["CheckActionAttrState"] = function(self, objid, actionattr) end, --[[@service Player.CheckActionAttrState; @mtype Normal]]
                ["CheckCustomOrderID"] = function(self, call_back, uin, orderids) end, --[[@service Player.CheckCustomOrderID; @mtype Block]]
                ["CheckGunType"] = function(self, objid, gunType) end, --[[@service Player.CheckGunType; @mtype Normal]]
                ["CheckMapShopOrder"] = function(self, call_back, uin, orderid) end, --[[@service Player.CheckMapShopOrder; @mtype Block]]
                ["CheckRealOwnerIsDeveloper"] = function(self) end, --[[@service Player.CheckRealOwnerIsDeveloper; @mtype Normal]]
                ["CheckSyncAction"] = function(self, actor) end, --[[@service Player.CheckSyncAction; @mtype Normal]]
                ["ClearActorWithId"] = function(self, actorid, bkill, worldId) end, --[[@service Player.ClearActorWithId; @mtype Normal]]
                ["ClearMotion"] = function(self, uin) end, --[[@service Player.ClearMotion; @mtype Sync]]
                ["ClearTags"] = function(self, objid) end, --[[@service Player.ClearTags; @mtype Normal]]
                ["ClearTaskDirtyState"] = function(self) end, --[[@service Player.ClearTaskDirtyState; @mtype Normal]]
                ["CloseGunUpgradeFrame"] = function(self, uin) end, --[[@service Player.CloseGunUpgradeFrame; @mtype Sync]]
                ["CloseRoleAttrFrame"] = function(self, uin) end, --[[@service Player.CloseRoleAttrFrame; @mtype Sync]]
                ["CompareMainModel"] = function(self, facade1, facade2) end, --[[@service Player.CompareMainModel; @mtype Normal]]
                ["DelMapShopBackOrder"] = function(self, uin, scene) end, --[[@service Player.DelMapShopBackOrder; @mtype Normal]]
                ["DisMountActor"] = function(self, objid) end, --[[@service Player.DisMountActor; @mtype Normal]]
                ["DropActor"] = function(self, objid, dir, isThrow, speed, hasInertance) end, --[[@service Player.DropActor; @mtype Normal]]
                ["EmitByShooter"] = function(self, objid, emitid) end, --[[@service Player.EmitByShooter; @mtype Normal]]
                ["EmitByShooterTarget"] = function(self, objidA, emitid, objidB) end, --[[@service Player.EmitByShooterTarget; @mtype Normal]]
                ["EmitByShooterTargetPos"] = function(self, objid, emitid, targetPos) end, --[[@service Player.EmitByShooterTargetPos; @mtype Normal]]
                ["EnableUpdateRun"] = function(self, uin, enable) end, --[[@service Player.EnableUpdateRun; @mtype Sync]]
                ["EnterGunState"] = function(self, objid, state) end, --[[@service Player.EnterGunState; @mtype SyncPack]]
                ["EscapePickup"] = function(self, objid) end, --[[@service Player.EscapePickup; @mtype Normal]]
                ["FindLevelNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Player.FindLevelNearestBlock; @mtype Normal]]
                ["FindLevelRandomsortBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Player.FindLevelRandomsortBlock; @mtype Normal]]
                ["FindNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Player.FindNearestBlock; @mtype Normal]]
                ["FinishMapShopOrder"] = function(self, ishost, uin, orderid) end, --[[@service Player.FinishMapShopOrder; @mtype HostAndClient]]
                ["ForceOpenBoxUI"] = function(self, objid, itemid) end, --[[@service Player.ForceOpenBoxUI; @mtype Normal]]
                ["GainItems"] = function(self, objid, itemid, num, prioritytype) end, --[[@service Player.GainItems; @mtype Normal]]
                ["GenMapShopBaseInfo"] = function(self, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end, --[[@service Player.GenMapShopBaseInfo; @mtype Normal]]
                ["GetActionAttrState"] = function(self, objid, actionattr) end, --[[@service Player.GetActionAttrState; @mtype Normal]]
                ["GetActorDir"] = function(self, objid, itype) end, --[[@service Player.GetActorDir; @mtype Normal]]
                ["GetActorFacade"] = function(self, objid, bhasequip) end, --[[@service Player.GetActorFacade; @mtype Normal]]
                ["GetActorMovementMode"] = function(self, objid) end, --[[@service Player.GetActorMovementMode; @mtype Normal]]
                ["GetActorPermissions"] = function(self, objid, ability) end, --[[@service Player.GetActorPermissions; @mtype Normal]]
                ["GetAimDir"] = function(self, objid) end, --[[@service Player.GetAimDir; @mtype Normal]]
                ["GetAimPos"] = function(self, objid) end, --[[@service Player.GetAimPos; @mtype Normal]]
                ["GetAttr"] = function(self, objid, attrtype) end, --[[@service Player.GetAttr; @mtype Normal]]
                ["GetBlockAtlasInfo"] = function(self, reportid, playerid, islock) end, --[[@service Player.GetBlockAtlasInfo; @mtype ClientData; @rtype WhiteList="LuaApi3_Player_GetBlockAtlasInfo"]]
                ["GetBodySize"] = function(self, objid, bodySizeType) end, --[[@service Player.GetBodySize; @mtype Normal]]
                ["GetBoundSzie"] = function(self, objid) end, --[[@service Player.GetBoundSzie; @mtype Normal]]
                ["GetBtreeVarValue"] = function(self, objid, varid) end, --[[@service Player.GetBtreeVarValue; @mtype Normal]]
                ["GetBuyItemRecoder"] = function(self, call_back, uin, itemids) end, --[[@service Player.GetBuyItemRecoder; @mtype Block]]
                ["GetCameraRot"] = function(self, playerid) end, --[[@service Player.GetCameraRot; @mtype Normal]]
                ["GetChargingMaxNum"] = function(self, objid, slot) end, --[[@service Player.GetChargingMaxNum; @mtype Normal]]
                ["GetChargingMaxTime"] = function(self, objid, slot) end, --[[@service Player.GetChargingMaxTime; @mtype Normal]]
                ["GetChargingNum"] = function(self, objid, slot) end, --[[@service Player.GetChargingNum; @mtype Normal]]
                ["GetChargingTime"] = function(self, objid, slot) end, --[[@service Player.GetChargingTime; @mtype Normal]]
                ["GetClientInfo"] = function(self, reportid, uin) end, --[[@service Player.GetClientInfo; @mtype ClientData]]
                ["GetCmpBaseState"] = function(self, objid, actionattr) end, --[[@service Player.GetCmpBaseState; @mtype Normal]]
                ["GetCurMapId"] = function(self, objid) end, --[[@service Player.GetCurMapId; @mtype Normal]]
                ["GetCurShotcut"] = function(self, objid) end, --[[@service Player.GetCurShotcut; @mtype Normal]]
                ["GetCurToolID"] = function(self, objid) end, --[[@service Player.GetCurToolID; @mtype Normal]]
                ["GetCurrMapId"] = function(self, objid) end, --[[@service Player.GetCurrMapId; @mtype Normal]]
                ["GetDefID"] = function(self, objid) end, --[[@service Player.GetDefID; @mtype Normal]]
                ["GetDirtyObjectiveTaskInfo"] = function(self, uin) end, --[[@service Player.GetDirtyObjectiveTaskInfo; @mtype Normal]]
                ["GetDirtyObjectiveTaskUins"] = function(self) end, --[[@service Player.GetDirtyObjectiveTaskUins; @mtype Normal]]
                ["GetDirtyTaskInfo"] = function(self, uin) end, --[[@service Player.GetDirtyTaskInfo; @mtype Normal]]
                ["GetDirtyTaskUins"] = function(self) end, --[[@service Player.GetDirtyTaskUins; @mtype Normal]]
                ["GetDropItemInstanceId"] = function(self, objid) end, --[[@service Player.GetDropItemInstanceId; @mtype Normal]]
                ["GetDropItemNum"] = function(self, objid) end, --[[@service Player.GetDropItemNum; @mtype Normal]]
                ["GetEntityFacade"] = function(self, prefab) end, --[[@service Player.GetEntityFacade; @mtype Normal]]
                ["GetEyeHeight"] = function(self, objid) end, --[[@service Player.GetEyeHeight; @mtype Normal]]
                ["GetFaceDirection"] = function(self, objid) end, --[[@service Player.GetFaceDirection; @mtype Normal]]
                ["GetFacePitch"] = function(self, objid) end, --[[@service Player.GetFacePitch; @mtype Normal]]
                ["GetFaceYaw"] = function(self, objid) end, --[[@service Player.GetFaceYaw; @mtype Normal]]
                ["GetFirstInviter"] = function(self, call_back, objid) end, --[[@service Player.GetFirstInviter; @mtype Block]]
                ["GetFoodLevel"] = function(self, objid) end, --[[@service Player.GetFoodLevel; @mtype Normal]]
                ["GetFriendList"] = function(self, reportid, uin, index, size) end, --[[@service Player.GetFriendList; @mtype ClientData; @rtype Uin_TimeLimit=(10,"调用频繁，请稍后尝试！")]]
                ["GetGameResults"] = function(self, objid) end, --[[@service Player.GetGameResults; @mtype Normal]]
                ["GetGameScore"] = function(self, objid) end, --[[@service Player.GetGameScore; @mtype Normal]]
                ["GetGunDamageType"] = function(self, objid) end, --[[@service Player.GetGunDamageType; @mtype Normal]]
                ["GetGunInfo"] = function(self, objid) end, --[[@service Player.GetGunInfo; @mtype Normal]]
                ["GetHorseRealID"] = function(self, reportid, playerid, horseid) end, --[[@service Player.GetHorseRealID; @mtype ClientData; @rtype WhiteList="LuaApi3_Player_GetHorseRealID"]]
                ["GetHostUin"] = function(self) end, --[[@service Player.GetHostUin; @mtype Normal]]
                ["GetItemId"] = function(self, objid) end, --[[@service Player.GetItemId; @mtype Normal]]
                ["GetLastFallSpeed"] = function(self, objid) end, --[[@service Player.GetLastFallSpeed; @mtype Normal]]
                ["GetLevelMode"] = function(self) end, --[[@service Player.GetLevelMode; @mtype Normal]]
                ["GetMainModel"] = function(self, facade) end, --[[@service Player.GetMainModel; @mtype Normal]]
                ["GetMainPlayerUin"] = function(self) end, --[[@service Player.GetMainPlayerUin; @mtype Normal]]
                ["GetMallModel"] = function(self, reportid, objid) end, --[[@service Player.GetMallModel; @mtype ClientData]]
                ["GetMapShopAllNoFinishOrder"] = function(self, uin, call_back) end, --[[@service Player.GetMapShopAllNoFinishOrder; @mtype Block]]
                ["GetMaxHP"] = function(self, objid) end, --[[@service Player.GetMaxHP; @mtype Normal]]
                ["GetMiniCurrency"] = function(self, reportid, objid, itype) end, --[[@service Player.GetMiniCurrency; @mtype ClientData]]
                ["GetMiniVipLevel"] = function(self, reportid, playerid) end, --[[@service Player.GetMiniVipLevel; @mtype ClientData]]
                ["GetMotion"] = function(self, objid) end, --[[@service Player.GetMotion; @mtype Normal]]
                ["GetNickName"] = function(self, objid) end, --[[@service Player.GetNickName; @mtype Normal]]
                ["GetNickname"] = function(self, objid) end, --[[@service Player.GetNickname; @mtype Normal]]
                ["GetObjType"] = function(self, objid) end, --[[@service Player.GetObjType; @mtype Normal]]
                ["GetObjWorldId"] = function(self, objid) end, --[[@service Player.GetObjWorldId; @mtype Normal]]
                ["GetOrientation"] = function(self, objid) end, --[[@service Player.GetOrientation; @mtype Normal]]
                ["GetOverlayGravity"] = function(self, objid) end, --[[@service Player.GetOverlayGravity; @mtype Normal]]
                ["GetPersonInfo"] = function(self, reportid, uin) end, --[[@service Player.GetPersonInfo; @mtype ClientData; @rtype Uin_TimeLimit=(5,"调用频繁，请稍后尝试！"); @rtype WhiteList="LuaApi3_Player_GetPersonInfo"]]
                ["GetPickupObjID"] = function(self, objid, roleType) end, --[[@service Player.GetPickupObjID; @mtype Normal]]
                ["GetPlayerCostStatic"] = function(self, call_back, playerid, tbegin, tend, costtype) end, --[[@service Player.GetPlayerCostStatic; @mtype Block; @rtype Uin_TimeLimit=(5,"")]]
                ["GetPosition"] = function(self, objid) end, --[[@service Player.GetPosition; @mtype Normal]]
                ["GetRayOriginPos"] = function(self, objid) end, --[[@service Player.GetRayOriginPos; @mtype Normal]]
                ["GetRentCloudServerOwner"] = function(self) end, --[[@service Player.GetRentCloudServerOwner; @mtype Normal]]
                ["GetRevivePoint"] = function(self, uin, worldId) end, --[[@service Player.GetRevivePoint; @mtype Normal]]
                ["GetRidingActorObjId"] = function(self, objid) end, --[[@service Player.GetRidingActorObjId; @mtype Normal]]
                ["GetScreenSpacePos"] = function(self, reportid, playerid, x, y, z) end, --[[@service Player.GetScreenSpacePos; @mtype ClientData]]
                ["GetScreenSpacePosV2"] = function(self, reportid, playerid, x, y, z) end, --[[@service Player.GetScreenSpacePosV2; @mtype ClientData]]
                ["GetSettingAbility"] = function(self, playerid, itype) end, --[[@service Player.GetSettingAbility; @mtype Normal]]
                ["GetShotcutIndex"] = function(self, objid) end, --[[@service Player.GetShotcutIndex; @mtype Normal]]
                ["GetSkillCD"] = function(self, objid, itemid) end, --[[@service Player.GetSkillCD; @mtype Normal]]
                ["GetSkillCurCD"] = function(self, objid, itemid, spellID) end, --[[@service Player.GetSkillCurCD; @mtype Normal]]
                ["GetSkillMaxCD"] = function(self, objid, slot) end, --[[@service Player.GetSkillMaxCD; @mtype Normal]]
                ["GetSkinIDByHorseID"] = function(self, horseid) end, --[[@service Player.GetSkinIDByHorseID; @mtype Normal]]
                ["GetSkinModelId"] = function(self, uin) end, --[[@service Player.GetSkinModelId; @mtype Normal]]
                ["GetSkinSeatInfos"] = function(self, reportid, uin, index, size) end, --[[@service Player.GetSkinSeatInfos; @mtype ClientData; @rtype WhiteList="LuaApi3_Player_GetSkinSeatInfos"]]
                ["GetSkinlist"] = function(self, call_back, uin, itype) end, --[[@service Player.GetSkinlist; @mtype Block; @rtype WhiteList="LuaApi3_Player_GetSkinlist"]]
                ["GetTags"] = function(self, objid) end, --[[@service Player.GetTags; @mtype Normal]]
                ["GetTeam"] = function(self, objid) end, --[[@service Player.GetTeam; @mtype Normal]]
                ["GetTriggerOperateDisable"] = function(self, uin, attr) end, --[[@service Player.GetTriggerOperateDisable; @mtype Normal]]
                ["GetViewMode"] = function(self, reportid, uin) end, --[[@service Player.GetViewMode; @mtype ClientData]]
                ["GetVisibleRange"] = function(self, reportid, objid) end, --[[@service Player.GetVisibleRange; @mtype ClientData; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["GetWorldMapId"] = function(self, uin) end, --[[@service Player.GetWorldMapId; @mtype Normal]]
                ["GunEnableAds"] = function(self, uin, b) end, --[[@service Player.GunEnableAds; @mtype Normal]]
                ["GunEnableHittedShake"] = function(self, uin, b) end, --[[@service Player.GunEnableHittedShake; @mtype Normal]]
                ["GunGetMagazine"] = function(self, uin) end, --[[@service Player.GunGetMagazine; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["HasActor"] = function(self, objid) end, --[[@service Player.HasActor; @mtype Normal]]
                ["HasFriend"] = function(self, reportid, playerid, friendid) end, --[[@service Player.HasFriend; @mtype ClientData]]
                ["HasHandheldGun"] = function(self, objid) end, --[[@service Player.HasHandheldGun; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["HasTags"] = function(self, objid, tags, mathcmode, bexactmatch) end, --[[@service Player.HasTags; @mtype Normal]]
                ["HideUIView"] = function(self, objid, uiname, effectid, time) end, --[[@service Player.HideUIView; @mtype Normal]]
                ["IncreasesAttr"] = function(self, objid, atttype, val) end, --[[@service Player.IncreasesAttr; @mtype Normal]]
                ["InitTriggerGlobalData"] = function(self) end, --[[@service Player.InitTriggerGlobalData; @mtype Normal]]
                ["IsEquipByResID"] = function(self, objid, itemid) end, --[[@service Player.IsEquipByResID; @mtype Normal]]
                ["IsExist"] = function(self, objid) end, --[[@service Player.IsExist; @mtype Normal]]
                ["IsHandWeaponSpellEnhancementActive"] = function(self, uin, enhanceIndex) end, --[[@service Player.IsHandWeaponSpellEnhancementActive; @mtype Normal]]
                ["IsHaveSkill"] = function(self, objid, slot) end, --[[@service Player.IsHaveSkill; @mtype Normal]]
                ["IsMainPlayer"] = function(self, objid) end, --[[@service Player.IsMainPlayer; @mtype Normal]]
                ["IsMob"] = function(self, objid) end, --[[@service Player.IsMob; @mtype Normal]]
                ["IsPlayer"] = function(self, objid) end, --[[@service Player.IsPlayer; @mtype Normal]]
                ["ItemSkillCDDone"] = function(self, objid, itemid) end, --[[@service Player.ItemSkillCDDone; @mtype Normal]]
                ["ItemSkillCDEnter"] = function(self, objid, itemid, cd) end, --[[@service Player.ItemSkillCDEnter; @mtype Normal]]
                ["Jump"] = function(self, objid) end, --[[@service Player.Jump; @mtype Normal]]
                ["KillSelf"] = function(self, objid) end, --[[@service Player.KillSelf; @mtype Normal]]
                ["LevelGunState"] = function(self, objid, state) end, --[[@service Player.LevelGunState; @mtype SyncPack]]
                ["LoadObjectiveTaskInfoByCloudVar"] = function(self, uin, jsonstr) end, --[[@service Player.LoadObjectiveTaskInfoByCloudVar; @mtype Normal]]
                ["LoadTaskInfoByCloudVar"] = function(self, uin, jsonstr) end, --[[@service Player.LoadTaskInfoByCloudVar; @mtype Normal]]
                ["MountActor"] = function(self, playerid, objid, bctrl) end, --[[@service Player.MountActor; @mtype Normal]]
                ["NotifyGameInfo2Self"] = function(self, objid, info) end, --[[@service Player.NotifyGameInfo2Self; @mtype Normal]]
                ["NotifySystemMsg2Self"] = function(self, objid, info) end, --[[@service Player.NotifySystemMsg2Self; @mtype Normal]]
                ["OnCurToolUsed"] = function(self, objid, num) end, --[[@service Player.OnCurToolUsed; @mtype Normal]]
                ["OpenActView"] = function(self, uin, actid, activatename, ...) end, --[[@service Player.OpenActView; @mtype Sync; @rtype WhiteList="trigger_api_MiraclesEventsPage"]]
                ["OpenBoxByPos"] = function(self, objid, x, y, z) end, --[[@service Player.OpenBoxByPos; @mtype Normal]]
                ["OpenDevGoodsBuyDetailedDialog"] = function(self, ishost, objid, devGoodsId) end, --[[@service Player.OpenDevGoodsBuyDetailedDialog; @mtype HostAndClient]]
                ["OpenDevGoodsBuyDialog"] = function(self, ishost, objid, devGoodsId, customDesc) end, --[[@service Player.OpenDevGoodsBuyDialog; @mtype HostAndClient]]
                ["OpenDevGoodsPage"] = function(self, playerid, pagetype, pagetitle) end, --[[@service Player.OpenDevGoodsPage; @mtype SyncPack]]
                ["OpenDevStore"] = function(self, objid) end, --[[@service Player.OpenDevStore; @mtype SyncPack]]
                ["OpenDevStoreTab"] = function(self, objid, page, name) end, --[[@service Player.OpenDevStoreTab; @mtype SyncPack]]
                ["OpenEquipFrame"] = function(self, uin, openType, level, mcoin, extraItemOdds, consumeOdds) end, --[[@service Player.OpenEquipFrame; @mtype Sync]]
                ["OpenFriendChatPage"] = function(self, playerid, uin2) end, --[[@service Player.OpenFriendChatPage; @mtype Sync; @rtype WhiteList="trigger_api_SendGiftsToFriends"]]
                ["OpenGunUpgradeFrame"] = function(self, uin) end, --[[@service Player.OpenGunUpgradeFrame; @mtype Sync]]
                ["OpenInnerItemTips"] = function(self, objid, content) end, --[[@service Player.OpenInnerItemTips; @mtype Sync]]
                ["OpenInnerView"] = function(self, ishost, uin, iview, bopen, data) end, --[[@service Player.OpenInnerView; @mtype HostAndClient]]
                ["OpenMiniShopItemPage"] = function(self, playerid, itype, itemid) end, --[[@service Player.OpenMiniShopItemPage; @mtype SyncPack; @rtype WhiteList="LuaApi3_Player_OpenMiniShopItemPage"]]
                ["OpenMiniShopPage"] = function(self, playerid, itype, itype2, itemid) end, --[[@service Player.OpenMiniShopPage; @mtype SyncPack; @rtype WhiteList="LuaApi3_Player_OpenMiniShopPage"]]
                ["OpenMiniShopWarehousePage"] = function(self, playerid, itype, itype2, itemid) end, --[[@service Player.OpenMiniShopWarehousePage; @mtype SyncPack; @rtype WhiteList="LuaApi3_Player_OpenMiniShopWarehousePage"]]
                ["OpenShopGiveGiftView"] = function(self, playerid, giveuin) end, --[[@service Player.OpenShopGiveGiftView; @mtype Sync; @rtype WhiteList="trigger_api_SendGiftsToFriends"]]
                ["OpenShopMiniCoinView"] = function(self, uin) end, --[[@service Player.OpenShopMiniCoinView; @mtype Sync]]
                ["OpenShopSkinBuyDialog"] = function(self, playerid, skins) end, --[[@service Player.OpenShopSkinBuyDialog; @mtype Sync; @rtype WhiteList="trigger_api_SkinTrialShop"]]
                ["OpenShopTryOnView"] = function(self, playerid) end, --[[@service Player.OpenShopTryOnView; @mtype Sync; @rtype WhiteList="trigger_api_SkinTrialShop"]]
                ["OpenSummerActView"] = function(self, ...) end, --[[@service Player.OpenSummerActView; @mtype Normal]]
                ["OpenTaskMainUI"] = function(self, uin) end, --[[@service Player.OpenTaskMainUI; @mtype Sync]]
                ["OpenTaskTraceUI"] = function(self, uin) end, --[[@service Player.OpenTaskTraceUI; @mtype Sync]]
                ["OpenUIView"] = function(self, objid, uiname, effectid, time) end, --[[@service Player.OpenUIView; @mtype Normal]]
                ["OrganizeFacadeList"] = function(self) end, --[[@service Player.OrganizeFacadeList; @mtype Normal]]
                ["PauseMusic"] = function(self, objid, musicId, pause) end, --[[@service Player.PauseMusic; @mtype Normal]]
                ["PauseSoundEffectById"] = function(self, objid, soundId, pause) end, --[[@service Player.PauseSoundEffectById; @mtype Normal]]
                ["PayMapShopOrder"] = function(self, ishost, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end, --[[@service Player.PayMapShopOrder; @mtype HostAndClient]]
                ["PickupActor"] = function(self, objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end, --[[@service Player.PickupActor; @mtype Normal]]
                ["PickupItem"] = function(self, objid, itemobjid, bforcepickup) end, --[[@service Player.PickupItem; @mtype Normal]]
                ["PlayAct"] = function(self, objid, actid) end, --[[@service Player.PlayAct; @mtype Normal]]
                ["PlayActInHand"] = function(self, playerid, animid, playmode) end, --[[@service Player.PlayActInHand; @mtype Normal]]
                ["PlayAdvertising"] = function(self, objid, adname) end, --[[@service Player.PlayAdvertising; @mtype Normal; @rtype Uin_TimeLimit=(90,"调用频繁，请稍后尝试！")]]
                ["PlayAdvertisingCallback"] = function(self, objid, adname, callback) end, --[[@service Player.PlayAdvertisingCallback; @mtype Normal]]
                ["PlayAdvertising_OnClient"] = function(self, reportid, objid, adname) end, --[[@service Player.PlayAdvertising_OnClient; @mtype ClientData]]
                ["PlayAnim"] = function(self, objid, animid, speed, loop) end, --[[@service Player.PlayAnim; @mtype Normal]]
                ["PlayAnimById"] = function(self, playerid, id) end, --[[@service Player.PlayAnimById; @mtype Normal]]
                ["PlayAnimByObj"] = function(self, objidA, objidB, breplay) end, --[[@service Player.PlayAnimByObj; @mtype Normal]]
                ["PlayBodyEffect"] = function(self, objid, itype) end, --[[@service Player.PlayBodyEffect; @mtype Normal]]
                ["PlayBodyEffectByFile"] = function(self, objid, filename, sync) end, --[[@service Player.PlayBodyEffectByFile; @mtype Normal]]
                ["PlayBodyEffectById"] = function(self, objid, particleId, scale, ptme) end, --[[@service Player.PlayBodyEffectById; @mtype Normal]]
                ["PlayBodyParticleById"] = function(self, objid, particleId, ptme, offset, rot, scale) end, --[[@service Player.PlayBodyParticleById; @mtype Normal]]
                ["PlayHandAnim"] = function(self, uin, animid, speed, playmode, crassfade) end, --[[@service Player.PlayHandAnim; @mtype Sync]]
                ["PlayHandToolAnim"] = function(self, uin, animid, speed, playmode, crassfade) end, --[[@service Player.PlayHandToolAnim; @mtype Sync]]
                ["PlayMusic"] = function(self, objid, musicId, volume, pitch, isLoop) end, --[[@service Player.PlayMusic; @mtype Normal]]
                ["PlaySkill"] = function(self, objid, slot) end, --[[@service Player.PlaySkill; @mtype Normal]]
                ["PlaySoundByName"] = function(self, objid, name, volume, pitch, flag) end, --[[@service Player.PlaySoundByName; @mtype Normal]]
                ["PlaySoundEffectById"] = function(self, objid, soundId, volume, pitch, isLoop) end, --[[@service Player.PlaySoundEffectById; @mtype Normal]]
                ["PlayerHurt"] = function(self, objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end, --[[@service Player.PlayerHurt; @mtype Normal]]
                ["RandomFacadeID"] = function(self) end, --[[@service Player.RandomFacadeID; @mtype Normal]]
                ["RecoverinitialModel"] = function(self, ishost, objid) end, --[[@service Player.RecoverinitialModel; @mtype Normal]]
                ["RefreshItemTips"] = function(self, uin, itemData) end, --[[@service Player.RefreshItemTips; @mtype Sync]]
                ["RemoveBackpackItem"] = function(self, objid, itemid, num) end, --[[@service Player.RemoveBackpackItem; @mtype Normal]]
                ["RemovePlayer"] = function(self, objid) end, --[[@service Player.RemovePlayer; @mtype Normal]]
                ["RemoveTags"] = function(self, objid, tags, icount) end, --[[@service Player.RemoveTags; @mtype Normal]]
                ["RequestCostCoin"] = function(self, reportid, uin, conid, num, orderid) end, --[[@service Player.RequestCostCoin; @mtype ClientData; @rtype Uin_TimeLimit=(3,"")]]
                ["RequestExchangeCoins"] = function(self, uin, conid, num, index) end, --[[@service Player.RequestExchangeCoins; @mtype Sync]]
                ["ResetCameraAttr"] = function(self, playerid) end, --[[@service Player.ResetCameraAttr; @mtype Normal]]
                ["ResetTriggerGlobalData"] = function(self) end, --[[@service Player.ResetTriggerGlobalData; @mtype Normal]]
                ["ReviveToPos"] = function(self, objid, x, y, z, worldId) end, --[[@service Player.ReviveToPos; @mtype Normal]]
                ["RotateCamera"] = function(self, objid, yaw, pitch, issmooth, iscorrectyaw, deltayaw, deltapitch) end, --[[@service Player.RotateCamera; @mtype Sync]]
                ["RotateCameraToActor"] = function(self, objid, targetid) end, --[[@service Player.RotateCameraToActor; @mtype Normal]]
                ["RotateFaceToActor"] = function(self, objid, targetid) end, --[[@service Player.RotateFaceToActor; @mtype Normal]]
                ["RotateMainModel"] = function(self, uin, yaw, pitch, bSmooth) end, --[[@service Player.RotateMainModel; @mtype SyncPack]]
                ["SendFriendApply"] = function(self, playerid, uin2) end, --[[@service Player.SendFriendApply; @mtype Sync; @rtype Uin_TimeLimit=(10,"")]]
                ["SetAblePick"] = function(self, objid, able) end, --[[@service Player.SetAblePick; @mtype Normal]]
                ["SetActionAttrState"] = function(self, objid, actionattr, switch) end, --[[@service Player.SetActionAttrState; @mtype Normal]]
                ["SetActorControl"] = function(self, objid, b) end, --[[@service Player.SetActorControl; @mtype Normal]]
                ["SetActorDir"] = function(self, objid, itype, value) end, --[[@service Player.SetActorDir; @mtype Normal]]
                ["SetActorPermissions"] = function(self, objid, ability, switch) end, --[[@service Player.SetActorPermissions; @mtype Normal]]
                ["SetAttr"] = function(self, objid, attrtype, val) end, --[[@service Player.SetAttr; @mtype Normal]]
                ["SetBeHurtTarget"] = function(self, objid, targetid) end, --[[@service Player.SetBeHurtTarget; @mtype Normal]]
                ["SetBehitDisable"] = function(self, objid, value) end, --[[@service Player.SetBehitDisable; @mtype Normal]]
                ["SetBodyEffectScale"] = function(self, objid, particleId, scale) end, --[[@service Player.SetBodyEffectScale; @mtype Normal]]
                ["SetBodyEffectScaleByFile"] = function(self, objid, filename, scale) end, --[[@service Player.SetBodyEffectScaleByFile; @mtype Normal]]
                ["SetBodyParticleTransform"] = function(self, objid, particleId, offset, rot, scale) end, --[[@service Player.SetBodyParticleTransform; @mtype Normal]]
                ["SetBtreeVarValue"] = function(self, objid, varid, val) end, --[[@service Player.SetBtreeVarValue; @mtype Normal]]
                ["SetCameraAttrState"] = function(self, playerid, attr, enable) end, --[[@service Player.SetCameraAttrState; @mtype Normal]]
                ["SetCameraFovTransformBy"] = function(self, playerid, fov, animid, time) end, --[[@service Player.SetCameraFovTransformBy; @mtype Normal]]
                ["SetCameraFovTransformTo"] = function(self, playerid, fov, animid, time) end, --[[@service Player.SetCameraFovTransformTo; @mtype Normal]]
                ["SetCameraLerpSpeed"] = function(self, playerid, lerpspeed) end, --[[@service Player.SetCameraLerpSpeed; @mtype Sync]]
                ["SetCameraMountObj"] = function(self, playerid, objid) end, --[[@service Player.SetCameraMountObj; @mtype Normal]]
                ["SetCameraMountPos"] = function(self, playerid, pos) end, --[[@service Player.SetCameraMountPos; @mtype Normal]]
                ["SetCameraPosTransformBy"] = function(self, playerid, vec, animid, time) end, --[[@service Player.SetCameraPosTransformBy; @mtype Normal]]
                ["SetCameraPosTransformTo"] = function(self, playerid, vec, animid, time) end, --[[@service Player.SetCameraPosTransformTo; @mtype Normal]]
                ["SetCameraRotMode"] = function(self, playerid, attr) end, --[[@service Player.SetCameraRotMode; @mtype Normal]]
                ["SetCameraRotTransformBy"] = function(self, playerid, vec, animid, time) end, --[[@service Player.SetCameraRotTransformBy; @mtype Normal]]
                ["SetCameraRotTransformTo"] = function(self, playerid, vec, animid, time) end, --[[@service Player.SetCameraRotTransformTo; @mtype Normal]]
                ["SetCameraShake"] = function(self, objid, shake) end, --[[@service Player.SetCameraShake; @mtype SyncPack; @rtype WhiteList="LuaApi3_Player_SetCameraShake"]]
                ["SetCanCollide"] = function(self, objid, value) end, --[[@service Player.SetCanCollide; @mtype Normal]]
                ["SetCanThrow"] = function(self, ishost, playerid, bThrow) end, --[[@service Player.SetCanThrow; @mtype HostAndClient]]
                ["SetCharging"] = function(self, objid, slot, ischarging) end, --[[@service Player.SetCharging; @mtype Normal]]
                ["SetChargingValue"] = function(self, objid, slot, value) end, --[[@service Player.SetChargingValue; @mtype Normal]]
                ["SetCharginginfo"] = function(self, objid, slot, max, num, maxnum, isauto) end, --[[@service Player.SetCharginginfo; @mtype Normal]]
                ["SetCmpBaseState"] = function(self, objid, actionattr, switch) end, --[[@service Player.SetCmpBaseState; @mtype Normal]]
                ["SetCrawl"] = function(self, ishost, playerid, bCrawl) end, --[[@service Player.SetCrawl; @mtype HostAndClient; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["SetCustomRevieInfo"] = function(self, uin, curnum, url, name, rsetdesc) end, --[[@service Player.SetCustomRevieInfo; @mtype Sync]]
                ["SetDeathFrameVisible"] = function(self, uin, visible) end, --[[@service Player.SetDeathFrameVisible; @mtype Sync]]
                ["SetFaceDirection"] = function(self, objid, x, y, z) end, --[[@service Player.SetFaceDirection; @mtype Normal]]
                ["SetFacePitch"] = function(self, objid, pitch) end, --[[@service Player.SetFacePitch; @mtype Normal]]
                ["SetFaceYaw"] = function(self, objid, yaw) end, --[[@service Player.SetFaceYaw; @mtype Normal]]
                ["SetFirstSearch"] = function(self, objid, firstsearch) end, --[[@service Player.SetFirstSearch; @mtype Normal]]
                ["SetFishLineEndPoint"] = function(self, uin, x, y, z) end, --[[@service Player.SetFishLineEndPoint; @mtype Sync]]
                ["SetFoodLevel"] = function(self, objid, foodLevel) end, --[[@service Player.SetFoodLevel; @mtype Normal]]
                ["SetGameResults"] = function(self, objid, result) end, --[[@service Player.SetGameResults; @mtype Normal]]
                ["SetGameScore"] = function(self, objid, score) end, --[[@service Player.SetGameScore; @mtype Normal]]
                ["SetGameWin"] = function(self, objid) end, --[[@service Player.SetGameWin; @mtype Normal]]
                ["SetGunActionState"] = function(self, objid, action, switch) end, --[[@service Player.SetGunActionState; @mtype Normal]]
                ["SetHandOrToolAnimSpeed"] = function(self, uin, animtype, animid, speed) end, --[[@service Player.SetHandOrToolAnimSpeed; @mtype Sync]]
                ["SetImmuneType"] = function(self, objid, immunetype, isadd) end, --[[@service Player.SetImmuneType; @mtype Normal]]
                ["SetItemAttAction"] = function(self, objid, itemid, atttype, switch) end, --[[@service Player.SetItemAttAction; @mtype Normal]]
                ["SetMobileVibrate"] = function(self, playerid, time, amplitude) end, --[[@service Player.SetMobileVibrate; @mtype Normal]]
                ["SetModAttrib"] = function(self, objid, attrtype, value) end, --[[@service Player.SetModAttrib; @mtype Normal]]
                ["SetMotionChange"] = function(self, objid, x, y, z) end, --[[@service Player.SetMotionChange; @mtype Normal]]
                ["SetMountActorAttr"] = function(self, objid, isRote, isPlayerContrl, isCloseAI) end, --[[@service Player.SetMountActorAttr; @mtype Normal]]
                ["SetNickName"] = function(self, objid, nickname) end, --[[@service Player.SetNickName; @mtype Normal]]
                ["SetNoClip"] = function(self, ishost, uin, flag) end, --[[@service Player.SetNoClip; @mtype HostAndClient]]
                ["SetOrientation"] = function(self, objid, x, y, z) end, --[[@service Player.SetOrientation; @mtype Normal]]
                ["SetOverlayGravity"] = function(self, objid, val) end, --[[@service Player.SetOverlayGravity; @mtype Normal]]
                ["SetPolaroidViewVisible"] = function(self, playerid, bvisible, hidepto) end, --[[@service Player.SetPolaroidViewVisible; @mtype SyncPack]]
                ["SetPosition"] = function(self, objid, x, y, z) end, --[[@service Player.SetPosition; @mtype Normal]]
                ["SetRevivePoint"] = function(self, objid, x, y, z, worldId) end, --[[@service Player.SetRevivePoint; @mtype Normal]]
                ["SetRidePosition"] = function(self, objid, x, y, z) end, --[[@service Player.SetRidePosition; @mtype Normal]]
                ["SetScale"] = function(self, objid, x, y, z) end, --[[@service Player.SetScale; @mtype Normal]]
                ["SetSettingAbility"] = function(self, playerid, itype, enable) end, --[[@service Player.SetSettingAbility; @mtype SyncPack]]
                ["SetSettingEnable"] = function(self, playerid, itype, enable) end, --[[@service Player.SetSettingEnable; @mtype SyncPack]]
                ["SetShotcutIndex"] = function(self, objid, index) end, --[[@service Player.SetShotcutIndex; @mtype Sync]]
                ["SetSkillCD"] = function(self, ishost, objid, itemid, cd) end, --[[@service Player.SetSkillCD; @mtype HostAndClient]]
                ["SetSkillCDInfo"] = function(self, objid, slot, maxcd, isauto) end, --[[@service Player.SetSkillCDInfo; @mtype Normal]]
                ["SetTaskTraceVisible"] = function(self, uin, bOpen) end, --[[@service Player.SetTaskTraceVisible; @mtype Sync]]
                ["SetTeam"] = function(self, objid, teamid, resetAttr) end, --[[@service Player.SetTeam; @mtype Normal]]
                ["SetTriggerOperateDisable"] = function(self, ishost, uin, attr, disable) end, --[[@service Player.SetTriggerOperateDisable; @mtype HostAndClient]]
                ["SetVisibleRange"] = function(self, objid, range) end, --[[@service Player.SetVisibleRange; @mtype Sync; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["ShakeCamera"] = function(self, objid, duration, power) end, --[[@service Player.ShakeCamera; @mtype Normal]]
                ["ShowFishLine"] = function(self, uin, bShow) end, --[[@service Player.ShowFishLine; @mtype Sync]]
                ["ShowNickName"] = function(self, objid, bshow) end, --[[@service Player.ShowNickName; @mtype Normal]]
                ["SkillIsCharging"] = function(self, objid, slot) end, --[[@service Player.SkillIsCharging; @mtype Normal]]
                ["StandReportEvent"] = function(self, playerid, eventstr) end, --[[@service Player.StandReportEvent; @mtype Normal]]
                ["StopAllAnim"] = function(self, objid) end, --[[@service Player.StopAllAnim; @mtype Normal]]
                ["StopAnimById"] = function(self, playerid, id) end, --[[@service Player.StopAnimById; @mtype Normal]]
                ["StopBodyEffect"] = function(self, objid, itype) end, --[[@service Player.StopBodyEffect; @mtype Normal]]
                ["StopBodyEffectById"] = function(self, objid, particleId) end, --[[@service Player.StopBodyEffectById; @mtype Normal]]
                ["StopHandAnim"] = function(self, uin, animid) end, --[[@service Player.StopHandAnim; @mtype Sync]]
                ["StopHandToolAnim"] = function(self, uin, animid) end, --[[@service Player.StopHandToolAnim; @mtype Sync]]
                ["StopMusic"] = function(self, objid, musicId) end, --[[@service Player.StopMusic; @mtype Normal]]
                ["StopShakeCamera"] = function(self, objid) end, --[[@service Player.StopShakeCamera; @mtype Normal]]
                ["StopSoundEffectById"] = function(self, objid, soundId) end, --[[@service Player.StopSoundEffectById; @mtype Normal]]
                ["SyncTriggerData"] = function(self, ishost, playerid, customuievent) end, --[[@service Player.SyncTriggerData; @mtype HostAndClient]]
                ["TeleportHome"] = function(self, objid) end, --[[@service Player.TeleportHome; @mtype Normal]]
                ["TriggerAttrChangeEvent"] = function(self, objid, atttype, val) end, --[[@service Player.TriggerAttrChangeEvent; @mtype Normal]]
                ["TriggerSkillCall"] = function(self, objid, skillName, growPatchName) end, --[[@service Player.TriggerSkillCall; @mtype Normal]]
                ["TryMoveToActor"] = function(self, objid, targetObjid, speed) end, --[[@service Player.TryMoveToActor; @mtype Normal]]
                ["TryMoveToNoSearch"] = function(self, objid, x, y, z) end, --[[@service Player.TryMoveToNoSearch; @mtype Normal]]
                ["TryMoveToPos"] = function(self, objid, x, y, z, cancontrol, bshowtip) end, --[[@service Player.TryMoveToPos; @mtype Normal]]
                ["TryPickupActorForward"] = function(self, objid, distance) end, --[[@service Player.TryPickupActorForward; @mtype Normal]]
                ["UpdateMainTaskForMod"] = function(self, uin, _type, target1, target2, goalnum) end, --[[@service Player.UpdateMainTaskForMod; @mtype Normal]]
                ["UseItem"] = function(self, objid, itemid, status, onshift) end, --[[@service Player.UseItem; @mtype Normal]]
                ["WhitList_StopSkill"] = function(self, objid, skillid) end, --[[@service Player.WhitList_StopSkill; @mtype Normal]]
            },
            ["PlayerAttr"] = {
                ["AtkFirearm"] = 38,
                ["AtkMagic"] = 32,
                ["AtkMelee"] = 17,
                ["AtkPhysical"] = 31,
                ["AtkRemote"] = 18,
                ["AttackDis"] = 41,
                ["CurArmor"] = 35,
                ["CurHp"] = 2,
                ["CurHunger"] = 6,
                ["CurLevel"] = 27,
                ["CurLevelexp"] = 26,
                ["CurOxygen"] = 8,
                ["CurStrength"] = 28,
                ["DamagedZombie"] = 37,
                ["DefChaos"] = 24,
                ["DefMagic"] = 34,
                ["DefMelee"] = 19,
                ["DefPhysical"] = 33,
                ["DefRemote"] = 20,
                ["Dimension"] = 21,
                ["Dodge"] = 16,
                ["EnableAttack"] = 32,
                ["EnableBeAttacked"] = 64,
                ["EnableBeKilled"] = 128,
                ["EnableDeathDropItem"] = 512,
                ["EnableDestroyBlock"] = 8,
                ["EnableDiscardItem"] = 2048,
                ["EnableForbiFire"] = 2097152,
                ["EnableForbidDodgeAnim"] = 4194304,
                ["EnableMove"] = 1,
                ["EnableOperateBlock"] = 4,
                ["EnablePickup"] = 256,
                ["EnablePlaceBlock"] = 2,
                ["EnableUseItem"] = 16,
                ["EnableVehicleAutoForward"] = 1024,
                ["FlySpeed"] = 39,
                ["HpRecover"] = 3,
                ["ItemDisableDrop"] = 2,
                ["ItemDisableThrow"] = 1,
                ["JumpPower"] = 14,
                ["Level"] = 23,
                ["LifeNum"] = 4,
                ["MaxArmor"] = 36,
                ["MaxHp"] = 1,
                ["MaxHunger"] = 5,
                ["MaxOxygen"] = 7,
                ["MaxStrength"] = 29,
                ["PackSize"] = 25,
                ["RecoverOxygen"] = 9,
                ["RunSpeed"] = 11,
                ["Score"] = 22,
                ["SneakSpeed"] = 12,
                ["StrengthRecover"] = 30,
                ["SwinSpeed"] = 13,
                ["ViewDis"] = 40,
                ["WalkSpeed"] = 10,
                ["Weight"] = 15,
            },
            ["PlayerBodyUIHight"] = {
                ["EffEct"] = 3,
                ["HpBar"] = 4,
                ["Nick"] = 1,
                ["Title"] = 2,
            },
            ["PlayerController"] = {
                ["CrosshairType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["BODY_EYES"] = 1,
                    ["SCREEN_CENTER"] = 0,
                    ["__info"] = {
                        ["BODY_EYES"] = {
                            ["name"] = "人物面朝方向",
                            ["sort"] = 2,
                        },
                        ["SCREEN_CENTER"] = {
                            ["name"] = "屏幕中央准星",
                            ["sort"] = 1,
                        },
                    },
                },
                ["Mode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["FIXED_CAMERA"] = 1,
                    ["FOLLOWED_CAMERA"] = 0,
                    ["__info"] = {
                        ["FIXED_CAMERA"] = {
                            ["name"] = "自由模式",
                            ["sort"] = 2,
                        },
                        ["FOLLOWED_CAMERA"] = {
                            ["name"] = "跟随人物",
                            ["sort"] = 1,
                        },
                    },
                },
                ["MoveLimit"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["NO_LIMIT"] = 0,
                    ["ONLY_X"] = 1,
                    ["ONLY_XY"] = 3,
                    ["ONLY_Y"] = 2,
                    ["__info"] = {
                        ["NO_LIMIT"] = {
                            ["name"] = "全方向",
                            ["sort"] = 1,
                        },
                        ["ONLY_X"] = {
                            ["name"] = "仅左右",
                            ["sort"] = 2,
                        },
                        ["ONLY_XY"] = {
                            ["name"] = "仅上下左右",
                            ["sort"] = 4,
                        },
                        ["ONLY_Y"] = {
                            ["name"] = "仅上下",
                            ["sort"] = 3,
                        },
                    },
                },
                ["RoteLimit"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["NO_LIMIT"] = 0,
                    ["ONLY_X"] = 1,
                    ["ONLY_Y"] = 2,
                    ["__info"] = {
                        ["NO_LIMIT"] = {
                            ["name"] = "全方向",
                            ["sort"] = 1,
                        },
                        ["ONLY_X"] = {
                            ["name"] = "仅左右",
                            ["sort"] = 2,
                        },
                        ["ONLY_Y"] = {
                            ["name"] = "仅上下",
                            ["sort"] = 3,
                        },
                    },
                },
                ["ViewMove"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CAMERA_AND_BODY"] = 0,
                    ["NOTHING"] = 1,
                    ["ONLY_BODY"] = 2,
                    ["ONLY_CAMERA"] = 3,
                    ["__info"] = {
                        ["CAMERA_AND_BODY"] = {
                            ["name"] = "视角和人物均转",
                            ["sort"] = 1,
                        },
                        ["NOTHING"] = {
                            ["name"] = "视角和人物均不转",
                            ["sort"] = 2,
                        },
                        ["ONLY_BODY"] = {
                            ["name"] = "视角不转，人转",
                            ["sort"] = 3,
                        },
                        ["ONLY_CAMERA"] = {
                            ["name"] = "视角转，人不转",
                            ["sort"] = 4,
                        },
                    },
                },
                ["ViewType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ACRIONVIEW"] = 3,
                    ["BACKVIEW"] = 1,
                    ["CUSTOM_VIEW"] = 5,
                    ["FRONTVIEW"] = 2,
                    ["MAINVIEW"] = 0,
                    ["OVERLOOKVIEW"] = 4,
                    ["__info"] = {
                        ["ACRIONVIEW"] = {
                            ["name"] = "动作视角",
                            ["sort"] = 4,
                        },
                        ["BACKVIEW"] = {
                            ["name"] = "背视角",
                            ["sort"] = 2,
                        },
                        ["CUSTOM_VIEW"] = {
                            ["name"] = "自定义视角",
                            ["sort"] = 6,
                        },
                        ["FRONTVIEW"] = {
                            ["name"] = "正视角",
                            ["sort"] = 3,
                        },
                        ["MAINVIEW"] = {
                            ["name"] = "主视角",
                            ["sort"] = 1,
                        },
                        ["OVERLOOKVIEW"] = {
                            ["name"] = "俯视角",
                            ["sort"] = 5,
                        },
                    },
                },
                ["ZoomMode"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AUTO_ZOOM_NO"] = 0,
                    ["AUTO_ZOOM_NO_AND_XRAY"] = 2,
                    ["AUTO_ZOOM_YES"] = 1,
                    ["__info"] = {
                        ["AUTO_ZOOM_NO"] = {
                            ["name"] = "不缩进",
                            ["sort"] = 1,
                        },
                        ["AUTO_ZOOM_NO_AND_XRAY"] = {
                            ["name"] = "不缩进角色半透明",
                            ["sort"] = 3,
                        },
                        ["AUTO_ZOOM_YES"] = {
                            ["name"] = "碰到方块缩进",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["PlayerMotion"] = {
                ["Down"] = 1000002,
                ["Fall"] = 1000003,
                ["FallGround"] = 32,
                ["Jump"] = 4,
                ["JumpTwice"] = 8,
                ["Run"] = 2,
                ["Sneak"] = 16,
                ["Static"] = 0,
                ["Swim"] = 64,
                ["Turnback"] = 1000000,
                ["Up"] = 1000001,
                ["Walk"] = 1,
            },
            ["PlayerNameType"] = {
                ["EffEct"] = 3,
                ["Nick"] = 1,
                ["Title"] = 2,
            },
            ["PlayerRelations"] = {
                ["CollectMaps"] = 2,
                ["EvaluateMaps"] = 3,
                ["InviteFriend"] = 4,
            },
            ["ProgressImg"] = {
                ["Background"] = 1,
                ["Progress"] = 2,
            },
            ["ProgressVal"] = {
                ["CurAndMax"] = 4,
                ["Current"] = 3,
                ["Max"] = 2,
                ["Min"] = 1,
            },
            ["Projectile"] = {
                ["HitProcess"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Pass"] = 2,
                    ["Tie"] = 3,
                    ["Trigger"] = 1,
                    ["__info"] = {
                        ["Pass"] = {
                            ["name"] = "穿透",
                            ["sort"] = 2,
                        },
                        ["Tie"] = {
                            ["name"] = "插上去",
                            ["sort"] = 3,
                        },
                        ["Trigger"] = {
                            ["name"] = "触发",
                            ["sort"] = 1,
                        },
                    },
                },
                ["HitType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["CollisionBox"] = 2,
                    ["Ray"] = 1,
                    ["__info"] = {
                        ["CollisionBox"] = {
                            ["name"] = "碰撞盒",
                            ["sort"] = 2,
                        },
                        ["Ray"] = {
                            ["name"] = "射线",
                            ["sort"] = 1,
                        },
                    },
                },
                ["HurtType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Physics"] = 2,
                    ["__info"] = {
                        ["Physics"] = {
                            ["name"] = "物理",
                            ["sort"] = 2,
                        },
                    },
                },
                ["TrailType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AutoFollow"] = 2,
                    ["Physics"] = 1,
                    ["__info"] = {
                        ["AutoFollow"] = {
                            ["name"] = "自动跟随目标",
                            ["sort"] = 2,
                        },
                        ["Physics"] = {
                            ["name"] = "游戏物理",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["ProjectileEdit"] = {
                ["AccumulatorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Full"] = 1,
                    ["Noneed"] = 2,
                    ["Normal"] = 0,
                    ["__info"] = {
                        ["Full"] = {
                            ["name"] = "蓄满才能释放",
                            ["sort"] = 2,
                        },
                        ["Noneed"] = {
                            ["name"] = "无需蓄力",
                            ["sort"] = 3,
                        },
                        ["Normal"] = {
                            ["name"] = "普通蓄力",
                            ["sort"] = 1,
                        },
                    },
                },
                ["AttackType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Boom"] = 1,
                    ["Shoot"] = 0,
                    ["__info"] = {
                        ["Boom"] = {
                            ["name"] = "爆炸",
                            ["sort"] = 2,
                        },
                        ["Shoot"] = {
                            ["name"] = "点射",
                            ["sort"] = 1,
                        },
                    },
                },
                ["DamageType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Chaotic"] = 6,
                    ["Ele"] = 9,
                    ["Fire"] = 4,
                    ["Ice"] = 8,
                    ["Light"] = 7,
                    ["Physics"] = 1,
                    ["Poison"] = 5,
                    ["__info"] = {
                        ["Chaotic"] = {
                            ["name"] = "混乱伤害",
                            ["sort"] = 4,
                        },
                        ["Ele"] = {
                            ["name"] = "元素伤害",
                            ["sort"] = 7,
                        },
                        ["Fire"] = {
                            ["name"] = "燃烧伤害",
                            ["sort"] = 2,
                        },
                        ["Ice"] = {
                            ["name"] = "冰冻伤害",
                            ["sort"] = 6,
                        },
                        ["Light"] = {
                            ["name"] = "闪电伤害",
                            ["sort"] = 5,
                        },
                        ["Physics"] = {
                            ["name"] = "物理伤害",
                            ["sort"] = 1,
                        },
                        ["Poison"] = {
                            ["name"] = "毒素伤害",
                            ["sort"] = 3,
                        },
                    },
                },
                ["PhysicsMaterialType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["HighElasticity"] = 12,
                    ["NoElasticity"] = 13,
                    ["Rough"] = 14,
                    ["Smooth"] = 11,
                    ["__info"] = {
                        ["HighElasticity"] = {
                            ["name"] = "高弹性的（预设）",
                            ["sort"] = 2,
                        },
                        ["NoElasticity"] = {
                            ["name"] = "无弹性的（预设）",
                            ["sort"] = 3,
                        },
                        ["Rough"] = {
                            ["name"] = "粗糙的（预设）",
                            ["sort"] = 4,
                        },
                        ["Smooth"] = {
                            ["name"] = "光滑的（预设）",
                            ["sort"] = 1,
                        },
                    },
                },
                ["TriggerCondition"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Block"] = 2,
                    ["Mob"] = 1,
                    ["Mob_Block"] = 3,
                    ["No"] = 5,
                    ["Soon"] = 4,
                    ["__info"] = {
                        ["Block"] = {
                            ["name"] = "碰撞方块",
                            ["sort"] = 2,
                        },
                        ["Mob"] = {
                            ["name"] = "碰撞生物",
                            ["sort"] = 1,
                        },
                        ["Mob_Block"] = {
                            ["name"] = "生物和方块",
                            ["sort"] = 3,
                        },
                        ["No"] = {
                            ["name"] = "不触发",
                            ["sort"] = 5,
                        },
                        ["Soon"] = {
                            ["name"] = "出手就触发",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["RandomAddStatus"] = {
                ["triggerTimeEnumType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Limit"] = 0,
                    ["NoLimit"] = 1,
                    ["__info"] = {
                        ["Limit"] = {
                            ["name"] = "持续触发",
                            ["sort"] = 1,
                        },
                        ["NoLimit"] = {
                            ["name"] = "永久触发",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["RandomChestBlock"] = {
                ["ProduceType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Drop"] = 2,
                    ["InteractDrop"] = 3,
                    ["OpenChest"] = 1,
                    ["__info"] = {
                        ["Drop"] = {
                            ["name"] = "掉落产出",
                            ["sort"] = 2,
                        },
                        ["InteractDrop"] = {
                            ["name"] = "交互掉落",
                            ["sort"] = 3,
                        },
                        ["OpenChest"] = {
                            ["name"] = "打开宝箱",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["RayDetectType"] = {
                ["Actor"] = 3,
                ["ActorType"] = 4,
                ["Block"] = 1,
                ["LiquidBlock"] = 5,
                ["Player"] = 2,
            },
            ["RecoverStatus"] = {
                ["AttrType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "生命值",
                        },
                        ["second"] = {
                            ["name"] = "饥饿值",
                        },
                        ["third"] = {
                            ["name"] = "体力值",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                    ["third"] = 2,
                },
                ["ModifyType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "增加",
                        },
                        ["second"] = {
                            ["name"] = "减少",
                        },
                        ["third"] = {
                            ["name"] = "设置",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                    ["third"] = 2,
                },
            },
            ["RelativeCampType"] = {
                ["Any"] = 999,
                ["Enemy"] = 2,
                ["Friendly"] = 1,
                ["Neutral"] = 3,
            },
            ["Reproduction"] = {
                ["LayingEggType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AddBlock"] = 0,
                    ["DropItem"] = 1,
                    ["__info"] = {
                        ["AddBlock"] = {
                            ["name"] = "放置方块",
                            ["sort"] = 1,
                        },
                        ["DropItem"] = {
                            ["name"] = "掉落物",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ReproductionType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Oviparous"] = 1,
                    ["Viviparous"] = 0,
                    ["__info"] = {
                        ["Oviparous"] = {
                            ["name"] = "卵生",
                            ["sort"] = 2,
                        },
                        ["Viviparous"] = {
                            ["name"] = "胎生",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Ride"] = {
                ["RideMobType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Forever"] = 0,
                    ["__info"] = {
                        ["Forever"] = {
                            ["name"] = "永久坐骑",
                            ["sort"] = 1,
                        },
                    },
                },
                ["RidingConditionType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["None"] = 0,
                    ["UseItem"] = 1,
                    ["__info"] = {
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["UseItem"] = {
                            ["name"] = "对生物使用道具",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RidingHpType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["IndependentCalculation"] = 0,
                    ["OneHp"] = 1,
                    ["__info"] = {
                        ["IndependentCalculation"] = {
                            ["name"] = "独立计算血量",
                            ["sort"] = 1,
                        },
                        ["OneHp"] = {
                            ["name"] = "替角色承受伤害",
                            ["sort"] = 2,
                        },
                    },
                },
                ["RidingItemPermissionType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AbleItem"] = 2,
                    ["BanItem"] = 1,
                    ["None"] = 0,
                    ["__info"] = {
                        ["AbleItem"] = {
                            ["name"] = "仅允许指定道具",
                            ["sort"] = 3,
                        },
                        ["BanItem"] = {
                            ["name"] = "禁止指定道具",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "无限制",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Roadblock"] = {
                ["ColliderType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Air"] = 0,
                    ["Fluid"] = 2,
                    ["ObstructBullet"] = 4,
                    ["PassBullet"] = 3,
                    ["Solid"] = 1,
                    ["__info"] = {
                        ["Air"] = {
                            ["name"] = "0",
                        },
                        ["Fluid"] = {
                            ["name"] = "2",
                        },
                        ["ObstructBullet"] = {
                            ["name"] = "4",
                        },
                        ["PassBullet"] = {
                            ["name"] = "3",
                        },
                        ["Solid"] = {
                            ["name"] = "1",
                        },
                    },
                },
            },
            ["RoleAttr"] = {
                ["Amana"] = 47,
                ["AmanaMax"] = 48,
                ["Atk"] = 42,
                ["AttackDis"] = 37,
                ["AttackDis1"] = 40,
                ["CurHp"] = 2,
                ["CurHunger"] = 6,
                ["CurOxygen"] = 8,
                ["CurStrength"] = 28,
                ["FlySpeed"] = 36,
                ["FlySpeed1"] = 39,
                ["Gravity"] = 15,
                ["HpRecover"] = 3,
                ["JumpPower"] = 14,
                ["LevelExp"] = 26,
                ["LevelExp1"] = 46,
                ["MaxHp"] = 1,
                ["MaxHunger"] = 5,
                ["MaxOxygen"] = 7,
                ["MaxStrength"] = 29,
                ["PunchArmor"] = 19,
                ["PunchArmor1"] = 43,
                ["RangeArmor"] = 20,
                ["RangeArmor1"] = 44,
                ["RunSpeed"] = 11,
                ["StarNum"] = 23,
                ["StarNum1"] = 45,
                ["SwinSpeed"] = 13,
                ["ViewDis"] = 38,
                ["ViewDis1"] = 41,
                ["WalkSpeed"] = 10,
            },
            ["RoleMotion"] = {
                ["FallGround"] = 32,
                ["Jump"] = 4,
                ["Run"] = 2,
                ["Sneak"] = 16,
                ["Stand"] = 0,
                ["Swim"] = 64,
                ["Walk"] = 1,
            },
            ["RolePickupType"] = {
                ["Carried"] = 2,
                ["Carrying"] = 1,
            },
            ["SetDebugInfo"] = function(...) end, --[[@lua]]
            ["ShapeStitch"] = {
                ["ModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["SlopeBoard"] = 1,
                    ["VerticalBoard"] = 2,
                    ["__info"] = {
                        ["SlopeBoard"] = {
                            ["name"] = "斜板",
                            ["sort"] = 1,
                        },
                        ["VerticalBoard"] = {
                            ["name"] = "竖板",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["ShortcutStartIndex"] = 1000,
            ["ShortcutexStartIndex"] = 42000,
            ["SkillTrapBlock"] = {
                ["DetectType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Collide"] = 2,
                    ["Interact"] = 3,
                    ["Step"] = 1,
                    ["__info"] = {
                        ["Collide"] = {
                            ["name"] = "碰撞方块时",
                            ["sort"] = 2,
                        },
                        ["Interact"] = {
                            ["name"] = "点击交互时",
                            ["sort"] = 3,
                        },
                        ["Step"] = {
                            ["name"] = "踩中方块时",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["SkyboxAttr"] = {
                ["AmbientLightIntensity"] = 14,
                ["CloudDensity"] = 5,
                ["CloudHigh"] = 6,
                ["CloudSpeed"] = 4,
                ["DirectionalLightIntensity"] = 13,
                ["FogreMaxDis"] = 8,
                ["FogreMinDis"] = 7,
                ["MoonScale"] = 2,
                ["StarDensity"] = 3,
                ["SunScale"] = 1,
                ["Template"] = 9,
                ["WaterMirrorness"] = 11,
                ["WaterTransparency"] = 10,
                ["WindStrength"] = 12,
            },
            ["SkyboxAttrNoTime"] = {
                ["Metallic"] = 1,
                ["Roughness"] = 2,
            },
            ["SkyboxColor"] = {
                ["AmbientLight"] = 12,
                ["Bottom"] = 3,
                ["Cloud"] = 8,
                ["DirectionalLight"] = 11,
                ["Env"] = 5,
                ["Fog"] = 9,
                ["Light"] = 4,
                ["Middle"] = 2,
                ["Moon"] = 7,
                ["Sun"] = 6,
                ["Top"] = 1,
                ["Water"] = 10,
            },
            ["SkyboxFilter"] = {
                ["Bloomthreshold"] = 15,
                ["Color"] = 8,
                ["Contrast"] = 1,
                ["Dof"] = 7,
                ["Exposure"] = 4,
                ["Flood"] = 3,
                ["Ftmblackclip"] = 14,
                ["Ftmshoulder"] = 13,
                ["Ftmslope"] = 11,
                ["Ftmtoe"] = 12,
                ["Gamma"] = 6,
                ["Lut"] = 9,
                ["Saturation"] = 2,
                ["Template"] = 10,
                ["Volumelight"] = 5,
            },
            ["SkyboxFilterSwitch"] = {
                ["Dofenable"] = 1,
            },
            ["SkyboxMap"] = {
                ["Moon"] = 3,
                ["Sky"] = 1,
                ["Sun"] = 2,
            },
            ["SkyboxParticle"] = {
                ["Randomness"] = 4,
                ["Range"] = 2,
                ["Speed"] = 3,
                ["Strength"] = 1,
            },
            ["SkyboxSwitch"] = {
                ["Fogenable"] = 1,
            },
            ["SkyboxTime"] = {
                ["Current"] = -1,
                ["Time0"] = 0,
                ["Time12"] = 12,
                ["Time16"] = 16,
                ["Time18"] = 18,
                ["Time20"] = 20,
                ["Time4"] = 4,
                ["Time6"] = 6,
                ["Time8"] = 8,
                ["TimeAll"] = 99,
            },
            ["SortType"] = {
                ["Down"] = 1,
                ["Up"] = 0,
            },
            ["Sound"] = {
                ["playModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ThreeD"] = 1,
                    ["TwoD"] = 2,
                    ["__info"] = {
                        ["ThreeD"] = {
                            ["name"] = "3D",
                            ["sort"] = 1,
                        },
                        ["TwoD"] = {
                            ["name"] = "2D",
                            ["sort"] = 2,
                        },
                    },
                },
                ["startType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["AfterStart"] = 3,
                    ["None"] = 0,
                    ["OnPreview"] = 2,
                    ["OnStart"] = 1,
                    ["__info"] = {
                        ["AfterStart"] = {
                            ["name"] = "3",
                        },
                        ["None"] = {
                            ["name"] = "0",
                        },
                        ["OnPreview"] = {
                            ["name"] = "2",
                        },
                        ["OnStart"] = {
                            ["name"] = "1",
                        },
                    },
                },
            },
            ["Status"] = {
                ["AddBuff"] = function(self, objid, buffid, bufflv, customticks) end, --[[@service Status.AddBuff; @mtype Normal]]
                ["ClearAllBadBuff"] = function(self, objid) end, --[[@service Status.ClearAllBadBuff; @mtype Normal]]
                ["ClearAllBuff"] = function(self, objid) end, --[[@service Status.ClearAllBuff; @mtype Normal]]
                ["GetBuffCfg"] = function(self, buff) end, --[[@service Status.GetBuffCfg; @mtype Normal]]
                ["GetBuffData"] = function(self, buff) end, --[[@service Status.GetBuffData; @mtype Normal]]
                ["GetBuffDefDesc"] = function(self, buffid) end, --[[@service Status.GetBuffDefDesc; @mtype Normal]]
                ["GetBuffDefLevel"] = function(self, buffid) end, --[[@service Status.GetBuffDefLevel; @mtype Normal]]
                ["GetBuffDefName"] = function(self, buffid) end, --[[@service Status.GetBuffDefName; @mtype Normal]]
                ["GetBuffDefTicks"] = function(self, buffid) end, --[[@service Status.GetBuffDefTicks; @mtype Normal]]
                ["GetBuffIndex"] = function(self, objid, buffid) end, --[[@service Status.GetBuffIndex; @mtype Normal]]
                ["GetBuffLeftTime"] = function(self, objid, buffid) end, --[[@service Status.GetBuffLeftTime; @mtype Normal]]
                ["GetBuffList"] = function(self, objid) end, --[[@service Status.GetBuffList; @mtype Normal]]
                ["GetBuffName"] = function(self, objid, buffid) end, --[[@service Status.GetBuffName; @mtype Normal]]
                ["GetBuffNumByBuffid"] = function(self, objid, buffid) end, --[[@service Status.GetBuffNumByBuffid; @mtype Normal]]
                ["HasBuff"] = function(self, objid, buffid, bufflv) end, --[[@service Status.HasBuff; @mtype Normal]]
                ["RefreshAllBuffTick"] = function(self, objid) end, --[[@service Status.RefreshAllBuffTick; @mtype Normal]]
                ["RemoveBuff"] = function(self, objid, buffid) end, --[[@service Status.RemoveBuff; @mtype Normal]]
                ["ReplaceBuff"] = function(self, objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) end, --[[@service Status.ReplaceBuff; @mtype Normal]]
                ["SetForbidAddBuff"] = function(self, objid, isForbid) end, --[[@service Status.SetForbidAddBuff; @mtype Normal]]
            },
            ["StatusEdit"] = {
                ["priority"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Cover"] = 1,
                    ["NoCover"] = 2,
                    ["__info"] = {
                        ["Cover"] = {
                            ["name"] = "覆盖",
                            ["sort"] = 1,
                        },
                        ["NoCover"] = {
                            ["name"] = "并存",
                            ["sort"] = 2,
                        },
                    },
                },
                ["triggerTimeEnumType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Limit"] = 0,
                    ["NoLimit"] = 1,
                    ["__info"] = {
                        ["Limit"] = {
                            ["name"] = "持续触发",
                            ["sort"] = 1,
                        },
                        ["NoLimit"] = {
                            ["name"] = "永久触发",
                            ["sort"] = 2,
                        },
                    },
                },
                ["type"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Advantage"] = 0,
                    ["Disadvantage"] = 1,
                    ["__info"] = {
                        ["Advantage"] = {
                            ["name"] = "有益状态",
                            ["sort"] = 1,
                        },
                        ["Disadvantage"] = {
                            ["name"] = "有害状态",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["StorageStartIndex"] = 3000,
            ["StorageType"] = {
                ["box"] = 801,
                ["boxcol"] = 1181,
                ["boxrow"] = 1180,
            },
            ["SurviveComponent"] = {
                ["AddAttrType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Hungry"] = 1,
                    ["None"] = 0,
                    ["Strenth"] = 2,
                    ["__info"] = {
                        ["Hungry"] = {
                            ["name"] = "饥饿值",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["Strenth"] = {
                            ["name"] = "体力值",
                            ["sort"] = 3,
                        },
                    },
                },
            },
            ["Tame"] = {
                ["TameMobType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ChangeToNew"] = 0,
                    ["KeepCurrMob"] = 1,
                    ["__info"] = {
                        ["ChangeToNew"] = {
                            ["name"] = "更换生物",
                            ["sort"] = 1,
                        },
                        ["KeepCurrMob"] = {
                            ["name"] = "使用当前生物",
                            ["sort"] = 2,
                        },
                    },
                },
                ["TameType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ByFavor"] = 1,
                    ["ByItem"] = 0,
                    ["__info"] = {
                        ["ByFavor"] = {
                            ["name"] = "好感度",
                            ["sort"] = 2,
                        },
                        ["ByItem"] = {
                            ["name"] = "使用道具",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Task"] = {
                ["AddPlayerInitTaskChain"] = function(self, name) end, --[[@service Task.AddPlayerInitTaskChain; @mtype Normal]]
                ["CloseNativePlayerGuide"] = function(self) end, --[[@service Task.CloseNativePlayerGuide; @mtype Normal]]
                ["GetIsHasSingPlayerGuide"] = function(self) end, --[[@service Task.GetIsHasSingPlayerGuide; @mtype Normal]]
                ["GetIsInSingPlayerGuide"] = function(self) end, --[[@service Task.GetIsInSingPlayerGuide; @mtype Normal]]
                ["NextTask"] = function(self, playerId, name, isFinish) end, --[[@service Task.NextTask; @mtype Normal]]
                ["OpenMainTaskForTaskID"] = function(self, taskID) end, --[[@service Task.OpenMainTaskForTaskID; @mtype Normal]]
                ["PassSingPlayerGuide"] = function(self) end, --[[@service Task.PassSingPlayerGuide; @mtype Normal]]
                ["PassTaskChain"] = function(self, playerId, name) end, --[[@service Task.PassTaskChain; @mtype Normal]]
                ["SetSingPlayerGuide"] = function(self, name, cfg) end, --[[@service Task.SetSingPlayerGuide; @mtype Normal]]
                ["SetTaskCfg"] = function(self, name, cfg) end, --[[@service Task.SetTaskCfg; @mtype Normal]]
                ["SetTaskChainCfg"] = function(self, name, cfg) end, --[[@service Task.SetTaskChainCfg; @mtype Normal]]
                ["ShowPassGuideMessageBox"] = function(self, tips, okFn, cancellFn) end, --[[@service Task.ShowPassGuideMessageBox; @mtype Normal]]
                ["StartTaskChain"] = function(self, playerId, name) end, --[[@service Task.StartTaskChain; @mtype Normal]]
                ["StopTaskChain"] = function(self, playerId, name) end, --[[@service Task.StopTaskChain; @mtype Normal]]
            },
            ["TaskAnimType"] = {
                ["Click"] = 1,
                ["LongPress"] = 2,
                ["MoveLeft"] = 4,
                ["MoveRight"] = 5,
                ["MoveUp"] = 3,
            },
            ["TaskChainType"] = {
                ["AllMap"] = 2,
                ["GuideSinglePlayer"] = 1,
                ["PlayerTask"] = 3,
            },
            ["TaskDialogType"] = {
                ["Base"] = 1,
                ["CustomUI"] = 2,
            },
            ["TaskEvent"] = {
                ["ClickRideCallBtn"] = "ClickRideCallBtn",
            },
            ["TaskPassType"] = {
                ["AllTask"] = 1,
                ["NextTask"] = 2,
                ["None"] = 3,
            },
            ["TaskType"] = {
                ["Dialog"] = 1,
                ["Task"] = 2,
            },
            ["TaskUIType"] = {
                ["CustomUI"] = 1,
                ["GameUI"] = 3,
                ["OldUI"] = 2,
            },
            ["Team"] = {
                ["AddTeamDieTimes"] = function(self, teamid) end, --[[@service Team.AddTeamDieTimes; @mtype Normal]]
                ["AddTeamScore"] = function(self, teamid, score) end, --[[@service Team.AddTeamScore; @mtype Normal]]
                ["ChangePlayerTeam"] = function(self, playerid, teamid, resetAttr) end, --[[@service Team.ChangePlayerTeam; @mtype Normal]]
                ["GetNumTeam"] = function(self) end, --[[@service Team.GetNumTeam; @mtype Normal]]
                ["GetRelativeActor"] = function(self, uin, relativing, actortype) end, --[[@service Team.GetRelativeActor; @mtype Normal]]
                ["GetTeamCreatures"] = function(self, teamid) end, --[[@service Team.GetTeamCreatures; @mtype Normal]]
                ["GetTeamDieTimes"] = function(self, teamid) end, --[[@service Team.GetTeamDieTimes; @mtype Normal]]
                ["GetTeamMobs"] = function(self, teamid) end, --[[@service Team.GetTeamMobs; @mtype Normal]]
                ["GetTeamPlayerNum"] = function(self, teamid, alive) end, --[[@service Team.GetTeamPlayerNum; @mtype Normal]]
                ["GetTeamPlayers"] = function(self, teamid, alive) end, --[[@service Team.GetTeamPlayers; @mtype Normal]]
                ["GetTeamResults"] = function(self, teamid) end, --[[@service Team.GetTeamResults; @mtype Normal]]
                ["GetTeamScore"] = function(self, teamid) end, --[[@service Team.GetTeamScore; @mtype Normal]]
                ["InitTriggerGlobalData"] = function(self) end, --[[@service Team.InitTriggerGlobalData; @mtype Normal]]
                ["RandomTeamPlayer"] = function(self, teamid, alive) end, --[[@service Team.RandomTeamPlayer; @mtype Normal]]
                ["SetTeamDieTimes"] = function(self, teamid, times) end, --[[@service Team.SetTeamDieTimes; @mtype Normal]]
                ["SetTeamResults"] = function(self, teamid, result) end, --[[@service Team.SetTeamResults; @mtype Normal]]
                ["SetTeamScore"] = function(self, teamid, score) end, --[[@service Team.SetTeamScore; @mtype Normal]]
            },
            ["TeamAttr"] = {
                ["PlayerNum"] = 1,
                ["Score"] = 2,
            },
            ["TeamResults"] = {
                ["Dogfall"] = 3,
                ["Lose"] = 2,
                ["None"] = 0,
                ["Win"] = 1,
            },
            ["TerrainType"] = {
                ["Flat"] = 0,
                ["Normal"] = 1,
            },
            ["Timeline"] = {
                ["GetPlayerState"] = function(self, uin, timelineId) end, --[[@service Timeline.GetPlayerState; @mtype Normal]]
                ["IsAllFinished"] = function(self, timelineId) end, --[[@service Timeline.IsAllFinished; @mtype Normal]]
                ["Pause"] = function(self, uin, timelineId) end, --[[@service Timeline.Pause; @mtype Normal]]
                ["PauseForPlayer"] = function(self, uin, timelineId, pause) end, --[[@service Timeline.PauseForPlayer; @mtype Normal]]
                ["PlayForAll"] = function(self, timelineId, refKind, anchorPos, anchorYaw) end, --[[@service Timeline.PlayForAll; @mtype Normal]]
                ["PlayForPlayer"] = function(self, uin, timelineId, reverse, playToEnd, refKind, anchorPos, anchorYaw) end, --[[@service Timeline.PlayForPlayer; @mtype Normal]]
                ["Resume"] = function(self, uin, timelineId) end, --[[@service Timeline.Resume; @mtype Normal]]
                ["SkipForPlayer"] = function(self, uin) end, --[[@service Timeline.SkipForPlayer; @mtype Normal]]
            },
            ["Timer"] = {
                ["ChangeTimerTime"] = function(self, id, curtime) end, --[[@service Timer.ChangeTimerTime; @mtype Normal]]
                ["CreateTimer"] = function(self, name) end, --[[@service Timer.CreateTimer; @mtype Normal]]
                ["DeleteTimer"] = function(self, id) end, --[[@service Timer.DeleteTimer; @mtype Normal]]
                ["GetTimerTime"] = function(self, id) end, --[[@service Timer.GetTimerTime; @mtype Normal]]
                ["HideTimerWnd"] = function(self, playerids) end, --[[@service Timer.HideTimerWnd; @mtype Normal]]
                ["IsExist"] = function(self, id) end, --[[@service Timer.IsExist; @mtype Normal]]
                ["IsPause"] = function(self, id) end, --[[@service Timer.IsPause; @mtype Normal]]
                ["IsPlaying"] = function(self, id) end, --[[@service Timer.IsPlaying; @mtype Normal]]
                ["PauseTimer"] = function(self, id) end, --[[@service Timer.PauseTimer; @mtype Normal]]
                ["ResumeTimer"] = function(self, id) end, --[[@service Timer.ResumeTimer; @mtype Normal]]
                ["ShowTimerWnd"] = function(self, playerids, timerid, title) end, --[[@service Timer.ShowTimerWnd; @mtype Normal]]
                ["StartBackwardTimer"] = function(self, id, interval, repeated) end, --[[@service Timer.StartBackwardTimer; @mtype Normal]]
                ["StartForwardTimer"] = function(self, id) end, --[[@service Timer.StartForwardTimer; @mtype Normal]]
                ["StopTimer"] = function(self, id) end, --[[@service Timer.StopTimer; @mtype Normal]]
            },
            ["ToolEdit"] = {
                ["ToolType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Axe"] = 1,
                    ["Null"] = 6,
                    ["Pickaxe"] = 2,
                    ["Shovel"] = 3,
                    ["Staff"] = 24,
                    ["__info"] = {
                        ["Axe"] = {
                            ["name"] = "斧头",
                            ["sort"] = 2,
                        },
                        ["Null"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["Pickaxe"] = {
                            ["name"] = "镐",
                            ["sort"] = 3,
                        },
                        ["Shovel"] = {
                            ["name"] = "铲子",
                            ["sort"] = 4,
                        },
                        ["Staff"] = {
                            ["name"] = "法杖",
                            ["sort"] = 5,
                        },
                    },
                },
            },
            ["TouchState"] = {
                ["Begin"] = 1,
                ["Cancel"] = 3,
                ["End"] = 2,
            },
            ["TransToPos"] = {
                ["TransModelType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Block"] = 1,
                    ["TargetPos"] = 0,
                    ["__info"] = {
                        ["Block"] = {
                            ["name"] = "附近方块位置",
                            ["sort"] = 2,
                        },
                        ["TargetPos"] = {
                            ["name"] = "目标位置",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["Trigger"] = {
                ["Actor"] = {
                    ["ActorDoHurt"] = function(self, doobj, data, value, itype) end, --[[@service Trigger.Actor.ActorDoHurt; @mtype Normal]]
                    ["AddOrRemoveTags"] = function(self, actorids, badd, tags, icount) end, --[[@service Trigger.Actor.AddOrRemoveTags; @mtype Normal]]
                    ["AppendSpeed"] = function(self, data, dir, speed) end, --[[@service Trigger.Actor.AppendSpeed; @mtype Normal]]
                    ["ChangActorMoveType"] = function(self, data, moveType) end, --[[@service Trigger.Actor.ChangActorMoveType; @mtype Normal]]
                    ["ChangeCustomModel"] = function(self, data, modtype) end, --[[@service Trigger.Actor.ChangeCustomModel; @mtype Normal]]
                    ["CheckActorType"] = function(self, objid, itype) end, --[[@service Trigger.Actor.CheckActorType; @mtype Normal]]
                    ["CheckPickupActionValid"] = function(self, param, actor1Type, pickupType, actor2Type) end, --[[@service Trigger.Actor.CheckPickupActionValid; @mtype Normal]]
                    ["CheckTargetActorType"] = function(self, objid, itype, ret) end, --[[@service Trigger.Actor.CheckTargetActorType; @mtype Normal]]
                    ["ClearActorWithId"] = function(self, killtype, actorids, worldId) end, --[[@service Trigger.Actor.ClearActorWithId; @mtype Normal]]
                    ["CompareMovementMode"] = function(self, objid, movementMode) end, --[[@service Trigger.Actor.CompareMovementMode; @mtype Normal]]
                    ["CompareTeam"] = function(self, data, team) end, --[[@service Trigger.Actor.CompareTeam; @mtype Normal]]
                    ["CreateCreature"] = function(self, monsterid, pos) end, --[[@service Trigger.Actor.CreateCreature; @mtype Normal]]
                    ["FindNearestBlock"] = function(self, objid, blockid, blockRange) end, --[[@service Trigger.Actor.FindNearestBlock; @mtype Normal]]
                    ["GetBoundSzie"] = function(self, obj, ix) end, --[[@service Trigger.Actor.GetBoundSzie; @mtype Normal]]
                    ["GetBtreeVarValue"] = function(self, objid, treeId, varid) end, --[[@service Trigger.Actor.GetBtreeVarValue; @mtype Normal]]
                    ["GetMusicId"] = function(self, objid, musicId) end, --[[@service Trigger.Actor.GetMusicId; @mtype Normal]]
                    ["GetOrthogonalDirection"] = function(self, objid, dirtype) end, --[[@service Trigger.Actor.GetOrthogonalDirection; @mtype Normal]]
                    ["GetPickupActorID"] = function(self, objid, roleType) end, --[[@service Trigger.Actor.GetPickupActorID; @mtype Normal]]
                    ["GetPosition"] = function(self, objid) end, --[[@service Trigger.Actor.GetPosition; @mtype Normal]]
                    ["GetProjectileShootMob"] = function(self, data) end, --[[@service Trigger.Actor.GetProjectileShootMob; @mtype Normal]]
                    ["GetProjectileShootPlayer"] = function(self, data) end, --[[@service Trigger.Actor.GetProjectileShootPlayer; @mtype Normal]]
                    ["IncreasesAttr"] = function(self, data, atttype, itype, val) end, --[[@service Trigger.Actor.IncreasesAttr; @mtype Normal]]
                    ["KillSelf"] = function(self, data) end, --[[@service Trigger.Actor.KillSelf; @mtype Normal]]
                    ["ObjToAnyObj"] = function(self, objid, roletype) end, --[[@service Trigger.Actor.ObjToAnyObj; @mtype Normal]]
                    ["PaseOrResumeSoundEffectById"] = function(self, data, musicId) end, --[[@service Trigger.Actor.PaseOrResumeSoundEffectById; @mtype Normal]]
                    ["PauseSoundEffectById"] = function(self, data, musicId) end, --[[@service Trigger.Actor.PauseSoundEffectById; @mtype Normal]]
                    ["PlayAnimByObj"] = function(self, actorids, objidB) end, --[[@service Trigger.Actor.PlayAnimByObj; @mtype Normal]]
                    ["PlayBodyEffectById"] = function(self, data, effectids, scale, ptme) end, --[[@service Trigger.Actor.PlayBodyEffectById; @mtype Normal]]
                    ["PlayBodyParticleById"] = function(self, data, effectids, ptme, offset, rot, scale) end, --[[@service Trigger.Actor.PlayBodyParticleById; @mtype Normal]]
                    ["PlaySoundEffectById"] = function(self, data, soundId, volume, pitch, isLoop) end, --[[@service Trigger.Actor.PlaySoundEffectById; @mtype Normal]]
                    ["RecoverinitialModel"] = function(self, data) end, --[[@service Trigger.Actor.RecoverinitialModel; @mtype Normal]]
                    ["RemoveImmuneAttackType"] = function(self, data, vlues) end, --[[@service Trigger.Actor.RemoveImmuneAttackType; @mtype Normal]]
                    ["ResumeSoundEffectById"] = function(self, data, musicId) end, --[[@service Trigger.Actor.ResumeSoundEffectById; @mtype Normal]]
                    ["RoleToAnyObj"] = function(self, objid, roletype) end, --[[@service Trigger.Actor.RoleToAnyObj; @mtype Normal]]
                    ["SetActorDir"] = function(self, data, itype, value) end, --[[@service Trigger.Actor.SetActorDir; @mtype Normal]]
                    ["SetAttr"] = function(self, data, atttype, val) end, --[[@service Trigger.Actor.SetAttr; @mtype Normal]]
                    ["SetBodyEffectScale"] = function(self, data, effectids, size) end, --[[@service Trigger.Actor.SetBodyEffectScale; @mtype Normal]]
                    ["SetBodyParticleTransform"] = function(self, data, effectids, offset, rot, scale) end, --[[@service Trigger.Actor.SetBodyParticleTransform; @mtype Normal]]
                    ["SetBtreeVarValue"] = function(self, objid, treeId, varid, val) end, --[[@service Trigger.Actor.SetBtreeVarValue; @mtype Normal]]
                    ["SetCmpBaseState"] = function(self, data, attr, switch) end, --[[@service Trigger.Actor.SetCmpBaseState; @mtype Normal]]
                    ["SetFaceDir"] = function(self, data, facedir) end, --[[@service Trigger.Actor.SetFaceDir; @mtype Normal]]
                    ["SetFaceYaw"] = function(self, data, value) end, --[[@service Trigger.Actor.SetFaceYaw; @mtype Normal]]
                    ["SetImmuneAttackType"] = function(self, data, vlues) end, --[[@service Trigger.Actor.SetImmuneAttackType; @mtype Normal]]
                    ["SetNickName"] = function(self, data, nick) end, --[[@service Trigger.Actor.SetNickName; @mtype Normal]]
                    ["SetPosition"] = function(self, data, position) end, --[[@service Trigger.Actor.SetPosition; @mtype Normal]]
                    ["SetTeam"] = function(self, data, teamid) end, --[[@service Trigger.Actor.SetTeam; @mtype Normal]]
                    ["StopBodyEffectById"] = function(self, data, effectids) end, --[[@service Trigger.Actor.StopBodyEffectById; @mtype Normal]]
                    ["StopSoundEffectById"] = function(self, data, soundId) end, --[[@service Trigger.Actor.StopSoundEffectById; @mtype Normal]]
                    ["TryInteractActor"] = function(self, objid, action, speed, dir, hasInertance) end, --[[@service Trigger.Actor.TryInteractActor; @mtype Normal]]
                    ["TryMoveToPos"] = function(self, objid, position, cancontrol) end, --[[@service Trigger.Actor.TryMoveToPos; @mtype Normal]]
                },
                ["AllAttackType"] = function(self) end, --[[@service Trigger.AllAttackType; @mtype Normal]]
                ["AllSound"] = function(self) end, --[[@service Trigger.AllSound; @mtype Normal]]
                ["AllStatus"] = function(self, data) end, --[[@service Trigger.AllStatus; @mtype Normal]]
                ["AnyValue2Str"] = function(self, value) end, --[[@service Trigger.AnyValue2Str; @mtype Normal]]
                ["Area"] = {
                    ["BlockInArea"] = function(self, blockid, areaid) end, --[[@service Trigger.Area.BlockInArea; @mtype Normal]]
                    ["ClearAllBlock"] = function(self, areaid, blockids) end, --[[@service Trigger.Area.ClearAllBlock; @mtype Normal]]
                    ["CloneArea"] = function(self, itype, areaid, deststartpos) end, --[[@service Trigger.Area.CloneArea; @mtype Normal]]
                    ["DestroyAllBlock"] = function(self, areaid, blockids) end, --[[@service Trigger.Area.DestroyAllBlock; @mtype Normal]]
                    ["FillBlock"] = function(self, blockid, areaid, itype, face, color, switch) end, --[[@service Trigger.Area.FillBlock; @mtype Normal]]
                    ["GetCenterFloatPos"] = function(self, areaid) end, --[[@service Trigger.Area.GetCenterFloatPos; @mtype Normal]]
                    ["GetCenterPos"] = function(self, areaid) end, --[[@service Trigger.Area.GetCenterPos; @mtype Normal]]
                    ["GetCenterPosReal"] = function(self, posbeg, posend) end, --[[@service Trigger.Area.GetCenterPosReal; @mtype Normal]]
                    ["GetRandomFloatPos"] = function(self, areaid) end, --[[@service Trigger.Area.GetRandomFloatPos; @mtype Normal]]
                    ["GetRandomPos"] = function(self, areaid) end, --[[@service Trigger.Area.GetRandomPos; @mtype Normal]]
                    ["GetRandomPosReal"] = function(self, posbeg, posend) end, --[[@service Trigger.Area.GetRandomPosReal; @mtype Normal]]
                    ["ObjInArea"] = function(self, objid, areaid) end, --[[@service Trigger.Area.ObjInArea; @mtype Normal]]
                    ["PosInArea"] = function(self, pos, areaid) end, --[[@service Trigger.Area.PosInArea; @mtype Normal]]
                    ["ReplaceAreaBlock"] = function(self, destblockid, areaid, srcblockid, face, color, switch) end, --[[@service Trigger.Area.ReplaceAreaBlock; @mtype Normal]]
                },
                ["ArrayTmp"] = {
                    ["GetActorsByTags"] = function(self, areaid, mathcmode, tags, itype, bexactmatch) end, --[[@service Trigger.ArrayTmp.GetActorsByTags; @mtype Normal]]
                    ["GetAllPlayers"] = function(self, alive) end, --[[@service Trigger.ArrayTmp.GetAllPlayers; @mtype Normal]]
                    ["GetAreaBlocks"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaBlocks; @mtype Normal]]
                    ["GetAreaCreatures"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaCreatures; @mtype Normal]]
                    ["GetAreaDropItems"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaDropItems; @mtype Normal]]
                    ["GetAreaEntity"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaEntity; @mtype Normal]]
                    ["GetAreaMisssile"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaMisssile; @mtype Normal]]
                    ["GetAreaObjEntity"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaObjEntity; @mtype Normal]]
                    ["GetAreaPlayers"] = function(self, areaid) end, --[[@service Trigger.ArrayTmp.GetAreaPlayers; @mtype Normal]]
                    ["GetAreaRelativeActors"] = function(self, areaid, uin, relativing, actortype) end, --[[@service Trigger.ArrayTmp.GetAreaRelativeActors; @mtype Normal]]
                    ["GetInviteGroupS"] = function(self, playerid) end, --[[@service Trigger.ArrayTmp.GetInviteGroupS; @mtype Normal]]
                    ["GetNewInviteGroup"] = function(self, playerid) end, --[[@service Trigger.ArrayTmp.GetNewInviteGroup; @mtype Normal]]
                    ["GetRelativeActor"] = function(self, uin, relativing, actortype) end, --[[@service Trigger.ArrayTmp.GetRelativeActor; @mtype Normal]]
                    ["GetTableRowIndex"] = function(self, varId, playerId, col, itype, value) end, --[[@service Trigger.ArrayTmp.GetTableRowIndex; @mtype Normal]]
                    ["GetTableRowIndexs"] = function(self, varId, playerId, col, itype, value) end, --[[@service Trigger.ArrayTmp.GetTableRowIndexs; @mtype Normal]]
                    ["GetTableValuesByCol"] = function(self, varId, playerId, col) end, --[[@service Trigger.ArrayTmp.GetTableValuesByCol; @mtype Normal]]
                    ["GetTeamCreatures"] = function(self, teamid) end, --[[@service Trigger.ArrayTmp.GetTeamCreatures; @mtype Normal]]
                    ["GetTeamLivingActor"] = function(self, teamid) end, --[[@service Trigger.ArrayTmp.GetTeamLivingActor; @mtype Normal]]
                    ["GetTeamMobs"] = function(self, teamid) end, --[[@service Trigger.ArrayTmp.GetTeamMobs; @mtype Normal]]
                    ["GetTeamPlayers"] = function(self, teamid, alive) end, --[[@service Trigger.ArrayTmp.GetTeamPlayers; @mtype Normal]]
                    ["GetVarTabValue"] = function(self, varId, playerId, col, rows, value) end, --[[@service Trigger.ArrayTmp.GetVarTabValue; @mtype Normal]]
                    ["InsertValue"] = function(self, value, varid, playerid) end, --[[@service Trigger.ArrayTmp.InsertValue; @mtype Normal]]
                    ["InsertValueToArray"] = function(self, varId, playerId, index, value) end, --[[@service Trigger.ArrayTmp.InsertValueToArray; @mtype Normal]]
                    ["InsertValuesToArray"] = function(self, varId, playerId, varId2, playerId2) end, --[[@service Trigger.ArrayTmp.InsertValuesToArray; @mtype Normal]]
                    ["InsertVarTabValue"] = function(self, varId, playerId, index, ...) end, --[[@service Trigger.ArrayTmp.InsertVarTabValue; @mtype Normal]]
                    ["ObjInTmpGroup"] = function(self, v1, v2) end, --[[@service Trigger.ArrayTmp.ObjInTmpGroup; @mtype Normal]]
                    ["RemoveByValue"] = function(self, value, varid, playerid) end, --[[@service Trigger.ArrayTmp.RemoveByValue; @mtype Normal]]
                    ["ReplaceValueToArray"] = function(self, varId, playerId, value, oldValue) end, --[[@service Trigger.ArrayTmp.ReplaceValueToArray; @mtype Normal]]
                    ["SetTableRows"] = function(self, varId, playerId, frow, itype, fvalue, col, value) end, --[[@service Trigger.ArrayTmp.SetTableRows; @mtype Normal]]
                    ["SetValueToArray"] = function(self, varId, playerId, index, value) end, --[[@service Trigger.ArrayTmp.SetValueToArray; @mtype Normal]]
                    ["SetVarTabValue"] = function(self, varId, playerId, col, rows, value) end, --[[@service Trigger.ArrayTmp.SetVarTabValue; @mtype Normal]]
                    ["SplitStrArray"] = function(self, str, mark) end, --[[@service Trigger.ArrayTmp.SplitStrArray; @mtype Normal]]
                },
                ["Backpack"] = {
                    ["ActDestructEquip"] = function(self, data, equipid) end, --[[@service Trigger.Backpack.ActDestructEquip; @mtype Normal]]
                    ["ActEquipOffByEquipID"] = function(self, data, equipid) end, --[[@service Trigger.Backpack.ActEquipOffByEquipID; @mtype Normal]]
                    ["ActEquipUpByResID"] = function(self, data, itemid) end, --[[@service Trigger.Backpack.ActEquipUpByResID; @mtype Normal]]
                    ["AddItem"] = function(self, num, itemid, data) end, --[[@service Trigger.Backpack.AddItem; @mtype Normal]]
                    ["CreateItemID"] = function(self, itemnum, itemid, data, ipos) end, --[[@service Trigger.Backpack.CreateItemID; @mtype Normal]]
                    ["DiscardItemByID"] = function(self, data, itemnum, itemid) end, --[[@service Trigger.Backpack.DiscardItemByID; @mtype Normal]]
                    ["EnoughSpaceForItem"] = function(self, objid, itemnum, itemid) end, --[[@service Trigger.Backpack.EnoughSpaceForItem; @mtype Normal]]
                    ["GetShurtItemid"] = function(self, playerid, gridtype, index) end, --[[@service Trigger.Backpack.GetShurtItemid; @mtype Normal]]
                    ["GetShurtItemnum"] = function(self, playerid, gridtype, index) end, --[[@service Trigger.Backpack.GetShurtItemnum; @mtype Normal]]
                    ["PlayShortCutItemEffect"] = function(self, data, itemid, effectid, scale) end, --[[@service Trigger.Backpack.PlayShortCutItemEffect; @mtype Normal]]
                    ["PlayShortCutItemParticle"] = function(self, data, itemid, effectids, offset, rot, scale) end, --[[@service Trigger.Backpack.PlayShortCutItemParticle; @mtype Normal]]
                    ["PlayShortCutIxEffect"] = function(self, data, effectid, scale) end, --[[@service Trigger.Backpack.PlayShortCutIxEffect; @mtype Normal]]
                    ["PlayShortCutIxParticle"] = function(self, data, effectids, offset, rot, scale) end, --[[@service Trigger.Backpack.PlayShortCutIxParticle; @mtype Normal]]
                    ["RemoveGridItem"] = function(self, data, gridid, itemnum) end, --[[@service Trigger.Backpack.RemoveGridItem; @mtype Normal]]
                    ["RemoveItem"] = function(self, data, itemnum, itemid) end, --[[@service Trigger.Backpack.RemoveItem; @mtype Normal]]
                    ["SetGridItem"] = function(self, data, gridid, itemid, itemnum) end, --[[@service Trigger.Backpack.SetGridItem; @mtype Normal]]
                    ["StopShortCutItemEffect"] = function(self, data, itemid, effectids) end, --[[@service Trigger.Backpack.StopShortCutItemEffect; @mtype Normal]]
                    ["StopShortCutIxEffect"] = function(self, data, effectids) end, --[[@service Trigger.Backpack.StopShortCutIxEffect; @mtype Normal]]
                },
                ["Block"] = {
                    ["CheckBlockDir"] = function(self, pos, dir, val, worldId) end, --[[@service Trigger.Block.CheckBlockDir; @mtype Normal]]
                    ["CompareBlockID"] = function(self, pos, flag, blockid, worldId) end, --[[@service Trigger.Block.CompareBlockID; @mtype Normal]]
                    ["CreateBlock"] = function(self, pos, blockid, face, worldId) end, --[[@service Trigger.Block.CreateBlock; @mtype Normal]]
                    ["CreateSpcBlock"] = function(self, pos, blockid, face, color, switch, worldId) end, --[[@service Trigger.Block.CreateSpcBlock; @mtype Normal]]
                    ["DestroyBlock"] = function(self, pos, worldId) end, --[[@service Trigger.Block.DestroyBlock; @mtype Normal]]
                    ["DestroyBlockDrop"] = function(self, pos, worldId) end, --[[@service Trigger.Block.DestroyBlockDrop; @mtype Normal]]
                    ["GetBlockID"] = function(self, pos, worldId) end, --[[@service Trigger.Block.GetBlockID; @mtype Normal]]
                    ["GetBlockSwitchStatus"] = function(self, pos, flag, worldId) end, --[[@service Trigger.Block.GetBlockSwitchStatus; @mtype Normal]]
                    ["GetFacade"] = function(self, blockid) end, --[[@service Trigger.Block.GetFacade; @mtype Normal]]
                    ["ReplaceBluePrint"] = function(self, pos, blueprint, angle, mirror, placeMode, worldId) end, --[[@service Trigger.Block.ReplaceBluePrint; @mtype Normal]]
                    ["SetBlockColor"] = function(self, pos, color, worldId) end, --[[@service Trigger.Block.SetBlockColor; @mtype Normal]]
                    ["SetBlockDir"] = function(self, pos, dir, worldId) end, --[[@service Trigger.Block.SetBlockDir; @mtype Normal]]
                    ["SetBlockSwichState"] = function(self, pos, switch, worldId) end, --[[@service Trigger.Block.SetBlockSwichState; @mtype Normal]]
                },
                ["Buff"] = {
                    ["AddBuff"] = function(self, data, buffid, bforever, ctime) end, --[[@service Trigger.Buff.AddBuff; @mtype Normal]]
                    ["CompareBuff"] = function(self, buff1, buff2) end, --[[@service Trigger.Buff.CompareBuff; @mtype Normal]]
                    ["GetBuffLeftTime"] = function(self, objid, buffid) end, --[[@service Trigger.Buff.GetBuffLeftTime; @mtype Normal]]
                    ["HasBuff"] = function(self, data, buffid) end, --[[@service Trigger.Buff.HasBuff; @mtype Normal]]
                    ["RemoveBuff"] = function(self, data, buffid) end, --[[@service Trigger.Buff.RemoveBuff; @mtype Normal]]
                    ["ReplaceBuff"] = function(self, data, buffer1, buffer2, bforever, ctime) end, --[[@service Trigger.Buff.ReplaceBuff; @mtype Normal]]
                },
                ["Component"] = {
                    ["AddComponent"] = function(self, object, cmpName) end, --[[@service Trigger.Component.AddComponent; @mtype Normal]]
                    ["AddEvent"] = function(self, cmp, object, event, fn, priority, ...) end, --[[@service Trigger.Component.AddEvent; @mtype Normal]]
                    ["CallBlockComponentFunctionByPos"] = function(self, pos, cmpName, fnName, ...) end, --[[@service Trigger.Component.CallBlockComponentFunctionByPos; @mtype Normal]]
                    ["CallBlockComponentFunctionByPosVar"] = function(self, pos, cmpName, fnName, ...) end, --[[@service Trigger.Component.CallBlockComponentFunctionByPosVar; @mtype Normal]]
                    ["CallComponentFunction"] = function(self, object, cmpName, fnName, ...) end, --[[@service Trigger.Component.CallComponentFunction; @mtype Normal]]
                    ["CallComponentFunctionVar"] = function(self, object, cmpName, fnName, ...) end, --[[@service Trigger.Component.CallComponentFunctionVar; @mtype Normal]]
                    ["CheckCmpFunctionCallType"] = function(self, fun, cmp, checkType, ...) end, --[[@service Trigger.Component.CheckCmpFunctionCallType; @mtype Normal]]
                    ["GetBlockComponentPropertyByPos"] = function(self, pos, cmpName, property) end, --[[@service Trigger.Component.GetBlockComponentPropertyByPos; @mtype Normal]]
                    ["GetComponentProperty"] = function(self, object, cmpName, property) end, --[[@service Trigger.Component.GetComponentProperty; @mtype Normal]]
                    ["GetIsHasCmp"] = function(self, object, cmpName) end, --[[@service Trigger.Component.GetIsHasCmp; @mtype Normal]]
                    ["IncreasesComponentProperty"] = function(self, object, cmpName, property, value) end, --[[@service Trigger.Component.IncreasesComponentProperty; @mtype Normal]]
                    ["IsEventEnable"] = function(self, funcname, cmp) end, --[[@service Trigger.Component.IsEventEnable; @mtype Normal]]
                    ["ProtectRunFn"] = function(self, isVar, isNewThread, obj, fn, ...) end, --[[@service Trigger.Component.ProtectRunFn; @mtype Normal]]
                    ["RemoveComponent"] = function(self, object, cmpName) end, --[[@service Trigger.Component.RemoveComponent; @mtype Normal]]
                    ["RunCmpBaseFn"] = function(self, cmp, fn, ...) end, --[[@service Trigger.Component.RunCmpBaseFn; @mtype Normal]]
                    ["SetComponentIsEnable"] = function(self, object, cmpName, isEnable) end, --[[@service Trigger.Component.SetComponentIsEnable; @mtype Normal]]
                    ["SetComponentProperty"] = function(self, object, cmpName, property, value) end, --[[@service Trigger.Component.SetComponentProperty; @mtype Normal]]
                    ["SetEventIsEnable"] = function(self, funcname, enable, cmp) end, --[[@service Trigger.Component.SetEventIsEnable; @mtype Normal]]
                    ["_FindBlockCmpByPos"] = function(self, pos, cmpName) end, --[[@service Trigger.Component._FindBlockCmpByPos; @mtype Normal]]
                    ["errorFn"] = function(cmp, message) end, --[[@service Trigger.Component.errorFn; @mtype Normal]]
                },
                ["CustomUI"] = {
                    ["GetElementAttrValue"] = function(self, playerid, elementid, enumId) end, --[[@service Trigger.CustomUI.GetElementAttrValue; @mtype Normal]]
                    ["GetProgressBarValue"] = function(self, objid, uiid, elementid, itype) end, --[[@service Trigger.CustomUI.GetProgressBarValue; @mtype Normal]]
                    ["GetScreenSize"] = function(self, objid, ix) end, --[[@service Trigger.CustomUI.GetScreenSize; @mtype Normal]]
                    ["MakeElementAnim"] = function(self, animid, time, mode) end, --[[@service Trigger.CustomUI.MakeElementAnim; @mtype Normal]]
                    ["MakeSmoothMoveBy"] = function(self, time, dir, isadd, len) end, --[[@service Trigger.CustomUI.MakeSmoothMoveBy; @mtype Normal]]
                    ["MakeSmoothMoveTo"] = function(self, time, x, y) end, --[[@service Trigger.CustomUI.MakeSmoothMoveTo; @mtype Normal]]
                    ["MakeSmoothRotateBy"] = function(self, time, isadd, angle) end, --[[@service Trigger.CustomUI.MakeSmoothRotateBy; @mtype Normal]]
                    ["MakeSmoothRotateTo"] = function(self, time, angle) end, --[[@service Trigger.CustomUI.MakeSmoothRotateTo; @mtype Normal]]
                    ["MakeSmoothScaleBy"] = function(self, time, dir, isadd, len) end, --[[@service Trigger.CustomUI.MakeSmoothScaleBy; @mtype Normal]]
                    ["MakeSmoothScaleTo"] = function(self, time, w, h) end, --[[@service Trigger.CustomUI.MakeSmoothScaleTo; @mtype Normal]]
                    ["MakeUITextAnim"] = function(self, animid, time) end, --[[@service Trigger.CustomUI.MakeUITextAnim; @mtype Normal]]
                    ["PlayAnim"] = function(self, playerid, uiid, elementid, info) end, --[[@service Trigger.CustomUI.PlayAnim; @mtype Normal]]
                    ["PlaySmoothAnim"] = function(self, playerid, uiid, elementid, info) end, --[[@service Trigger.CustomUI.PlaySmoothAnim; @mtype Normal]]
                    ["SetBeaconBand"] = function(self, playerid, elementid, itype, param) end, --[[@service Trigger.CustomUI.SetBeaconBand; @mtype Normal]]
                    ["SetLoaderModelAct"] = function(self, playerid, uiid, elementid, animid, speed, playmode) end, --[[@service Trigger.CustomUI.SetLoaderModelAct; @mtype Normal]]
                    ["SetText"] = function(self, playerid, uiid, elementid, text, info) end, --[[@service Trigger.CustomUI.SetText; @mtype Normal]]
                },
                ["DoObjOrArrayAction"] = function(self, src, fn) end, --[[@service Trigger.DoObjOrArrayAction; @mtype Normal]]
                ["GameObject"] = {
                    ["CreatePrefabInst"] = function(self, objectType, prefabId, num, pos, worldId) end, --[[@service Trigger.GameObject.CreatePrefabInst; @mtype Normal]]
                    ["CreatePrefabInstEx"] = function(self, objectType, var, prefabId, num, pos, face, scale) end, --[[@service Trigger.GameObject.CreatePrefabInstEx; @mtype Normal]]
                    ["CreateSinglePrefabInst"] = function(self, objectType, prefabId, pos, worldId) end, --[[@service Trigger.GameObject.CreateSinglePrefabInst; @mtype Normal]]
                    ["GetObjectPrefab"] = function(self, itype, objId) end, --[[@service Trigger.GameObject.GetObjectPrefab; @mtype Normal]]
                    ["GetPrefabDes"] = function(self, info) end, --[[@service Trigger.GameObject.GetPrefabDes; @mtype Normal]]
                    ["GetPrefabName"] = function(self, info) end, --[[@service Trigger.GameObject.GetPrefabName; @mtype Normal]]
                },
                ["GetAttrVal"] = function(self, param) end, --[[@service Trigger.GetAttrVal; @mtype Normal]]
                ["GetByteCount"] = function(self, byte) end, --[[@service Trigger.GetByteCount; @mtype Normal]]
                ["GetEffectParams"] = function(self, cmp) end, --[[@service Trigger.GetEffectParams; @mtype Normal]]
                ["GetElementID"] = function(self, uiID, elementid) end, --[[@service Trigger.GetElementID; @mtype Normal]]
                ["GetLastCreateBlockId"] = function(self) end, --[[@service Trigger.GetLastCreateBlockId; @mtype Normal]]
                ["GetLastCreateCreatureId"] = function(self) end, --[[@service Trigger.GetLastCreateCreatureId; @mtype Normal]]
                ["GetLastCreateCreatureObjId"] = function(self) end, --[[@service Trigger.GetLastCreateCreatureObjId; @mtype Normal]]
                ["GetLastCreateEffectId"] = function(self) end, --[[@service Trigger.GetLastCreateEffectId; @mtype Normal]]
                ["GetLastCreateItemId"] = function(self) end, --[[@service Trigger.GetLastCreateItemId; @mtype Normal]]
                ["GetMobId"] = function(self, cmp) end, --[[@service Trigger.GetMobId; @mtype Normal]]
                ["GetPlayerId"] = function(self, cmp) end, --[[@service Trigger.GetPlayerId; @mtype Normal]]
                ["GetPrefabIdStr"] = function(self, id) end, --[[@service Trigger.GetPrefabIdStr; @mtype Normal]]
                ["GetPrefabInfo"] = function(self, id, objType) end, --[[@service Trigger.GetPrefabInfo; @mtype Normal]]
                ["GetRandomColor"] = function(self) end, --[[@service Trigger.GetRandomColor; @mtype Normal]]
                ["GetStringLength"] = function(self, str) end, --[[@service Trigger.GetStringLength; @mtype Normal]]
                ["GetUIObject"] = function(self, id) end, --[[@service Trigger.GetUIObject; @mtype Normal]]
                ["GetWorld"] = function(self) end, --[[@service Trigger.GetWorld; @mtype Normal]]
                ["Graphics"] = {
                    ["CreateFlotageTxtByActor"] = function(self, objid, info, dir, offest, x, y) end, --[[@service Trigger.Graphics.CreateFlotageTxtByActor; @mtype Normal]]
                    ["CreateFlotageTxtByPos"] = function(self, pos, GraphicInfo, x, y, worldId) end, --[[@service Trigger.Graphics.CreateFlotageTxtByPos; @mtype Normal]]
                    ["CreateGraphicsArrowByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsArrowByActorToActor; @mtype Normal]]
                    ["CreateGraphicsArrowByActorToPos"] = function(self, objid, info, dir, offest) end, --[[@service Trigger.Graphics.CreateGraphicsArrowByActorToPos; @mtype Normal]]
                    ["CreateGraphicsArrowByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsArrowByPosToActor; @mtype Normal]]
                    ["CreateGraphicsArrowByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsArrowByPosToPos; @mtype Normal]]
                    ["CreateGraphicsByActor"] = function(self, data, info, dir, offest) end, --[[@service Trigger.Graphics.CreateGraphicsByActor; @mtype Normal]]
                    ["CreateGraphicsByActor2"] = function(self, data, info, x, y) end, --[[@service Trigger.Graphics.CreateGraphicsByActor2; @mtype Normal]]
                    ["CreateGraphicsByPos"] = function(self, pos, GraphicInfo, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsByPos; @mtype Normal]]
                    ["CreateGraphicsByPos2"] = function(self, pos, GraphicInfo, x, y, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsByPos2; @mtype Normal]]
                    ["CreateGraphicsImageByActor"] = function(self, objid, info, dir, offest, x, y) end, --[[@service Trigger.Graphics.CreateGraphicsImageByActor; @mtype Normal]]
                    ["CreateGraphicsImageByPos"] = function(self, pos, GraphicInfo, x, y, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsImageByPos; @mtype Normal]]
                    ["CreateGraphicsLineByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsLineByActorToActor; @mtype Normal]]
                    ["CreateGraphicsLineByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsLineByActorToPos; @mtype Normal]]
                    ["CreateGraphicsLineByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsLineByPosToActor; @mtype Normal]]
                    ["CreateGraphicsLineByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsLineByPosToPos; @mtype Normal]]
                    ["CreateGraphicsNavPathByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsNavPathByActorToPos; @mtype Normal]]
                    ["CreateGraphicsSurfaceByActorToActor"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsSurfaceByActorToActor; @mtype Normal]]
                    ["CreateGraphicsSurfaceByActorToPos"] = function(self, objid, info, dir, offset) end, --[[@service Trigger.Graphics.CreateGraphicsSurfaceByActorToPos; @mtype Normal]]
                    ["CreateGraphicsSurfaceByPosToActor"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsSurfaceByPosToActor; @mtype Normal]]
                    ["CreateGraphicsSurfaceByPosToPos"] = function(self, pos, info, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsSurfaceByPosToPos; @mtype Normal]]
                    ["CreateGraphicsTxtByActor"] = function(self, objid, info, dir, offest, x, y) end, --[[@service Trigger.Graphics.CreateGraphicsTxtByActor; @mtype Normal]]
                    ["CreateGraphicsTxtByPos"] = function(self, pos, GraphicInfo, x, y, worldId) end, --[[@service Trigger.Graphics.CreateGraphicsTxtByPos; @mtype Normal]]
                    ["CreateProGressByActor"] = function(self, objid, info, dir, offest, x, y) end, --[[@service Trigger.Graphics.CreateProGressByActor; @mtype Normal]]
                    ["CreateProGressByPos"] = function(self, pos, info, x, y, worldId) end, --[[@service Trigger.Graphics.CreateProGressByPos; @mtype Normal]]
                    ["GetInnerGraphicsOffset"] = function(self, tuin, itype) end, --[[@service Trigger.Graphics.GetInnerGraphicsOffset; @mtype Normal]]
                    ["MakeGraphicsArrowToPos"] = function(self, pos, size, color, itype, worldId) end, --[[@service Trigger.Graphics.MakeGraphicsArrowToPos; @mtype Normal]]
                    ["MakeGraphicsLineToPos"] = function(self, pos, size, color, itype, worldId) end, --[[@service Trigger.Graphics.MakeGraphicsLineToPos; @mtype Normal]]
                    ["MakeGraphicsNavPathToPos"] = function(self, pos, itype, canSeePlayersArr) end, --[[@service Trigger.Graphics.MakeGraphicsNavPathToPos; @mtype Normal]]
                    ["MakeGraphicsSurfaceToPos"] = function(self, pos, size, color, itype, worldId) end, --[[@service Trigger.Graphics.MakeGraphicsSurfaceToPos; @mtype Normal]]
                    ["RemoveGraphicsByObjID"] = function(self, objids, itype, graphType) end, --[[@service Trigger.Graphics.RemoveGraphicsByObjID; @mtype Normal]]
                    ["RemoveGraphicsByPos"] = function(self, pos, itype, graphType, worldId) end, --[[@service Trigger.Graphics.RemoveGraphicsByPos; @mtype Normal]]
                },
                ["Item"] = {
                    ["ClearStorageBox"] = function(self, pos, worldId) end, --[[@service Trigger.Item.ClearStorageBox; @mtype Normal]]
                    ["CompareItemid"] = function(self, itemid, itemid2) end, --[[@service Trigger.Item.CompareItemid; @mtype Normal]]
                    ["CreateItemToStorageBox"] = function(self, itemid, num, pos, worldId) end, --[[@service Trigger.Item.CreateItemToStorageBox; @mtype Normal]]
                    ["DespawnItemFromStorageBox"] = function(self, itemid, num, pos, worldId) end, --[[@service Trigger.Item.DespawnItemFromStorageBox; @mtype Normal]]
                    ["GetFacade"] = function(self, itemid) end, --[[@service Trigger.Item.GetFacade; @mtype Normal]]
                    ["ToItemID"] = function(self, itemid) end, --[[@service Trigger.Item.ToItemID; @mtype Normal]]
                },
                ["KvMap"] = {
                    ["GetDataListBykey"] = function(self, varid, playerid, key, itype) end, --[[@service Trigger.KvMap.GetDataListBykey; @mtype Normal]]
                    ["GetOrderDataBykey"] = function(self, varid, playerid, ktype, key) end, --[[@service Trigger.KvMap.GetOrderDataBykey; @mtype Normal]]
                    ["RemoveDataListBykey"] = function(self, varid, playerid, key) end, --[[@service Trigger.KvMap.RemoveDataListBykey; @mtype Normal]]
                    ["RemoveOrderDataByKey"] = function(self, varid, playerid, ktype, key) end, --[[@service Trigger.KvMap.RemoveOrderDataByKey; @mtype Normal]]
                    ["SetDataListBykey"] = function(self, varid, playerid, key, value) end, --[[@service Trigger.KvMap.SetDataListBykey; @mtype Normal]]
                    ["SetOrderDataBykey"] = function(self, varid, playerid, ktype, key, opcode, value, extendinfo) end, --[[@service Trigger.KvMap.SetOrderDataBykey; @mtype Normal]]
                },
                ["Math"] = {
                    ["Abs"] = function(self, v1) end, --[[@service Trigger.Math.Abs; @mtype Normal]]
                    ["Ceil"] = function(self, v1) end, --[[@service Trigger.Math.Ceil; @mtype Normal]]
                    ["ColorTostring"] = function(self, v1) end, --[[@service Trigger.Math.ColorTostring; @mtype Normal]]
                    ["CompareGreater"] = function(self, v1, v2) end, --[[@service Trigger.Math.CompareGreater; @mtype Normal]]
                    ["CompareGreaterEqual"] = function(self, v1, v2) end, --[[@service Trigger.Math.CompareGreaterEqual; @mtype Normal]]
                    ["CompareLess"] = function(self, v1, v2) end, --[[@service Trigger.Math.CompareLess; @mtype Normal]]
                    ["CompareLessEqual"] = function(self, v1, v2) end, --[[@service Trigger.Math.CompareLessEqual; @mtype Normal]]
                    ["Concat"] = function(self, ...) end, --[[@service Trigger.Math.Concat; @mtype Normal]]
                    ["ContainStr"] = function(self, str1, str2) end, --[[@service Trigger.Math.ContainStr; @mtype Normal]]
                    ["Cos"] = function(self, v1) end, --[[@service Trigger.Math.Cos; @mtype Normal]]
                    ["Deg"] = function(self, v1) end, --[[@service Trigger.Math.Deg; @mtype Normal]]
                    ["DivAndFloor"] = function(self, v1, v2) end, --[[@service Trigger.Math.DivAndFloor; @mtype Normal]]
                    ["Equal"] = function(self, v1, v2) end, --[[@service Trigger.Math.Equal; @mtype Normal]]
                    ["Exp"] = function(self, v1) end, --[[@service Trigger.Math.Exp; @mtype Normal]]
                    ["Floor"] = function(self, v1) end, --[[@service Trigger.Math.Floor; @mtype Normal]]
                    ["IsEven"] = function(self, num) end, --[[@service Trigger.Math.IsEven; @mtype Normal]]
                    ["IsNegative"] = function(self, num) end, --[[@service Trigger.Math.IsNegative; @mtype Normal]]
                    ["IsOdd"] = function(self, num) end, --[[@service Trigger.Math.IsOdd; @mtype Normal]]
                    ["IsPositive"] = function(self, num) end, --[[@service Trigger.Math.IsPositive; @mtype Normal]]
                    ["IsPrime"] = function(self, num) end, --[[@service Trigger.Math.IsPrime; @mtype Normal]]
                    ["Isinteger"] = function(self, num) end, --[[@service Trigger.Math.Isinteger; @mtype Normal]]
                    ["Isnil"] = function(self, v1) end, --[[@service Trigger.Math.Isnil; @mtype Normal]]
                    ["Ldexp"] = function(self, v1, v2) end, --[[@service Trigger.Math.Ldexp; @mtype Normal]]
                    ["Log"] = function(self, v1) end, --[[@service Trigger.Math.Log; @mtype Normal]]
                    ["Log10"] = function(self, v1) end, --[[@service Trigger.Math.Log10; @mtype Normal]]
                    ["LogicCompareTable"] = function(self, a, b) end, --[[@service Trigger.Math.LogicCompareTable; @mtype Normal]]
                    ["MathAdd"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathAdd; @mtype Normal]]
                    ["MathArithmetic"] = function(self, fn, ...) end, --[[@service Trigger.Math.MathArithmetic; @mtype Normal]]
                    ["MathDivide"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathDivide; @mtype Normal]]
                    ["MathExtractOpt"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathExtractOpt; @mtype Normal]]
                    ["MathMultiply"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathMultiply; @mtype Normal]]
                    ["MathSub"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathSub; @mtype Normal]]
                    ["MathUnFixedBaseLog"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathUnFixedBaseLog; @mtype Normal]]
                    ["MathXor"] = function(self, v1, v2) end, --[[@service Trigger.Math.MathXor; @mtype Normal]]
                    ["Max"] = function(self, v1, v2) end, --[[@service Trigger.Math.Max; @mtype Normal]]
                    ["Min"] = function(self, v1, v2) end, --[[@service Trigger.Math.Min; @mtype Normal]]
                    ["Mod"] = function(self, v1, v2) end, --[[@service Trigger.Math.Mod; @mtype Normal]]
                    ["ModEqualZero"] = function(self, v1, v2) end, --[[@service Trigger.Math.ModEqualZero; @mtype Normal]]
                    ["Negate"] = function(self, v1) end, --[[@service Trigger.Math.Negate; @mtype Normal]]
                    ["NotEqual"] = function(self, v1, v2) end, --[[@service Trigger.Math.NotEqual; @mtype Normal]]
                    ["Pow"] = function(self, v1, v2) end, --[[@service Trigger.Math.Pow; @mtype Normal]]
                    ["Pow10"] = function(self, v1) end, --[[@service Trigger.Math.Pow10; @mtype Normal]]
                    ["Rad"] = function(self, v1) end, --[[@service Trigger.Math.Rad; @mtype Normal]]
                    ["Random"] = function(self, v1, v2) end, --[[@service Trigger.Math.Random; @mtype Normal]]
                    ["Round"] = function(self, v1) end, --[[@service Trigger.Math.Round; @mtype Normal]]
                    ["Sin"] = function(self, v1) end, --[[@service Trigger.Math.Sin; @mtype Normal]]
                    ["Sqrt"] = function(self, v1) end, --[[@service Trigger.Math.Sqrt; @mtype Normal]]
                    ["StrToBool"] = function(self, str) end, --[[@service Trigger.Math.StrToBool; @mtype Normal]]
                    ["StrToColor"] = function(self, str) end, --[[@service Trigger.Math.StrToColor; @mtype Normal]]
                    ["StrToV3"] = function(self, str) end, --[[@service Trigger.Math.StrToV3; @mtype Normal]]
                    ["Tan"] = function(self, v1) end, --[[@service Trigger.Math.Tan; @mtype Normal]]
                    ["TanAngle2Rad"] = function(self, v1) end, --[[@service Trigger.Math.TanAngle2Rad; @mtype Normal]]
                    ["Tostring"] = function(self, v1) end, --[[@service Trigger.Math.Tostring; @mtype Normal]]
                    ["V3Tostring"] = function(self, v1) end, --[[@service Trigger.Math.V3Tostring; @mtype Normal]]
                },
                ["Monster"] = {
                    ["GetMonsterFacade"] = function(self, monsterid) end, --[[@service Trigger.Monster.GetMonsterFacade; @mtype Normal]]
                },
                ["Player"] = {
                    ["ChangeViewMode"] = function(self, data, viewmode, islock) end, --[[@service Trigger.Player.ChangeViewMode; @mtype Normal]]
                    ["EventGridID2GridEnum"] = function(self, gridid) end, --[[@service Trigger.Player.EventGridID2GridEnum; @mtype Normal]]
                    ["GetAimPoint"] = function(self, objid) end, --[[@service Trigger.Player.GetAimPoint; @mtype Normal]]
                    ["GetAttr"] = function(self, playerid, attr) end, --[[@service Trigger.Player.GetAttr; @mtype Normal]]
                    ["GetBackPackGridID"] = function(self, ix) end, --[[@service Trigger.Player.GetBackPackGridID; @mtype Normal]]
                    ["GetBackpackItemNum"] = function(self, objid, itemid) end, --[[@service Trigger.Player.GetBackpackItemNum; @mtype Normal]]
                    ["GetEquipGridID"] = function(self, ix) end, --[[@service Trigger.Player.GetEquipGridID; @mtype Normal]]
                    ["GetFirstInviter"] = function(self, uin) end, --[[@service Trigger.Player.GetFirstInviter; @mtype Normal]]
                    ["GetGridItemID"] = function(self, playerid, gridid) end, --[[@service Trigger.Player.GetGridItemID; @mtype Normal]]
                    ["GetGridItemNum"] = function(self, playerid, gridid) end, --[[@service Trigger.Player.GetGridItemNum; @mtype Normal]]
                    ["GetMusicId"] = function(self, objid, musicId) end, --[[@service Trigger.Player.GetMusicId; @mtype Normal]]
                    ["GetRayOriginPos"] = function(self, uin) end, --[[@service Trigger.Player.GetRayOriginPos; @mtype Normal]]
                    ["GetRevivePoint"] = function(self, objid, worldId) end, --[[@service Trigger.Player.GetRevivePoint; @mtype Normal]]
                    ["GetShortCutGridID"] = function(self, ix) end, --[[@service Trigger.Player.GetShortCutGridID; @mtype Normal]]
                    ["HasFriend"] = function(self, playerid, friendid, flag) end, --[[@service Trigger.Player.HasFriend; @mtype Normal]]
                    ["IsMiniVip"] = function(self, playerid) end, --[[@service Trigger.Player.IsMiniVip; @mtype Normal]]
                    ["MakeCamerFvoAttr"] = function(self, playerid) end, --[[@service Trigger.Player.MakeCamerFvoAttr; @mtype Normal]]
                    ["MakeCamerPosAttr"] = function(self, playerid, dir) end, --[[@service Trigger.Player.MakeCamerPosAttr; @mtype Normal]]
                    ["MakeCamerRotAttr"] = function(self, playerid, dir) end, --[[@service Trigger.Player.MakeCamerRotAttr; @mtype Normal]]
                    ["MoveGridItem"] = function(self, playerid, num, gridsrc, griddst) end, --[[@service Trigger.Player.MoveGridItem; @mtype Normal]]
                    ["NotifyGameInfo2Self"] = function(self, data, content) end, --[[@service Trigger.Player.NotifyGameInfo2Self; @mtype Normal]]
                    ["NotifySystemMsg2Self"] = function(self, data, content) end, --[[@service Trigger.Player.NotifySystemMsg2Self; @mtype Normal]]
                    ["OpenDevGoodsWearHouse"] = function(self, uin) end, --[[@service Trigger.Player.OpenDevGoodsWearHouse; @mtype Normal]]
                    ["OpenInnerView"] = function(self, data, bopen, view, exparam) end, --[[@service Trigger.Player.OpenInnerView; @mtype Normal]]
                    ["OpenInnerView_AdventureHandBook"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_AdventureHandBook; @mtype Normal]]
                    ["OpenInnerView_AnimView"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_AnimView; @mtype Normal]]
                    ["OpenInnerView_BackPackEra"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_BackPackEra; @mtype Normal]]
                    ["OpenInnerView_BackPackRole"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_BackPackRole; @mtype Normal]]
                    ["OpenInnerView_BackPackTask"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_BackPackTask; @mtype Normal]]
                    ["OpenInnerView_BuffStatus"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_BuffStatus; @mtype Normal]]
                    ["OpenInnerView_CollectMaps"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_CollectMaps; @mtype Normal]]
                    ["OpenInnerView_EvaluateMaps"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_EvaluateMaps; @mtype Normal]]
                    ["OpenInnerView_FollowTheAuthor"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_FollowTheAuthor; @mtype Normal]]
                    ["OpenInnerView_InviteFriend"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_InviteFriend; @mtype Normal]]
                    ["OpenInnerView_ItemProcessing"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_ItemProcessing; @mtype Normal]]
                    ["OpenInnerView_ItemTips"] = function(self, data, bopen, itemid) end, --[[@service Trigger.Player.OpenInnerView_ItemTips; @mtype Normal]]
                    ["OpenInnerView_MiniMap"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_MiniMap; @mtype Normal]]
                    ["OpenInnerView_MiniShop"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_MiniShop; @mtype Normal]]
                    ["OpenInnerView_Specialty"] = function(self, data, bopen) end, --[[@service Trigger.Player.OpenInnerView_Specialty; @mtype Normal]]
                    ["OpenInnerView_StorageBox"] = function(self, data, bopen, pos) end, --[[@service Trigger.Player.OpenInnerView_StorageBox; @mtype Normal]]
                    ["PaseOrResumeMusic"] = function(self, data, musicId) end, --[[@service Trigger.Player.PaseOrResumeMusic; @mtype Normal]]
                    ["PauseMusic"] = function(self, data, musicId) end, --[[@service Trigger.Player.PauseMusic; @mtype Normal]]
                    ["PlayMusic"] = function(self, data, musicId, volume, pitch, isLoop) end, --[[@service Trigger.Player.PlayMusic; @mtype Normal]]
                    ["ResetCameraAttr"] = function(self, data) end, --[[@service Trigger.Player.ResetCameraAttr; @mtype Normal]]
                    ["ResumeMusic"] = function(self, data, musicId) end, --[[@service Trigger.Player.ResumeMusic; @mtype Normal]]
                    ["RotateCamera"] = function(self, data, yaw, pitch) end, --[[@service Trigger.Player.RotateCamera; @mtype Normal]]
                    ["SetAttr"] = function(self, playerid, attr, value) end, --[[@service Trigger.Player.SetAttr; @mtype Normal]]
                    ["SetCameraAnimFov"] = function(self, data, isadd, value, animid, time) end, --[[@service Trigger.Player.SetCameraAnimFov; @mtype Normal]]
                    ["SetCameraAnimPos"] = function(self, data, sigdir, isadd, value, animid, time) end, --[[@service Trigger.Player.SetCameraAnimPos; @mtype Normal]]
                    ["SetCameraAnimPosEx"] = function(self, data, sigdir, isadd, value, animid, time) end, --[[@service Trigger.Player.SetCameraAnimPosEx; @mtype Normal]]
                    ["SetCameraAnimRot"] = function(self, data, sigdir, isadd, value, animid, time) end, --[[@service Trigger.Player.SetCameraAnimRot; @mtype Normal]]
                    ["SetCameraAttrState"] = function(self, data, attr, enable) end, --[[@service Trigger.Player.SetCameraAttrState; @mtype Normal]]
                    ["SetCameraMountObj"] = function(self, data, objid) end, --[[@service Trigger.Player.SetCameraMountObj; @mtype Normal]]
                    ["SetCameraMountPos"] = function(self, data, pos) end, --[[@service Trigger.Player.SetCameraMountPos; @mtype Normal]]
                    ["SetCameraRotMode"] = function(self, data, attr) end, --[[@service Trigger.Player.SetCameraRotMode; @mtype Normal]]
                    ["SetGameDefeat"] = function(self, data) end, --[[@service Trigger.Player.SetGameDefeat; @mtype Normal]]
                    ["SetGameWin"] = function(self, data) end, --[[@service Trigger.Player.SetGameWin; @mtype Normal]]
                    ["SetGunActionState"] = function(self, data, attr, switch) end, --[[@service Trigger.Player.SetGunActionState; @mtype Normal]]
                    ["SetItemDropAttAction"] = function(self, data, itemid, switch) end, --[[@service Trigger.Player.SetItemDropAttAction; @mtype Normal]]
                    ["SetItemThrowAttAction"] = function(self, data, itemid, switch) end, --[[@service Trigger.Player.SetItemThrowAttAction; @mtype Normal]]
                    ["SetJoinJudge"] = function(self, data) end, --[[@service Trigger.Player.SetJoinJudge; @mtype Normal]]
                    ["SetMobileVibrate"] = function(self, data, time, amplitude) end, --[[@service Trigger.Player.SetMobileVibrate; @mtype Normal]]
                    ["SetQuitJudge"] = function(self, data) end, --[[@service Trigger.Player.SetQuitJudge; @mtype Normal]]
                    ["SetRevivePoint"] = function(self, data, pos, worldId) end, --[[@service Trigger.Player.SetRevivePoint; @mtype Normal]]
                    ["ShakeCamera"] = function(self, data, duration, power) end, --[[@service Trigger.Player.ShakeCamera; @mtype Normal]]
                    ["StopMusic"] = function(self, data, musicId) end, --[[@service Trigger.Player.StopMusic; @mtype Normal]]
                    ["StopShakeCamera"] = function(self, data) end, --[[@service Trigger.Player.StopShakeCamera; @mtype Normal]]
                    ["ToBackPackGridID"] = function(self, ix) end, --[[@service Trigger.Player.ToBackPackGridID; @mtype Normal]]
                    ["ToEquipGridID"] = function(self, ix) end, --[[@service Trigger.Player.ToEquipGridID; @mtype Normal]]
                    ["ToShortCutGridID"] = function(self, ix) end, --[[@service Trigger.Player.ToShortCutGridID; @mtype Normal]]
                    ["UseItem"] = function(self, data, itemnum, itemid) end, --[[@service Trigger.Player.UseItem; @mtype Normal]]
                },
                ["PrintTag"] = function(self, tag, ...) end, --[[@service Trigger.PrintTag; @mtype Normal]]
                ["SetLastCreateBlockId"] = function(self, blockid) end, --[[@service Trigger.SetLastCreateBlockId; @mtype Normal]]
                ["SetLastCreateCreatureId"] = function(self, actorid) end, --[[@service Trigger.SetLastCreateCreatureId; @mtype Normal]]
                ["SetLastCreateCreatureObjId"] = function(self, objid) end, --[[@service Trigger.SetLastCreateCreatureObjId; @mtype Normal]]
                ["SetLastCreateEffectId"] = function(self, effectid) end, --[[@service Trigger.SetLastCreateEffectId; @mtype Normal]]
                ["SetLastCreateItemId"] = function(self, itemid) end, --[[@service Trigger.SetLastCreateItemId; @mtype Normal]]
                ["SplitStr"] = function(self, str, mark, index) end, --[[@service Trigger.SplitStr; @mtype Normal]]
                ["Str2Obj"] = function(self, itype, str) end, --[[@service Trigger.Str2Obj; @mtype Normal]]
                ["String2Playerid"] = function(self, str) end, --[[@service Trigger.String2Playerid; @mtype Normal]]
                ["Substring"] = function(self, content, startIdx, endIdx) end, --[[@service Trigger.Substring; @mtype Normal]]
                ["Timeline"] = {
                    ["GetDisplayName"] = function(self, filename) end, --[[@service Trigger.Timeline.GetDisplayName; @mtype Normal]]
                    ["Pause"] = function(self, data, filename) end, --[[@service Trigger.Timeline.Pause; @mtype Normal]]
                    ["PlayForPlayer"] = function(self, data, filename, playRef, a, b) end, --[[@service Trigger.Timeline.PlayForPlayer; @mtype Normal]]
                    ["Resume"] = function(self, data, filename) end, --[[@service Trigger.Timeline.Resume; @mtype Normal]]
                    ["SkipForPlayer"] = function(self, data) end, --[[@service Trigger.Timeline.SkipForPlayer; @mtype Normal]]
                },
                ["ToAnyID"] = function(self, itemid) end, --[[@service Trigger.ToAnyID; @mtype Normal]]
                ["ToMobId"] = function(self, id) end, --[[@service Trigger.ToMobId; @mtype Normal]]
                ["ToPlayerId"] = function(self, id) end, --[[@service Trigger.ToPlayerId; @mtype Normal]]
                ["TransmitToCategoryRoom"] = function(self, players, mapid, categorys) end, --[[@service Trigger.TransmitToCategoryRoom; @mtype Normal; @rtype TimeLimit=30; @rtype WhiteList="trigger_api3_MapTagTransfer"]]
                ["Wait"] = function(self, second, cmp) end, --[[@service Trigger.Wait; @mtype Normal]]
                ["World"] = {
                    ["CalcDirectionByPos2Pos"] = function(self, pos1, pos2) end, --[[@service Trigger.World.CalcDirectionByPos2Pos; @mtype Normal]]
                    ["CalcHorizontalAngle"] = function(self, posSrc, posDst) end, --[[@service Trigger.World.CalcHorizontalAngle; @mtype Normal]]
                    ["CalcVectorDirectionAngle"] = function(self, vec1, vec2) end, --[[@service Trigger.World.CalcVectorDirectionAngle; @mtype Normal]]
                    ["CalcVerticalAngle"] = function(self, posSrc, posDst) end, --[[@service Trigger.World.CalcVerticalAngle; @mtype Normal]]
                    ["CanMobSpawnOnPosXZ"] = function(self, pos, worldId) end, --[[@service Trigger.World.CanMobSpawnOnPosXZ; @mtype Normal]]
                    ["CompareBiomeGroup"] = function(self, v1, v2) end, --[[@service Trigger.World.CompareBiomeGroup; @mtype Normal]]
                    ["CompareGameMode"] = function(self, isequal, mode) end, --[[@service Trigger.World.CompareGameMode; @mtype Normal]]
                    ["DespawnActor"] = function(self, killtype, data) end, --[[@service Trigger.World.DespawnActor; @mtype Normal]]
                    ["DespawnAreas"] = function(self, data) end, --[[@service Trigger.World.DespawnAreas; @mtype Normal]]
                    ["DespawnObject"] = function(self, data) end, --[[@service Trigger.World.DespawnObject; @mtype Normal]]
                    ["GetBiomeGroup"] = function(self, pos, worldId) end, --[[@service Trigger.World.GetBiomeGroup; @mtype Normal]]
                    ["GetContainerGridAttr"] = function(self, pos, gridid, attr, worldId) end, --[[@service Trigger.World.GetContainerGridAttr; @mtype Normal]]
                    ["GetContainerStorageItem"] = function(self, pos, gridid, worldId) end, --[[@service Trigger.World.GetContainerStorageItem; @mtype Normal]]
                    ["GetCoord"] = function(self, pos, v) end, --[[@service Trigger.World.GetCoord; @mtype Normal]]
                    ["GetDirRayDetection"] = function(self, posbegin, dir, maxlen, itype, worldId) end, --[[@service Trigger.World.GetDirRayDetection; @mtype Normal]]
                    ["GetLightByPos"] = function(self, pos, worldId) end, --[[@service Trigger.World.GetLightByPos; @mtype Normal]]
                    ["GetMusicId"] = function(self, pos, musicId) end, --[[@service Trigger.World.GetMusicId; @mtype Normal]]
                    ["GetRayBlock"] = function(self, pos, face, distance) end, --[[@service Trigger.World.GetRayBlock; @mtype Normal]]
                    ["GetRayDetectionPos"] = function(self, posbegin, dir, maxlen, itype, worldId) end, --[[@service Trigger.World.GetRayDetectionPos; @mtype Normal]]
                    ["GetRayLength"] = function(self, pos1, pos2, distance) end, --[[@service Trigger.World.GetRayLength; @mtype Normal]]
                    ["GetSpawnPoint"] = function(self, worldid) end, --[[@service Trigger.World.GetSpawnPoint; @mtype Normal]]
                    ["IsChunkLoaded"] = function(self, pos, worldId) end, --[[@service Trigger.World.IsChunkLoaded; @mtype Normal]]
                    ["OffsetPos"] = function(self, pos, x, y, z) end, --[[@service Trigger.World.OffsetPos; @mtype Normal]]
                    ["OffsetPosVal"] = function(self, pos, x, y, z) end, --[[@service Trigger.World.OffsetPosVal; @mtype Normal]]
                    ["PaseOrResumeSoundEffectOnPos"] = function(self, pos, musicId, worldId) end, --[[@service Trigger.World.PaseOrResumeSoundEffectOnPos; @mtype Normal]]
                    ["PauseSoundEffectOnPos"] = function(self, pos, musicId, worldId) end, --[[@service Trigger.World.PauseSoundEffectOnPos; @mtype Normal]]
                    ["PlayParticle"] = function(self, pos, particleIds, ptime, offset, rot, scale, worldId) end, --[[@service Trigger.World.PlayParticle; @mtype Normal]]
                    ["PlayParticleEffect"] = function(self, pos, particleId, scale, ptime) end, --[[@service Trigger.World.PlayParticleEffect; @mtype Normal]]
                    ["ResumeSoundEffectOnPos"] = function(self, pos, musicId, worldId) end, --[[@service Trigger.World.ResumeSoundEffectOnPos; @mtype Normal]]
                    ["SetContainerGridAttr"] = function(self, pos, gridid, attr, value) end, --[[@service Trigger.World.SetContainerGridAttr; @mtype Normal]]
                    ["SetLightByPos"] = function(self, pos, value, worldId) end, --[[@service Trigger.World.SetLightByPos; @mtype Normal]]
                    ["SetParticleEffectScale"] = function(self, pos, particleId, sclae) end, --[[@service Trigger.World.SetParticleEffectScale; @mtype Normal]]
                    ["SetParticleTransform"] = function(self, pos, particleIds, offset, rot, scale, worldId) end, --[[@service Trigger.World.SetParticleTransform; @mtype Normal]]
                    ["SetSkyBoxColorAnim"] = function(self, data, itype, color, animId, animTime, worldid) end, --[[@service Trigger.World.SetSkyBoxColorAnim; @mtype Normal]]
                    ["SetSkyBoxFilter"] = function(self, data, itype, value, worldid) end, --[[@service Trigger.World.SetSkyBoxFilter; @mtype Normal]]
                    ["SetSkyBoxFilterColor"] = function(self, playerid, value, worldid) end, --[[@service Trigger.World.SetSkyBoxFilterColor; @mtype Normal]]
                    ["SetSkyBoxFilterColorAnim"] = function(self, data, value, animId, animTime, worldid) end, --[[@service Trigger.World.SetSkyBoxFilterColorAnim; @mtype Normal]]
                    ["SetSkyBoxFilterLUT"] = function(self, playerid, value, worldid) end, --[[@service Trigger.World.SetSkyBoxFilterLUT; @mtype Normal]]
                    ["SetSkyBoxFilterTemplate"] = function(self, playerid, value, worldid) end, --[[@service Trigger.World.SetSkyBoxFilterTemplate; @mtype Normal]]
                    ["SetSkyBoxMapsAnim"] = function(self, data, itype, url, animId, animTime, worldid) end, --[[@service Trigger.World.SetSkyBoxMapsAnim; @mtype Normal]]
                    ["SetSpawnPoint"] = function(self, obiid, pos) end, --[[@service Trigger.World.SetSpawnPoint; @mtype Normal]]
                    ["SetStorageItem"] = function(self, pos, offset, itemid, num, worldId) end, --[[@service Trigger.World.SetStorageItem; @mtype Normal]]
                    ["SpawnProjectileOnPos"] = function(self, pos, itemid, dst, worldId) end, --[[@service Trigger.World.SpawnProjectileOnPos; @mtype Normal]]
                    ["SpawnShooterProjectile"] = function(self, objid, dir, itemid) end, --[[@service Trigger.World.SpawnShooterProjectile; @mtype Normal]]
                    ["SpawnShooterProjectileByPos"] = function(self, pos, objid, itemid, dst) end, --[[@service Trigger.World.SpawnShooterProjectileByPos; @mtype Normal]]
                    ["StopParticleEffectOnPos"] = function(self, pos, particleIds) end, --[[@service Trigger.World.StopParticleEffectOnPos; @mtype Normal]]
                    ["StopParticleOnPos"] = function(self, pos, particleIds, worldId) end, --[[@service Trigger.World.StopParticleOnPos; @mtype Normal]]
                    ["XyzToPos"] = function(self, x, y, z) end, --[[@service Trigger.World.XyzToPos; @mtype Normal]]
                },
            },
            ["TriggerEvent"] = {
                ["ActorAddBuff"] = "Actor.AddBuff",
                ["ActorAreaIn"] = "Actor.AreaIn",
                ["ActorAreaOut"] = "Actor.AreaOut",
                ["ActorAttack"] = "Object.Attack",
                ["ActorAttackHit"] = "Actor.AttackHit",
                ["ActorBeHurt"] = "Actor.BeHurt",
                ["ActorBeat"] = "Actor.Beat",
                ["ActorChangeAttr"] = "Actor.ChangeAttr",
                ["ActorChangeMotion"] = "Actor.ChangeMotion",
                ["ActorClickActor"] = "Actor.ClickActor",
                ["ActorCollide"] = "Actor.Collide.Begin",
                ["ActorCreate"] = "Actor.Create",
                ["ActorDamage"] = "Actor.Damage",
                ["ActorDie"] = "Actor.Die",
                ["ActorPickupActor"] = "Actor.PickupActor",
                ["ActorProjectileHit"] = "Actor.Projectile.Hit",
                ["ActorRemoveBuff"] = "Actor.RemoveBuff",
                ["AreaObjAreaIn"] = "AreaObj.AreaIn",
                ["AreaObjAreaOut"] = "AreaObj.AreaOut",
                ["AreaObjCollideToAreaObj"] = "AreaObj.CollideAreaObj",
                ["AreaObjCollideToDropItem"] = "AreaObj.CollideDropItem",
                ["AreaObjCollideToEntity"] = "AreaObj.CollideEntity",
                ["AreaObjCollideToMissile"] = "AreaObj.CollideMissile",
                ["AreaObjCollideToMob"] = "AreaObj.CollideMob",
                ["AreaObjCollideToPlayer"] = "AreaObj.CollidePlayer",
                ["AreaObjCreate"] = "AreaObj.Create",
                ["AtorPlayAnim"] = "Ator.PlayAnim",
                ["BackpackItemChange"] = "Backpack.ItemChange",
                ["BackpackItemPutIn"] = "Backpack.ItemPutIn",
                ["BackpackItemTakeOut"] = "Backpack.ItemTakeOut",
                ["BiomeActorSpawn"] = "Biome.ActorSpawn",
                ["BlockAdd"] = "Block.Add",
                ["BlockBeTouched"] = "Block.BeTouched",
                ["BlockChangeColor"] = "Block.ChangeColor",
                ["BlockChangeDir"] = "Block.BlockChangeDir",
                ["BlockChunkExtraBuild"] = "Block.Chunk.ExtraBuild",
                ["BlockContainerChange"] = "Backpack.ItemChange",
                ["BlockContainerPutIn"] = "Backpack.ItemPutIn",
                ["BlockContainerTakeOut"] = "Backpack.ItemTakeOut",
                ["BlockDestroyBy"] = "Block.DestroyBy",
                ["BlockDigBegin"] = "Block.Dig.Begin",
                ["BlockDigCancel"] = "Block.Dig.Cancel",
                ["BlockDigEnd"] = "Block.Dig.End",
                ["BlockDropModReward"] = "Block.DropModReward",
                ["BlockPlaceBy"] = "Block.PlaceBy",
                ["BlockRemove"] = "Block.Remove",
                ["BlockTrigger"] = "Block.Trigger",
                ["BluePrintBuildBegin"] = "BluePrint.BuildBegin",
                ["BuildActorSpawn"] = "Build.ActorSpawn",
                ["BuildBaseActorSpawn"] = "Build.BaseActorSpawn",
                ["BuildBaseZombieSpawn"] = "Build.BaseZombieSpawn",
                ["BuildPlace"] = "Build.Place",
                ["BuildReport"] = "Build.Report",
                ["BuildZombieSpawn"] = "Build.ZombieSpawn",
                ["CaptureAndUploadScreenshot"] = "Game.CaptureAndUploadScreenshot",
                ["CheckSummoner"] = "Summoner.CheckSummoner",
                ["CityReport"] = "City.Report",
                ["ComputerSendOrderEvent"] = "Computer.SendOrderEvent",
                ["CraftEnd"] = "Craft.end",
                ["DeveloperBuyItem"] = "Developer.BuyItem",
                ["DropItemAreaIn"] = "DropItem.AreaIn",
                ["DropItemAreaOut"] = "DropItem.AreaOut",
                ["DropItemCollideToAreaObj"] = "DropItem.CollideAreaObj",
                ["DropItemCollideToDropItem"] = "DropItem.CollideDropItem",
                ["DropItemCollideToEntity"] = "DropItem.CollideEntity",
                ["DropItemCollideToMissile"] = "DropItem.CollideMissile",
                ["DropItemCollideToMob"] = "DropItem.CollideMob",
                ["DropItemCollideToPlayer"] = "DropItem.CollidePlayer",
                ["DropItemPickup"] = "DropItem.Pickup",
                ["EntityAreaIn"] = "Entity.AreaIn",
                ["EntityAreaOut"] = "Entity.AreaOut",
                ["EntityCollideToAreaObj"] = "Entity.CollideAreaObj",
                ["EntityCollideToDropItem"] = "Entity.CollideDropItem",
                ["EntityCollideToEntity"] = "Entity.CollideEntity",
                ["EntityCollideToMissile"] = "Entity.CollideMissile",
                ["EntityCollideToMob"] = "Entity.CollideMob",
                ["EntityCollideToPlayer"] = "Entity.CollidePlayer",
                ["EntityCreate"] = "Entity.Create",
                ["FurnaceBegin"] = "Furnace.begin",
                ["FurnaceEnd"] = "Furnace.end",
                ["GameAnyPlayerDefeat"] = "Game.AnyPlayer.Defeat",
                ["GameAnyPlayerEnterGame"] = "Game.AnyPlayer.EnterGame",
                ["GameAnyPlayerLeaveGame"] = "Game.AnyPlayer.LeaveGame",
                ["GameAnyPlayerVictory"] = "Game.AnyPlayer.Victory",
                ["GameHour"] = "Game.Hour",
                ["GameStart"] = "GameStart",
                ["GroupWeatherChanged"] = "GroupWeather.Changed",
                ["ItemAddDuration"] = "Item.AddDuration",
                ["ItemCreate"] = "Item.Create",
                ["ItemDamage"] = "Item.Damage",
                ["ItemDestroy"] = "Item.Destroy",
                ["ItemDisappear"] = "Item.Disappear",
                ["ItemDiscardItem"] = "Item.DiscardItem",
                ["ItemExpend"] = "Item.expend",
                ["ItemPickup"] = "Item.Pickup",
                ["ItemTipsOpen"] = "ItemTips.Open",
                ["MainTaskCheck"] = "MainTask.Check",
                ["MainTaskGain"] = "MainTask.Gain",
                ["MiniMapIconClick"] = "MiniMapIconClick",
                ["MinitimerChange"] = "minitimer.change",
                ["MissileAreaIn"] = "Missile.AreaIn",
                ["MissileAreaOut"] = "Missile.AreaOut",
                ["MissileCollideToAreaObj"] = "Missile.CollideAreaObj",
                ["MissileCollideToDropItem"] = "Missile.CollideDropItem",
                ["MissileCollideToEntity"] = "Missile.CollideEntity",
                ["MissileCollideToMissile"] = "Missile.CollideMissile",
                ["MissileCollideToMob"] = "Missile.CollideMob",
                ["MissileCollideToPlayer"] = "Missile.CollidePlayer",
                ["MissileCreate"] = "Missile.Create",
                ["MobAddBuff"] = "Actor.AddBuff",
                ["MobAreaIn"] = "Actor.AreaIn",
                ["MobAreaOut"] = "Actor.AreaOut",
                ["MobAttack"] = "Actor.Attack",
                ["MobAttackHit"] = "Actor.AttackHit",
                ["MobAttrStateChange"] = "Mob.AttrStateChange",
                ["MobBeClick"] = "Actor.ClickActor",
                ["MobBeHurt"] = "Actor.BeHurt",
                ["MobBeInteract"] = "Mob.BeInteract",
                ["MobBeat"] = "Actor.Beat",
                ["MobChangeAttr"] = "Actor.ChangeAttr",
                ["MobChangeMotion"] = "Actor.ChangeMotion",
                ["MobCollide"] = "Actor.Collide.Begin",
                ["MobCollideToAreaObj"] = "Mob.CollideAreaObj",
                ["MobCollideToDropItem"] = "Mob.CollideDropItem",
                ["MobCollideToEntity"] = "Mob.CollideEntity",
                ["MobCollideToMissile"] = "Mob.CollideMissile",
                ["MobCollideToMob"] = "Mob.CollideMob",
                ["MobCollideToPlayer"] = "Mob.CollidePlayer",
                ["MobCreate"] = "Actor.Create",
                ["MobDamage"] = "Actor.Damage",
                ["MobDie"] = "Actor.Die",
                ["MobDismountActor"] = "Actor.DismountActor",
                ["MobModelChange"] = "Mob.ModelChange",
                ["MobMotionStateChange"] = "Mob.MotionStateChange",
                ["MobMountActor"] = "Actor.MountActor",
                ["MobProjectileHit"] = "Actor.Projectile.Hit",
                ["MobRemoveBuff"] = "Actor.RemoveBuff",
                ["ObjBeTouched"] = "Obj.BeTouched",
                ["ObsBluePrintBuildBegin"] = "ObsBluePrint.BuildBegin",
                ["ObsBluePrintBuildEnd"] = "ObsBluePrint.BuildEnd",
                ["ObsBluePrintLoaded"] = "ObsBluePrint.Loaded",
                ["ObsBluePrintUnLoaded"] = "ObsBluePrint.UnLoaded",
                ["ParticleEntityOnCreate"] = "Particle.Entity.OnCreate",
                ["ParticleItemOnCreate"] = "Particle.Item.OnCreate",
                ["ParticleMobOnCreate"] = "Particle.Mob.OnCreate",
                ["ParticleObjectOnCreate"] = "Particle.Object.OnCreate",
                ["ParticlePlayerOnCreate"] = "Particle.Player.OnCreate",
                ["ParticlePosOnCreate"] = "Particle.Pos.OnCreate",
                ["ParticleProjectileOnCreate"] = "Particle.Projectile.OnCreate",
                ["PayMapShopOrder"] = "Game.PayMapShopOrder",
                ["PlanetCreated"] = "Planet.Created",
                ["PlayerAddBuff"] = "Player.AddBuff",
                ["PlayerAddItem"] = "Player.AddItem",
                ["PlayerAnimFinish"] = "Player.AnimFinish",
                ["PlayerAreaIn"] = "Player.AreaIn",
                ["PlayerAreaOut"] = "Player.AreaOut",
                ["PlayerAttack"] = "Player.Attack",
                ["PlayerAttackHit"] = "Player.AttackHit",
                ["PlayerAttrStateChange"] = "Player.AttrStateChange",
                ["PlayerBackPackAddItem"] = "Player.BackPackAddItem",
                ["PlayerBackPackChange"] = "Player.BackPackChange",
                ["PlayerBackPackRemItem"] = "Player.BackPackRemItem",
                ["PlayerBeHurt"] = "Player.BeHurt",
                ["PlayerChangeAttr"] = "Player.ChangeAttr",
                ["PlayerChangeCoin"] = "Player.ChangeCoin",
                ["PlayerChargeItemBegin"] = "Player.ChargeItem.Begin",
                ["PlayerChargeItemEnd"] = "Player.ChargeItem.End",
                ["PlayerClickActor"] = "Player.ClickActor",
                ["PlayerClickBlock"] = "Player.ClickBlock",
                ["PlayerClickDropItem"] = "Player.ClickDropItem",
                ["PlayerClickEntity"] = "Player.ClickEntity",
                ["PlayerClickMob"] = "Player.ClickMob",
                ["PlayerClickPlayer"] = "Player.ClickPlayer",
                ["PlayerClickProjectile"] = "Player.ClickProjectile",
                ["PlayerCloseInnerView"] = "Player.CloseInnerView",
                ["PlayerCollide"] = "Player.Collide.Begin",
                ["PlayerCollideToAreaObj"] = "Player.CollideAreaObj",
                ["PlayerCollideToDropItem"] = "Player.CollideDropItem",
                ["PlayerCollideToEntity"] = "Player.CollideEntity",
                ["PlayerCollideToMissile"] = "Player.CollideMissile",
                ["PlayerCollideToMob"] = "Player.CollideMob",
                ["PlayerCollideToPlayer"] = "Player.CollidePlayer",
                ["PlayerConsumeItem"] = "Player.ConsumeItem",
                ["PlayerDamageActor"] = "Player.DamageActor",
                ["PlayerDefeatActor"] = "Player.DefeatActor",
                ["PlayerDie"] = "Player.Die",
                ["PlayerDiscardItem"] = "Player.DiscardItem",
                ["PlayerDismountActor"] = "Player.DismountActor",
                ["PlayerEnterPlanet"] = "Player.EnterPlanet",
                ["PlayerEquipAddItem"] = "Player.EquipAddItem",
                ["PlayerEquipChange"] = "Player.EquipChange",
                ["PlayerEquipOff"] = "Player.EquipOff",
                ["PlayerEquipOn"] = "Player.EquipOn",
                ["PlayerEquipRemItem"] = "Player.EquipRemItem",
                ["PlayerGunAction"] = "Player.GunAction",
                ["PlayerInputContent"] = "Player.InputContent",
                ["PlayerInputKeyClick"] = "Player.InputKeyClick",
                ["PlayerInputKeyDown"] = "Player.InputKeyDown",
                ["PlayerInputKeyOnPress"] = "Player.InputKeyOnPress",
                ["PlayerInputKeyUp"] = "Player.InputKeyUp",
                ["PlayerInvateFriend"] = "Player.InvateFriend",
                ["PlayerLeavePlanet"] = "Player.LeavePlanet",
                ["PlayerLevelModelUpgrade"] = "Player.LevelModelUpgrade",
                ["PlayerModelChange"] = "Player.ModelChange",
                ["PlayerMotionStateChange"] = "Player.MotionStateChange",
                ["PlayerMotionStateChangeEnd"] = "Player.MotionStateChangeEnd",
                ["PlayerMountActor"] = "Player.MountActor",
                ["PlayerMoveOneBlockSize"] = "Player.MoveOneBlockSize",
                ["PlayerNewInputContent"] = "Player.NewInputContent",
                ["PlayerOpenInnerView"] = "Player.OpenInnerView",
                ["PlayerPickUpItem"] = "Player.PickUpItem",
                ["PlayerPlayAction"] = "Player.PlayAction",
                ["PlayerRemoveBuff"] = "Player.RemoveBuff",
                ["PlayerRevive"] = "Player.Revive",
                ["PlayerSaveSkinSeat"] = "Player.SaveSkinSeat",
                ["PlayerSelectShortcut"] = "Player.SelectShortcut",
                ["PlayerShortcutAddItem"] = "Player.ShortcutAddItem",
                ["PlayerShortcutChange"] = "Player.ShortcutChange",
                ["PlayerShortcutRemItem"] = "Player.ShortcutRemItem",
                ["PlayerTouchBlock"] = "Player.TouchBlock",
                ["PlayerTouchObj"] = "Player.TouchObj",
                ["PlayerUseGiftPack"] = "Player.UseGiftPack",
                ["PlayerUseItem"] = "Player.UseItem",
                ["PlotBegin"] = "Plot.begin",
                ["PlotEnd"] = "Plot.end",
                ["ProjectileHitAreaObj"] = "Projectile.Hit.AreaObj",
                ["ProjectileHitBlock"] = "Projectile.Hit.Block",
                ["ProjectileHitEntity"] = "Projectile.Hit.Entity",
                ["ProjectileHitItem"] = "Projectile.Hit.Item",
                ["ProjectileHitMob"] = "Projectile.Hit.Mob",
                ["ProjectileHitPlayer"] = "Projectile.Hit.Player",
                ["ProjectileHitProj"] = "Projectile.Hit.Proj",
                ["QQMusicPlayBegin"] = "QQMusic.PlayBegin",
                ["TLEventActorSpawn"] = "TLFrameEvent.ActorSpawn",
                ["TaskUpdate"] = "Task.Update",
                ["TeleportMatchRsp"] = "CloudTeleport.MacthRsp",
                ["TimelineStart"] = "Timeline.Start",
                ["TimelineStop"] = "Timeline.Stop",
                ["UIBtnClick"] = "UI.Button.Click",
                ["UIButtonClick"] = "UI.Button.NewClick",
                ["UIButtonLongPress"] = "UI.Button.LongPress",
                ["UIButtonTouchBegin"] = "UI.Button.TouchBegin",
                ["UIButtonTouchEnd"] = "UI.Button.TouchEnd",
                ["UIContainerActivity"] = "UI.Container.Activity",
                ["UIContainerPress"] = "UI.Container.Press",
                ["UIContainerRelease"] = "UI.Container.Release",
                ["UIGLoader3DLongPress"] = "UI.GLoader3D.LongPress",
                ["UIGLoader3DTouchBegin"] = "UI.GLoader3D.TouchBegin",
                ["UIGLoader3DTouchClick"] = "UI.GLoader3D.NewClick",
                ["UIGLoader3DTouchEnd"] = "UI.GLoader3D.TouchEnd",
                ["UIGridClick"] = "UI.Grid.Click",
                ["UIHide"] = "UI.Hide",
                ["UILostFocus"] = "UI.LostFocus",
                ["UIScrollPaneScrollEnd"] = "UI.ScrollPane.ScrollEnd",
                ["UIScrollPaneTouchBegin"] = "UI.ScrollPane.TouchBegin",
                ["UIScrollPaneTouchEnd"] = "UI.ScrollPane.TouchEnd",
                ["UIShow"] = "UI.Show",
                ["UISpineComplete"] = "UI.SpineComplete",
                ["WeatherChanged"] = "Weather.Changed",
            },
            ["TurnFaceDir"] = {
                ["Pitch"] = 2,
                ["Yaw"] = 1,
            },
            ["UIAttr"] = {
                ["Id"] = 2,
                ["Name"] = 1,
                ["Visibility"] = 3,
            },
            ["UIProjectSet"] = {
                ["bgColorEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["darkGrey"] = {
                            ["name"] = "深灰色",
                            ["sort"] = 2,
                        },
                        ["lightGray"] = {
                            ["name"] = "浅灰色",
                            ["sort"] = 1,
                        },
                        ["white"] = {
                            ["name"] = "白色",
                            ["sort"] = 3,
                        },
                    },
                    ["darkGrey"] = 2,
                    ["lightGray"] = 1,
                    ["white"] = 3,
                },
                ["systemLevelEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["highByBackPackFrame"] = {
                            ["name"] = "背包上",
                            ["sort"] = 5,
                        },
                        ["highByMiniMapFrame"] = {
                            ["name"] = "小地图上",
                            ["sort"] = 3,
                        },
                        ["lowByBackPackFrame"] = {
                            ["name"] = "背包下",
                            ["sort"] = 4,
                        },
                        ["lowByMiniMapFrame"] = {
                            ["name"] = "小地图下",
                            ["sort"] = 2,
                        },
                        ["none"] = {
                            ["name"] = "自定义层级",
                            ["sort"] = 1,
                        },
                    },
                    ["highByBackPackFrame"] = 4,
                    ["highByMiniMapFrame"] = 2,
                    ["lowByBackPackFrame"] = 3,
                    ["lowByMiniMapFrame"] = 1,
                    ["none"] = 0,
                },
            },
            ["UIScollDir"] = {
                ["Both"] = 2,
                ["Horizontal"] = 0,
                ["Vertical"] = 1,
            },
            ["UseEdit"] = {
                ["ChargeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "不蓄力",
                        },
                        ["fourth"] = {
                            ["name"] = "蓄满自动释放",
                        },
                        ["second"] = {
                            ["name"] = "蓄力中途可以释放",
                        },
                        ["third"] = {
                            ["name"] = "蓄满才能释放",
                        },
                    },
                    ["first"] = 0,
                    ["fourth"] = 3,
                    ["second"] = 1,
                    ["third"] = 2,
                },
                ["CostType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "耐久度",
                        },
                        ["fourth"] = {
                            ["name"] = "体力值",
                        },
                        ["second"] = {
                            ["name"] = "饥饿度",
                        },
                        ["third"] = {
                            ["name"] = "道具",
                        },
                    },
                    ["first"] = 0,
                    ["fourth"] = 3,
                    ["second"] = 1,
                    ["third"] = 2,
                },
                ["RangeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "单体",
                        },
                        ["second"] = {
                            ["name"] = "立方体",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 2,
                },
                ["SkillType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "点击目标",
                        },
                        ["second"] = {
                            ["name"] = "无需目标",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                },
                ["TargetTeam"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["first"] = {
                            ["name"] = "不限队伍",
                        },
                        ["second"] = {
                            ["name"] = "同队伍",
                        },
                        ["third"] = {
                            ["name"] = "不同队伍",
                        },
                    },
                    ["first"] = 0,
                    ["second"] = 1,
                    ["third"] = 2,
                },
            },
            ["VDistanceRange"] = {
                ["Far"] = 8,
                ["Farthest"] = 16,
                ["Further"] = 10,
                ["Middle"] = 4,
                ["Near"] = 2,
            },
            ["VIEWPORTTYPE"] = {
                ["BACK2VIEW"] = 3,
                ["BACKVIEW"] = 1,
                ["CUSTOMVIEW"] = 5,
                ["FRONTVIEW"] = 2,
                ["MAINVIEW"] = 0,
                ["TOPVIEW"] = 4,
            },
            ["VarType"] = {
                ["AreaGroup"] = 16,
                ["Areains"] = 2,
                ["BlockType"] = 8,
                ["BlockTypeGroup"] = 20,
                ["Blueprint"] = 29,
                ["Boolean"] = 5,
                ["BooleanGroup"] = 19,
                ["BuffType"] = 43,
                ["BuffTypeGroup"] = 44,
                ["Creature"] = 10,
                ["CreatureGroup"] = 12,
                ["CreatureType"] = 11,
                ["CreatureTypeGroup"] = 22,
                ["DropItem"] = 35,
                ["DropItemGroup"] = 36,
                ["EffectType"] = 14,
                ["EffectTypeGroup"] = 24,
                ["Element"] = 37,
                ["ElementGroup"] = 38,
                ["Entity"] = 49,
                ["EntityGroup"] = 50,
                ["EntityType"] = 51,
                ["EntityTypeGroup"] = 52,
                ["ItemType"] = 9,
                ["ItemTypeGroup"] = 21,
                ["ListData"] = 26,
                ["Map"] = 27,
                ["Model"] = 47,
                ["ModelGroup"] = 48,
                ["Number"] = 3,
                ["NumberGroup"] = 17,
                ["Object"] = 30,
                ["ObjectGroup"] = 32,
                ["Player"] = 6,
                ["PlayerGroup"] = 7,
                ["Pos"] = 1,
                ["PosGroup"] = 15,
                ["Projectile"] = 33,
                ["ProjectileGroup"] = 34,
                ["Role"] = 41,
                ["RoleGroup"] = 42,
                ["SortedData"] = 25,
                ["Sound"] = 45,
                ["SoundGroup"] = 46,
                ["String"] = 4,
                ["StringGroup"] = 18,
                ["Table"] = 28,
                ["Texture"] = 39,
                ["TextureGroup"] = 40,
                ["Timer"] = 13,
                ["TimerGroup"] = 23,
            },
            ["VerticalOffset"] = {
                ["Bottom"] = 3,
                ["Centered"] = 2,
                ["Top"] = 1,
            },
            ["ViedoPlayMode"] = {
                ["Once"] = 2,
                ["Repeat"] = 1,
            },
            ["ViewPortType"] = {
                ["Back"] = 1,
                ["Back2"] = 3,
                ["Custom"] = 5,
                ["Front"] = 2,
                ["Main"] = 0,
                ["Top"] = 4,
            },
            ["Villager"] = {
                ["AvatarAnchorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Back_Ornament"] = 8,
                    ["Body"] = 0,
                    ["Face"] = 2,
                    ["Face_Ornament"] = 3,
                    ["FootPrint"] = 9,
                    ["Hand_Ornament"] = 5,
                    ["Head"] = 1,
                    ["Jacket"] = 4,
                    ["Right_Hand"] = 11,
                    ["Right_Shoe"] = 12,
                    ["Shoe"] = 7,
                    ["Skin"] = 10,
                    ["Trousers"] = 6,
                    ["__info"] = {
                        ["Back_Ornament"] = {
                            ["name"] = "背装饰",
                        },
                        ["Body"] = {
                            ["name"] = "身体",
                        },
                        ["Face"] = {
                            ["name"] = "脸",
                        },
                        ["Face_Ornament"] = {
                            ["name"] = "脸装饰",
                        },
                        ["FootPrint"] = {
                            ["name"] = "脚印",
                        },
                        ["Hand_Ornament"] = {
                            ["name"] = "手装饰",
                        },
                        ["Head"] = {
                            ["name"] = "头",
                        },
                        ["Jacket"] = {
                            ["name"] = "夹克",
                        },
                        ["Right_Hand"] = {
                            ["name"] = "右手avt特效挂点",
                        },
                        ["Right_Shoe"] = {
                            ["name"] = "右脚avt特效挂点",
                        },
                        ["Shoe"] = {
                            ["name"] = "鞋子",
                        },
                        ["Skin"] = {
                            ["name"] = "皮肤",
                        },
                        ["Trousers"] = {
                            ["name"] = "裤子",
                        },
                    },
                },
                ["GunAnchorType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Butt"] = 1005,
                    ["Clip"] = 1003,
                    ["FishBone"] = 1008,
                    ["FrontSight"] = 1013,
                    ["Grip"] = 1004,
                    ["Laser"] = 1002,
                    ["LeftRail"] = 1011,
                    ["LowerRail"] = 1010,
                    ["Muzzle"] = 1001,
                    ["RearSight"] = 1014,
                    ["RightRail"] = 1012,
                    ["Sight1"] = 1006,
                    ["Sight2"] = 1007,
                    ["UpperRail"] = 1009,
                    ["__info"] = {
                        ["Butt"] = {
                            ["name"] = "枪托",
                        },
                        ["Clip"] = {
                            ["name"] = "弹夹",
                        },
                        ["FishBone"] = {
                            ["name"] = "鱼骨",
                        },
                        ["FrontSight"] = {
                            ["name"] = "准星",
                        },
                        ["Grip"] = {
                            ["name"] = "握把",
                        },
                        ["Laser"] = {
                            ["name"] = "镭射",
                        },
                        ["LeftRail"] = {
                            ["name"] = "左导轨",
                        },
                        ["LowerRail"] = {
                            ["name"] = "下导轨",
                        },
                        ["Muzzle"] = {
                            ["name"] = "枪口",
                        },
                        ["RearSight"] = {
                            ["name"] = "照门",
                        },
                        ["RightRail"] = {
                            ["name"] = "右导轨",
                        },
                        ["Sight1"] = {
                            ["name"] = "瞄准镜1",
                        },
                        ["Sight2"] = {
                            ["name"] = "瞄准镜2",
                        },
                        ["UpperRail"] = {
                            ["name"] = "上导轨",
                        },
                    },
                },
                ["PartType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Avatar"] = 1,
                    ["__info"] = {
                        ["Avatar"] = {
                            ["name"] = "Avatar部件",
                        },
                    },
                },
                ["ProfessionType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Architect"] = 7,
                    ["Breeder"] = 10,
                    ["Chef"] = 9,
                    ["Farmer"] = 3,
                    ["Fisherman"] = 8,
                    ["Helper"] = 5,
                    ["Hunter"] = 6,
                    ["MeleeGuard"] = 2,
                    ["None"] = 0,
                    ["RemoteGuard"] = 4,
                    ["Woodcutter"] = 1,
                    ["__info"] = {
                        ["Architect"] = {
                            ["name"] = "工人",
                            ["sort"] = 8,
                        },
                        ["Breeder"] = {
                            ["name"] = "养殖工",
                            ["sort"] = 11,
                        },
                        ["Chef"] = {
                            ["name"] = "厨师",
                            ["sort"] = 10,
                        },
                        ["Farmer"] = {
                            ["name"] = "农夫",
                            ["sort"] = 4,
                        },
                        ["Fisherman"] = {
                            ["name"] = "钓鱼手",
                            ["sort"] = 9,
                        },
                        ["Helper"] = {
                            ["name"] = "小帮手",
                            ["sort"] = 6,
                        },
                        ["Hunter"] = {
                            ["name"] = "猎人",
                            ["sort"] = 7,
                        },
                        ["MeleeGuard"] = {
                            ["name"] = "守护者",
                            ["sort"] = 3,
                        },
                        ["None"] = {
                            ["name"] = "族民",
                            ["sort"] = 1,
                        },
                        ["RemoteGuard"] = {
                            ["name"] = "神射手",
                            ["sort"] = 5,
                        },
                        ["Woodcutter"] = {
                            ["name"] = "樵夫",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["WeatherGroup"] = {
                ["AirIsland"] = 9,
                ["Coldzone"] = 5,
                ["Common"] = 1,
                ["Desert"] = 3,
                ["Frigidzone"] = 4,
                ["Global"] = 0,
                ["Nunja"] = 7,
                ["Ocean"] = 2,
                ["Plain"] = 8,
                ["Volcano"] = 6,
            },
            ["WeatherType"] = {
                ["Custom"] = 7,
                ["None"] = 0,
                ["Rain"] = 2,
                ["Sandstorm"] = 3,
                ["Snow"] = 4,
                ["Sunshine"] = 1,
                ["UnderWater"] = 5,
                ["VoidNight"] = 8,
                ["Volcano"] = 6,
                ["WEATHRT_NONE"] = 0,
                ["ZOMBIE_WAVE"] = 9,
                ["ZombieWave"] = 9,
            },
            ["WorkStage"] = {
                ["Craft"] = 800,
                ["Enchant"] = 833,
                ["Repair"] = 824,
            },
            ["WorkeStage"] = {
                ["Craft"] = 800,
                ["Enchant"] = 833,
                ["Repair"] = 824,
            },
            ["World"] = {
                ["AddCustomMarker"] = function(self, uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end, --[[@service World.AddCustomMarker; @mtype Sync]]
                ["AddGameTimes"] = function(self, timeenum, value) end, --[[@service World.AddGameTimes; @mtype Normal; @rtype WhiteList="LuaApi3_World_AddGameTimes"]]
                ["AddGravity"] = function(self, value, worldId) end, --[[@service World.AddGravity; @mtype Normal]]
                ["BroadcastModBlockDataEx"] = function(self, x, y, z, msgSubId, mapid, content) end, --[[@service World.BroadcastModBlockDataEx; @mtype Normal]]
                ["CalcDirectionByAngle"] = function(self, yaw, pitch) end, --[[@service World.CalcDirectionByAngle; @mtype Normal]]
                ["CalcDirectionByCoord"] = function(self, x, y, z) end, --[[@service World.CalcDirectionByCoord; @mtype Normal]]
                ["CalcDirectionByPos2Pos"] = function(self, pos1, pos2) end, --[[@service World.CalcDirectionByPos2Pos; @mtype Normal]]
                ["CalcDirectionByYawAngle"] = function(self, objid, yaw, pitch) end, --[[@service World.CalcDirectionByYawAngle; @mtype Normal]]
                ["CalcDirectionByYawDirection"] = function(self, objid, vx, vy, vz) end, --[[@service World.CalcDirectionByYawDirection; @mtype Normal]]
                ["CalcDistance"] = function(self, posSrc, posDst) end, --[[@service World.CalcDistance; @mtype Normal]]
                ["CanMobSpawnOnPosXZ"] = function(self, x, y, z, worldId) end, --[[@service World.CanMobSpawnOnPosXZ; @mtype Normal]]
                ["CheckBlockIsReplaceable"] = function(self, mapid, x, y, z) end, --[[@service World.CheckBlockIsReplaceable; @mtype Normal]]
                ["CheckSummerActActivate"] = function(self, callback, activatename) end, --[[@service World.CheckSummerActActivate; @mtype Normal]]
                ["ClearCustomMarkerByResName"] = function(self, uin, iconName) end, --[[@service World.ClearCustomMarkerByResName; @mtype Sync]]
                ["CloseStorageBoxFrame"] = function(self, uin) end, --[[@service World.CloseStorageBoxFrame; @mtype Sync]]
                ["CreateExplosion"] = function(self, objid, x, y, z, explosionRadius, flaming, smoking, dirmask, damageType) end, --[[@service World.CreateExplosion; @mtype Normal]]
                ["CreateExplosionNew"] = function(self, x, y, z, radius, upHalf, atkValue, isDestroyBlock) end, --[[@service World.CreateExplosionNew; @mtype Normal]]
                ["DelCustomMarker"] = function(self, uin, iconName, name, x, z, level) end, --[[@service World.DelCustomMarker; @mtype Sync]]
                ["DespawnActor"] = function(self, objid) end, --[[@service World.DespawnActor; @mtype Normal]]
                ["EditCustomMarker"] = function(self, uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end, --[[@service World.EditCustomMarker; @mtype Normal]]
                ["EmitByPosition"] = function(self, posbegin, emitid, shooter) end, --[[@service World.EmitByPosition; @mtype Normal]]
                ["EmitByPositionTarget"] = function(self, posbegin, emitid, objid, shooter) end, --[[@service World.EmitByPositionTarget; @mtype Normal]]
                ["EmitByPositionTargetPos"] = function(self, posbegin, emitid, targetPos, shooter) end, --[[@service World.EmitByPositionTargetPos; @mtype Normal]]
                ["FindCanSpawnMobPosList"] = function(self, centerX, centerY, centerZ, radius, includeCenterPos, worldId) end, --[[@service World.FindCanSpawnMobPosList; @mtype Normal]]
                ["FindEcosystem"] = function(self, x, y, z, biomeType, radius, worldId) end, --[[@service World.FindEcosystem; @mtype Normal]]
                ["FindNearActorListByDefId"] = function(self, centerX, centerY, centerZ, radius, defId, worldId) end, --[[@service World.FindNearActorListByDefId; @mtype Normal]]
                ["FindNearActorListByObjType"] = function(self, centerX, centerY, centerZ, radius, objType, worldId) end, --[[@service World.FindNearActorListByObjType; @mtype Normal; @rtype WhiteList="LuaApi3_InternalApi"]]
                ["FindNearActorListByTeam"] = function(self, centerX, centerY, centerZ, radius, team, worldId) end, --[[@service World.FindNearActorListByTeam; @mtype Normal]]
                ["FindNearCanSpawnMobPosList"] = function(self, centerX, centerY, centerZ, radius, includeCenterPos, worldId) end, --[[@service World.FindNearCanSpawnMobPosList; @mtype Normal]]
                ["FindNearestActorByDefId"] = function(self, posX, posY, posZ, radius, defId, worldId) end, --[[@service World.FindNearestActorByDefId; @mtype Normal]]
                ["FindNearestPlayerByPos"] = function(self, posX, posY, posZ, worldId) end, --[[@service World.FindNearestPlayerByPos; @mtype Normal]]
                ["GetAllPlayers"] = function(self, alive) end, --[[@service World.GetAllPlayers; @mtype Normal]]
                ["GetBiomeDesc"] = function(self, biomeId) end, --[[@service World.GetBiomeDesc; @mtype Normal]]
                ["GetBiomeGroup"] = function(self, posX, posZ, worldId) end, --[[@service World.GetBiomeGroup; @mtype Normal]]
                ["GetBiomeType"] = function(self, posX, posZ, worldId) end, --[[@service World.GetBiomeType; @mtype Normal]]
                ["GetCurMapId"] = function(self) end, --[[@service World.GetCurMapId; @mtype Normal]]
                ["GetCurrMapId"] = function(self) end, --[[@service World.GetCurrMapId; @mtype Normal]]
                ["GetDateFromTime"] = function(self, time, enum) end, --[[@service World.GetDateFromTime; @mtype Normal]]
                ["GetDateStringFromTime"] = function(self, time) end, --[[@service World.GetDateStringFromTime; @mtype Normal]]
                ["GetDay"] = function(self) end, --[[@service World.GetDay; @mtype Normal]]
                ["GetDirRayDetection"] = function(self, posbegin, dir, maxlen, picktype, worldId, ignoreObjs, ignorePrefabs) end, --[[@service World.GetDirRayDetection; @mtype Normal]]
                ["GetGameMode"] = function(self) end, --[[@service World.GetGameMode; @mtype Normal]]
                ["GetGravity"] = function(self, worldId) end, --[[@service World.GetGravity; @mtype Normal]]
                ["GetGroupWeather"] = function(self, groupid, worldId) end, --[[@service World.GetGroupWeather; @mtype Normal]]
                ["GetHostWorldId"] = function(self) end, --[[@service World.GetHostWorldId; @mtype Normal]]
                ["GetHours"] = function(self) end, --[[@service World.GetHours; @mtype Normal]]
                ["GetInnerViewEnable"] = function(self, iview) end, --[[@service World.GetInnerViewEnable; @mtype Normal]]
                ["GetLightByPos"] = function(self, x, y, z, worldId) end, --[[@service World.GetLightByPos; @mtype Normal]]
                ["GetLocalDate"] = function(self, enum) end, --[[@service World.GetLocalDate; @mtype Normal]]
                ["GetLocalDateString"] = function(self) end, --[[@service World.GetLocalDateString; @mtype Normal]]
                ["GetLoginSvrTime"] = function(self) end, --[[@service World.GetLoginSvrTime; @mtype Normal]]
                ["GetMainPlayerPos"] = function(self) end, --[[@service World.GetMainPlayerPos; @mtype Normal]]
                ["GetMidJoin"] = function(self) end, --[[@service World.GetMidJoin; @mtype Normal]]
                ["GetMiniMapFlagPos"] = function(self, key) end, --[[@service World.GetMiniMapFlagPos; @mtype Normal]]
                ["GetPlanetComponent"] = function(self, worldId, cmpName) end, --[[@service World.GetPlanetComponent; @mtype Normal]]
                ["GetPlayerTotal"] = function(self, alive) end, --[[@service World.GetPlayerTotal; @mtype Normal]]
                ["GetRayBlock"] = function(self, srcx, srcy, srcz, face, distance, worldId) end, --[[@service World.GetRayBlock; @mtype Normal]]
                ["GetRayLength"] = function(self, srcx, srcy, srcz, dstx, dsty, dstz, distance, worldId) end, --[[@service World.GetRayLength; @mtype Normal]]
                ["GetServerDate"] = function(self, enum) end, --[[@service World.GetServerDate; @mtype Normal]]
                ["GetServerDateString"] = function(self) end, --[[@service World.GetServerDateString; @mtype Normal]]
                ["GetServerTimeMs"] = function(self) end, --[[@service World.GetServerTimeMs; @mtype Normal]]
                ["GetSkyBoxtime"] = function(self, time) end, --[[@service World.GetSkyBoxtime; @mtype Normal]]
                ["GetSnapshot"] = function(self, dt) end, --[[@service World.GetSnapshot; @mtype Normal]]
                ["GetSpawnPoint"] = function(self, worldId) end, --[[@service World.GetSpawnPoint; @mtype Normal]]
                ["GetTimeFromDateString"] = function(self, date_str) end, --[[@service World.GetTimeFromDateString; @mtype Normal]]
                ["GetTreeModel"] = function(self, stBlockPos, bCreateActorTree) end, --[[@service World.GetTreeModel; @mtype Normal]]
                ["GetTreeModelMod"] = function(self, stBlockPosList, bCreateActorTree) end, --[[@service World.GetTreeModelMod; @mtype Normal]]
                ["GetWorldCreateMobRule"] = function(self, biometype, worldId) end, --[[@service World.GetWorldCreateMobRule; @mtype Normal]]
                ["GetWorldid"] = function(self) end, --[[@service World.GetWorldid; @mtype Normal]]
                ["IsChunkLoaded"] = function(self, x, z, worldId) end, --[[@service World.IsChunkLoaded; @mtype Normal]]
                ["IsDaytime"] = function(self) end, --[[@service World.IsDaytime; @mtype Normal]]
                ["NotifyGameInfo2All"] = function(self, info, objids) end, --[[@service World.NotifyGameInfo2All; @mtype Normal]]
                ["PauseSoundEffectOnPos"] = function(self, pos, soundId, pause, worldId) end, --[[@service World.PauseSoundEffectOnPos; @mtype Normal]]
                ["PixelMapAddMarker"] = function(self, uin, id, params, worldid) end, --[[@service World.PixelMapAddMarker; @mtype Sync]]
                ["PixelMapAddTexture"] = function(self, uin, id, params, worldid) end, --[[@service World.PixelMapAddTexture; @mtype Sync]]
                ["PixelMapDelMarker"] = function(self, uin, id, worldid) end, --[[@service World.PixelMapDelMarker; @mtype Sync]]
                ["PixelMapDelTexture"] = function(self, uin, id, worldid) end, --[[@service World.PixelMapDelTexture; @mtype Sync]]
                ["PixelMapRefreshMarker"] = function(self, uin, id, params, worldid) end, --[[@service World.PixelMapRefreshMarker; @mtype Sync]]
                ["PixelMapRefreshTexture"] = function(self, uin, id, params, worldid) end, --[[@service World.PixelMapRefreshTexture; @mtype Sync]]
                ["PlayParticle"] = function(self, pos, particleIdArg, ptimeArg, offset, rot, scale, worldId) end, --[[@service World.PlayParticle; @mtype Normal]]
                ["PlayParticleEffect"] = function(self, x, y, z, particleId, scale, ptime, bUsePlayerViewRange, worldId) end, --[[@service World.PlayParticleEffect; @mtype Normal]]
                ["PlaySoundEffectOnPos"] = function(self, pos, soundId, volume, pitch, isLoop, worldId) end, --[[@service World.PlaySoundEffectOnPos; @mtype Normal]]
                ["RandomParticleEffectID"] = function(self) end, --[[@service World.RandomParticleEffectID; @mtype Normal]]
                ["RandomSoundID"] = function(self) end, --[[@service World.RandomSoundID; @mtype Normal]]
                ["RandomWeatherID"] = function(self) end, --[[@service World.RandomWeatherID; @mtype Normal]]
                ["ReceiveModBlockDataEx"] = function(self, content) end, --[[@service World.ReceiveModBlockDataEx; @mtype Normal]]
                ["RegisterMatchTeleport"] = function(self, content) end, --[[@service World.RegisterMatchTeleport; @mtype Normal]]
                ["SendToClientOpenTransferStationUI"] = function(self, playerid, mapid, srcGateId) end, --[[@service World.SendToClientOpenTransferStationUI; @mtype Normal]]
                ["SetChunkRectAlwaysLoaded"] = function(self, x1, z1, x2, z2, keepLoaded, worldId) end, --[[@service World.SetChunkRectAlwaysLoaded; @mtype BoardCast; @rtype ResendMsg=1; @rtype WhiteList="LuaApi3_World_SetChunkRectAlwaysLoaded"]]
                ["SetGravity"] = function(self, value, worldId) end, --[[@service World.SetGravity; @mtype BoardCast]]
                ["SetGroupWeather"] = function(self, groupid, weatherid, worldId) end, --[[@service World.SetGroupWeather; @mtype Normal]]
                ["SetHours"] = function(self, time) end, --[[@service World.SetHours; @mtype BoardCast]]
                ["SetInnerViewEnable"] = function(self, iview, bopen) end, --[[@service World.SetInnerViewEnable; @mtype BoardCast; @rtype ResendMsg=1]]
                ["SetIsCreateSnow"] = function(self, value, worldId) end, --[[@service World.SetIsCreateSnow; @mtype BoardCast; @rtype ResendMsg=1]]
                ["SetLightByPos"] = function(self, x, y, z, value, worldId) end, --[[@service World.SetLightByPos; @mtype BoardCast]]
                ["SetMapIconSettingCfg"] = function(self, cfg) end, --[[@service World.SetMapIconSettingCfg; @mtype BoardCast; @rtype ResendMsg=1]]
                ["SetMidJoin"] = function(self, enable) end, --[[@service World.SetMidJoin; @mtype Normal]]
                ["SetMobSpawnDensity"] = function(self, mobType, density, worldId) end, --[[@service World.SetMobSpawnDensity; @mtype Normal]]
                ["SetParticleEffectScale"] = function(self, x, y, z, particleId, scale) end, --[[@service World.SetParticleEffectScale; @mtype Normal]]
                ["SetParticleTransform"] = function(self, pos, particleIdArg, offset, rot, scale, worldId) end, --[[@service World.SetParticleTransform; @mtype Normal]]
                ["SetPicAndShare"] = function(self, uin, fileName, needShare) end, --[[@service World.SetPicAndShare; @mtype Sync]]
                ["SetPlantGrowRate"] = function(self, rate, worldId) end, --[[@service World.SetPlantGrowRate; @mtype Normal]]
                ["SetSkyBoxAttr"] = function(self, time, itype, value, worldId) end, --[[@service World.SetSkyBoxAttr; @mtype BoardCast]]
                ["SetSkyBoxAttrWithNoTime"] = function(self, itype, value, worldId) end, --[[@service World.SetSkyBoxAttrWithNoTime; @mtype BoardCast]]
                ["SetSkyBoxColor"] = function(self, time, itype, color, worldId) end, --[[@service World.SetSkyBoxColor; @mtype BoardCast]]
                ["SetSkyBoxColorAnim"] = function(self, playerid, itype, color, animId, animTime, worldId) end, --[[@service World.SetSkyBoxColorAnim; @mtype Sync]]
                ["SetSkyBoxFilter"] = function(self, playerid, itype, value, worldId) end, --[[@service World.SetSkyBoxFilter; @mtype Sync]]
                ["SetSkyBoxFilterAnim"] = function(self, playerid, itype, value, animId, animTime, worldId) end, --[[@service World.SetSkyBoxFilterAnim; @mtype Sync]]
                ["SetSkyBoxFilterForMod"] = function(self, playerid, itype, value) end, --[[@service World.SetSkyBoxFilterForMod; @mtype Sync]]
                ["SetSkyBoxFilterSwitch"] = function(self, playerid, itype, value, worldId) end, --[[@service World.SetSkyBoxFilterSwitch; @mtype Sync]]
                ["SetSkyBoxMaps"] = function(self, itype, url, worldId) end, --[[@service World.SetSkyBoxMaps; @mtype BoardCast]]
                ["SetSkyBoxMapsAnim"] = function(self, playerid, itype, url, animId, animTime, worldId) end, --[[@service World.SetSkyBoxMapsAnim; @mtype Sync]]
                ["SetSkyBoxSwitch"] = function(self, time, itype, value, worldId) end, --[[@service World.SetSkyBoxSwitch; @mtype BoardCast]]
                ["SetSkyBoxTemplate"] = function(self, value, worldId) end, --[[@service World.SetSkyBoxTemplate; @mtype BoardCast]]
                ["SetSpawnPoint"] = function(self, x, y, z, worldId) end, --[[@service World.SetSpawnPoint; @mtype Normal]]
                ["SetTimeVanishingSpeed"] = function(self, speed) end, --[[@service World.SetTimeVanishingSpeed; @mtype BoardCast]]
                ["SetWeatherType"] = function(self, wtype) end, --[[@service World.SetWeatherType; @mtype Normal]]
                ["SetWorldCreateMobRule"] = function(self, cfgs, worldId) end, --[[@service World.SetWorldCreateMobRule; @mtype Normal]]
                ["ShowTransferView"] = function(self, playerid, mapid, srcGateId) end, --[[@service World.ShowTransferView; @mtype Normal]]
                ["SnapShortAndOpenShareFrame"] = function(self, uin, needShare) end, --[[@service World.SnapShortAndOpenShareFrame; @mtype Sync]]
                ["Snapshot"] = function(self, w, h) end, --[[@service World.Snapshot; @mtype Normal]]
                ["SpawnCreature"] = function(self, x, y, z, mobid, num, trigger, worldId) end, --[[@service World.SpawnCreature; @mtype Normal]]
                ["SpawnEquipOrGun"] = function(self, x, y, z, itemid, worldId) end, --[[@service World.SpawnEquipOrGun; @mtype Normal]]
                ["SpawnItem"] = function(self, x, y, z, itemid, num, worldId) end, --[[@service World.SpawnItem; @mtype Normal]]
                ["SpawnProjectile"] = function(self, objid, itemid, x, y, z, dstx, dsty, dstz, speed, worldId) end, --[[@service World.SpawnProjectile; @mtype Normal]]
                ["SpawnProjectileByDir"] = function(self, objid, itemid, x, y, z, dirx, diry, dirz, speed, worldId) end, --[[@service World.SpawnProjectileByDir; @mtype Normal]]
                ["StopParticleEffectOnPos"] = function(self, x, y, z, particleId, worldId) end, --[[@service World.StopParticleEffectOnPos; @mtype Normal]]
                ["StopParticleOnPos"] = function(self, x, y, z, particleId, worldId) end, --[[@service World.StopParticleOnPos; @mtype Normal]]
                ["StopSoundEffectOnPos"] = function(self, pos, soundId, worldId) end, --[[@service World.StopSoundEffectOnPos; @mtype Normal]]
                ["UseTransferTo"] = function(self, playerUin, toUin) end, --[[@service World.UseTransferTo; @mtype Normal]]
                ["getChunkRandomSpawnPos"] = function(self, x, y, z) end, --[[@service World.getChunkRandomSpawnPos; @mtype Normal]]
            },
            ["WorldContainer"] = {
                ["AddFurnace"] = function(self, x, y, z, blockid) end, --[[@service WorldContainer.AddFurnace; @mtype Normal]]
                ["AddItemToContainer"] = function(self, x, y, z, itemid, num, worldId) end, --[[@service WorldContainer.AddItemToContainer; @mtype Normal]]
                ["AddStorageBox"] = function(self, x, y, z, blockid) end, --[[@service WorldContainer.AddStorageBox; @mtype Normal]]
                ["AddStorageItem"] = function(self, x, y, z, itemid, num, worldId) end, --[[@service WorldContainer.AddStorageItem; @mtype Normal]]
                ["AddWorldStorageItems"] = function(self, x, y, z, itemids, worldId) end, --[[@service WorldContainer.AddWorldStorageItems; @mtype Normal]]
                ["CheckFurnace"] = function(self, x, y, z) end, --[[@service WorldContainer.CheckFurnace; @mtype Normal]]
                ["CheckStorage"] = function(self, x, y, z, worldId) end, --[[@service WorldContainer.CheckStorage; @mtype Normal]]
                ["CheckStorageEmptyGrid"] = function(self, x, y, z, itemid, worldId) end, --[[@service WorldContainer.CheckStorageEmptyGrid; @mtype Normal]]
                ["ClearContainer"] = function(self, x, y, z, worldId) end, --[[@service WorldContainer.ClearContainer; @mtype Normal]]
                ["ClearStorageBox"] = function(self, x, y, z, worldId) end, --[[@service WorldContainer.ClearStorageBox; @mtype Normal]]
                ["GetAllStorageItemInstanceIds"] = function(self, x, y, z, worldId) end, --[[@service WorldContainer.GetAllStorageItemInstanceIds; @mtype Normal]]
                ["GetFurnaceHeatPercent"] = function(self, x, y, z, lev) end, --[[@service WorldContainer.GetFurnaceHeatPercent; @mtype Normal]]
                ["GetFurnaceMeltPercent"] = function(self, x, y, z) end, --[[@service WorldContainer.GetFurnaceMeltPercent; @mtype Normal]]
                ["GetGridAttr"] = function(self, x, y, z, gridid, attr, worldId) end, --[[@service WorldContainer.GetGridAttr; @mtype Normal]]
                ["GetStorageItem"] = function(self, x, y, z, offset, worldId) end, --[[@service WorldContainer.GetStorageItem; @mtype Normal]]
                ["GetStorageItemInstanceId"] = function(self, x, y, z, offset, worldId) end, --[[@service WorldContainer.GetStorageItemInstanceId; @mtype Normal]]
                ["Is2Sizeblock"] = function(self, blockid) end, --[[@service WorldContainer.Is2Sizeblock; @mtype Normal]]
                ["RemoveContainerItemByID"] = function(self, x, y, z, itemid, num, worldId) end, --[[@service WorldContainer.RemoveContainerItemByID; @mtype Normal]]
                ["RemoveFurnace"] = function(self, x, y, z) end, --[[@service WorldContainer.RemoveFurnace; @mtype Normal]]
                ["RemoveStorageBox"] = function(self, x, y, z) end, --[[@service WorldContainer.RemoveStorageBox; @mtype Normal]]
                ["RemoveStorageItemByID"] = function(self, x, y, z, itemid, num, worldId) end, --[[@service WorldContainer.RemoveStorageItemByID; @mtype Normal]]
                ["RemoveStorageItemByIndex"] = function(self, x, y, z, offset, num, worldId) end, --[[@service WorldContainer.RemoveStorageItemByIndex; @mtype Normal]]
                ["SetGridAttr"] = function(self, x, y, z, gridid, attr, value, worldId) end, --[[@service WorldContainer.SetGridAttr; @mtype Normal]]
                ["SetStorageItem"] = function(self, x, y, z, offset, itemid, num, worldId) end, --[[@service WorldContainer.SetStorageItem; @mtype Normal]]
                ["SetSummoner"] = function(self, x, y, z, changeCD, CD, CDType) end, --[[@service WorldContainer.SetSummoner; @mtype Normal]]
                ["SetSummonerLevel"] = function(self, x, y, z, level) end, --[[@service WorldContainer.SetSummonerLevel; @mtype Normal]]
                ["SwapContainerItem"] = function(self, x, y, z, grid, uin, grid2) end, --[[@service WorldContainer.SwapContainerItem; @mtype Normal]]
            },
            ["WorldRuleBaseSetting"] = {
                ["WeatherType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Aurora"] = 114,
                    ["Bad"] = 107,
                    ["Rainstorm"] = 110,
                    ["Rainy"] = 11,
                    ["Random"] = 60,
                    ["Sandstorm"] = 109,
                    ["Snowstorm"] = 111,
                    ["Snowy"] = 108,
                    ["Sunny"] = 10,
                    ["Thunderstorm"] = 97,
                    ["VoidFog"] = 115,
                    ["__info"] = {
                        ["Aurora"] = {
                            ["name"] = "极光天",
                            ["sort"] = 10,
                        },
                        ["Bad"] = {
                            ["name"] = "恶劣天气",
                            ["sort"] = 5,
                        },
                        ["Rainstorm"] = {
                            ["name"] = "暴风雨",
                            ["sort"] = 8,
                        },
                        ["Rainy"] = {
                            ["name"] = "雨天",
                            ["sort"] = 3,
                        },
                        ["Random"] = {
                            ["name"] = "随机天气",
                            ["sort"] = 1,
                        },
                        ["Sandstorm"] = {
                            ["name"] = "沙尘暴",
                            ["sort"] = 7,
                        },
                        ["Snowstorm"] = {
                            ["name"] = "暴风雪",
                            ["sort"] = 9,
                        },
                        ["Snowy"] = {
                            ["name"] = "下雪",
                            ["sort"] = 6,
                        },
                        ["Sunny"] = {
                            ["name"] = "晴天",
                            ["sort"] = 2,
                        },
                        ["Thunderstorm"] = {
                            ["name"] = "雷暴",
                            ["sort"] = 4,
                        },
                        ["VoidFog"] = {
                            ["name"] = "虚空浓雾",
                            ["sort"] = 11,
                        },
                    },
                },
            },
            ["WorldRuleCloudSetting"] = {
                ["GameModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Cloud"] = 1,
                    ["Custom"] = 2,
                    ["__info"] = {
                        ["Cloud"] = {
                            ["name"] = "云服游戏",
                            ["sort"] = 2,
                        },
                        ["Custom"] = {
                            ["name"] = "普通游戏",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["WorldRuleFightSetting"] = {
                ["attackModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["All"] = 57,
                    ["Forbid"] = 58,
                    ["Team"] = 59,
                    ["__info"] = {
                        ["All"] = {
                            ["name"] = "自由攻击",
                            ["sort"] = 3,
                        },
                        ["Forbid"] = {
                            ["name"] = "禁止攻击玩家",
                            ["sort"] = 2,
                        },
                        ["Team"] = {
                            ["name"] = "队伍间攻击",
                            ["sort"] = 1,
                        },
                    },
                },
                ["defenseFormulaType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Division"] = 122,
                    ["Mulitplication"] = 121,
                    ["__info"] = {
                        ["Division"] = {
                            ["name"] = "除法公式",
                            ["sort"] = 2,
                        },
                        ["Mulitplication"] = {
                            ["name"] = "乘法公式",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["WorldRuleHUDUI"] = {
                ["MapIconClickType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["None"] = 0,
                    ["TriggerEvent"] = 1,
                    ["__info"] = {
                        ["None"] = {
                            ["name"] = "无效果",
                            ["sort"] = 1,
                        },
                        ["TriggerEvent"] = {
                            ["name"] = "响应事件",
                            ["sort"] = 2,
                        },
                    },
                },
                ["MapPlayerIconType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["PlayerIcon"] = 1,
                    ["Point"] = 0,
                    ["__info"] = {
                        ["PlayerIcon"] = {
                            ["name"] = "玩家头像",
                            ["sort"] = 2,
                        },
                        ["Point"] = {
                            ["name"] = "小绿点",
                            ["sort"] = 1,
                        },
                    },
                },
                ["MapPlayerShowType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["All"] = 0,
                    ["None"] = 1,
                    ["SameTeam"] = 2,
                    ["__info"] = {
                        ["All"] = {
                            ["name"] = "全部可见",
                            ["sort"] = 1,
                        },
                        ["None"] = {
                            ["name"] = "全部不可见",
                            ["sort"] = 2,
                        },
                        ["SameTeam"] = {
                            ["name"] = "仅同队伍可见",
                            ["sort"] = 3,
                        },
                    },
                },
            },
            ["WorldRuleRebirth"] = {
                ["deathDropModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["ClearBag"] = 68,
                    ["DropBox"] = 94,
                    ["DropPack"] = 112,
                    ["KeepItems"] = 69,
                    ["Normal"] = 67,
                    ["__info"] = {
                        ["ClearBag"] = {
                            ["name"] = "清空背包",
                            ["sort"] = 2,
                        },
                        ["DropBox"] = {
                            ["name"] = "掉落箱子",
                            ["sort"] = 4,
                        },
                        ["DropPack"] = {
                            ["name"] = "掉落包裹",
                            ["sort"] = 5,
                        },
                        ["KeepItems"] = {
                            ["name"] = "保留物品",
                            ["sort"] = 3,
                        },
                        ["Normal"] = {
                            ["name"] = "正常掉落",
                            ["sort"] = 1,
                        },
                    },
                },
                ["rebirthCostModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Increase"] = 1,
                    ["Same"] = 0,
                    ["__info"] = {
                        ["Increase"] = {
                            ["name"] = "递增",
                            ["sort"] = 2,
                        },
                        ["Same"] = {
                            ["name"] = "不递增",
                            ["sort"] = 1,
                        },
                    },
                },
                ["rebirthModeType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Auto"] = 71,
                    ["Manual"] = 72,
                    ["__info"] = {
                        ["Auto"] = {
                            ["name"] = "自动重生",
                            ["sort"] = 1,
                        },
                        ["Manual"] = {
                            ["name"] = "手动重生",
                            ["sort"] = 2,
                        },
                    },
                },
            },
            ["WorldRuleSceneUI"] = {
                ["displayNameType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["All"] = 71,
                    ["Enemy"] = 73,
                    ["Friendly"] = 72,
                    ["None"] = 74,
                    ["__info"] = {
                        ["All"] = {
                            ["name"] = "所有人可见",
                            ["sort"] = 1,
                        },
                        ["Enemy"] = {
                            ["name"] = "仅敌方队伍可见",
                            ["sort"] = 3,
                        },
                        ["Friendly"] = {
                            ["name"] = "仅己方队伍可见",
                            ["sort"] = 2,
                        },
                        ["None"] = {
                            ["name"] = "全部不可见",
                            ["sort"] = 4,
                        },
                    },
                },
            },
            ["WorldRuleSound"] = {
                ["backgroundMusicType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Chinese"] = 51,
                    ["Clever"] = 50,
                    ["Decrypt"] = 54,
                    ["Default"] = 9,
                    ["Explode"] = 55,
                    ["Fight"] = 52,
                    ["Lonely"] = 53,
                    ["None"] = 48,
                    ["Soccer"] = 56,
                    ["Speed"] = 49,
                    ["__info"] = {
                        ["Chinese"] = {
                            ["name"] = "中国风",
                            ["sort"] = 4,
                        },
                        ["Clever"] = {
                            ["name"] = "古灵精怪",
                            ["sort"] = 3,
                        },
                        ["Decrypt"] = {
                            ["name"] = "解密氛围",
                            ["sort"] = 7,
                        },
                        ["Default"] = {
                            ["name"] = "默认音乐",
                            ["sort"] = 1,
                        },
                        ["Explode"] = {
                            ["name"] = "爆炸",
                            ["sort"] = 8,
                        },
                        ["Fight"] = {
                            ["name"] = "战斗",
                            ["sort"] = 5,
                        },
                        ["Lonely"] = {
                            ["name"] = "孤独上帝",
                            ["sort"] = 6,
                        },
                        ["None"] = {
                            ["name"] = "无音乐",
                            ["sort"] = 10,
                        },
                        ["Soccer"] = {
                            ["name"] = "足球场",
                            ["sort"] = 9,
                        },
                        ["Speed"] = {
                            ["name"] = "加速世界",
                            ["sort"] = 2,
                        },
                    },
                },
                ["ratioPec"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["__info"] = {
                        ["pec1"] = {
                            ["name"] = "1%",
                            ["sort"] = 1,
                        },
                        ["pec10"] = {
                            ["name"] = "10%",
                            ["sort"] = 3,
                        },
                        ["pec100"] = {
                            ["name"] = "100%",
                            ["sort"] = 6,
                        },
                        ["pec25"] = {
                            ["name"] = "25%",
                            ["sort"] = 4,
                        },
                        ["pec5"] = {
                            ["name"] = "5%",
                            ["sort"] = 2,
                        },
                        ["pec50"] = {
                            ["name"] = "50%",
                            ["sort"] = 5,
                        },
                    },
                    ["pec1"] = 1,
                    ["pec10"] = 10,
                    ["pec100"] = 100,
                    ["pec25"] = 25,
                    ["pec5"] = 5,
                    ["pec50"] = 50,
                },
            },
            ["WorldRuleStartMode"] = {
                ["displayNameType"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Auto"] = 70,
                    ["Host"] = 30,
                    ["Number"] = 31,
                    ["__info"] = {
                        ["Auto"] = {
                            ["name"] = "直接开启",
                            ["sort"] = 3,
                        },
                        ["Host"] = {
                            ["name"] = "房主开启",
                            ["sort"] = 1,
                        },
                        ["Number"] = {
                            ["name"] = "达到人数开启",
                            ["sort"] = 2,
                        },
                    },
                },
                ["levelModeTypeEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["MoneyMode"] = 2,
                    ["None"] = -1,
                    ["StarMode"] = 0,
                    ["__info"] = {
                        ["MoneyMode"] = {
                            ["name"] = "货币模式",
                            ["sort"] = 3,
                        },
                        ["None"] = {
                            ["name"] = "无",
                            ["sort"] = 1,
                        },
                        ["StarMode"] = {
                            ["name"] = "星星模式",
                            ["sort"] = 2,
                        },
                    },
                },
                ["playerLimitTypeEnum"] = {
                    ["$meta"] = { ["$ref"] = {"$meta", "__index", "AdaptiveJoin", "ModeType", "$meta"} },
                    ["Custom"] = 3,
                    ["SystemRecommend"] = 1,
                    ["__info"] = {
                        ["Custom"] = {
                            ["name"] = "自定义人数",
                            ["sort"] = 3,
                        },
                        ["SystemRecommend"] = {
                            ["name"] = "系统推荐",
                            ["sort"] = 1,
                        },
                    },
                },
            },
            ["WorldType"] = {
                ["Create"] = 1,
                ["CreateToRungame"] = 3,
                ["Extremity"] = 2,
                ["Freemode"] = 6,
                ["Gamemaker"] = 4,
                ["GamemakerRun"] = 5,
                ["Record"] = 9,
                ["Single"] = 0,
            },
            ["_VERSION"] = "Lua 5.1",
            ["__CallComponentDebugFn"] = function() end, --[[@lua]]
            ["assert"] = function() end, --[[@builtin]]
            ["bit"] = {
                ["arshift"] = function() end, --[[@builtin]]
                ["band"] = function() end, --[[@builtin]]
                ["bnot"] = function() end, --[[@builtin]]
                ["bor"] = function() end, --[[@builtin]]
                ["bswap"] = function() end, --[[@builtin]]
                ["bxor"] = function() end, --[[@builtin]]
                ["lshift"] = function() end, --[[@builtin]]
                ["rol"] = function() end, --[[@builtin]]
                ["ror"] = function() end, --[[@builtin]]
                ["rshift"] = function() end, --[[@builtin]]
                ["tobit"] = function() end, --[[@builtin]]
                ["tohex"] = function() end, --[[@builtin]]
            },
            ["copy_table"] = function(ori_tab) end, --[[@lua]]
            ["coroutine"] = {
                ["create"] = function() end, --[[@builtin]]
                ["isyieldable"] = function() end, --[[@builtin]]
                ["resume"] = function() end, --[[@builtin]]
                ["running"] = function() end, --[[@builtin]]
                ["status"] = function() end, --[[@builtin]]
                ["wrap"] = function() end, --[[@builtin]]
                ["yield"] = function() end, --[[@builtin]]
            },
            ["debug"] = {
                ["traceback"] = function() end, --[[@lua]]
            },
            ["dofile"] = function() end, --[[@lua]]
            ["error"] = function() end, --[[@builtin]]
            ["getServerTime"] = function() end, --[[@lua]]
            ["getmetatable"] = function(tb) end, --[[@lua]]
            ["io"] = {
            },
            ["ipairs"] = function(data) end, --[[@lua]]
            ["json"] = {
                ["decode"] = function(jstr) end, --[[@lua]]
                ["encode"] = function(tab) end, --[[@lua]]
            },
            ["loadfile"] = function() end, --[[@lua]]
            ["loadstring"] = function() end, --[[@lua]]
            ["math"] = {
                ["abs"] = function() end, --[[@builtin]]
                ["acos"] = function() end, --[[@builtin]]
                ["approximately"] = function(a, b) end, --[[@lua]]
                ["asin"] = function() end, --[[@builtin]]
                ["atan"] = function() end, --[[@builtin]]
                ["atan2"] = function() end, --[[@builtin]]
                ["ceil"] = function() end, --[[@builtin]]
                ["clamp"] = function(value, min, max) end, --[[@lua]]
                ["cos"] = function() end, --[[@builtin]]
                ["cosh"] = function() end, --[[@builtin]]
                ["deg"] = function() end, --[[@lua]]
                ["exp"] = function() end, --[[@builtin]]
                ["floor"] = function() end, --[[@builtin]]
                ["fmod"] = function() end, --[[@builtin]]
                ["frexp"] = function() end, --[[@builtin]]
                ["huge"] = 1/0,
                ["ldexp"] = function() end, --[[@builtin]]
                ["lerp"] = function(from, to, t) end, --[[@lua]]
                ["log"] = function() end, --[[@builtin]]
                ["log10"] = function() end, --[[@builtin]]
                ["max"] = function() end, --[[@builtin]]
                ["min"] = function() end, --[[@builtin]]
                ["mod"] = function(x, y) end, --[[@lua]]
                ["modf"] = function() end, --[[@builtin]]
                ["pi"] = 3.1415926535898,
                ["pow"] = function() end, --[[@builtin]]
                ["rad"] = function() end, --[[@lua]]
                ["random"] = function() end, --[[@builtin]]
                ["randomseed"] = function() end, --[[@builtin]]
                ["sin"] = function() end, --[[@builtin]]
                ["sinh"] = function() end, --[[@builtin]]
                ["sqrt"] = function() end, --[[@builtin]]
                ["tan"] = function() end, --[[@builtin]]
                ["tanh"] = function() end, --[[@builtin]]
            },
            ["next"] = function() end, --[[@builtin]]
            ["os"] = {
                ["date"] = function() end, --[[@builtin]]
                ["time"] = function() end, --[[@builtin]]
                ["timeMs"] = function() end, --[[@lua]]
            },
            ["package"] = {
            },
            ["pairs"] = function(data) end, --[[@lua]]
            ["pcall"] = function() end, --[[@builtin]]
            ["print"] = function(...) end, --[[@lua]]
            ["printError"] = function(...) end, --[[@lua]]
            ["rawequal"] = function() end, --[[@builtin]]
            ["rawget"] = function() end, --[[@builtin]]
            ["require"] = function() end, --[[@lua]]
            ["select"] = function() end, --[[@builtin]]
            ["setmetatable"] = function() end, --[[@builtin]]
            ["string"] = {
                ["Trim"] = function(self) end, --[[@lua]]
                ["byte"] = function() end, --[[@builtin]]
                ["char"] = function() end, --[[@builtin]]
                ["find"] = function() end, --[[@builtin]]
                ["format"] = function() end, --[[@builtin]]
                ["gmatch"] = function() end, --[[@builtin]]
                ["gsub"] = function() end, --[[@builtin]]
                ["len"] = function() end, --[[@lua]]
                ["lower"] = function() end, --[[@builtin]]
                ["match"] = function() end, --[[@builtin]]
                ["rep"] = function() end, --[[@builtin]]
                ["reverse"] = function() end, --[[@builtin]]
                ["split"] = function(input, delimiter) end, --[[@lua]]
                ["sub"] = function() end, --[[@builtin]]
                ["upper"] = function() end, --[[@builtin]]
            },
            ["table"] = {
                ["clone"] = function(ori_tab) end, --[[@lua]]
                ["concat"] = function() end, --[[@builtin]]
                ["equal"] = function(a, b) end, --[[@lua]]
                ["getn"] = function() end, --[[@lua]]
                ["insert"] = function() end, --[[@builtin]]
                ["maxn"] = function() end, --[[@builtin]]
                ["remove"] = function() end, --[[@lua]]
                ["sort"] = function() end, --[[@builtin]]
            },
            ["threadpool"] = {
                ["Wait"] = function(vir, ...) end, --[[@lua]]
                ["Work"] = function(vir, ...) end, --[[@lua]]
                ["wait"] = function(vir, ...) end, --[[@lua]]
                ["work"] = function(vir, ...) end, --[[@lua]]
            },
            ["tonumber"] = function() end, --[[@builtin]]
            ["tostring"] = function() end, --[[@builtin]]
            ["type"] = function() end, --[[@builtin]]
            ["unpack"] = function() end, --[[@builtin]]
            ["xpcall"] = function() end, --[[@builtin]]
        },
        ["__metatable"] = "read only",
        ["__newindex"] = { ["$ref"] = {"$meta", "__index", "$meta", "__index"} },
    },
    ["_G"] = { ["$ref"] = {} },
}
