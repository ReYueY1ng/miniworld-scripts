# DevApiCfg.lua 限制体系分析

## 概述

`luascript/ugc/framework/api/devapicfg.lua` 定义了 UGC 脚本系统对第三方 Mod 开发者调用引擎 API 的**权限控制和频率限制**配置。由 `ScriptEnvMgr`（`mgr/scriptenvmgr.lua`）加载并执行。

控制分为四个维度：对象方法白名单、Service 黑名单/白名单+配置、devServices 二次筛选、以及运行时权限限制。

---

## 一、四大维度的 API 控制

### 1. DevApiMType — 同步方式（怎么执行）

| 类型 | 值 | 作用 |
|------|----|------|
| `Normal` | 0 | 直接本地执行，无网络同步 |
| `Block` | 1 | 阻塞等待 Host 执行完毕返回结果 |
| `NoBlock` | 2 | 非阻塞发送到 Host |
| `Sync` | 3 | 同步到 Host 执行（可靠消息） |
| `SyncPack` | 4 | 打包同步（高频操作合并发送，减少带宽） |
| `ClientData` | 5 | 只在客户端本地取数据，不走网络 |
| `ReportHost` | 6 | 客户端上报给 Host（客户端主动触发） |
| `HostAndClient` | 7 | Host 和 Client 都执行（双端同步） |
| `BoardCast` | 8 | 广播给所有客户端 |
| `Mod` | 9 | Mod 专属调用路径 |

`ScriptEnvMgr:LoadServicesApi()`（scriptenvmgr.lua:289-556）根据此类型决定实际调用方式：
- `Normal` → `v(service, ...)` 直接调用
- `Sync` → `SyncMgr:Sync(msgid, ...)`
- `SyncPack` → `SyncMgr:SyncPack(msgid, ...)`
- `Block` → `SyncMgr:HostRunBlockFunc(msgid, ...)`
- `ClientData` → `SyncMgr:GetClientValue(msgid, ...)`
- `BoardCast` → `SyncMgr:BoardCast(msgid, ...)`
- `HostAndClient` → `v(service, true, ...)` caller 注入 `true`；receiver 注入 `false`
- `ReportHost` → `SyncMgr:ReportEventToHost()` 上报，Host 收到时注入 `playerid`
- `Mod` → `v(service, ...)` 直接调用（并标记 `modInfoTable[k] = true`）

> ⚠️ `NoBlock`（2）在枚举中仍保留，但 `LoadServicesApi` 的调用分支**没有为其实现**——配置了 `NoBlock` 的方法会落入 `else` 分支且不匹配任何 `msgid` 类型，最终**不会被暴露**。属于已废弃的枚举值。

#### 额外参数注入

部分 MType 在调用 Service 方法时会**注入额外参数**，Service 方法签名需对应调整：

> 注：datasycmgr.lua 实际位于 `luascript/ugc/framework/mgr/datasycmgr.lua`（框架层 mgr 目录，非 logic/）。

| MType | 注入参数 | Service 方法签名 | 说明 |
|-------|---------|-----------------|------|
| `HostAndClient` | `isHost` (bool) | `method(self, isHost, ...)` | caller 侧注入 `true`（scriptenvmgr.lua:394），receiver 侧注入 `false`（datasycmgr.lua:380） |
| `Block` | `runcallback` (func) | `method(self, runcallback, ...)` | Host 执行完后调 `runcallback(result)` 返回结果给客户端（datasycmgr.lua:789） |
| `ReportHost` | `playerid` (number) | `method(self, playerid, ...)` | Host 端收到上报时注入发起者 UIN（datasycmgr.lua:352） |
| 其他类型 | 无 | `method(self, ...)` | 原样透传用户参数 |

`HostAndClient` 的 `isHost` 区分当前执行端：

```lua
-- ScriptEnvMgr caller 侧 (scriptenvmgr.lua:394)
v(service, true, ...)   -- Host 调用

-- DataSycMgr receiver 侧 (datasycmgr.lua:380)
pcall(Service[service][method], Service[service], false, ...)  -- Client 收到同步包
```

`Block` 的 `runcallback` 用于异步返回：

```lua
-- DataSycMgr:789
pcall(Service[service][method], Service[service], runcallback, ...)
-- Service 内部: runcallback(result1, result2, ...)
-- 客户端阻塞等待 Host 返回结果
```

### 2. DevApiRType — 调用权限（谁能调、调多快）

