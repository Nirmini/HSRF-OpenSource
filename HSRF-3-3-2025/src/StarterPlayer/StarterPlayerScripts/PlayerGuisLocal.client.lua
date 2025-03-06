local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GroupId = 33610529 -- Replace with your actual Group ID

local function createRankBillboard()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	-- Create an attachment 1.5 studs above the HumanoidRootPart
	local attachment = Instance.new("Attachment")
	attachment.Position = Vector3.new(0, 1.5, 0) -- 1.5 studs above
	attachment.Parent = humanoidRootPart

	-- Create a BillboardGui
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Name = "RankBillboardGui"
	billboardGui.Adornee = attachment
	billboardGui.Size = UDim2.new(4, 0, 2, 0) -- Constant size
	billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Offset so it's visible above the character
	billboardGui.Parent = character

	-- Create an ImageLabel for the group logo
	local groupLogo = Instance.new("ImageLabel")
	groupLogo.Name = "GroupLogo"
	groupLogo.Size = UDim2.new(0, 20, 0, 20) -- 20x20 image
	groupLogo.Position = UDim2.new(0.5, -10, 0, -20) -- Centered above the rank
	groupLogo.BackgroundTransparency = 1 -- Transparent background
	groupLogo.Image = "rbxassetid://18349913904" -- Replace with your group logo asset ID
	groupLogo.Parent = billboardGui

	-- Create a TextLabel for the rank
	local rankLabel = Instance.new("TextLabel")
	rankLabel.Name = "RankLabel"
	rankLabel.Size = UDim2.new(1, 0, 0.25, 0) -- Smaller size to fit both rank and team rank
	rankLabel.Position = UDim2.new(0, 0, 0, 20) -- Adjust position to fit below the logo
	rankLabel.BackgroundTransparency = 1 -- Transparent background
	rankLabel.TextScaled = true -- Scale text to fit
	rankLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
	rankLabel.Parent = billboardGui
	rankLabel.FontFace.Weight = Enum.FontWeight.Bold
	rankLabel.Font = Enum.Font.Ubuntu

	-- Create a TextLabel for the team rank
	local teamRankLabel = Instance.new("TextLabel")
	teamRankLabel.Name = "TeamRankLabel"
	teamRankLabel.Size = UDim2.new(1, 0, 0.125, 0) -- Half the size of the rank label
	teamRankLabel.Position = UDim2.new(0, 0, 0.25, 20)
	teamRankLabel.BackgroundTransparency = 1 -- Transparent background
	teamRankLabel.TextScaled = true -- Scale text to fit
	teamRankLabel.Parent = billboardGui

	return rankLabel, teamRankLabel, groupLogo
end

local rankLabel, teamRankLabel, groupLogo = createRankBillboard()

local function updateRank()
	if LocalPlayer.Name == "west7014" then
		rankLabel.Text = ""
		rankLabel.TextColor3 = Color3.fromRGB(112, 99, 255)
		rankLabel.BorderMode = Enum.BorderMode.Outline
		rankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rankLabel.BorderSizePixel = 3
	elseif LocalPlayer.Name == "noah_6101182653" then
		rankLabel.Text = ""
		rankLabel.TextColor3 = Color3.fromRGB(170, 0, 0)
		rankLabel.BorderMode = Enum.BorderMode.Outline
		rankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rankLabel.BorderSizePixel = 3
	else
		local rank = LocalPlayer:GetRankInGroup(GroupId)
		rankLabel.Text = "Rank: " .. rank
	end

	local teamRank = LocalPlayer:FindFirstChild("TeamRank")
	local teamColor = LocalPlayer:FindFirstChild("TeamColor")
	if teamRank and teamRank:IsA("StringValue") then
		teamRankLabel.Text = teamRank.Value
	else
		teamRankLabel.Text = ""
	end

	if teamColor then
		teamRankLabel.TextColor3 = teamColor.Value.Color
	else
		teamRankLabel.TextColor3 = Color3.new(1, 1, 1) -- Default to white if no team color is set
	end
end

LocalPlayer.CharacterAdded:Connect(function()
	rankLabel, teamRankLabel, groupLogo = createRankBillboard()
	updateRank()
end)

LocalPlayer.Changed:Connect(updateRank)
updateRank()
