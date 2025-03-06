local deskmod = game.Workspace.FuelDesk
local G1Flow = script.Parent.TempMon.FuelUse1
local G2Flow = script.Parent.TempMon.FuelUse2
local S1B1 = deskmod.S1B1.Bttn
local S1B2 = deskmod.S1B2.Bttn
local S1B3 = deskmod.S1B3.Bttn
local S1B4 = deskmod.S1B4.Bttn
local S1B5 = deskmod.S1B5.Bttn
local S2B1 = deskmod.S2B1.Bttn
local S2B2 = deskmod.S2B2.Bttn
local S2B3 = deskmod.S2B3.Bttn
local S2B4 = deskmod.S2B4.Bttn
local S2B5 = deskmod.S2B5.Bttn
local ROn = script.Parent.ReactorOnline

S1B1.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G1Flow.Value = 0
	end
end)
S1B2.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G1Flow.Value = 1
	end
end)
S1B3.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G1Flow.Value = 2
	end
end)
S1B4.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G1Flow.Value = 3
	end
end)
S1B5.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G1Flow.Value = 4
	end
end)
S2B1.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G2Flow.Value = 0
	end
end)
S2B2.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G2Flow.Value = 1
	end
end)
S2B3.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G2Flow.Value = 2
	end
end)
S2B4.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G2Flow.Value = 3
	end
end)
S2B5.ClickDetector.MouseClick:Connect(function()
	if ROn.Value == true then
		G2Flow.Value = 4
	end
end)