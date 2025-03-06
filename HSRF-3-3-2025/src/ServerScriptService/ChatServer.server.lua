local TextChatService = game:GetService("TextChatService")

local Commands = TextChatService:FindFirstChild("CustomCommands")
local Channels = TextChatService:FindFirstChild("CustomChannels")
local ChatCommands = script.Parent:FindFirstChild("ChatCommands") -- Location of BindableEvents

local Remote = game:GetService("ReplicatedStorage"):WaitForChild("ChatReplicate")

for _, command in pairs(Commands:GetChildren()) do
	command.Triggered:Connect(function(origin, unfiltered)
		local player = game.Players:GetPlayerByUserId(origin.UserId)
		if not player then
			warn("Player not found for origin:", origin.UserId)
			return
		end

		-- Check if the command has a related channel
		if Channels:FindFirstChild(command.Name) then
			if Channels[command.Name]:FindFirstChild(origin.Name) then
				-- Remove user from the channel
				Channels[command.Name][origin.Name]:Destroy()
				Remote:FireClient(player, "RBXGeneral")
			else
				-- Add user to the channel
				Channels[command.Name]:AddUserAsync(origin.UserId)
				Remote:FireClient(player, command.Name)
			end
		else
			-- Custom command handling
			local bindable = ChatCommands:FindFirstChild(command.Name)
			if bindable then
				-- Parse arguments from the unfiltered message
				local args = unfiltered:split(" ")
				table.remove(args, 1) -- Remove the command itself (e.g., '/report')

				local targetUser = args[1] or "Unknown"
				local reason = table.concat(args, " ", 2) or "No reason provided"

				if targetUser ~= "Unknown" and reason ~= "No reason provided" then
					-- Fire the BindableEvent
					bindable:Fire(player.Name, targetUser, reason)
				else
					warn("Invalid arguments for /report. Usage: /report <Username> <Reason>")
				end
			else
				warn("BindableEvent not found for command:", command.Name)
			end
		end
	end)
end
