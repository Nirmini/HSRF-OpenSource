local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local player = Players.LocalPlayer

local achievementsFrame = script.Parent
local progressBar = achievementsFrame:FindFirstChild("ProgressBar")
local completeBar = progressBar and progressBar:FindFirstChild("CompleteBar")
local achievementsList = achievementsFrame:FindFirstChild("AchievementsList")
local templateFrame = achievementsList:FindFirstChild("Achieve") 

local function getBadgeInfo()
	local badges = {}
	local success, result = pcall(function()
		return BadgeService:GetBadgeIdsAsync()
	end)

	if success then
		for _, badgeID in ipairs(result) do
			local successInfo, badgeInfo = pcall(function()
				return BadgeService:GetBadgeInfoAsync(badgeID)
			end)

			if successInfo then
				table.insert(badges, {
					id = badgeID,
					name = badgeInfo.Name,
					description = badgeInfo.Description,
					icon = badgeInfo.IconImageId
				})
			else
				warn("Failed to retrieve badge info for:", badgeID)
			end
		end
	else
		warn("Failed to retrieve badge IDs:", result)
	end

	return badges
end

local function hasBadge(player, badgeID)
	local success, result = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeID)
	end)

	if success then
		return result
	else
		warn("Failed to check badge:", badgeID, result)
		return false
	end
end

local function updateAchievements()
	local badges = getBadgeInfo()
	local totalBadges = #badges
	local achievedCount = 0

	for _, badge in ipairs(badges) do
		local achieved = hasBadge(player, badge.id)
		if achieved then
			achievedCount += 1
		end

		local badgeFrame = templateFrame:Clone()
		badgeFrame.Parent = achievementsList
		badgeFrame.Visible = true

		badgeFrame.Title.Text = badge.name
		badgeFrame.Description.Text = badge.description
		badgeFrame.Image.Image = "rbxassetid://" .. badge.icon

		local checkmark = badgeFrame:FindFirstChild("CheckMrk")
		if checkmark then
			checkmark.Visible = achieved
		end
	end

	local progress = achievedCount / totalBadges
	if completeBar then
		completeBar.Size = UDim2.new(progress, 0, 1, 0)
	end
end

for _, child in ipairs(achievementsList:GetChildren()) do
	if child:IsA("Frame") and child ~= templateFrame then
		child:Destroy()
	end
end

templateFrame.Visible = false 

updateAchievements()
