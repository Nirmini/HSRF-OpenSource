local Bttn = script.Parent
local Player = game.Players.LocalPlayer
Bttn.MouseButton1Click:Connect(function()
	if Player:GetRankInGroup(33610529) >= 9 then
	Player.Team = game.Teams.Administration
	else
		warn("[TEAM CHANGER]: Unable To Set. Invalid Access!")
	end
end)