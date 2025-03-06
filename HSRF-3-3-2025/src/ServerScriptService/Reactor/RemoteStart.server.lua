local Trigger = game.ReplicatedStorage.RemoteStart
local StartEvnt = script.Parent.Startup

local function CHKSVR(user)
	if game.PrivateServerId == "" then
		return
	elseif user.UserId ~= game.PrivateServerOwnerId then
		return
	else
		StartEvnt:Fire()
	end
end


Trigger.OnServerEvent:Connect(CHKSVR)