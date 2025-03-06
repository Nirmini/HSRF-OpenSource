local Tool = script.Parent
local player = game.Players.LocalPlayer

Tool.Equipped:Connect(function()
	workspace.Gravity = 36.2
	player.Character.Humanoid.JumpPower = 80
end)

Tool.Unequipped:Connect(function()
	workspace.Gravity = 196.2
	player.Character.Humanoid.JumpPower = 50
end)
