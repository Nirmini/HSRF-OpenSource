local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local badgeId = 699596029254781

local function awardBadge(player)
	if BadgeService:UserHasBadgeAsync(player.UserId, badgeId) then
		print(player.Name .. " already has the badge.")
	else
		local success, result = pcall(function()
			BadgeService:AwardBadge(player.UserId, badgeId)
		end)
		if success and result then
			print("Awarded badge to " .. player.Name)
		elseif success then
			print("Failed to award badge to " .. player.Name .. " (no errors, but badge was not awarded).")
		else
			warn("Error awarding badge to " .. player.Name .. ": " .. tostring(result))
		end
	end
end

-- Connect to the PlayerAdded event
Players.PlayerAdded:Connect(function(player)
	awardBadge(player)
end)
