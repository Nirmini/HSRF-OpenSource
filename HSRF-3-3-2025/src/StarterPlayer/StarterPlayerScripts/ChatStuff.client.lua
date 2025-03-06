local TextChatService = game:GetService("TextChatService")
local ChatBar = TextChatService:WaitForChild("ChatInputBarConfiguration")
local Remote = game:GetService("ReplicatedStorage"):WaitForChild("ChatReplicate")

--// Replicating server requests
Remote.OnClientEvent:Connect(function(ChannelName)

	--// Forces target text channel to assigned channel
	local Channel = TextChatService.CustomChannels:FindFirstChild(ChannelName) or TextChatService.TextChannels:FindFirstChild(ChannelName)
	ChatBar.TargetTextChannel = Channel

	--// Informs client of new channel
	if ChannelName == "RBXGeneral" then
		Channel:DisplaySystemMessage("You're now chatting on Default Chat.")
	else
		Channel:DisplaySystemMessage("You're now chatting on " .. ChannelName .. ".")
	end

end)

--// Adds the Channel Tag and Color when receiving messages from Channels different than Roblox Default
TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")

	if TextChatService.TextChannels:FindFirstChild(message.TextChannel.Name) then
		return
	end

	if message.TextSource then
		local player = game.Players:GetPlayerByUserId(message.TextSource.UserId)

		local ChannelColor = message.TextChannel:GetAttribute("Color") or {R = 1, G = 1, B = 1}

		properties.PrefixText = (string.format("<font color='rgb(%s, %s, %s)'>[%s] %s</font>",
			math.round(ChannelColor.R * 255),
			math.round(ChannelColor.G * 255),
			math.round(ChannelColor.B * 255),
			message.TextChannel.Name,
			message.PrefixText
			)
		)
	end

	return properties
end