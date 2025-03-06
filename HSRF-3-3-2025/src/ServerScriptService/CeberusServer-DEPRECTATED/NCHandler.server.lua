local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NonClipCheckEvent = ReplicatedStorage.Cerberus["83z28e"].NCT

local trustedUserIds = {
	798440211,
	113902290,
}

local playerViolations = {}

local function isTrustedUserId(userId)
	for _, trustedId in ipairs(trustedUserIds) do
		if userId == trustedId then
			return true
		end
	end
	return false
end

local function logAndCheckViolations(player)
	local userId = player.UserId
	if isTrustedUserId(userId) then
		return
	end

	local username = player.Name
	if not playerViolations[username] then
		playerViolations[username] = 0
	end

	playerViolations[username] = playerViolations[username] + 1

	if playerViolations[username] >= 3 then
		local banConfig = {
			UserIds = {player.UserId},
			Duration = -1, -- Perma-ban
			DisplayReason = "Banned for Exploiting. You may appeal twice in QHDG.",
			PrivateReason = "User was caught non-clipping three times by QHAC",
			ExcludeAltAccounts = false,
			ApplyToUniverse = true
		}

		local success, err = pcall(function()
			Players:BanAsync(banConfig)
		end)

		if not success then
			warn("Failed to ban player: " .. err)
		end
	else
		player:Kick("[Cerberus]: You have been kicked for non-clipping.")
	end
end

local function monitorNonClipping()
	while true do
		wait(45)
		for _, player in pairs(Players:GetPlayers()) do
			-- TO DO : Redo Clip Detection
		end
	end
end

NonClipCheckEvent.OnServerEvent:Connect(function(player, isNonClipping)
	if isNonClipping then
		logAndCheckViolations(player)
	end
end)

Players.PlayerRemoving:Connect(function(player)
	playerViolations[player.Name] = nil
end)

monitorNonClipping()
