SLASH_CRANCH1 = "/cranch"

local f = CreateFrame("Frame")

function f:InitializeOptions()
	self.panel = CreateFrame("Frame")
	self.panel.name = "Wow Bingo"

	local cb = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	cb:SetPoint("TOPLEFT", 20, -20)
	cb.Text:SetText("Print when you jump")

    cb:HookScript("OnClick", function(_, btn, down)
		self.db.someOption = cb:GetChecked()
	end)
	cb:SetChecked(self.db.someOption)

	local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
	btn:SetPoint("TOPLEFT", cb, 0, -40)
	btn:SetText("Click me")
	btn:SetWidth(100)
	btn:SetScript("OnClick", function()
		print("You clicked me!")
	end)

	InterfaceOptions_AddCategory(self.panel)
end

SlashCmdList.CRANCH = function(msg, editBox)
	InterfaceOptionsFrame_OpenToCategory(f.panel)
end