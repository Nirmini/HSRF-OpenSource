local Tool = script.Parent
local player = game.Players.LocalPlayer

Tool.Equipped:Connect(function()
	while Tool.Equipped do
		wait(math.random(4,8))
		player.Character.Humanoid.Health = player.Character.Humanoid.Health + 10		
	end
end)
Tool.Unequipped:Connect(function()
	--Stuff or Something
end)