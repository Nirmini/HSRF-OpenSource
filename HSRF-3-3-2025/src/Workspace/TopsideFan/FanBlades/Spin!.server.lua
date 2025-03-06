local FanOn = game.ServerScriptService.Topside.FanOn
local targetSpeed = 0
local currentSpeed = 0
local rotationIncrement = 0.5  -- Initial rotation increment

local function InvokeFan()
	while true do
		if FanOn.Value == true then
			targetSpeed = 3-- Target speed when the fan is on
			rotationIncrement = 1.2  -- Initial increment when starting

			-- Gradually increase speed to targetSpeed over 5-10 seconds
			while currentSpeed < targetSpeed do
				currentSpeed = math.min(currentSpeed + 0.1, targetSpeed)
				script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0, 0, currentSpeed)
				wait(0.1)
			end
		else
			targetSpeed = 0  -- Target speed when the fan is off

			-- Gradually decrease speed to 0 at a rate of -0.9/sec
			while currentSpeed > targetSpeed do
				currentSpeed = math.max(currentSpeed - 0.09, targetSpeed)
				script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0, 0, currentSpeed)
				wait(0.1)
			end
		end

		-- Ensure continuous rotation with the current speed when the target speed is reached
		if currentSpeed == targetSpeed then
			script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0, 0, currentSpeed)
			wait(0.01)
		end
	end
end

FanOn:GetPropertyChangedSignal("Value"):Connect(InvokeFan)
