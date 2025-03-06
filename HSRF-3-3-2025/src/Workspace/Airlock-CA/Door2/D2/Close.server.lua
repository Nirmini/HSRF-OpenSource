local tweenService = game:GetService("TweenService")

local Model = script.Parent
local goal1 = Model.Parent:WaitForChild("Orig2")

local origCFrame1 = Model.PrimaryPart.CFrame

--CONFIG VARIABLES
local tweenTime = 5
local closeWaitTime = 3
local easingStyle = Enum.EasingStyle.Quad
local easingDirection = Enum.EasingDirection.InOut
local repeats = 0
local reverse = false
local delayTime = 0
--yep

local deb = false
local info = TweenInfo.new(tweenTime, easingStyle, easingDirection, repeats, reverse, delayTime)
local function tweenModel(model, CF)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = model:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		model:SetPrimaryPartCFrame(CFrameValue.Value)
	end)
	
	local tween = tweenService:Create(CFrameValue, info, {Value = CF})
	tween:Play()
	
	tween.Completed:Connect(function()
		CFrameValue:Destroy()
	end)
end
wait(0)
tweenModel(Model, goal1.CFrame)