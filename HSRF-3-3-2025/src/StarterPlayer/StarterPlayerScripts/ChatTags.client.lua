local dev = {}
local specificPlayer = "798440211" -- Change to your username

game.Players.PlayerAdded:Connect(function(plr)
	if plr.UserId == specificPlayer then
		table.insert(dev, plr.UserId)
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	for i, id in ipairs(dev) do
		if id == plr.UserId then
			table.remove(dev, i)
			break
		end
	end
end)

local TextChatService = game:GetService("TextChatService")

TextChatService.OnIncomingMessage = function(message)
	local fromUser = message.TextSource.UserId

	local props = Instance.new("TextChatMessageProperties")

	if table.find(dev, fromUser) then
		props.PrefixText = "[DEV]" .. message.PrefixText
	end

	return props
end

for _, plr in ipairs(game.Players:GetPlayers()) do
	if plr.UserId == specificPlayer then
		table.insert(dev, plr.UserId)
	end
end