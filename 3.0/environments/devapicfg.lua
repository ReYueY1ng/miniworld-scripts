-- chunkname: @F:/minichina/AssetRuntime/CommonResource/Assets/../Script/luascript/ugc/framework/api/DevApiCfg.lua

DevApiMType = {
	Mod = 9,
	BoardCast = 8,
	HostAndClient = 7,
	ReportHost = 6,
	ClientData = 5,
	SyncPack = 4,
	Sync = 3,
	NoBlock = 2,
	Block = 1,
	Normal = 0
}
DevApiRType = {
	WhiteList = 3,
	Uin_TimeLimit = 2,
	ResendMsg = 7,
	ResetCompareParam = 6,
	CompareParam = 5,
	TimeLimit = 4
}
DevApiEnvType = {
	Motion = 3,
	Client = 2,
	Host = 1
}
DevApiCfg = {
	gameObject = {
		"GetId",
		"Destroy",
		"AddTag",
		"RemoveTag",
		"HasTag",
		"GetObjType",
		"IsValid",
		"GetWorldId",
		"PushEvent",
		"PushEventSync",
		"PushCustomEvent",
		"PushCustomEventSync",
		"PushCloudServerMsg",
		"AddCustomEvent",
		"AddEvent",
		"AddCloudSeverEvent",
		"RemoveEvent",
		"RemoveCustomEvent",
		"RemoveTriggerEvent",
		"RemoveCloudSeverEvent",
		"SaveInChunk",
		"DoTaskInTime",
		"DoPeriodicTask",
		"ClearTaskByCmp",
		"SetTaskIsPauseByCmp",
		"SetEventIsEnable",
		"IsEventEnable",
		"SetComponentIndex",
		"HasComponent",
		"GetWorldId"
	},
	worldObject = {
		"GetObjType",
		"GetId",
		"IsValid",
		"PushEvent",
		"PushEventSync",
		"PushCustomEvent",
		"PushCustomEventSync",
		"PushCloudServerMsg",
		"AddCustomEvent",
		"AddEvent",
		"AddTriggerEvent",
		"AddCloudSeverEvent",
		"RemoveEvent",
		"RemoveCustomEvent",
		"RemoveTriggerEvent",
		"RemoveCloudSeverEvent",
		"DoTaskInTime",
		"DoPeriodicTask",
		"ClearTaskByCmp",
		"SetTaskIsPauseByCmp",
		"SetComponentIndex",
		"SetEventIsEnable",
		"IsEventEnable",
		"HasComponent",
		"GetWorldId"
	},
	BlockObject = {
		"GetObjType",
		"GetId",
		"GetResId",
		"SetComponentIndex",
		"IsValid",
		"PushEvent",
		"PushEventSync",
		"PushCustomEvent",
		"PushCustomEventSync",
		"PushCloudServerMsg",
		"AddCustomEvent",
		"AddEvent",
		"AddCloudSeverEvent",
		"RemoveEvent",
		"RemoveCustomEvent",
		"RemoveCloudSeverEvent",
		"HasComponent",
		"SetEventIsEnable",
		"IsEventEnable",
		"DoTaskInTime",
		"DoPeriodicTask",
		"ClearTaskByCmp",
		"SetTaskIsPauseByCmp",
		"GetBlockData",
		"SetBlockData",
		"PlayAnim",
		"SetTexture",
		"ShowModel",
		"IsShowModel",
		"SetOverlayColor",
		"SetCallbackCanPutOntoPos",
		"SetCallbackCanPutOntoPlayer",
		"DisableNonCoreBlockTick",
		"RegisterUsedKeys",
		"SetCollideCheckInterval",
		"ChangeImportModelRunning",
		"SetUVAnimSwitch",
		"SetParticleEffectAsyns",
		"GetTransferGateId",
		"RegisterContainerType",
		"setChangeColorAnim",
		"ModOnDestroyContainer",
		"CheckPosCallPlace",
		"SetCallbackCreateCollideData",
		"SetCallbackGetPhisicMesh"
	},
	services = {
		Log = {
			ix = 1,
			dismethods = {
				"PrintDevLog",
				"PrintLog",
				"DealLog",
				"PcallErrorInfo",
				"GetStrFromLine",
				"PcallError",
				"IsOpenLog",
				"ModLoad",
				"PrintRunInfo"
			}
		},
		GameObject = {
			ix = 2,
			dismethods = {
				"CreateGameObject",
				"CreateEditActor",
				"CreateGameObjectDefault",
				"FindGameObject",
				"GetWorldObject",
				"CreatePrefabInstObject",
				"PushCustomEvent",
				"CreatePrefabObject"
			},
			methods = {}
		},
		Data = {
			ix = 3,
			methods = {
				{
					"DoPackBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			},
			dismethods = {},
			items = {
				Array = {
					dismethods = {}
				},
				Map = {
					dismethods = {},
					methods = {
						{
							"SetValueAndBlock",
							DevApiMType.Block
						},
						{
							"RemoveValueAndBlock",
							DevApiMType.Block
						},
						{
							"GetValueAndBlock",
							DevApiMType.Block
						},
						{
							"GetIndexValueAndBlock",
							DevApiMType.Block
						},
						{
							"SetRankValueAndBlock",
							DevApiMType.Block
						},
						{
							"IncreasesRankValueAndBlock",
							DevApiMType.Block
						}
					}
				},
				Table = {
					dismethods = {}
				}
			}
		},
		Area = {
			ix = 6,
			dismethods = {
				"GetObjInstanceID"
			},
			methods = {}
		},
		Item = {
			ix = 7,
			dismethods = {
				"_BeginModifyItem",
				"_BeginModifyItemByGridIndex"
			},
			methods = {
				{
					"GetGunBaseDesc",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Item_GetGunBaseDesc"
					}
				},
				{
					"CreateItemInstInBackpack",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetObjData",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetObjData",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetItemModelComp",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetObjDataByGrid",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetObjDataByGrid",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"CreateBindItemInBackpack",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Item_CreateBindItemInBackpack"
					}
				},
				{
					"IsBindItem",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Item_IsBindItem"
					}
				}
			}
		},
		Block = {
			ix = 8,
			methods = {
				{
					"SetBlockTextureColor",
					DevApiMType.BoardCast
				},
				{
					"CreateObsBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"PlaceBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"UnbindBluePrintRegion",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SaveBluePrintRegionData",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"BluePrintSaveAsNewId",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"BluePrintSetUploadInteral",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"DeleteBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetBluePrintBlockInfo",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"CaptureAndUploadScreenshot",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"LoadObsBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"UnloadObsBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"StopPlaceObsBluePrint",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetObsBluePrintStatus",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetObsBluePrintPos",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			}
		},
		Listen = {
			ix = 9,
			methods = {
				{
					"VarRunDataRecord",
					DevApiMType.SyncPack
				},
				{
					"SetBlockAll",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			}
		},
		Timer = {
			ix = 10,
			dismethods = {}
		},
		CustomUI = {
			ix = 11,
			methods = {
				{
					"SetText",
					DevApiMType.HostAndClient,
					{
						[DevApiRType.CompareParam] = {
							3,
							5
						}
					}
				},
				{
					"SetTexture",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetSize",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetRelationSize",
							"SetScale",
							"SmoothScaleBy",
							"SmoothScaleTo"
						}
					}
				},
				{
					"SetFontSize",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetColor",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"ShowElement",
					DevApiMType.SyncPack
				},
				{
					"HideElement",
					DevApiMType.SyncPack
				},
				{
					"RotateElement",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetAlpha",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetState",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3
						}
					}
				},
				{
					"SetPosition",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetRelationPosition",
							"SmoothMoveTo",
							"SmoothMoveBy"
						}
					}
				},
				{
					"SmoothMoveTo",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetPosition",
							"SetRelationPosition",
							"SmoothMoveBy"
						}
					}
				},
				{
					"SmoothMoveBy",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetPosition",
							"SetRelationPosition",
							"SmoothMoveTo"
						}
					}
				},
				{
					"SmoothScaleTo",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetSize",
							"SetRelationSize",
							"SetScale",
							"SmoothScaleBy"
						}
					}
				},
				{
					"SmoothScaleBy",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetSize",
							"SetRelationSize",
							"SetScale",
							"SmoothScaleTo"
						}
					}
				},
				{
					"SmoothRotateTo",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"RotateElement",
							"SmoothRotateBy"
						}
					}
				},
				{
					"SmoothRotateBy",
					DevApiMType.SyncPack,
					{
						[DevApiRType.ResetCompareParam] = {
							3,
							"RotateElement",
							"SmoothRotateTo"
						}
					}
				},
				{
					"PlayElementAnim",
					DevApiMType.SyncPack
				},
				{
					"StopAnim",
					DevApiMType.SyncPack
				},
				{
					"SetLoaderModel",
					DevApiMType.HostAndClient
				},
				{
					"SetLoaderModelScale",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetLoaderModelDir",
					DevApiMType.SyncPack
				},
				{
					"SetLoaderModelAct",
					DevApiMType.SyncPack
				},
				{
					"TurnSliderToPos",
					DevApiMType.SyncPack
				},
				{
					"SetSliderDir",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetSliderBarImg",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						}
					}
				},
				{
					"SetRelationPosition",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetPosition",
							"SmoothMoveBy",
							"SmoothMoveTo"
						}
					}
				},
				{
					"SetRelationSize",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetSize",
							"SetScale",
							"SmoothScaleBy",
							"SmoothScaleTo"
						}
					}
				},
				{
					"CreateElement",
					DevApiMType.HostAndClient
				},
				{
					"CloneElement",
					DevApiMType.HostAndClient
				},
				{
					"ChangeParent",
					DevApiMType.SyncPack
				},
				{
					"SetProgressBarValue",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetProgressBarData",
							"SmoothIncreaseProgress"
						}
					}
				},
				{
					"SetProgressBarData",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetProgressBarValue",
							"SmoothIncreaseProgress"
						}
					}
				},
				{
					"SetProgressBarResId",
					DevApiMType.SyncPack
				},
				{
					"SmoothChangeProgress",
					DevApiMType.SyncPack
				},
				{
					"SetSpineAnimID",
					DevApiMType.SyncPack
				},
				{
					"SmoothIncreaseProgress",
					DevApiMType.SyncPack,
					{
						[DevApiRType.CompareParam] = {
							3
						},
						[DevApiRType.ResetCompareParam] = {
							3,
							"SetProgressBarValue",
							"SmoothIncreaseProgress"
						}
					}
				},
				{
					"SetFloatDamageTxt",
					DevApiMType.SyncPack
				},
				{
					"SetFloatDamageTxtEx",
					DevApiMType.SyncPack
				},
				{
					"SyncPicCheckStatus",
					DevApiMType.SyncPack
				},
				{
					"TurnSliderToIndex",
					DevApiMType.SyncPack
				},
				{
					"GetScreenSize",
					DevApiMType.ClientData
				},
				{
					"GlobalToLocal",
					DevApiMType.ClientData
				},
				{
					"SetLoaderModelPosition",
					DevApiMType.SyncPack
				},
				{
					"SmoothScaleByEx",
					DevApiMType.SyncPack
				},
				{
					"SetScale",
					DevApiMType.SyncPack
				},
				{
					"SetBounceback",
					DevApiMType.SyncPack
				},
				{
					"SetSpineTouch",
					DevApiMType.SyncPack
				},
				{
					"EnableSetGunMagazine",
					DevApiMType.SyncPack
				},
				{
					"GetProgressBarValue",
					DevApiMType.ClientData
				},
				{
					"DeleteElement",
					DevApiMType.SyncPack
				},
				{
					"SetPositionBindActor",
					DevApiMType.SyncPack
				},
				{
					"RemovePositionBindActor",
					DevApiMType.SyncPack
				},
				{
					"SetPositionBandBlock",
					DevApiMType.SyncPack
				},
				{
					"RemovePositionBandBlock",
					DevApiMType.SyncPack
				},
				{
					"SetSysSettingBtnVisible",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_CustomUI_SetSysSettingBtnVisible"
					}
				},
				{
					"GetElementAttrValue",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_CustomUI_GetElementAttrValue"
					}
				},
				{
					"GetUIViewAttrValue",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_CustomUI_GetUIViewAttrValue"
					}
				},
				{
					"SetBeaconBandPos",
					DevApiMType.SyncPack
				},
				{
					"SetBeaconObjId",
					DevApiMType.SyncPack
				},
				{
					"SetBeaconOffset",
					DevApiMType.SyncPack
				},
				{
					"SetBeaconClampType",
					DevApiMType.SyncPack
				},
				{
					"SetBeaconRadius",
					DevApiMType.SyncPack
				},
				{
					"SetUrlIcon",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetBeaconMargin",
					DevApiMType.SyncPack
				}
			},
			dismethods = {
				"CreateElementId",
				"CloneElementId"
			}
		},
		Chat = {
			ix = 12,
			dismethods = {
				"SendMsg"
			}
		},
		Player = {
			ix = 13,
			dismethods = {
				"GetActorByObjid",
				"GetObjTypeByActor",
				"ChangeCustomModelOld"
			},
			methods = {
				{
					"OpenInnerItemTips",
					DevApiMType.Sync
				},
				{
					"SetCustomRevieInfo",
					DevApiMType.Sync
				},
				{
					"OpenEquipFrame",
					DevApiMType.Sync
				},
				{
					"GetClientInfo",
					DevApiMType.ClientData
				},
				{
					"GetMiniCurrency",
					DevApiMType.ClientData
				},
				{
					"RequestExchangeCoins",
					DevApiMType.Sync
				},
				{
					"RequestCostCoin",
					DevApiMType.ClientData,
					{
						[DevApiRType.Uin_TimeLimit] = {
							3,
							""
						}
					}
				},
				{
					"CheckCustomOrderID",
					DevApiMType.Block
				},
				{
					"GetPlayerCostStatic",
					DevApiMType.Block,
					{
						[DevApiRType.Uin_TimeLimit] = {
							5,
							""
						}
					}
				},
				{
					"GetBuyItemRecoder",
					DevApiMType.Block
				},
				{
					"OpenRewardsFrame",
					DevApiMType.Sync
				},
				{
					"OpenShopMiniCoinView",
					DevApiMType.Sync
				},
				{
					"SetDeathFrameVisible",
					DevApiMType.Sync
				},
				{
					"OpenActView",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "trigger_api_MiraclesEventsPage"
					}
				},
				{
					"OpenDevGoodsBuyDialog",
					DevApiMType.HostAndClient
				},
				{
					"OpenDevGoodsPage",
					DevApiMType.SyncPack
				},
				{
					"OpenGunUpgradeFrame",
					DevApiMType.Sync
				},
				{
					"CloseGunUpgradeFrame",
					DevApiMType.Sync
				},
				{
					"OpenShopTryOnView",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "trigger_api_SkinTrialShop"
					}
				},
				{
					"OpenShopSkinBuyDialog",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "trigger_api_SkinTrialShop"
					}
				},
				{
					"CloseRoleAttrFrame",
					DevApiMType.Sync
				},
				{
					"RefreshItemTips",
					DevApiMType.Sync
				},
				{
					"SetTriggerOperateDisable",
					DevApiMType.HostAndClient
				},
				{
					"SetCameraLerpSpeed",
					DevApiMType.Sync
				},
				{
					"PlayHandAnim",
					DevApiMType.Sync
				},
				{
					"PlayHandToolAnim",
					DevApiMType.Sync
				},
				{
					"ShowFishLine",
					DevApiMType.Sync
				},
				{
					"EnableUpdateRun",
					DevApiMType.Sync
				},
				{
					"ChangeViewModeForMod",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetFishLineEndPoint",
					DevApiMType.Sync
				},
				{
					"ClearMotion",
					DevApiMType.Sync
				},
				{
					"StopHandAnim",
					DevApiMType.Sync
				},
				{
					"StopHandToolAnim",
					DevApiMType.Sync
				},
				{
					"SetHandOrToolAnimSpeed",
					DevApiMType.Sync
				},
				{
					"SetTaskTraceVisible",
					DevApiMType.Sync
				},
				{
					"GetScreenSpacePos",
					DevApiMType.ClientData
				},
				{
					"GetScreenSpacePosV2",
					DevApiMType.ClientData
				},
				{
					"RotateCamera",
					DevApiMType.Sync
				},
				{
					"ChangeSkinTextureForMod",
					DevApiMType.BoardCast
				},
				{
					"OpenShopGiveGiftView",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "trigger_api_SendGiftsToFriends"
					}
				},
				{
					"SetPolaroidViewVisible",
					DevApiMType.SyncPack
				},
				{
					"GetFirstInviter",
					DevApiMType.Block
				},
				{
					"HasFriend",
					DevApiMType.ClientData
				},
				{
					"GetMiniVipLevel",
					DevApiMType.ClientData
				},
				{
					"SetNoClip",
					DevApiMType.HostAndClient
				},
				{
					"OpenTaskMainUI",
					DevApiMType.Sync
				},
				{
					"OpenTaskTraceUI",
					DevApiMType.Sync
				},
				{
					"SendFriendApply",
					DevApiMType.Sync,
					{
						[DevApiRType.Uin_TimeLimit] = {
							10,
							""
						}
					}
				},
				{
					"SetShotcutIndex",
					DevApiMType.Sync
				},
				{
					"SetCanThrow",
					DevApiMType.HostAndClient
				},
				{
					"SetCrawl",
					DevApiMType.HostAndClient,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"HasHandheldGun",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GunGetMagazine",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetViewMode",
					DevApiMType.ClientData
				},
				{
					"OpenInnerView",
					DevApiMType.HostAndClient
				},
				{
					"OpenDevGoodsBuyDetailedDialog",
					DevApiMType.HostAndClient
				},
				{
					"OpenDevStore",
					DevApiMType.SyncPack
				},
				{
					"OpenDevStoreTab",
					DevApiMType.SyncPack
				},
				{
					"PlayAdvertising",
					DevApiMType.Normal,
					{
						[DevApiRType.Uin_TimeLimit] = {
							90,
							"调用频繁，请稍后尝试！"
						}
					}
				},
				{
					"PlayAdvertising_OnClient",
					DevApiMType.ClientData
				},
				{
					"GetMallModel",
					DevApiMType.ClientData
				},
				{
					"AddMagazine",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetVisibleRange",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetVisibleRange",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetCameraShake",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_SetCameraShake"
					}
				},
				{
					"SyncTriggerData",
					DevApiMType.HostAndClient
				},
				{
					"GetSkinlist",
					DevApiMType.Block,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_GetSkinlist"
					}
				},
				{
					"SetSkillCD",
					DevApiMType.HostAndClient
				},
				{
					"PayMapShopOrder",
					DevApiMType.HostAndClient
				},
				{
					"FinishMapShopOrder",
					DevApiMType.HostAndClient
				},
				{
					"CheckMapShopOrder",
					DevApiMType.Block
				},
				{
					"GetMapShopAllNoFinishOrder",
					DevApiMType.Block
				},
				{
					"GetSkinSeatInfos",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_GetSkinSeatInfos"
					}
				},
				{
					"GetFriendList",
					DevApiMType.ClientData,
					{
						[DevApiRType.Uin_TimeLimit] = {
							10,
							"调用频繁，请稍后尝试！"
						}
					}
				},
				{
					"OpenFriendChatPage",
					DevApiMType.Sync,
					{
						[DevApiRType.WhiteList] = "trigger_api_SendGiftsToFriends"
					}
				},
				{
					"SetSettingEnable",
					DevApiMType.SyncPack
				},
				{
					"SetSettingAbility",
					DevApiMType.SyncPack
				},
				{
					"OpenMiniShopPage",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_OpenMiniShopPage"
					}
				},
				{
					"OpenMiniShopItemPage",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_OpenMiniShopItemPage"
					}
				},
				{
					"OpenMiniShopWarehousePage",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_OpenMiniShopWarehousePage"
					}
				},
				{
					"GetHorseRealID",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_GetHorseRealID"
					}
				},
				{
					"GetPersonInfo",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_GetPersonInfo",
						[DevApiRType.Uin_TimeLimit] = {
							5,
							"调用频繁，请稍后尝试！"
						}
					}
				},
				{
					"RotateMainModel",
					DevApiMType.SyncPack
				},
				{
					"GetBlockAtlasInfo",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_Player_GetBlockAtlasInfo"
					}
				}
			}
		},
		World = {
			ix = 14,
			methods = {
				{
					"AddCustomMarker",
					DevApiMType.Sync
				},
				{
					"DelCustomMarker",
					DevApiMType.Sync
				},
				{
					"CloseStorageBoxFrame",
					DevApiMType.Sync
				},
				{
					"ClearCustomMarkerByResName",
					DevApiMType.Sync
				},
				{
					"SnapShortAndOpenShareFrame",
					DevApiMType.Sync
				},
				{
					"SetPicAndShare",
					DevApiMType.Sync
				},
				{
					"SetSkyBoxFilterForMod",
					DevApiMType.Sync
				},
				{
					"SetHours",
					DevApiMType.BoardCast
				},
				{
					"SetGravity",
					DevApiMType.BoardCast
				},
				{
					"PixelMapAddMarker",
					DevApiMType.Sync
				},
				{
					"PixelMapRefreshMarker",
					DevApiMType.Sync
				},
				{
					"PixelMapDelMarker",
					DevApiMType.Sync
				},
				{
					"PixelMapAddTexture",
					DevApiMType.Sync
				},
				{
					"PixelMapRefreshTexture",
					DevApiMType.Sync
				},
				{
					"PixelMapDelTexture",
					DevApiMType.Sync
				},
				{
					"SetIsCreateSnow",
					DevApiMType.BoardCast,
					{
						[DevApiRType.ResendMsg] = 1
					}
				},
				{
					"SetInnerViewEnable",
					DevApiMType.BoardCast,
					{
						[DevApiRType.ResendMsg] = 1
					}
				},
				{
					"FindNearActorListByObjType",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"SetLightByPos",
					DevApiMType.BoardCast
				},
				{
					"AddGameTimes",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_World_AddGameTimes"
					}
				},
				{
					"SetMapIconSettingCfg",
					DevApiMType.BoardCast,
					{
						[DevApiRType.ResendMsg] = 1
					}
				},
				{
					"SetChunkRectAlwaysLoaded",
					DevApiMType.BoardCast,
					{
						[DevApiRType.ResendMsg] = 1,
						[DevApiRType.WhiteList] = "LuaApi3_World_SetChunkRectAlwaysLoaded"
					}
				}
			},
			dismethods = {
				"GetWorldById",
				"GetWorldId"
			}
		},
		ClientPositive = {
			ix = 15,
			methods = {
				{
					"OnDispathTriggerEvent",
					DevApiMType.ReportHost
				},
				{
					"OnReportHostTriggerEvent",
					DevApiMType.ReportHost
				},
				{
					"OnCheckServerTime",
					DevApiMType.ReportHost
				},
				{
					"OnSyncServerTime",
					DevApiMType.Sync
				},
				{
					"DealAutoTestCmd",
					DevApiMType.ClientData
				},
				{
					"ExportReportV2",
					DevApiMType.Sync
				},
				{
					"OnSyncInscriptionTableUnlockSpellList",
					DevApiMType.Sync
				}
			}
		},
		OfficeUtils = {
			ix = 16,
			methods = {
				{
					"GeneralTaskReported",
					DevApiMType.Sync
				},
				{
					"ReportActivateDataForUin",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "trigger_api_UploadActData"
					}
				},
				{
					"GetActivateProgress",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"GetActivateReward",
					DevApiMType.ClientData,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi",
						[DevApiRType.Uin_TimeLimit] = {
							10,
							"请求频繁,请稍后再试！"
						}
					}
				},
				{
					"SendClientReportEvent",
					DevApiMType.SyncPack,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			}
		},
		CloudSever = {
			ix = 17,
			methods = {
				{
					"SendSeverMsg",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 15,
						[DevApiRType.WhiteList] = "message_trigger"
					}
				},
				{
					"TransmitToMap",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 30
					}
				},
				{
					"TransmitToCategoryRoom",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 30,
						[DevApiRType.WhiteList] = "trigger_api3_MapTagTransfer"
					}
				},
				{
					"TransmitToCurMapCategoryRoom",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 30,
						[DevApiRType.WhiteList] = "trigger_api3_MapTagTransfer"
					}
				},
				{
					"GetRoomCategory",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "trigger_api3_MapTagTransfer"
					}
				},
				{
					"SetRoomCategory",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 5,
						[DevApiRType.WhiteList] = "trigger_api3_MapTagTransfer"
					}
				}
			}
		},
		Graphics = {
			ix = 18,
			methods = {
				{
					"GetInnerGraphicsOffset_OnClient",
					DevApiMType.ClientData
				},
				{
					"RemoveGraphicsByGraphicsID",
					DevApiMType.BoardCast
				}
			}
		},
		Actor = {
			ix = 19,
			dismethods = {
				"GetActorByObjid",
				"GetObjTypeByActor",
				"ChangeCustomModelOld",
				"CheckSyncAction"
			},
			methods = {
				{
					"SetActorControl",
					DevApiMType.BoardCast
				},
				{
					"SetOverlayGravity",
					DevApiMType.BoardCast
				},
				{
					"WhitList_StopSkill",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				},
				{
					"ShowNickName",
					DevApiMType.BoardCast
				},
				{
					"PlayAnimByObj",
					DevApiMType.BoardCast
				},
				{
					"RecoverinitialModel",
					DevApiMType.HostAndClient
				}
			}
		},
		Monster = {
			ix = 20,
			methods = {
				{
					"SetPersistance",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			},
			dismethods = {
				"GetActorByObjid",
				"GetObjTypeByActor",
				"ChangeCustomModelOld"
			}
		},
		Status = {
			ix = 21
		},
		Team = {
			ix = 22
		},
		WorldContainer = {
			ix = 23
		},
		Backpack = {
			ix = 24,
			methods = {
				{
					"GetGridGunInfo",
					DevApiMType.Normal,
					{
						[DevApiRType.WhiteList] = "LuaApi3_InternalApi"
					}
				}
			}
		},
		GameRule = {
			ix = 25
		},
		GameEffect = {
			ix = 26
		},
		Mod = {
			ix = 27
		},
		Task = {
			ix = 28
		},
		ObjectLib = {
			ix = 29
		},
		Biome = {
			ix = 30
		},
		Game = {
			ix = 31,
			methods = {}
		},
		Buff = {
			ix = 32
		},
		Trigger = {
			ix = 33,
			items = {
				ArrayTmp = {},
				Math = {},
				Component = {
					dismethods = {},
					methods = {}
				},
				CustomUI = {},
				World = {},
				Player = {},
				Item = {},
				Block = {},
				Actor = {},
				Monster = {},
				Area = {},
				Status = {},
				Graphics = {},
				Backpack = {},
				GameObject = {},
				Buff = {},
				KvMap = {},
				Timeline = {}
			},
			methods = {
				{
					"TransmitToCategoryRoom",
					DevApiMType.Normal,
					{
						[DevApiRType.TimeLimit] = 30,
						[DevApiRType.WhiteList] = "trigger_api3_MapTagTransfer"
					}
				}
			}
		},
		Timeline = {
			ix = 34,
			methods = {},
			dismethods = {}
		}
	},
	ScriptFenvG = {
		_VERSION = true,
		math = true,
		string = true,
		copy_table = true,
		getServerTime = true,
		assert = true,
		CREATUREATTR = true,
		VIEWPORTTYPE = true,
		ITEMATTR = true,
		xpcall = true,
		pcall = true,
		error = true,
		tostring = true,
		tonumber = true,
		select = true,
		unpack = true,
		rawequal = true,
		GRAPHICS = true,
		rawget = true,
		HURTTYPE = true,
		PLAYERATTR = true,
		setmetatable = true,
		BACKPACK_TYPE = true,
		GameActorType = true,
		MODATTRIB_TYPE = true,
		next = true,
		type = true,
		LinearTransformation = true,
		table = true,
		ABSOLUTECAMPTYPE = true,
		coroutine = true
	}
}
DevApiCfg.devServices = {
	Log = {
		methods = {}
	},
	GameObject = {
		name = "对象模块",
		methods = {
			"FindObject",
			"GetObjInstanceID",
			"FindUIObject",
			"FindBlockObject",
			"CreatePrefab",
			"CreatePrefabInst",
			"Destroy",
			"GetObjectPrefab"
		}
	},
	Data = {
		name = "普通变量数据",
		methods = {
			"SetValue",
			"GetValue",
			"DoPackBluePrint",
			"IncreasesValue"
		},
		items = {
			Array = {
				name = "数组变量数据",
				methods = {
					"Remove",
					"InsertValue",
					"Sort",
					"CreateTmpArray",
					"HasValueByNo",
					"GetMin",
					"Clear",
					"GetMax",
					"ReplaceValue",
					"GetIndexByValue",
					"RemoveByValues",
					"InsertValues",
					"GetSize",
					"RemoveByValue",
					"GetAllValue",
					"SetValue",
					"GetValue",
					"RandomValue",
					"HasValue",
					"GetCountByValue",
					"IncreasesValue",
					"HasIntersectionByTags"
				}
			},
			Map = {
				name = "一维表变量数据",
				methods = {
					"SetValueAndCallBack",
					"SetValueAndBlock",
					"RemoveValueAndCallBack",
					"RemoveValueAndBlock",
					"GetValueAndCallBack",
					"GetValueAndBlock",
					"GetIndexValueAndBlock",
					"GetIndexValueAndCallback",
					"GetNumValuesAndCallback",
					"GetRangeValuesAndCallback",
					"SetRankValueAndBlock",
					"UpdateValueAndCallback",
					"ClearData",
					"IncreasesRankValueAndBlock",
					"IncreasesRankValueAndCallback",
					"GetRangeIndexsAndCallback"
				}
			},
			Table = {
				name = "二维表变量数据",
				methods = {
					"Clear",
					"SetValue",
					"GetValue",
					"GetCols",
					"GetRows",
					"RemoveRow",
					"InsertValue",
					"InsertValueByRow",
					"GetValuesByCol",
					"GetRowIndex",
					"GetRowIndexs",
					"GetColIndex",
					"GetAllValue",
					"GetTableColKeys",
					"UpdateAllValue"
				}
			}
		}
	},
	Trigger = {
		items = {
			ArrayTmp = {
				methods = {
					"ObjInTmpGroup",
					"InsertValue",
					"GetNewInviteGroup",
					"RemoveByValue",
					"GetAllPlayers",
					"GetTeamCreatures",
					"GetAreaMisssile",
					"GetAreaBlocks",
					"GetAreaPlayers",
					"GetAreaCreatures",
					"SplitStrArray",
					"GetAreaDropItems",
					"GetTableValuesByCol",
					"GetTableRowIndexs",
					"GetTableRowIndex",
					"InsertVarTabValue",
					"SetTableRows",
					"GetAreaEntity",
					"GetAreaObjEntity",
					"GetTeamPlayers",
					"GetRelativeActor",
					"GetTeamMobs",
					"GetTeamLivingActor",
					"GetAreaRelativeActors",
					"InsertValuesToArray",
					"SetValueToArray",
					"ReplaceValueToArray",
					"InsertValueToArray",
					"SetVarTabValue",
					"GetVarTabValue",
					"GetVarTabValue",
					"GetActorsByTags"
				}
			},
			Math = {
				methods = {
					"MathExtractOpt",
					"MathUnFixedBaseLog",
					"MathXor",
					"LogicCompareTable",
					"MathArithmetic",
					"MathAdd",
					"MathSub",
					"MathMultiply",
					"MathDivide",
					"Round",
					"Floor",
					"Ceil",
					"Deg",
					"Rad",
					"Abs",
					"Sqrt",
					"Tostring",
					"Max",
					"Min",
					"Pow",
					"Ldexp",
					"Mod",
					"Random",
					"Concat",
					"CompareGreater",
					"CompareGreaterEqual",
					"CompareLess",
					"CompareLessEqual",
					"Equal",
					"NotEqual",
					"Sin",
					"Cos",
					"Tan",
					"TanAngle2Rad",
					"Log10",
					"Log",
					"Isnil",
					"Negate",
					"Pow10",
					"Exp",
					"ColorTostring",
					"V3Tostring",
					"StrToColor",
					"StrToV3",
					"StrToBool",
					"ContainStr",
					"IsPrime",
					"IsEven",
					"Isinteger",
					"IsNegative",
					"IsPositive",
					"IsOdd",
					"ModEqualZero",
					"DivAndFloor"
				}
			},
			Component = {
				methods = {
					"RunCmpBaseFn",
					"SetComponentProperty",
					"IncreasesComponentProperty",
					"GetComponentProperty",
					"AddComponent",
					"RemoveComponent",
					"CallComponentFunction",
					"CallComponentFunctionVar",
					"SetEventIsEnable",
					"IsEventEnable",
					"GetIsHasCmp",
					"CheckCmpFunctionCallType",
					"AddEvent"
				}
			},
			CustomUI = {
				methods = {
					"MakeSmoothMoveTo",
					"MakeSmoothRotateTo",
					"MakeSmoothMoveBy",
					"MakeSmoothScaleTo",
					"MakeSmoothScaleBy",
					"MakeSmoothRotateBy",
					"PlaySmoothAnim",
					"SetText",
					"PlayAnim",
					"MakeElementAnim",
					"MakeUITextAnim",
					"GetScreenSize",
					"GetProgressBarValue",
					"SetLoaderModelAct",
					"GetElementAttrValue",
					"SetBeaconBand"
				}
			},
			World = {
				methods = {
					"PlayParticleEffect",
					"GetSpawnPoint",
					"XyzToPos",
					"SetSkyBoxMapsAnim",
					"SetSkyBoxColorAnim",
					"SetSkyBoxFilterColorAnim",
					"SetSkyBoxFilterColor",
					"SetSkyBoxFilterLUT",
					"SetSkyBoxFilter",
					"GetDirRayDetection",
					"SetSpawnPoint",
					"SetSkyBoxFilterTemplate",
					"SpawnProjectileOnPos",
					"StopParticleEffectOnPos",
					"StopParticleOnPos",
					"DespawnActor",
					"PauseSoundEffectOnPos",
					"ResumeSoundEffectOnPos",
					"PaseOrResumeSoundEffectOnPos",
					"OffsetPos",
					"OffsetPosVal",
					"CalcHorizontalAngle",
					"SpawnShooterProjectile",
					"SpawnShooterProjectileByPos",
					"CalcVerticalAngle",
					"CalcVectorDirectionAngle",
					"SetStorageItem",
					"SetParticleEffectScale",
					"SetParticleTransform",
					"GetBiomeGroup",
					"GetRayLength",
					"DespawnObject",
					"GetRayBlock",
					"CanMobSpawnOnPosXZ",
					"GetCoord",
					"CalcDirectionByPos2Pos",
					"PlayParticle",
					"CompareBiomeGroup",
					"CompareGameMode",
					"GetContainerGridAttr",
					"GetContainerStorageItem",
					"SetContainerGridAttr",
					"GetLightByPos",
					"SetLightByPos",
					"GetRayDetectionPos",
					"IsChunkLoaded",
					"DespawnAreas"
				}
			},
			Player = {
				methods = {
					"GetBackPackGridID",
					"GetShortCutGridID",
					"GetEquipGridID",
					"GetAimPoint",
					"GetBackpackItemNum",
					"MoveGridItem",
					"GetGridItemNum",
					"MakeCamerRotAttr",
					"MakeCamerPosAttr",
					"IsMiniVip",
					"MakeCamerFvoAttr",
					"NotifyGameInfo2Self",
					"SetItemDropAttAction",
					"ShakeCamera",
					"StopShakeCamera",
					"SetCameraAnimPos",
					"SetCameraAnimPosEx",
					"SetCameraAnimRot",
					"SetCameraAnimFov",
					"SetCameraAttrState",
					"SetCameraRotMode",
					"ResetCameraAttr",
					"SetJoinJudge",
					"RotateCamera",
					"SetQuitJudge",
					"OpenInnerView",
					"OpenInnerView_FollowTheAuthor",
					"OpenInnerView_CollectMaps",
					"OpenInnerView_EvaluateMaps",
					"OpenInnerView_InviteFriend",
					"OpenInnerView_StorageBox",
					"OpenInnerView_ItemTips",
					"OpenInnerView_BuffStatus",
					"OpenInnerView_Specialty",
					"OpenInnerView_ItemProcessing",
					"OpenInnerView_BackPackTask",
					"OpenInnerView_BackPackRole",
					"OpenInnerView_BackPackEra",
					"OpenInnerView_AnimView",
					"OpenInnerView_MiniMap",
					"OpenInnerView_MiniShop",
					"SetGameDefeat",
					"SetGameWin",
					"SetRevivePoint",
					"UseItem",
					"SetCameraMountPos",
					"SetMobileVibrate",
					"ChangeViewMode",
					"NotifySystemMsg2Self",
					"SetItemThrowAttAction",
					"SetCameraMountObj",
					"StopMusic",
					"PauseMusic",
					"ResumeMusic",
					"PaseOrResumeMusic",
					"PlayMusic",
					"HasFriend",
					"GetFirstInviter",
					"ToBackPackGridID",
					"ToShortCutGridID",
					"ToEquipGridID",
					"SetGunActionState",
					"GetRevivePoint",
					"GetRayOriginPos",
					"GetGridItemID",
					"EventGridID2GridEnum",
					"OpenDevGoodsWearHouse"
				}
			},
			Item = {
				methods = {
					"CompareItemid",
					"GetBlockFacade",
					"ClearStorageBox",
					"DespawnItemFromStorageBox",
					"ToItemID",
					"CreateItemToStorageBox",
					"GetFacade"
				}
			},
			Block = {
				methods = {
					"ReplaceBluePrint",
					"CreateBlock",
					"GetBlockID",
					"CheckBlockDir",
					"DestroyBlockDrop",
					"DestroyBlock",
					"SetBlockSwichState",
					"SetBlockColor",
					"SetBlockDir",
					"CreateSpcBlock",
					"GetFacade",
					"GetBlockSwitchStatus",
					"CompareBlockID"
				}
			},
			Actor = {
				methods = {
					"GetProjectileShootMob",
					"GetProjectileShootPlayer",
					"PlayBodyEffectById",
					"PlayBodyParticleById",
					"GetBoundSzie",
					"RemoveImmuneAttackType",
					"SetActorDir",
					"SetFaceDir",
					"KillSelf",
					"SetAttr",
					"ChangActorMoveType",
					"SetFaceYaw",
					"ActorDoHurt",
					"SetPosition",
					"SetImmuneAttackType",
					"AppendSpeed",
					"FindNearestBlock",
					"ChangeCustomModel",
					"RecoverinitialModel",
					"SetCmpBaseState",
					"SetNickName",
					"SetTeam",
					"CompareTeam",
					"PlaySoundEffectById",
					"PauseSoundEffectById",
					"SetBodyEffectScale",
					"SetBodyParticleTransform",
					"StopBodyEffectById",
					"StopSoundEffectById",
					"ResumeSoundEffectById",
					"PaseOrResumeSoundEffectById",
					"CheckTargetActorType",
					"CheckActorType",
					"GetPosition",
					"TryMoveToPos",
					"ClearActorWithId",
					"CompareMovementMode",
					"TryInteractActor",
					"CheckPickupActionValid",
					"GetPickupActorID",
					"SetBtreeVarValue",
					"GetBtreeVarValue",
					"ObjToAnyObj",
					"RoleToAnyObj",
					"IncreasesAttr",
					"AddOrRemoveTags",
					"PlayAnimByObj"
				}
			},
			Monster = {
				methods = {
					"GetMonsterFacade",
					"GetFacade"
				}
			},
			Area = {
				methods = {
					"BlockInArea",
					"ReplaceAreaBlock",
					"ObjInArea",
					"GetCenterPos",
					"CloneArea",
					"GetRandomPos",
					"GetCenterFloatPos",
					"GetRandomFloatPos",
					"PosInArea",
					"FillBlock",
					"ClearAllBlock",
					"DestroyAllBlock"
				}
			},
			Buff = {
				methods = {
					"CompareBuff",
					"RemoveBuff",
					"ReplaceBuff",
					"AddBuff",
					"HasBuff",
					"GetBuffLeftTime"
				}
			},
			Graphics = {
				methods = {
					"MakeGraphicsArrowToPos",
					"MakeGraphicsLineToPos",
					"MakeGraphicsSurfaceToPos",
					"CreateGraphicsByPos",
					"CreateGraphicsByPos2",
					"RemoveGraphicsByPos",
					"GetInnerGraphicsOffset",
					"CreateGraphicsByActor",
					"CreateGraphicsByActor2",
					"MakeGraphicsNavPathToPos",
					"RemoveGraphicsByObjID"
				}
			},
			Backpack = {
				methods = {
					"CreateItemID",
					"DiscardItemByID",
					"AddItem",
					"RemoveItem",
					"SetGridItem",
					"RemoveGridItem",
					"EnoughSpaceForItem",
					"ActEquipUpByResID",
					"ActEquipOffByEquipID",
					"ActDestructEquip",
					"GetShurtItemnum",
					"GetShurtItemid",
					"PlayShortCutIxEffect",
					"PlayShortCutIxParticle",
					"StopShortCutIxEffect",
					"PlayShortCutItemEffect",
					"PlayShortCutItemParticle",
					"StopShortCutItemEffect",
					"GetGridInfos",
					"LoadGridInfos",
					"DecodeGridInfo",
					"EncodeTableGridInfo",
					"SetGridsLock",
					"ClearGrids",
					"SetBackPackNum"
				}
			},
			GameObject = {
				methods = {
					"CreatePrefabInst",
					"CreatePrefabInstEx",
					"GetPrefabName",
					"GetPrefabDes",
					"CreateSinglePrefabInst",
					"GetObjectPrefab"
				}
			},
			KvMap = {
				methods = {
					"SetOrderDataBykey",
					"RemoveOrderDataByKey",
					"GetOrderDataBykey",
					"SetDataListBykey",
					"GetDataListBykey",
					"RemoveDataListBykey"
				}
			},
			Timeline = {
				methods = {
					"PlayForPlayer",
					"Pause",
					"Resume",
					"SkipForPlayer",
					"GetDisplayName"
				}
			}
		},
		methods = {
			"GetLastCreateCreatureObjId",
			"Substring",
			"GetLastCreateCreatureId",
			"String2Playerid",
			"GetStringLength",
			"Wait",
			"Str2Obj",
			"AnyValue2Str",
			"GetElementID",
			"GetRandomColor",
			"GetLastCreateBlockId",
			"GetLastCreateEffectId",
			"SetLastCreateEffectId",
			"SetLastCreateItemId",
			"GetLastCreateItemId",
			"SplitStr",
			"DoObjOrArrayAction",
			"GetPrefabIdStr",
			"GetPrefabInfo",
			"AllSound",
			"AllAttackType",
			"AllStatus",
			"SetLastCreateCreatureId",
			"SetLastCreateBlockId",
			"GetPlayerId",
			"GetMobId",
			"ToPlayerId",
			"ToMobId",
			"PrintTag",
			"GetWorld",
			"GetUIObject",
			"TransmitToCategoryRoom",
			"GetEffectParams"
		},
		dismethods = {}
	},
	Area = {
		name = "区域模块",
		methods = {
			"BlockInArea",
			"GetAreaBlockTypes",
			"GetAreaPlayers",
			"GetAreaRectRange",
			"CreateAreaRectByLen",
			"ReplaceAreaBlock",
			"FillBlockAreaRange",
			"DestroyAllBlock",
			"ObjInArea",
			"CloneAreaRange",
			"PosInArea",
			"GetAreaCreatures",
			"ClearAllBlock",
			"GetAllObjsInAreaRange",
			"GetRelativeActors",
			"GetBlockNum",
			"CreateAreaRectByRange",
			"GetRandomPos",
			"CreateAreaPrefab",
			"GetAreaUuidByObjId",
			"DestroyArea",
			"GetAreaCenter",
			"GetAreaRectLength",
			"CloneAreaBlock",
			"GetAllPlayersInAreaRange",
			"GetAllCreaturesInAreaRange",
			"ClearAllBlockAreaRange",
			"ReplaceAreaRangeBlock",
			"GetRandomAirPos",
			"CheckRangeCanPlace"
		}
	},
	Listen = {
		methods = {
			"AddGraphicsListenParam"
		}
	},
	Timer = {
		name = "计时器模块",
		methods = {
			"StartBackwardTimer",
			"StartForwardTimer",
			"PauseTimer",
			"ResumeTimer",
			"ChangeTimerTime",
			"ShowTimerWnd",
			"HideTimerWnd",
			"StopTimer",
			"GetTimerTime",
			"IsExist",
			"CreateTimer",
			"DeleteTimer"
		}
	},
	Item = {
		name = "道具模块",
		methods = {
			"GetAttr",
			"RandomProjectileID",
			"GetItemDesc",
			"RandomItemID",
			"GetItemName",
			"GetGunBaseDesc",
			"GetCustomGunAttr",
			"GetFacade",
			"GetItemModelComp",
			"CreateGunInWorld",
			"CreateItemInstInBackpack",
			"CreateItemInstInWorld",
			"SetObjData",
			"GetObjData",
			"SetObjDataByGrid",
			"GetObjDataByGrid",
			"GetEquipItemGridID",
			"ModifyGunAttribute",
			"GetGunAttribute",
			"GetGunPrefabAttribute",
			"GetItemIdByInstanceId",
			"GetResIdByInstanceId",
			"AddSubModelPart",
			"DeleteSubModelPart",
			"ReplaceSubModelPart",
			"SetStringCustomData",
			"SetBoolCustomData",
			"SetNumberCustomData",
			"SetObjCustomData",
			"SetArrayCustomData",
			"GetStringCustomData",
			"GetBoolCustomData",
			"GetNumberCustomData",
			"GetObjCustomData",
			"GetArrayCustomData",
			"GetCraftIDNum",
			"GetCraftMaterialAndNum",
			"GetGridAttr",
			"GetItemInstFacade",
			"GetTags",
			"CreateBindItemInBackpack",
			"IsBindItem"
		}
	},
	Block = {
		name = "方块模块",
		methods = {
			"GetBlockData",
			"GetBlockSettingAttState",
			"GetBlockID",
			"SetBlockSettingAttState",
			"GetBlockSwitchStatus",
			"SetBlockSwitchStatus",
			"RandomBlockID",
			"ReplaceBluePrint",
			"DestroyBlock",
			"SetBlockSwichState",
			"SetBlockColor",
			"SetBlockDir",
			"GetBlockDefName",
			"GetBlockDefDesc",
			"ReplaceBlock",
			"GetBlockDir",
			"PlaceBlock",
			"PlayAnim",
			"GetFacade",
			"SetBlockAll",
			"IsSolidBlock",
			"IsLiquidBlock",
			"IsAirBlock",
			"PlayCrackEffect",
			"PlayDestroyEffect",
			"GetBlockDropItemType",
			"GetBlockDropExp",
			"GetBlockPowerStatus",
			"SetBlockData",
			"SetBlockTextureColor",
			"CreateObsBluePrint",
			"PlaceBluePrint",
			"UnbindBluePrintRegion",
			"SaveBluePrintRegionData",
			"BluePrintSaveAsNewId",
			"BluePrintSetUploadInteral",
			"DeleteBluePrint",
			"GetBluePrintBlockInfo",
			"CaptureAndUploadScreenshot",
			"LoadObsBluePrint",
			"UnloadObsBluePrint",
			"StopPlaceObsBluePrint",
			"GetObsBluePrintStatus",
			"GetObsBluePrintPos"
		}
	},
	Graphics = {
		name = "图文信息模块",
		methods = {
			"MakeflotageText",
			"RemoveGraphicsByPos",
			"MakeGraphicsArrowToPos",
			"GetInnerGraphicsOffset",
			"MakeGraphicsSurfaceToPos",
			"MakeGraphicsArrowToActor",
			"MakeGraphicsLineToActor",
			"MakeGraphicsSurfaceToActor",
			"MakeGraphicsImage",
			"CreateGraphicsTxtByPos",
			"CreateGraphicsArrowByPosToActor",
			"CreateGraphicsArrowByPosToPos",
			"CreateGraphicsLineByPosToActor",
			"CreateGraphicsLineByPosToPos",
			"CreateGraphicsSurfaceByPosToActor",
			"CreateGraphicsSurfaceByPosToPos",
			"CreateGraphicsImageByPos",
			"CreateGraphicsTxtByActor",
			"CreateGraphicsArrowByActorToActor",
			"CreateGraphicsArrowByActorToPos",
			"CreateGraphicsLineByActorToActor",
			"CreateGraphicsLineByActorToPos",
			"CreateGraphicsSurfaceByActorToActor",
			"CreateGraphicsSurfaceByActorToPos",
			"CreateGraphicsImageByActor",
			"CreateflotageTextByPos",
			"CreateflotageTextByActor",
			"CreateGraphicsProgressByPos",
			"CreateGraphicsProgressByActor",
			"CreateGraphicsNavPathByActorToPos",
			"MakeGraphicsLineToPos",
			"MakeGraphicsText",
			"MakeGraphicsProgress",
			"MakeGraphicsNavPathToPos",
			"RemoveGraphicsByObjID",
			"UpdateGraphicsTextById",
			"UpdateGraphicsProgressById",
			"ReplaceAllGraphics",
			"CreateBrushByPos",
			"RemoveGraphicsByGraphicsID"
		}
	},
	CustomUI = {
		name = "界面模块",
		methods = {
			"TurnSliderToPos",
			"SetSliderDir",
			"SetSliderBarImg",
			"CreateElement",
			"CloneElement",
			"ChangeParent",
			"SetProgressBarValue",
			"SetProgressBarResId",
			"SetFontSize",
			"SmoothIncreaseProgress",
			"GetItemIcon",
			"GetMonsterObjIcon",
			"GetMonsterIcon",
			"SetColor",
			"GetBlockIcon",
			"SetPosition",
			"SetTexture",
			"SetSize",
			"SetSpineAnimID",
			"SetState",
			"GetStatusIcon",
			"SetAlpha",
			"SetText",
			"SetRelationSize",
			"ShowElement",
			"HideElement",
			"RotateElement",
			"SetRelationPosition",
			"SmoothMoveTo",
			"SmoothMoveBy",
			"SmoothScaleTo",
			"SmoothScaleBy",
			"SmoothRotateTo",
			"SmoothRotateBy",
			"PlayElementAnim",
			"StopAnim",
			"SetLoaderModel",
			"SetLoaderModelScale",
			"SetLoaderModelDir",
			"GetRoleIcon",
			"GetRoleHeadIcon",
			"SetLoaderModelAct",
			"SetLoaderModelPosition",
			"GetScreenSize",
			"GetProgressBarValue",
			"SmoothChangeProgress",
			"GetShortcutIcon",
			"SetScale",
			"SetFloatDamageTxt",
			"SmoothScaleByEx",
			"DeleteElement",
			"SetPositionBindActor",
			"RemovePositionBindActor",
			"SetPositionBandBlock",
			"RemovePositionBandBlock",
			"SetSysSettingBtnVisible",
			"GetElementAttrValue",
			"GetUIViewAttrValue",
			"SetBeaconMapType",
			"SetBeaconBandPos",
			"SetBeaconObjId",
			"SetBeaconOffset",
			"SetBeaconClampType",
			"SetBeaconRadius",
			"SetUrlIcon",
			"SetBeaconMargin"
		}
	},
	Chat = {
		name = "消息模块",
		methods = {
			"SendChat",
			"SendSystemMsg"
		}
	},
	Actor = {
		name = "角色模块",
		methods = {
			"GetRidingActorObjId",
			"GetFaceDirection",
			"PlayBodyEffectById",
			"PlayBodyParticleById",
			"GetActionAttrState",
			"RandomFacadeID",
			"SetAttr",
			"GetItemId",
			"GetBoundSzie",
			"GetEyeHeight",
			"GetObjType",
			"IsExist",
			"SetPosition",
			"ClearActorWithId",
			"GetDropItemNum",
			"IsPlayer",
			"SetImmuneType",
			"KillSelf",
			"ChangActorMoveType",
			"SetFaceYaw",
			"AppendSpeed",
			"FindNearestBlock",
			"GetAttr",
			"RecoverinitialModel",
			"SetCmpBaseState",
			"GetCmpBaseState",
			"SetActorPermissions",
			"GetActorPermissions",
			"SetActionAttrState",
			"SetNickName",
			"GetNickName",
			"ShowNickName",
			"SetTeam",
			"PlaySoundEffectById",
			"PauseSoundEffectById",
			"SetBodyEffectScale",
			"SetBodyParticleTransform",
			"StopBodyEffectById",
			"StopSoundEffectById",
			"GetActorDir",
			"TryMoveToPos",
			"GetFaceYaw",
			"GetActorFacade",
			"ChangeCustomModel",
			{
				name = "GetPosition",
				envType = DevApiEnvType.Motion
			},
			"ActorHurt",
			"GetTeam",
			"GetDefID",
			"SetFacePitch",
			"GetFacePitch",
			"PlayAnim",
			"PlayHandAnim",
			"TryMoveToActor",
			"SetFaceDirection",
			"GetActorMovementMode",
			"MountActor",
			"DisMountActor",
			"SetMountActorAttr",
			"PickupActor",
			"TryPickupActorForward",
			"DropActor",
			"EscapePickup",
			"WhitList_StopSkill",
			"AddHp",
			"GetMaxHP",
			"RotateFaceToActor",
			"GetCurMapId",
			"GetObjWorldId",
			"SetBtreeBBvalue",
			"GetBtreeBBvalue",
			"GetDropItemInstanceId",
			"SetBtreeVarValue",
			"GetBtreeVarValue",
			"SetAblePick",
			"GetEntityFacade",
			"GetMotion",
			"HasActor",
			"SetBeHurtTarget",
			"Jump",
			"PickupItem",
			"CompareMainModel",
			"GetPickupObjID",
			"IncreasesAttr",
			"HasTags",
			"AddTags",
			"RemoveTags",
			"ClearTags",
			"GetTags",
			"PlayAnimByObj",
			"EmitByShooter",
			"EmitByShooterTarget",
			"EmitByShooterTargetPos"
		}
	},
	Monster = {
		name = "生物模块",
		methods = {
			"RandomActorID",
			"SetTameTarget",
			"GetActorID",
			"ReplaceActor",
			"GetTamedOwnerID",
			"SetAIActive",
			"ChangeAI",
			"GetFacade",
			"SetPersistance",
			"GetActorName",
			"GetMonsterDefLevelExp",
			"SetMonsterDefLevelExp",
			"CanSee",
			"GetDropItemInfo",
			"GetTags",
			"GetMonsterDefName"
		}
	},
	Player = {
		name = "玩家模块",
		methods = {
			"StandReportEvent",
			"GetPlayerCostStatic",
			"ReviveToPos",
			"GetAimPos",
			"OpenShopTryOnView",
			"OpenShopSkinBuyDialog",
			"OpenUIView",
			"GetFirstInviter",
			"OpenBoxByPos",
			"GetCurToolID",
			"GetHostUin",
			"SetCameraPosTransformTo",
			"SetCameraRotTransformTo",
			"CheckActionAttrState",
			"IsEquipByResID",
			"IsHandWeaponSpellEnhancementActive",
			"SetCameraRotTransformBy",
			"SetCameraFovTransformBy",
			"HasFriend",
			"GetMiniVipLevel",
			"HideUIView",
			"SetCameraPosTransformBy",
			"SetCameraFovTransformTo",
			"MountActor",
			"GetNickname",
			"NotifyGameInfo2Self",
			"ShakeCamera",
			"StopShakeCamera",
			"SetCameraAttrState",
			"SetCameraRotMode",
			"ResetCameraAttr",
			"ItemSkillCDEnter",
			"ItemSkillCDDone",
			"SetGameResults",
			"SetGameWin",
			"SetRevivePoint",
			"UseItem",
			"ForceOpenBoxUI",
			"SetShotcutIndex",
			"SetCameraMountPos",
			"ChangeViewMode",
			"OpenShopGiveGiftView",
			"SetMobileVibrate",
			"PauseMusic",
			"GetCurShotcut",
			"GetShotcutIndex",
			"SetSkillCD",
			"SetItemAttAction",
			"RotateCamera",
			"SetCameraMountObj",
			"PlayMusic",
			"StopMusic",
			"SendFriendApply",
			"PlayAdvertising",
			"OpenInnerView",
			"HasHandheldGun",
			"SetCrawl",
			"GunGetMagazine",
			"ChangeViewModeForMod",
			"SetGunActionState",
			"GetAimDir",
			"GetViewMode",
			"GetRentCloudServerOwner",
			"OpenDevGoodsBuyDialog",
			"OpenDevGoodsBuyDetailedDialog",
			"OpenDevStore",
			"OpenDevStoreTab",
			"OpenDevGoodsPage",
			"GetRevivePoint",
			"GetRayOriginPos",
			"RotateCameraToActor",
			"ClearMotion",
			"GetScreenSpacePos",
			"GetScreenSpacePosV2",
			"ChangPlayerMoveType",
			"AddMagazine",
			"GetClientInfo",
			"GetVisibleRange",
			"SetVisibleRange",
			"SetCameraShake",
			"RemovePlayer",
			"OpenActView",
			"GetSkinlist",
			"GetSkinSeatInfos",
			"GetFriendList",
			"GetMiniCurrency",
			"OpenFriendChatPage",
			"SetSettingEnable",
			"SetSettingAbility",
			"OpenMiniShopPage",
			"OpenMiniShopItemPage",
			"OpenMiniShopWarehousePage",
			"GetHorseRealID",
			"GetPersonInfo",
			"RotateMainModel",
			"GetBlockAtlasInfo"
		}
	},
	Buff = {
		name = "状态模块",
		methods = {
			"GetBuffLeftTime",
			"HasBuff",
			"GetBuffDefName",
			"GetBuffDefDesc",
			"ReplaceBuff",
			"RemoveBuff",
			"AddBuff",
			"ClearAllGoodBuff",
			"ClearAllBadBuff",
			"ClearAllBuff",
			"GetBuffList",
			"GetBuffNumByBuffid"
		}
	},
	Team = {
		name = "队伍模块",
		methods = {}
	},
	World = {
		name = "世界模块",
		methods = {
			"CalcDirectionByYawAngle",
			"CalcDirectionByCoord",
			"GetHours",
			"RandomParticleEffectID",
			"RandomSoundID",
			"SetHours",
			"SetGravity",
			"SetTimeVanishingSpeed",
			"SetSkyBoxTemplate",
			"SetSkyBoxMaps",
			"SetSkyBoxFilterAnim",
			"SetSkyBoxAttr",
			"SetSkyBoxAttrWithNoTime",
			"SetSkyBoxSwitch",
			"SetSkyBoxFilter",
			"GetDateFromTime",
			"GetDirRayDetection",
			"GetPlayerTotal",
			"GetTimeFromDateString",
			"GetSpawnPoint",
			"GetRayLength",
			"GetDateStringFromTime",
			"SetSkyBoxColor",
			"CalcDirectionByAngle",
			"GetRayBlock",
			"CalcDirectionByYawDirection",
			"GetGravity",
			"RandomWeatherID",
			"CalcDistance",
			"StopSoundEffectOnPos",
			"SpawnProjectile",
			"GetLocalDate",
			"SpawnCreature",
			"PlayParticleEffect",
			"StopParticleEffectOnPos",
			"StopParticleOnPos",
			"SetParticleEffectScale",
			"SetParticleTransform",
			"PlaySoundEffectOnPos",
			"GetGroupWeather",
			"GetLocalDateString",
			"GetServerDate",
			"SetSkyBoxMapsAnim",
			"SetSkyBoxColorAnim",
			"GetBiomeGroup",
			"GetServerDateString",
			"SetSpawnPoint",
			"SetGroupWeather",
			"DespawnActor",
			"PauseSoundEffectOnPos",
			"GetDay",
			"PlayParticle",
			"PixelMapAddMarker",
			"PixelMapRefreshMarker",
			"PixelMapDelMarker",
			"PixelMapAddTexture",
			"PixelMapRefreshTexture",
			"PixelMapDelTexture",
			"SpawnProjectileByDir",
			"CanMobSpawnOnPosXZ",
			"GetCurMapId",
			"GetAllPlayers",
			"CalcDirectionByPos2Pos",
			"SetWorldCreateMobRule",
			"GetWorldCreateMobRule",
			"SetMobSpawnDensity",
			"SetPlantGrowRate",
			"SetInnerViewEnable",
			"SetMidJoin",
			"GetGameMode",
			"FindCanSpawnMobPosList",
			"FindNearestPlayerByPos",
			"IsDaytime",
			"GetBiomeType",
			"FindEcosystem",
			"GetLightByPos",
			"FindNearActorListByObjType",
			"GetHostWorldId",
			"SetLightByPos",
			"AddGameTimes",
			"AddGravity",
			"IsChunkLoaded",
			"SetChunkRectAlwaysLoaded",
			"EmitByPosition",
			"EmitByPositionTargetPos",
			"EmitByPositionTarget"
		}
	},
	WorldContainer = {
		name = "容器模块",
		methods = {
			"ClearContainer",
			"AddItemToContainer",
			"SetStorageItem",
			"RemoveContainerItemByID",
			"CheckStorage",
			"ClearStorageBox",
			"CheckStorageEmptyGrid",
			"GetStorageItem",
			"AddStorageItem",
			"RemoveStorageItemByID",
			"RemoveStorageItemByIndex",
			"AddWorldStorageItems",
			"GetStorageItemInstanceId",
			"GetAllStorageItemInstanceIds",
			"SwapContainerItem",
			"GetGridAttr"
		}
	},
	Backpack = {
		name = "背包模块",
		methods = {
			"GetGridItemName",
			"CalcSpaceNumForItem",
			"ClearPack",
			"GetGridItemID",
			"SwapGridItem",
			"CreateItem",
			"DiscardItemByID",
			"DiscardItem",
			"AddItem",
			"SetGridItem",
			"RemoveGridItem",
			"EnoughSpaceForItem",
			"ActEquipUpByResID",
			"ActEquipOffByEquipID",
			"ActDestructEquip",
			"GetItemNumByBackpackBar",
			"StopShortCutIxEffect",
			"RemoveGridItemByItemID",
			"HasItemByBackpackBar",
			"PlayShortCutItemEffect",
			"PlayShortCutItemParticle",
			"PlayShortCutIxEffect",
			"PlayShortCutIxParticle",
			"MoveGridItem",
			"StopShortCutItemEffect",
			"GetItemNum",
			"ClearAllPack",
			"GetGridGunInfo",
			"GetAllBackPackInstanceIds",
			"CreateItemInstInBackpack",
			"CreateGunInBackpack",
			"GetInstIdByGridIndex",
			"GetGunInstIdInBackpack",
			"GetGridInfos",
			"LoadGridInfos",
			"DecodeGridInfo",
			"EncodeTableGridInfo",
			"SetGridsLock",
			"ClearGrids",
			"SetBackPackNum",
			"IsLock",
			"GetGridAttr",
			"SetGridAttr"
		}
	},
	GameRule = {},
	GameEffect = {},
	Mod = {
		name = "资源模块",
		methods = {
			"GetCfgIdByAssetId"
		}
	},
	Task = {},
	ObjectLib = {},
	Biome = {},
	CloudSever = {
		name = "云服模块",
		methods = {
			"SetDataListValue",
			"SetDataListBykey",
			"GetDataListByKey",
			"TransmitToCategoryRoom",
			"TransmitToCurMapCategoryRoom",
			"GetRoomCategory",
			"SetRoomCategory",
			"GetRoomID"
		}
	},
	Game = {
		methods = {}
	},
	OfficeUtils = {
		name = "工具模块",
		methods = {
			"ReportActivateDataForUin",
			"GetShopItemInfo",
			"GetActivateProgress",
			"GetActivateReward",
			"SendClientReportEvent"
		}
	},
	Timeline = {
		name = "剧情动画模块",
		methods = {
			"PlayForAll",
			"PlayForPlayer",
			"Pause",
			"Resume",
			"SkipForPlayer",
			"GetPlayerState",
			"IsAllFinished"
		}
	}
}
