local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

local function assignTeam(player)
	local groupId = 33610529 
	local groupCheck = player:IsInGroup(groupId)
	local team = groupCheck and Teams["Employee"] or Teams["Visitor"]
	player.Team = team
end

Players.PlayerAdded:Connect(function(player)
	assignTeam(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
	assignTeam(player)
end
