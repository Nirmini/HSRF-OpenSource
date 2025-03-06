local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")

local frame = script.Parent
local HSRF = frame.HSRF
local NDT1 = frame.NDT1
local BGM = frame.BGM
local Exit = frame.Exit
local Play = frame.Play
local player = players.LocalPlayer

-- Initial positions for HSRF and NDT1
local startPosHSRF = UDim2.new(-5, 0, HSRF.Position.Y.Scale, HSRF.Position.Y.Offset)
local startPosNDT1 = UDim2.new(-5, 0, NDT1.Position.Y.Scale, NDT1.Position.Y.Offset)

local targetPosHSRF = UDim2.new(0.051, 0, 0.141, 0)
local targetPosNDT1 = UDim2.new(0.24, 0, 0.182, 0)

-- Tween settings
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Function to handle frame visibility change
local function onFrameVisible()
	if frame.Visible then
		-- Move text off-screen first
		HSRF.Position = startPosHSRF
		NDT1.Position = startPosNDT1

		-- Play BGM
		BGM:Play()

		-- Tween text labels back to position
		local tweenHSRF = tweenService:Create(HSRF, tweenInfo, { Position = targetPosHSRF })
		local tweenNDT1 = tweenService:Create(NDT1, tweenInfo, { Position = targetPosNDT1 })

		tweenHSRF:Play()
		tweenNDT1:Play()
	end
end

-- Connect frame visibility change event
frame:GetPropertyChangedSignal("Visible"):Connect(onFrameVisible)

-- Exit button: Kick the player
Exit.MouseButton1Click:Connect(function()
	player:Kick("You have exited HSRF.")
end)

-- Play button: Stop BGM and hide the frame
Play.MouseButton1Click:Connect(function()
	BGM:Stop()
	frame.Visible = false
end)
