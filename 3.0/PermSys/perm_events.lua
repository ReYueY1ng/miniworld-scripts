---@class PermEvents: WorldComponent
local PermEvents = {}

local PERM_CORE_COMPONENT_ID = "c7664922215809248473686730"

function PermEvents:OnPlayerEnterGame(e)
    local uin = e.eventobjid
    if not uin then
        print("[PermSys] PermEvents: EnterGame missing eventobjid")
        return
    end

    local permCore = self:GetComponent(PERM_CORE_COMPONENT_ID) --[[@as PermCore]]
    if not permCore or not permCore:IsValid() then
        print("[PermSys] PermEvents: PermCore not ready for user " .. tostring(uin))
        return
    end

    permCore:ensureUser(uin)
end

function PermEvents:OnPlayerLeaveGame(e)
    local uin = e.eventobjid
    if not uin then return end

    local permCore = self:GetComponent(PERM_CORE_COMPONENT_ID) --[[@as PermCore]]
    if permCore and permCore:IsValid() then
        permCore:clearPlayerCache(uin)
    end
end

function PermEvents:OnStart()
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerEnterGame, self.OnPlayerEnterGame)
    self:AddTriggerEvent(TriggerEvent.GameAnyPlayerLeaveGame, self.OnPlayerLeaveGame)
    print("[PermSys] PermEvents: registered player enter/leave events")
end

return PermEvents
