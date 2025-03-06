local Tool = script.Parent
local player = game.Players.LocalPlayer

Tool.Equipped:Connect(function()
	player.Character.Humanoid.WalkSpeed = 40
end)
Tool.Unequipped:Connect(function()
	player.Character.Humanoid.WalkSpeed = 20
end)