| 类型 | 值 | 作用 |
|------|----|------|
| `Uin_TimeLimit` | 2 | 按玩家 UIN 的频率限制（冷却 N 秒） |
| `WhiteList` | 3 | 白名单鉴权（需云服务校验权限标识） |
| `TimeLimit` | 4 | 全局频率限制（所有玩家共享冷却） |
| `CompareParam` | 5 | 同步参数比较（避免重复发送相同数据） |
| `ResetCompareParam` | 6 | 调用时重置其他方法的比较缓存 |
| `ResendMsg` | 7 | 断线重连时补发消息 |

---

## 二、限制判断机制

### 频率限制：Uin_TimeLimit / TimeLimit

`ScriptEnvMgr:CheckLimit()`（scriptenvmgr.lua:216-287）：

```lua
-- Uin_TimeLimit: 按玩家 UIN 限频
if itype == DevApiRType.Uin_TimeLimit then
    local curtime = g_curtime
    local otime = info[itype] or 0
    if otime == 0 or curtime - otime > v[1] then  -- v[1] 是冷却秒数
        info[itype] = curtime   -- 记录本次调用时间
        ret = false             -- 允许
    else
        -- 超频：弹提示 v[2]（如"调用频繁，请稍后尝试！"）
        ret = true              -- 拒绝
    end
end
```

**示例**：`Player.GetFriendList` 配置 `Uin_TimeLimit = {10, "调用频繁，请稍后尝试！"}` → 同一玩家 10 秒内只能调一次。

### 白名单鉴权：WhiteList

`ScriptEnvMgr:CreateModEvnService()`（scriptenvmgr.lua:718-773）：

```lua
if not isOfficial then  -- 官方环境（isOfficial=true）跳过全部 WhiteList 校验
    limitkey = servicename and servicename .. "." .. key or key

    if self.limitcfg[limitkey] and self.limitcfg[limitkey][DevApiRType.WhiteList] then
        local ns = self.limitcfg[limitkey][DevApiRType.WhiteList]

        if modId ~= localMap then  -- 第三方 Mod：取作者 UIN 校验
            local moddesc = ModPackMgr and ModPackMgr:GetModDescByUUID(modId, true)

            if moddesc then
                local ret = check_apiid_ver_conditions_in_cloudsever(ns_version[ns], false, moddesc.iAuthorUin)
                blimit = not ret
            else
                blimit = true  -- 找不到 mod 描述 → 直接拒绝
            end
        else  -- localMap（编辑器/本地地图环境）：不传 UIN 校验
            local ret = check_apiid_ver_conditions_in_cloudsever(ns_version[ns], false)
            blimit = not ret
        end
    end
end
-- blimit=true 时方法被替换为: ShowGameTips("权限不足 " .. limitkey) return false
```

`ns_version` 是从云服务下载的配置表（对应 `limits.txt` 的数据），`ns` 是 WhiteList 名称（如 `"LuaApi3_InternalApi"`）。

### 禁用方法：dismethods

直接排除，**对第三方完全不可见**（scriptenvmgr.lua:332-342）：

```lua
if cfg.dismethods then
    for i = 1, #cfg.dismethods do
        dismethods[cfg.dismethods[i]] = 1
    end
end
-- 遍历 service 方法时: if dismethods[k] == nil then 才暴露给脚本
```

---

## 三、check_apiid_ver_conditions_in_cloudsever 鉴权逻辑

定义于 `luascript/ugc/logic/gameglobal.lua:296-562`。

```lua
function check_apiid_ver_conditions_in_cloudsever(condition_configs, default_, taguin, mapid)
    if condition_configs then
        -- 1. super_uin_list：命中 return true，不命中继续（快速通道，不拒绝）
        -- 2. device_ids：命中 return true，不命中继续
        -- 3. uin_list：不在列表 return false，在列表继续；无此字段则跳过
        -- 4. Map_list：不在列表 return false，在列表继续
        -- 5. creator_limit：不满足 return false（海外环境直接 false；需 idType==2 的创作者）
        -- 6. versions_yes：命中版本列表且 apiids 通过 → 提前 return true
        -- 7. versions_no：命中版本列表且 apiids 通过 → 提前 return false
        -- 8. apiids：当前渠道不在列表 return false
        -- 9. apiids_no：当前渠道在列表 return false（"9999" 仅屏蔽 apiid=9999）
        -- 10. version_min：版本过低 return false
        -- 11. version_max：版本过高 return false
        -- 12. lang / langs：语言不匹配 return false
        -- 13. start_time / end_time：不在时间窗口 return false
        -- 14. close_start_time / close_end_time：处于停机维护窗口 return false
        -- 15. countrys / noCountrys：国家限制
        -- 16. userPkgs / noUserPkgs：用户包限制
        -- 17. isExtLink：外部链接限制（extLinksFlag 或 reviewForbidden 任一开启均 return false）
        return true  -- 所有检查均未 return false → 放行
    elseif default_ then
        return true
    else
        return false  -- condition_configs 为 nil → 拒绝
    end
end
```

