local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FlyCheckEvent = ReplicatedStorage:WaitForChild("Cerberus"):WaitForChild("83z28e"):WaitForChild("FCE")
local FlyCheckResponse = ReplicatedStorage:WaitForChild("Cerberus"):WaitForChild("83z28e"):WaitForChild("FCER") -- New RemoteFunction for checking client response

local trustedUsernames = {
	"west7014",
	"noah_6101182653",
	"Zacharyeb17",
	-- Secure Override
}

local playerViolations = {}

local function isTrustedUser(username)
	for _, trustedUsername in ipairs(trustedUsernames) do
		if username == trustedUsername then
			return true
		end
	end
	return false
end

local function logAndCheckViolations(player)
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
			PrivateReason = "User was caught flying three times by QHAC",
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
		player:Kick("[Cerberus]: You have been kicked for violating game rules.")
	end
end

local function monitorPlayer(player)
	while player.Parent do -- While the player is still in the game
		wait(30) -- Wait for 30 seconds

		local success, isFlying = pcall(function()
			return FlyCheckResponse:InvokeClient(player)
		end)

		if success and isFlying then
			if not isTrustedUser(player.Name) then
				logAndCheckViolations(player)
			end
		elseif not success then
			warn("No response from player: " .. player.Name)
			if not isTrustedUser(player.Name) then
				logAndCheckViolations(player)
			end
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	monitorPlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
	playerViolations[player.Name] = nil
end)

FlyCheckEvent.OnServerEvent:Connect(function(player, isFlying)
	if isFlying then
		if not isTrustedUser(player.Name) then
			logAndCheckViolations(player)
		end
	end
end)
