local HttpService = game:GetService("HttpService")
local reportEvent = script.Parent:WaitForChild("/report") -- BindableEvent

-- Webhook URLs
local webhooks = {
	"[REMOVED FOR SECURITY REASONS]",
	"[REMOVED FOR SECURITY REASONS]"
}

-- Function to send the webhook message
local function sendWebhookMessage(url, content)
	local success, err = pcall(function()
		HttpService:PostAsync(
			url,
			HttpService:JSONEncode({
				content = content
			}),
			Enum.HttpContentType.ApplicationJson
		)
	end)

	if not success then
		warn("Failed to send webhook message:", err)
	end
end

-- Event connection
reportEvent.Event:Connect(function(User, UserReported, Reason)
	local jobId = game.JobId
	--[[if jobId == "" then
		jobId = "STUDIO SESSION"
	end]]
	local message = "`" .. User .. "` Has reported `" .. UserReported .. "` For: `" .. Reason .. "` In Server ID: `" .. jobId .. "`"

	-- Send the message to all webhooks
	for _, webhookUrl in ipairs(webhooks) do
		sendWebhookMessage(webhookUrl, message)
	end
end)
