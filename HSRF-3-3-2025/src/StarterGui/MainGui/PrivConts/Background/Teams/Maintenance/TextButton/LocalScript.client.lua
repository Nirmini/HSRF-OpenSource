local Bttn = script.Parent
local Player = game.Players.LocalPlayer
Bttn.MouseButton1Click:Connect(function()
	Player.Team = game.Teams.Maintenance
end)