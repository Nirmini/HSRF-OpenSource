local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShakeScreenEvent = ReplicatedStorage:WaitForChild("ShakeScreen")
local RunService = game:GetService("RunService")

local function onShakeScreen()
	local cam = workspace.CurrentCamera
	local startTime = tick()
	local duration = math.random(3, 4) -- Random duration between 3 and 4 seconds

	local function shake()
		if tick() - startTime < duration then
			cam.CFrame = cam.CFrame * CFrame.Angles(math.random(-3, 3) / 360, math.random(-3, 3) / 360, math.random(-3, 3) / 360)
		else
			-- Disconnect the render step function when the duration ends
			RunService:UnbindFromRenderStep("CameraShake")
		end
	end

	-- Bind the shake function to the render step
	RunService:BindToRenderStep("CameraShake", Enum.RenderPriority.Camera.Value, shake)
end

ShakeScreenEvent.OnClientEvent:Connect(onShakeScreen)
