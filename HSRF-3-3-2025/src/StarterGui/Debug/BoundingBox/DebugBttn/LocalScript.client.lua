local button = script.Parent
local Evnt = game.ReplicatedStorage.StartEvntDebug
local player = game.Players.LocalPlayer

if player.Name ~= "west7014" then
	script.Parent:Destroy()
end

button.MouseButton1Click:Connect(function()
	Evnt:FireServer(player)
end)