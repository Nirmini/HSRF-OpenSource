local Bttn = script.Parent
local DoorModel = script.Parent.Parent.Door
local TweenService = game:GetService("TweenService")
local DoorOpen = false
local DoorTweening = false

local function rotateDoor()
	if DoorTweening then
		return  -- If the door is already tweening, do nothing
	end
	DoorTweening = true
	local goalRotation = DoorOpen and 0 or 90  -- Rotate 90 degrees if opening, 0 degrees if closing
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0.5)
	local tween = TweenService:Create(DoorModel, tweenInfo, {CFrame = DoorModel.CFrame * CFrame.Angles(0, math.rad(goalRotation), 0)})
	tween:Play()
	tween.Completed:Connect(function()
		DoorOpen = not DoorOpen
		DoorTweening = false
	end)
end

Bttn.MouseClick:Connect(function()
	rotateDoor()
end)
