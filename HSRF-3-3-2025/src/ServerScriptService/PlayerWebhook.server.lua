local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local WEBHOOK_URL = "[REMOVED FOR SECUIRTY REASONS]
local GAME_NAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local SERVER_ID = game.JobId
local function sendWebhookMessage(content)
	local success, response = pcall(function()
		return HttpService:PostAsync(
			WEBHOOK_URL,
			HttpService:JSONEncode({ content = content }),
			Enum.HttpContentType.ApplicationJson
		)
	end)
	if not success then
		warn("Failed to send webhook: " .. response)
	else
		print("Webhook sent successfully!")
	end
end
Players.PlayerAdded:Connect(function(player)
	if RunService:IsRunning() then
		if SERVER_ID == "" then
		SERVER_ID = "STUDIO RUNTIME"
		end
	sendWebhookMessage("`" .. player.Name .. "` joined `" .. GAME_NAME .. "`  ServerID: `" .. SERVER_ID .. "`")
	end
end)
