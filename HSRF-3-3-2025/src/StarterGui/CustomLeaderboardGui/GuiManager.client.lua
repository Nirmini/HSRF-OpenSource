local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Disable the default player list
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

-- References for icons
local icons = {
	Admin = ReplicatedStorage:WaitForChild("AdminIcon"),
	Moderator = ReplicatedStorage:WaitForChild("ModeratorIcon"),
	Premium = ReplicatedStorage:WaitForChild("PremiumIcon")
}

-- GUI Elements
local gui = script.Parent
local scrollingFrame = gui:WaitForChild("ScrollingFrame")

-- Utility function to determine the player's icon
local function getPlayerIcon(player)
	if player:GetRankInGroup(33610529) >= 150 then -- Replace 33610529 with your group ID for Admins
		return icons.Admin
	elseif player:GetRankInGroup(33610529) >= 100 then -- Replace 33610529 with your group ID for Moderators
		return icons.Moderator
	elseif player.MembershipType == Enum.MembershipType.Premium then
		return icons.Premium
	else
		return nil
	end
end

-- Function to create a player entry in the leaderboard
local function createPlayerEntry(player)
	local entry = Instance.new("Frame")
	entry.Size = UDim2.new(1, 0, 0, 50)
	entry.BackgroundTransparency = 1

	local usernameLabel = Instance.new("TextLabel")
	usernameLabel.Parent = entry
	usernameLabel.Size = UDim2.new(0.7, 0, 1, 0)
	usernameLabel.BackgroundTransparency = 1
	usernameLabel.Text = player.Name .. " | " .. player:GetRoleInGroup(33610529) -- Replace 33610529 with your group ID
	usernameLabel.TextScaled = true
	usernameLabel.TextColor3 = Color3.new(1, 1, 1)

	local icon = getPlayerIcon(player)
	if (icon) then
		local iconImage = Instance.new("ImageLabel")
		iconImage.Parent = entry
		iconImage.Size = UDim2.new(0.2, 0, 0.8, 0)
		iconImage.Position = UDim2.new(0.8, 0, 0.1, 0)
		iconImage.Image = icon.Image
		iconImage.BackgroundTransparency = 1
	end

	entry.Parent = scrollingFrame
end

-- Function to update the leaderboard
local function updateLeaderboard()
	scrollingFrame:ClearAllChildren()

	local teams = {}
	for _, player in ipairs(Players:GetPlayers()) do
		local team = player.Team
		if (team) then
			if (not teams[team.Name]) then
				teams[team.Name] = {}
			end
			table.insert(teams[team.Name], player)
		end
	end

	for teamName, teamPlayers in pairs(teams) do
		if (#teamPlayers > 0) then
			for _, player in ipairs(teamPlayers) do
				createPlayerEntry(player)
			end
		end
	end
end

-- Update stats when received from the server
local updateStatsEvent = ReplicatedStorage:WaitForChild("UpdateStats")
updateStatsEvent.OnClientEvent:Connect(function(stats)
	print("Stats received from server:")
	print("GlobalEXP:", stats.GlobalEXP)
	print("TeamEXP:", stats.TeamEXP)
	print("Playtime:", stats.Playtime)
	print("Credits:", stats.Credits)

	-- Update the client's UI or perform any other actions with the received stats
	-- Example: updating a GUI
	local player = Players.LocalPlayer
	local leaderstats = player:FindFirstChild("leaderstats")
	if (leaderstats) then
		leaderstats:FindFirstChild("GlobalEXP").Value = stats.GlobalEXP
		leaderstats:FindFirstChild("TeamEXP").Value = stats.TeamEXP
		leaderstats:FindFirstChild("Playtime").Value = stats.Playtime
		leaderstats:FindFirstChild("Credits").Value = stats.Credits
	end
end)

-- Events for updating the leaderboard
Players.PlayerAdded:Connect(function(player)
	player:GetPropertyChangedSignal("Team"):Connect(updateLeaderboard)
	updateLeaderboard()
end)
Players.PlayerRemoving:Connect(updateLeaderboard)

-- Initial call
updateLeaderboard()
