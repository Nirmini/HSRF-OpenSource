local minimumAge = 64
local kickMessage = "[NDT NEXUS]: Your account must be at least "..minimumAge.." days old to play this game."
game.Players.PlayerAdded:Connect(function(player)
	if player.AccountAge < minimumAge then
		player:Kick(kickMessage)
	end
end)