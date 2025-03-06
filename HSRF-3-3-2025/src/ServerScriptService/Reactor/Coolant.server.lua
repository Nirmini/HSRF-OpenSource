local deskmod = game.Workspace.CoolantDesk
local CFlow = script.Parent.TempMon.CoolantLvl
local BStat = script.Parent.BridgeConencted
local Bttn1 = deskmod.Bttn1.Bttn
local Bttn2 = deskmod.Bttn2.Bttn
local Bttn3 = deskmod.Bttn3.Bttn
local Bttn4 = deskmod.Bttn4.Bttn

Bttn1.ClickDetector.MouseClick:Connect(function()
	if BStat.Value == true then
		CFlow.Value = 0
	end
end)
Bttn2.ClickDetector.MouseClick:Connect(function()
	if BStat.Value == true then
		CFlow.Value = 1
	end
end)
Bttn3.ClickDetector.MouseClick:Connect(function()
	if BStat.Value == true then
		CFlow.Value = 2
	end
end)
Bttn4.ClickDetector.MouseClick:Connect(function()
	if BStat.Value == true then
		CFlow.Value = 3
	end
end)