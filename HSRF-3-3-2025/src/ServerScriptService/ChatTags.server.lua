local chatService = require(game.ServerScriptService:WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

local tags = {
	[0] = {TagText = "TESTER", TagColor = Color3.fromRGB(135, 130, 255)}, -- The 0 must be changed to the the id of the user you want the tag to have
}

chatService.SpeakerAdded:Connect(function(playerName)
	local speaker = chatService:GetSpeaker(playerName)
	local player = game.Players[playerName]

	if tags[player.UserId] then
		speaker:SetExtraData("Tags",{tags[player.UserId]})
	end
end)

-- DEPRECATED DEMO CODE!!!