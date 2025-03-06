local deskmod = game.Workspace.CCoolantDesk
local CFlow = script.Parent.TempMon.CTCoolLvl
local Bttn1 = deskmod.Bttn1.Bttn
local Bttn2 = deskmod.Bttn2.Bttn
local Bttn3 = deskmod.Bttn3.Bttn
local Bttn4 = deskmod.Bttn4.Bttn

Bttn1.ClickDetector.MouseClick:Connect(function()
	CFlow.Value = 1
end)
Bttn2.ClickDetector.MouseClick:Connect(function()
	CFlow.Value = 2
end)
Bttn3.ClickDetector.MouseClick:Connect(function()
	CFlow.Value = 3
end)
Bttn4.ClickDetector.MouseClick:Connect(function()
	CFlow.Value = 4
end)