**关键理解**：
- `condition_configs` 存在 + 内部没有一个检查触发 `return false` → 最终 `return true`
- `super_uin_list` 只是**快速通道**，不命中不拒绝，继续后续检查
- `versions_yes` / `versions_no` 是**提前返回**开关：命中版本且 apiids 通过即跳过其余所有检查直接 return
- `uin_list` 是**硬门控**，不在列表中直接 `return false`
- `apiids_no = "9999"` 只屏蔽 apiid 恰好为 9999 的渠道，不影响正常用户
- `condition_configs` 为 nil（ns_version 中无此 key）→ 返回 `default_`（false）

---

## 四、各 WhiteList API 可用性

> ⚠️ **数据来源说明**：`ns_version` 的实际内容由云端下发——客户端在 `miniui/module/commoncomp/cfgdownload/cfgdownloadpluglaunch.lua:380`（`WWW_file_download("version")` 回调）、服务端在 `luascript/cloudserverinitconst.lua:91` 填充，**本 dump 中不包含该数据**。下表「配置内容」列的 uin_list 数量、`apiids_no`、`super_uin_list`、`creator_level` 等来自运行期快照，需以当前云端配置为准；方法→WhiteList key 的映射则来自 devapicfg.lua，可验证。

### ✅ 对所有 Mod 可用

以下 API 的 `ns_version` 配置中**无 `uin_list`**，后续检查也不会 return false，最终 return true。

| ns_version Key | DevApiCfg 中的 API | 配置内容 |
|---|---|---|
| `LuaApi3_CustomUI_GetUIViewAttrValue` | `CustomUI.GetUIViewAttrValue` | `apiids_no = "9999"` |
| `LuaApi3_CustomUI_GetElementAttrValue` | `CustomUI.GetElementAttrValue` | `apiids_no = "9999"` |
| `LuaApi3_World_AddGameTimes` | `World.AddGameTimes` | `apiids_no = "9999"` |
| `message_trigger` | `CloudSever.SendSeverMsg` | `super_uin_list` + `creator_level = 1`（`creator_level` 不被函数检查） |

### ❌ 仅白名单 UIN 可用

以下 API 的 `ns_version` 配置中有 **`uin_list`**，不在列表中的 UIN 会被 `return false`。

