-- Variables
local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local objectToView = game.Workspace:WaitForChild("QBHNR") -- Replace with your object's name
local frame = script.Parent
local button = frame:WaitForChild("PlayBttn")

frame.Visible = true

-- Ensure the model has a PrimaryPart set
if not objectToView.PrimaryPart then
	-- Optionally, set the PrimaryPart if not already set
	objectToView.PrimaryPart = objectToView:FindFirstChildWhichIsA("BasePart")
end

if objectToView.PrimaryPart then
	local originalCameraCFrame = camera.CFrame
	local viewingCameraCFrame = CFrame.new(objectToView.PrimaryPart.Position + Vector3.new(0, 5, 10), objectToView.PrimaryPart.Position) -- Adjust the offset and position as needed

	-- TweenService for smooth transitions
	local TweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) -- Adjust timing and easing style as needed

	-- Function to pan the camera around the object
	local function panCamera()
		local tween = TweenService:Create(camera, tweenInfo, {CFrame = viewingCameraCFrame})
		tween:Play()
	end

	-- Function to return the camera to the player
	local function returnCamera()
		local tween = TweenService:Create(camera, tweenInfo, {CFrame = originalCameraCFrame})
		tween:Play()
	end

	-- Event listener for the button click
	button.MouseButton1Click:Connect(function()
		if camera.CFrame == originalCameraCFrame then
			panCamera()
		else
			returnCamera()
		end
	end)

	-- Optional: Handle initial camera setup when the player spawns
	player.CharacterAdded:Connect(function()
		camera.CameraType = Enum.CameraType.Scriptable
		camera.CFrame = originalCameraCFrame
	end)
else
	warn("PrimaryPart not found in the model")
end
