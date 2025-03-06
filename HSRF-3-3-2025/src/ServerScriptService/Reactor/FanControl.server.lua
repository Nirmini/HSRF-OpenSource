local BttnModel = game.Workspace.CoolantDesk.FanLever
local FanModel = game.Workspace.ChamberFan.Fan
local Stat = script.Parent.TempMon.FanOn
local VStat = game.Workspace.ReactorInfoDisp.Fan
local TweenService = game:GetService("TweenService")
local rotationSpeed = math.random(10,20) -- Rotations per second

local handle = BttnModel:WaitForChild("Handle")

local function MoveD()
	-- Define the rotation angle (in degrees)
	local rotationAngle = -50

	-- Convert the rotation angle to radians
	local rotationAngleRadians = math.rad(rotationAngle)

	-- Define the rotation axis (you can change the axis if needed)
	local rotationAxis = Vector3.new(1, 0, 0)  -- Y-axis rotation

	-- Create a CFrame representing the rotation
	local rotationCFrame = CFrame.fromAxisAngle(rotationAxis, rotationAngleRadians)

	-- Get the current pivot offset
	local currentPivot = handle:GetPivot()

	-- Apply the rotation to the current pivot offset
	local newPivot = currentPivot * rotationCFrame

	-- Set the new pivot offset to the Handle model
	handle:PivotTo(newPivot)
end

local function MoveU()
	-- Define the rotation angle (in degrees)
	local rotationAngle = 50

	-- Convert the rotation angle to radians
	local rotationAngleRadians = math.rad(rotationAngle)

	-- Define the rotation axis (you can change the axis if needed)
	local rotationAxis = Vector3.new(1, 0, 0)  -- Y-axis rotation

	-- Create a CFrame representing the rotation
	local rotationCFrame = CFrame.fromAxisAngle(rotationAxis, rotationAngleRadians)

	-- Get the current pivot offset
	local currentPivot = handle:GetPivot()

	-- Apply the rotation to the current pivot offset
	local newPivot = currentPivot * rotationCFrame

	-- Set the new pivot offset to the Handle model
	handle:PivotTo(newPivot)
end

BttnModel.Handle.Main.ClickDetector.MouseClick:Connect(function()
	if Stat.Value == true then
		MoveU()
		Stat.Value = false
		for _, part in ipairs(VStat:GetDescendants()) do
			if part:IsA("BasePart") then part.BrickColor = BrickColor.new("New Yeller") end
		end 
	else
		MoveD()
		Stat.Value = true
		for _, part in ipairs(VStat:GetDescendants()) do
			if part:IsA("BasePart") then part.BrickColor = BrickColor.new("Lime green") end
		end 
	end
end)

-- Create a function to handle the fan rotation
local function RotateFan()
	while Stat.Value == true do
		-- Create a TweenInfo object with infinite repeats and no reversal
		local tweenInfo = TweenInfo.new(1 / rotationSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false)

		-- Set the goal rotation (360 degrees around the Y-axis)
		local goal = {Orientation = FanModel.Orientation + Vector3.new(0, 0, -360)}

		-- Create and play the tween
		local tween = TweenService:Create(FanModel, tweenInfo, goal)
		tween:Play()

		-- Wait until the tween completes before continuing (to prevent overlapping tweens)
		tween.Completed:Wait()
	end
end

-- Connect the fan rotation function to the status value change
Stat:GetPropertyChangedSignal("Value"):Connect(function()
	if Stat.Value == true then
		RotateFan()
	end
end)

-- Initial check for fan status
if Stat.Value then
	RotateFan()
end