| ns_version Key | DevApiCfg 中的 API | uin_list 概况 |
|---|---|---|
| `LuaApi3_InternalApi` | Data.DoPackBluePrint, Item.CreateItemInstInBackpack, Item.SetObjData, Item.GetObjData, Item.GetItemModelComp, Item.GetObjDataByGrid, Item.SetObjDataByGrid, Item.LevelUpEquipOrGunForPlayer, Item.FreshPowerEquipOrGunForPlayer, Item.EmpowerEquipOrGunForPlayer, Block.CreateObsBluePrint, Block.PlaceBluePrint, Block.UnbindBluePrintRegion, Block.SaveBluePrintRegionData, Block.BluePrintSaveAsNewId, Block.BluePrintSetUploadInteral, Block.DeleteBluePrint, Block.GetBluePrintBlockInfo, Block.CaptureAndUploadScreenshot, Block.LoadObsBluePrint, Block.UnloadObsBluePrint, Block.StopPlaceObsBluePrint, Block.GetObsBluePrintStatus, Block.GetObsBluePrintPos, Listen.SetBlockAll, CustomUI.SetUrlIcon, Player.ChangeViewModeForMod, Player.SetCrawl, Player.HasHandheldGun, Player.GunGetMagazine, Player.AddMagazine, Player.GetVisibleRange, Player.SetVisibleRange, World.FindNearActorListByObjType, OfficeUtils.GetActivateProgress, OfficeUtils.GetActivateReward, OfficeUtils.SendClientReportEvent, Actor.WhitList_StopSkill, Monster.SetPersistance, Backpack.GetGridGunInfo | 16 个 UIN |
| `LuaApi3_Item_GetGunBaseDesc` | Item.GetGunBaseDesc | 8 个 UIN |
| `LuaApi3_Item_CreateBindItemInBackpack` | Item.CreateBindItemInBackpack | 5 个 UIN |
| `LuaApi3_CustomUI_SetSysSettingBtnVisible` | CustomUI.SetSysSettingBtnVisible | 5 个 UIN |
| `LuaApi3_Player_SetCameraShake` | Player.SetCameraShake | 10 个 UIN |
| `LuaApi3_Player_GetSkinlist` | Player.GetSkinlist | 6 个 UIN |
| `LuaApi3_Player_GetSkinSeatInfos` | Player.GetSkinSeatInfos | 5 个 UIN |
| `LuaApi3_Player_OpenMiniShopPage` | Player.OpenMiniShopPage | 5 个 UIN |
| `LuaApi3_Player_OpenMiniShopItemPage` | Player.OpenMiniShopItemPage | 5 个 UIN |
| `LuaApi3_Player_OpenMiniShopWarehousePage` | Player.OpenMiniShopWarehousePage | 5 个 UIN |
| `LuaApi3_Player_GetHorseRealID` | Player.GetHorseRealID | 5 个 UIN |
| `LuaApi3_Player_GetPersonInfo` | Player.GetPersonInfo | 6 个 UIN |
| `LuaApi3_Player_GetBlockAtlasInfo` | Player.GetBlockAtlasInfo | 5 个 UIN |
| `LuaApi3_World_SetChunkRectAlwaysLoaded` | World.SetChunkRectAlwaysLoaded | 仅 1 个 UIN |
| `trigger_api_MiraclesEventsPage` | Player.OpenActView | 26 个 UIN |
| `trigger_api_SkinTrialShop` | Player.OpenShopTryOnView, Player.OpenShopSkinBuyDialog | 9 个 UIN |
| `trigger_api_SendGiftsToFriends` | Player.OpenShopGiveGiftView, Player.OpenFriendChatPage | 6 个 UIN |
| `trigger_api_UploadActData` | OfficeUtils.ReportActivateDataForUin | 5 个 UIN |
| `trigger_api3_MapTagTransfer` | CloudSever.TransmitToCategoryRoom, CloudSever.TransmitToCurMapCategoryRoom, CloudSever.GetRoomCategory, CloudSever.SetRoomCategory, Trigger.TransmitToCategoryRoom | 23 个 UIN |
| `trigger_api_ReportOfficeActivateData` | OfficeUtils.ReportOfficeActivateData | uin_list（数量以云端配置为准） |

> 注：旧 key `trigger_api_MapTagTransfer`（不带 3）已不存在，当前统一使用 `trigger_api3_MapTagTransfer`（devapicfg.lua:1614/1622/1629/1637/1787 共 5 处引用）。

### ❌ ns_version 中不存在

| WhiteList Key | DevApiCfg 中的 API | 原因 |
|---|---|---|
| `LuaApi3_Item_IsBindItem` | Item.IsBindItem | ns_version 无此 key → `condition_configs = nil` → 返回 false |

---

## 五、API 暴露机制

`DevApiCfg` 中有两套不同性质的列表，作用完全不同：

### 1. 对象方法白名单（`DevApiCfg.gameObject/worldObject/BlockObject`）

这是**白名单**，决定虚拟对象（`virObj`）暴露哪些方法给沙盒脚本。**不在列表中的方法不会出现在虚拟对象上**。

`gameobject.lua:2901-2911` / `worldobject.lua:82-92` / `blockobject.lua:605-615` 中的加载逻辑：

```lua
local list = DevApiCfg.gameObject  -- 白名单列表
for i = 1, #list do
    local key = list[i]
    if virObj[key] == nil and type(self[key]) == "function" then
        virObj[key] = function(vir, ...)  -- 创建代理函数
            return self[key](self, ...)
        end
    end
end
```

不在列表中的方法对 Mod 脚本不可见。典型例子：`AddTriggerEvent` 不在 gameObject/BlockObject 白名单中，被硬编码替换为 `TipsFunction`（gameobject.lua:2913、blockobject.lua:617）；而 **worldObject 的白名单包含 `AddTriggerEvent`**（devapicfg.lua:72），不会被替换。

