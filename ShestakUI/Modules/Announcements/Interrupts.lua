local T, C, L = unpack(ShestakUI)
if C.announcements.interrupts ~= true then return end

----------------------------------------------------------------------------------------
--	Announce your interrupts(by Elv22)
----------------------------------------------------------------------------------------
local RaidIconMaskToIndex = {
	[COMBATLOG_OBJECT_RAIDTARGET1] = 1,
	[COMBATLOG_OBJECT_RAIDTARGET2] = 2,
	[COMBATLOG_OBJECT_RAIDTARGET3] = 3,
	[COMBATLOG_OBJECT_RAIDTARGET4] = 4,
	[COMBATLOG_OBJECT_RAIDTARGET5] = 5,
	[COMBATLOG_OBJECT_RAIDTARGET6] = 6,
	[COMBATLOG_OBJECT_RAIDTARGET7] = 7,
	[COMBATLOG_OBJECT_RAIDTARGET8] = 8,
}

local function GetRaidIcon(unitFlags)
	local raidTarget = bit.band(unitFlags, COMBATLOG_OBJECT_RAIDTARGET_MASK)
	if raidTarget == 0 then
		return ""
	end

	return "{rt"..RaidIconMaskToIndex[raidTarget].."}"
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function()
	if not IsInGroup() then return end
	local _, event, _, sourceGUID, _, _, _, _, destName, _, destRaidFlags, _, _, _, spellID, spellName = CombatLogGetCurrentEventInfo()
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player")) then return end

	local destIcon = ""
	if destName then
		destIcon = GetRaidIcon(destRaidFlags)
	end

	if T.Vanilla then
		spellID = T.GetSpellID(spellName)
	end

	if spellID == 0 then
		SendChatMessage(L_ANNOUNCE_INTERRUPTED.." "..destIcon..destName..": "..spellName, T.CheckChat())
	else
		SendChatMessage(L_ANNOUNCE_INTERRUPTED.." "..destIcon..destName..": "..GetSpellLink(spellID), T.CheckChat())
	end
end)