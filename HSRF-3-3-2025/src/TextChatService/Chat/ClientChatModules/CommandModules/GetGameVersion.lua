--	// FileName: GetVersion.lua
--	// Written by: spotco
--	// Description: Command to print the chat version.

local util = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(message, ChatWindow, ChatSettings)
	if string.sub(message, 1,  8):lower() == "/gversion" or string.sub(message, 1, 9):lower() == "/gversion " then
		util:SendSystemMessageToSelf(
			string.format("This game is ruinng Nirmini Nexus on Game Build xx" ..game.pu),
			ChatWindow:GetCurrentChannel(),
			{})
		return true
	end
	return false
end

return {
	[util.KEY_COMMAND_PROCESSOR_TYPE] = util.COMPLETED_MESSAGE_PROCESSOR,
	[util.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}