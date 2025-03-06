local script = script

-- Get references to essential services
local TweenService = game:GetService("TweenService")

-- Define the rotation speed (adjust as needed)
local rotationSpeed = 2 -- Rotations per second

while true do
	-- Create a TweenInfo object with infinite repeats and no reversal
	local tweenInfo = TweenInfo.new(4.0 / rotationSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, false)

	-- Calculate the goal orientation based on the current orientation
	local currentOrientation = script.Parent.Orientation
	local goalOrientation = currentOrientation + Vector3.new(0, 360, 0)

	-- Create a CFrame representing the goal rotation
	local goalCFrame = CFrame.Angles(math.rad(45), math.rad(currentOrientation.Y + 360), math.rad(currentOrientation.Z))

	-- Set the goal rotation (360 degrees around the Y-axis)
	local goal = {CFrame = goalCFrame}

	-- Create and play the tween
	local tween = TweenService:Create(script.Parent, tweenInfo, goal)
	tween:Play()

	-- Wait until the tween finishes before creating a new one (optional for smoother rotation)
	tween.Completed:Wait()
end
