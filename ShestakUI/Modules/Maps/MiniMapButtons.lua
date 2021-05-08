local T, C, L, _ = unpack(select(2, ...))
if C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Switch layout mouseover button on minimap
----------------------------------------------------------------------------------------
local switch = CreateFrame("Button", "SwitchLayout", UIParent)
switch:SetTemplate("ClassColor")
if C.actionbar.toggle_mode == true then
	switch:SetPoint("TOPLEFT", Minimap, "TOPRIGHT", 3, -18)
else
	switch:SetPoint("TOPLEFT", Minimap, "TOPRIGHT", 3, 2)
end
switch:SetSize(19, 19)
switch:SetAlpha(0)

switch.t = switch:CreateTexture(nil, "OVERLAY")
switch.t:SetTexture("Interface\\LFGFrame\\LFGROLE")
switch.t:SetPoint("TOPLEFT", switch, 2, -2)
switch.t:SetPoint("BOTTOMRIGHT", switch, -2, 2)

switch:EnableMouse(true)
switch:RegisterForClicks("AnyUp")
switch:SetScript("OnClick", function(_, button)
	if button == "LeftButton" and ShestakUISettings.RaidLayout ~= "HEAL" then
		ShestakUISettings.RaidLayout = "HEAL"
		ReloadUI()
	elseif button == "RightButton" and ShestakUISettings.RaidLayout ~= "DPS" then
		ShestakUISettings.RaidLayout = "DPS"
		ReloadUI()
	elseif button == "MiddleButton" and ShestakUISettings.RaidLayout ~= "NONE" then
		ShestakUISettings.RaidLayout = "NONE"
		ReloadUI()
	end
end)

switch:SetScript("OnEnter", function()
	switch:FadeIn()
	GameTooltip:SetOwner(switch, "ANCHOR_LEFT")
	GameTooltip:AddLine(RAID_FRAMES_LABEL)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L_MINIMAP_HEAL_LAYOUT)
	GameTooltip:AddLine(L_MINIMAP_DPS_LAYOUT)
	GameTooltip:AddLine(L_MINIMAP_BLIZZ_LAYOUT)
	GameTooltip:Show()
end)

switch:SetScript("OnLeave", function()
	switch:FadeOut()
	GameTooltip:Hide()
end)

switch:RegisterEvent("PLAYER_LOGIN")
switch:SetScript("OnEvent", function()
	if ShestakUISettings and ShestakUISettings.RaidLayout == "DPS" then
		switch.t:SetTexCoord(0.25, 0.5, 0, 1)
	elseif ShestakUISettings and ShestakUISettings.RaidLayout == "HEAL" then
		switch.t:SetTexCoord(0.75, 1, 0, 1)
	elseif ShestakUISettings and ShestakUISettings.RaidLayout == "NONE" then
		switch.t:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-Blizz")
		switch.t:SetTexCoord(0.2, 0.8, -0.1, 1.1)
	elseif ShestakUISettings and ShestakUISettings.RaidLayout == "UNKNOWN" or ShestakUISettings == nil then
		switch.t:SetTexture("Interface\\InventoryItems\\WoWUnknownItem01")
		switch.t:SetTexCoord(0.2, 0.8, 0.2, 0.8)
	end
end)

----------------------------------------------------------------------------------------
--	Farm mode for minimap(by Elv22)
----------------------------------------------------------------------------------------
local show = false
SlashCmdList.FARMMODE = function()
	if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
	if show == false then
		MinimapAnchor:SetSize(C.minimap.size * 1.65, C.minimap.size * 1.65)
		Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())
		show = true
	else
		MinimapAnchor:SetSize(C.minimap.size, C.minimap.size)
		Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())
		show = false
	end
end
SLASH_FARMMODE1 = "/farmmode"
SLASH_FARMMODE2 = "/афкььщву"
SLASH_FARMMODE3 = "/fm"
SLASH_FARMMODE4 = "/аь"

----------------------------------------------------------------------------------------
--	Farm mode mouseover button(by m2jest1c)
----------------------------------------------------------------------------------------
local farm = CreateFrame("Button", "FarmMode", UIParent)
farm:SetTemplate("ClassColor")
farm:SetPoint("TOP", switch, "BOTTOM", 0, -1)
farm:SetSize(19, 19)
farm:SetAlpha(0)

farm.t = farm:CreateTexture(nil, "OVERLAY")
farm.t:SetTexture("Interface\\Icons\\inv_misc_map_01")
farm.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
farm.t:SetPoint("TOPLEFT", farm, 2, -2)
farm.t:SetPoint("BOTTOMRIGHT", farm, -2, 2)

farm:SetScript("OnClick", function()
	SlashCmdList.FARMMODE()
end)

farm:SetScript("OnEnter", function()
	farm:FadeIn()
	GameTooltip:SetOwner(switch, "ANCHOR_LEFT")
	GameTooltip:AddLine(L_MINIMAP_FARM)
	GameTooltip:Show()
end)

farm:SetScript("OnLeave", function()
	farm:FadeOut()
	GameTooltip:Hide()
end)