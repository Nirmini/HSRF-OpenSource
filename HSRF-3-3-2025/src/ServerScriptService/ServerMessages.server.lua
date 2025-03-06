local TextChatService = game:GetService("TextChatService")

function BroadcastChatMessage(prefix, message, channel)
	local chatMessage = prefix .. message
	local properties = Instance.new("TextChatMessageProperties")
	properties.PrefixText = prefix -- Set the prefix separately
	properties.Text = message -- The actual message
	properties.TextColor3 = Color3.fromRGB(255, 200, 0) -- Change color if needed

	-- Send to the specified chat channel or default if nil
	TextChatService:DisplaySystemMessage(chatMessage)
end

-- Example usage
BroadcastChatMessage("[SERVER]: ", "System startup initiated.", "All")
task.wait(3)
BroadcastChatMessage("[Facility]: ", "Security lockdown in effect.", "All")
task.wait(3)
BroadcastChatMessage("[Reactor]: ", "Core temperature rising!", "All")
