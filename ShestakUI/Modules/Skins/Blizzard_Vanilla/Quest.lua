local T, C, L = unpack(ShestakUI)
if C.skins.blizzard_frames ~= true then return else return end -- incomplete

----------------------------------------------------------------------------------------
--	Quest skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	QuestFrame:CreateBackdrop("Transparent")
	QuestFrame.backdrop:SetPoint("TOPLEFT", 10, -12)
	QuestFrame.backdrop:SetPoint("BOTTOMRIGHT", -32, 76)

	QuestFrameNpcNameText:ClearAllPoints()
	QuestFrameNpcNameText:SetPoint("TOP", QuestFrame.backdrop, "TOP", 0, -6)

	T.SkinCloseButton(QuestFrameCloseButton, QuestFrame.backdrop)

	local ScrollFrames = {
		"QuestDetailScrollFrame",
		"QuestRewardScrollFrame",
		"QuestProgressScrollFrame",
		"QuestGreetingScrollFrame",
	}

	for _, object in pairs(ScrollFrames) do
		_G[object]:ClearAllPoints()
		_G[object]:SetPoint("TOP", QuestFrame.backdrop, -6, -30)
		_G[object]:SetHeight(362)
	end

	local QuestStrip = {
		"QuestFrame",
		"QuestFrameDetailPanel",
		"QuestDetailScrollFrame",
		"QuestDetailScrollChildFrame",
		"QuestRewardScrollFrame",
		"QuestRewardScrollChildFrame",
		"QuestProgressScrollFrame",
		"QuestGreetingScrollFrame",
		"QuestFrameProgressPanel",
		"QuestFrameRewardPanel",
	}

	for _, object in pairs(QuestStrip) do
		_G[object]:StripTextures(true)
	end

	QuestFrameDetailPanel:SetPoint("TOPLEFT", -5, -12)
	QuestFrameDetailPanel:SetPoint("BOTTOMRIGHT", 0, 76)
	QuestFrameProgressPanel:SetPoint("TOPLEFT", -5, -12)
	QuestFrameProgressPanel:SetPoint("BOTTOMRIGHT", 0, 76)

	local LeftQuestButtons = {
		"QuestFrameAcceptButton",
		"QuestFrameCompleteButton",
		"QuestFrameCompleteQuestButton",
	}

	local RightQuestButtons = {
		"QuestFrameDeclineButton",
		"QuestFrameGoodbyeButton",
		"QuestFrameCancelButton",
	}

	for _, button in pairs(LeftQuestButtons) do
		_G[button]:SkinButton()
		_G[button]:SetPoint("BOTTOMLEFT", QuestFrame.backdrop, "BOTTOMLEFT", 4, 4)
	end

	for _, button in pairs(RightQuestButtons) do
		_G[button]:SkinButton()
		_G[button]:SetPoint("BOTTOMRIGHT", QuestFrame.backdrop, "BOTTOMRIGHT", -4, 4)
	end

	local ScrollBars = {
		"QuestDetailScrollFrameScrollBar",
		"QuestProgressScrollFrameScrollBar",
		"QuestRewardScrollFrameScrollBar",
		"QuestGreetingScrollFrameScrollBar",
		"QuestNPCModelTextScrollFrameScrollBar",
	}

	for _, scrollbar in pairs(ScrollBars) do
		T.SkinScrollBar(_G[scrollbar])
	end

	QuestInfoTitleHeader:SetTextColor(1, 0.8, 0)
	QuestInfoTitleHeader:SetShadowColor(0, 0, 0)
	QuestInfoDescriptionText:SetTextColor(1, 1, 1)
	QuestInfoObjectivesHeader:SetTextColor(1, 0.8, 0)
	QuestInfoObjectivesHeader:SetShadowColor(0, 0, 0)
	QuestInfoObjectivesText:SetTextColor(1, 1, 1)
	QuestInfoRewardText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.Header:SetTextColor(1, 0.8, 0)
	QuestInfoRewardsFrame.Header:SetShadowColor(0, 0, 0)
	QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)

	local function SkinReward(button, mapReward)
		if button.NameFrame then button.NameFrame:Hide() end
		if button.CircleBackground then button.CircleBackground:Hide() end
		if button.CircleBackgroundGlow then button.CircleBackgroundGlow:Hide() end
		if button.ValueText then button.ValueText:SetPoint("BOTTOMRIGHT", button.Icon, 0, 0) end
		if button.IconBorder then button.IconBorder:SetAlpha(0) end
		button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		button:CreateBackdrop("Default")
		button.backdrop:ClearAllPoints()
		button.backdrop:SetPoint("TOPLEFT", button.Icon, -2, 2)
		button.backdrop:SetPoint("BOTTOMRIGHT", button.Icon, 2, -2)
		if mapReward then
			button.Icon:SetSize(26, 26)
		end
	end

	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local button = rewardsFrame.RewardButtons[index]
		if not button.backdrop then
			SkinReward(button, rewardsFrame == MapQuestInfoRewardsFrame)

			hooksecurefunc(button.IconBorder, "SetVertexColor", function(self, r, g, b)
				if r ~= BAG_ITEM_QUALITY_COLORS[1].r ~= r and g ~= BAG_ITEM_QUALITY_COLORS[1].g then
					self:GetParent().backdrop:SetBackdropBorderColor(r, g, b)
				else
					self:GetParent().backdrop:SetBackdropBorderColor(unpack(C.media.border_color))
				end
				self:SetTexture(0)
			end)

			hooksecurefunc(button.IconBorder, "Hide", function(self)
				self:GetParent().backdrop:SetBackdropBorderColor(unpack(C.media.border_color))
			end)
		end
	end)

	QuestInfoItemHighlight:StripTextures()
	QuestInfoItemHighlight:SetTemplate("Default")
	QuestInfoItemHighlight:SetBackdropBorderColor(1, 1, 0)
	QuestInfoItemHighlight:SetBackdropColor(0, 0, 0, 0)

	hooksecurefunc("QuestInfoItem_OnClick", function(self)
		QuestInfoItemHighlight:ClearAllPoints()
		QuestInfoItemHighlight:SetPoint("TOPLEFT", self.Icon, "TOPLEFT", -2, 2)
		QuestInfoItemHighlight:SetPoint("BOTTOMRIGHT", self.Icon, "BOTTOMRIGHT", 2, -2)

		local parent = self:GetParent()
		for i = 1, #parent.RewardButtons do
			local questItem = QuestInfoRewardsFrame.RewardButtons[i]
			if questItem ~= self then
				questItem.Name:SetTextColor(1, 1, 1)
			else
				self.Name:SetTextColor(1, 1, 0)
			end
		end
	end)

	for i = 1, 6 do
		local button = _G["QuestProgressItem"..i]
		local texture = _G["QuestProgressItem"..i.."IconTexture"]

		if button.NameFrame then button.NameFrame:Hide() end
		button.Name:SetFont(C.media.normal_font, 12)

		button:CreateBackdrop("Default")
		button.backdrop:ClearAllPoints()
		button.backdrop:SetPoint("TOPLEFT", texture, -2, 2)
		button.backdrop:SetPoint("BOTTOMRIGHT", texture, 2, -2)

		texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	hooksecurefunc("QuestFrameProgressItems_Update", function()
		QuestProgressTitleText:SetTextColor(1, 0.8, 0)
		QuestProgressTitleText:SetShadowColor(0, 0, 0)
		QuestProgressText:SetTextColor(1, 1, 1)
		QuestProgressRequiredItemsText:SetTextColor(1, 0.8, 0)
		QuestProgressRequiredItemsText:SetShadowColor(0, 0, 0)
		QuestProgressRequiredMoneyText:SetTextColor(1, 0.8, 0)
	end)

	-- QuestGreeting
	local function UpdateGreetingPanel()
		QuestFrameGreetingPanel:StripTextures()
		QuestFrameGreetingGoodbyeButton:SkinButton()
		QuestFrameGreetingGoodbyeButton:SetPoint("BOTTOMRIGHT", QuestFrame.backdrop, "BOTTOMRIGHT", -4, 4)
		GreetingText:SetTextColor(1, 1, 1)
		CurrentQuestsText:SetTextColor(1, 0.8, 0)
		AvailableQuestsText:SetTextColor(1, 0.8, 0)
		QuestGreetingFrameHorizontalBreak:Kill()

		for i = 1, MAX_NUM_QUESTS do
			local button = _G["QuestTitleButton"..i]

			if button:GetFontString() then
				if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffFFFF00"))
				end
			end
		end
	end

	QuestFrameGreetingPanel:HookScript("OnShow", UpdateGreetingPanel)
	hooksecurefunc("QuestFrameGreetingPanel_OnShow", UpdateGreetingPanel)
end

tinsert(T.SkinFuncs["ShestakUI"], LoadSkin)
