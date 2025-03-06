local Players = game:GetService("Players")
local GroupId = 33610529
local function createRankBillboard(player, character)
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	local attachment = Instance.new("Attachment")
	attachment.Position = Vector3.new(0, 3.85, 0)
	attachment.Parent = humanoidRootPart

	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Name = "RankBillboardGui"
	billboardGui.Adornee = attachment
	billboardGui.Size = UDim2.new(4, 0, 3, 0)
	billboardGui.StudsOffset = Vector3.new(0, 0, 0)
	billboardGui.Parent = attachment

	print("Created BillboardGui for", player.Name)

	local IcoFrame = Instance.new("Frame")
	IcoFrame.Parent = billboardGui
	IcoFrame.Position = UDim2.new(0, 0, 0, 0)
	IcoFrame.Size = UDim2.new(1, 0, 1, 0)
	IcoFrame.BackgroundTransparency = 1

	local IcoList = Instance.new("UIListLayout")
	IcoList.Parent = IcoFrame
	IcoList.SortOrder = Enum.SortOrder.LayoutOrder
	IcoList.FillDirection = Enum.FillDirection.Horizontal
	IcoList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	IcoList.Padding.Offset = 5

	local groupLogo = Instance.new("ImageLabel")
	groupLogo.Name = "GroupLogo"
	groupLogo.Size = UDim2.new(0, 50, 0, 50)
	groupLogo.BackgroundTransparency = 1
	groupLogo.Image = "rbxassetid://18746683507"
	groupLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
	groupLogo.Parent = IcoFrame
	groupLogo.AutomaticSize = Enum.AutomaticSize.None
	if player.Name == "west7014" then 
		groupLogo.Image = "rbxassetid://18746477387"
	end
	print("Group logo set for", player.Name)

	local rankLabel = Instance.new("TextLabel")
	rankLabel.Name = "RankLabel"
	rankLabel.Size = UDim2.new(1, 0, 0.25, 0)
	rankLabel.Position = UDim2.new(0, 0, 0, 0)
	rankLabel.BackgroundTransparency = 1
	rankLabel.TextScaled = true 
	rankLabel.TextColor3 = Color3.new(1, 1, 1)
	rankLabel.Parent = billboardGui
	rankLabel.FontFace.Weight = Enum.FontWeight.ExtraBold
	rankLabel.Font = Enum.Font.Ubuntu

	print("Rank label created for", player.Name)

	local teamRankLabel = Instance.new("TextLabel")
	teamRankLabel.Name = "TeamRankLabel"
	teamRankLabel.Size = UDim2.new(1, 0, 0.125, 0)
	teamRankLabel.Position = UDim2.new(0, 0, 0.25, 0)
	teamRankLabel.BackgroundTransparency = 1
	teamRankLabel.TextScaled = true
	teamRankLabel.Parent = billboardGui

	print("Team rank label created for", player.Name)
	return rankLabel, teamRankLabel, groupLogo
end

local function updateRank(player, rankLabel, teamRankLabel)
	print("Updating rank for", player.Name)
	if player.UserId == 798440211 then
		rankLabel.Text = "Game Management//Nirmini Director"
		rankLabel.TextColor3 = Color3.fromRGB(183, 87, 209)
		rankLabel.BorderMode = Enum.BorderMode.Outline
		rankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rankLabel.BorderSizePixel = 3
		print("Set rank for west7014")
	elseif player.UserId == 113902290 then
		rankLabel.Text = "Internal Affairs Director"
		rankLabel.TextColor3 = Color3.fromRGB(170, 0, 0)
		rankLabel.BorderMode = Enum.BorderMode.Outline
		rankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rankLabel.BorderSizePixel = 3
		print("Set rank for noah_6101182653")
	elseif player.UserId == 1767676567 then
		rankLabel.Text = "Admin Hall of Fame"
		rankLabel.TextColor3 = Color3.fromRGB(233, 30, 99)
		rankLabel.BorderMode = Enum.BorderMode.Outline
		rankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rankLabel.BorderSizePixel = 3
		print("Set rank for Zacharyeb17")
	else
		local rank = player:GetRankInGroup(GroupId)
		rankLabel.Text = "Rank: " .. rank
		print("Set rank for other player: ", player.Name)
	end

	local teamRank = player:FindFirstChild("TeamRank")
	local teamColor = player:FindFirstChild("TeamColor")
	if teamRank and teamRank:IsA("StringValue") then
		teamRankLabel.Text = teamRank.Value
	else
		teamRankLabel.Text = ""
	end

	if teamColor and teamColor:IsA("BrickColorValue") then
		teamRankLabel.TextColor3 = teamColor.Value.Color
	else
		teamRankLabel.TextColor3 = Color3.new(1, 1, 1)
	end

	print("Updated rank and team rank for", player.Name)
end

local function onCharacterAdded(character)
	local player = Players:GetPlayerFromCharacter(character)
	if player then
		local rankLabel, teamRankLabel, _ = createRankBillboard(player, character)
		updateRank(player, rankLabel, teamRankLabel)
		player.ChildAdded:Connect(function(child)
			if child.Name == "TeamRank" or child.Name == "TeamColor" then
				updateRank(player, rankLabel, teamRankLabel)
			end
		end)
		player.ChildRemoved:Connect(function(child)
			if child.Name == "TeamRank" or child.Name == "TeamColor" then
				updateRank(player, rankLabel, teamRankLabel)
			end
		end)
		if player:FindFirstChild("TeamRank") then
			player.TeamRank.Changed:Connect(function()
				updateRank(player, rankLabel, teamRankLabel)
			end)
		end
		if player:FindFirstChild("TeamColor") then
			player.TeamColor.Changed:Connect(function()
				updateRank(player, rankLabel, teamRankLabel)
			end)
		end
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end
Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
