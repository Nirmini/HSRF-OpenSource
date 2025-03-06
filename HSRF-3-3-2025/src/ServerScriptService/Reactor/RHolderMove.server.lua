local Bridge = game.Workspace.ReactorHolderR
local Trigger = script.Parent.HolderConnected
local TweenService = game:GetService("TweenService")

local function moveBridge()
	if Trigger.Value == false then
		local endSignal = Instance.new("BindableEvent")
		local function MoBridge()
			for _, part in ipairs(Bridge:GetDescendants()) do
				if part:IsA("BasePart") then
					local newPosition = part.Position + Vector3.new(170, 0, 0) -- Move each part upwards by 10 units along the Y-axis
					local tweenInfo = TweenInfo.new(25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
					local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
					if tween then
						tween:Play()
						tween.Completed:Connect(function()
							endSignal:Fire()
						end)
					end
				end
			end
			local endEvent = endSignal.Event
			local connection
			connection = endEvent:Connect(function()
				connection:Disconnect()
				endSignal:Destroy()
			end)
		end
		MoBridge()
	elseif Trigger.Value == true then
		local endSignal = Instance.new("BindableEvent")
		local function ReBridge()
			for _, part in ipairs(Bridge:GetDescendants()) do
				if part:IsA("BasePart") then
					local newPosition = part.Position + Vector3.new(-170, 0, 0) -- Move each part upwards by 10 units along the Y-axis
					local tweenInfo = TweenInfo.new(25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
					local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
					if tween then
						tween:Play()
						tween.Completed:Connect(function()
							endSignal:Fire()
						end)
					end
				end
			end
			local endEvent = endSignal.Event
			local connection
			connection = endEvent:Connect(function()
				connection:Disconnect()
				endSignal:Destroy()
			end)
		end
		ReBridge()
	end
end

Trigger:GetPropertyChangedSignal("Value"):Connect(moveBridge)