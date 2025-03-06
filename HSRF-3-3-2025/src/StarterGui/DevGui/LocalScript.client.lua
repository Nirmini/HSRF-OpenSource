local allowedUsernames = {
	"west7014",
	"noah_6101182653",
}
local player = game.Players.LocalPlayer

while true do
	for _, username in pairs(allowedUsernames) do
		if player.Name == username then
			isAllowed = true
			break
		end
	end
	
	if isAllowed then
		wait()
	else
		script.Parent:Remove()
	end
end