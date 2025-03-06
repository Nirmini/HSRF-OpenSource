local BloxstrapRPC = require(game.ReplicatedStorage.BloxstrapRPC)
local player = game.Players.LocalPlayer
local GRTemp = game.ReplicatedStorage.GTemp
local timestamp = os.time()

local function SetRPC()
BloxstrapRPC.SetRichPresence({
	details = "QHBR at " .. GRTemp.Value .. "° Kelvin.",
	state = "Working as '" .. player.Team.Name .. "'.",
	timeStart = timestamp,
	--
	largeImage = {
		assetId = 18836804307,
		hoverText = "Horizon Research Facility - AlphaSite"
	},
	smallImage = {
		assetId = 13409122839,
		hoverText = "BloxStrap"
	}
})
end

player:GetPropertyChangedSignal("Team"):Connect(SetRPC)
GRTemp.Changed:Connect(SetRPC)
SetRPC()