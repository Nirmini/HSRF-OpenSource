local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShakeScreenEvent = ReplicatedStorage:WaitForChild("Whiteout")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local function onShakeScreen()
	local Gui = player.PlayerGui.Endings
	Gui.Enabled = true
	for i=1, 20, 1 do
		Gui.Frame.BackgroundTransparency = Gui.Frame.BackgroundTransparency - 0.05
		wait(0.05)
	end
	player.Character.Humanoid.Health = 0
end

ShakeScreenEvent.OnClientEvent:Connect(onShakeScreen)
