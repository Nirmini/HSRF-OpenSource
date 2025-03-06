local TC = Instance.new("RemoteEvent")
TC.Name = "TeamChanger"
TC.Parent = game.ReplicatedStorage

TC.OnServerEvent:Connect(function(Player, TeamName)
	Player.Team = game.Teams[TeamName]
	Player:LoadCharacter()
end)