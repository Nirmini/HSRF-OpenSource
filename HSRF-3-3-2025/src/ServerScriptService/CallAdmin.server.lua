local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RemoteEvent = ReplicatedStorage:WaitForChild("CallAdmin")
local ServerID = game.JobId
local webhookURL = "[REMOVED FOR SECURITY REASONS]"
local function sendWebhookMessage(message)
	local data = {
		["content"] = message
	}
	local jsonData = HttpService:JSONEncode(data)

	HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end
local function onCallAdminFired(player)
	sendWebhookMessage("<@&1292225150741381271> | `" .. player.Name .. "` Requested an Admin to Server `" .. ServerID.Value .. "`")
end
RemoteEvent.OnServerEvent:Connect(onCallAdminFired)