另外，`ApplyVirComponentInterfaces()`（gameobject.lua:2918 起）会**无条件**挂上组件/层级操作接口（`AddChild`/`GetChild`/`GetParent`/`SetParent`/`GetChildren`/`AddComponent`/`RemoveComponent`/`GetComponent`），不经过上述白名单过滤。

`ComponentsMgr:PrintDiffAllInfo()` 会把这些列表作为基线快照进行版本 diff（开发工具，不参与运行时）。

### 2. Service 方法黑名单（`DevApiCfg.services.*.dismethods`）

这是**黑名单**，从 Service 的全量方法中屏蔽指定方法。`ScriptEnvMgr:LoadServicesApi()`（scriptenvmgr.lua:332-342）在遍历 Service 函数时跳过 `dismethods` 中的方法：

```lua
if cfg.dismethods then
    for i = 1, #cfg.dismethods do
        dismethods[cfg.dismethods[i]] = 1
    end
end
for k, v in pairs(service) do
    if dismethods[k] == nil and type(v) == "function" then
        -- 暴露到沙盒
    end
end
```

各 Service 的 dismethods 黑名单：

- **Log**: PrintDevLog, PrintLog, DealLog, PcallErrorInfo, GetStrFromLine, PcallError, IsOpenLog, ModLoad, PrintRunInfo
- **GameObject**: CreateGameObject, CreateEditActor, CreateGameObjectDefault, FindGameObject, GetWorldObject, CreatePrefabInstObject, PushCustomEvent, CreatePrefabObject
- **Area**: GetObjInstanceID
- **Item**: _BeginModifyItem, _BeginModifyItemByGridIndex
- **Chat**: SendMsg
- **Player**: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld
- **Actor**: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld, CheckSyncAction
- **Monster**: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld
- **CustomUI**: CreateElementId, CloneElementId
- **World**: GetWorldById, GetWorldId
- **Planet**: GetOrCreatePlanetWorld, KeepChunkLoaded, PreloadChunk, IsPlanetRuntimeSupported, GetDefaultSafePos, FindRandomSafePos, RegisterKeptChunk, ReleaseKeptChunk, ReleaseAllKeptChunks

> 此外，`ToRunMode` / `GetBaseApi` / `OnDestroy` / `OnInit` 四个方法在所有 Service 中**无条件屏蔽**（scriptenvmgr.lua:295-300），与 dismethods 无关。

### 3. 完整过滤链

```
原始对象/Service 全量方法
    ↓ 对象白名单（gameObject/worldObject/BlockObject） + Service 黑名单（dismethods）
self.services（沙盒 API，带 MType/RType 包装）
    ↓ devServices 白名单（CopyServicesToDev）
self.servicesDev（第三方 Mod 环境）
self.servicesMotion（Motion 环境，额外按 envType 过滤）
```

---

## 六、总结

| 层级 | 机制 | 效果 |
|------|------|------|
| **对象方法白名单** | `DevApiCfg.gameObject/worldObject/BlockObject` | 决定虚拟对象暴露哪些方法，不在列表中则不可见 |
| **Service 黑名单** | `DevApiCfg.services.*.dismethods` | 从 Service 全量方法中屏蔽指定方法 |
| **内置方法剔除** | `ToRunMode/GetBaseApi/OnDestroy/OnInit` | 所有 Service 无条件屏蔽，不参与任何配置 |
| **Service 白名单+配置** | `DevApiCfg.services.*.methods` | 允许的方法 + MType/RType 同步/权限配置 |
| **devServices 白名单** | `DevApiCfg.devServices.*.methods` | 从沙盒 API 中再精选，用于第三方 Mod 和 Motion 环境 |
| **WhiteList 鉴权** | `DevApiRType.WhiteList` | 函数可见但调用时检查 ns_version 云服务配置 |
| **频率限制** | `Uin_TimeLimit / TimeLimit` | 调用成功后有冷却期保护 |
| **同步优化** | `CompareParam / ResetCompareParam` | UI 等高频场景避免发送重复数据 |

**WhiteList 判定核心**：`condition_configs` 存在 + 内部无 `return false` → 放行。`super_uin_list` 仅为快速通道，`uin_list` 才是硬门控，`versions_yes`/`versions_no` 可提前放行/拒绝。`condition_configs` 为 nil（ns_version 中无对应 key）→ 直接拒绝。
