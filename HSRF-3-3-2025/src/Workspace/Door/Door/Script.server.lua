local TweenService = game:GetService("TweenService")
local part = script.Parent
idle = true

local tweeningInformation = TweenInfo.new(	
1, --Length
Enum.EasingStyle.Quad, --Style
Enum.EasingDirection.InOut, --Direction
0, --Times it will repeate
false, --Toggles Repeate
0 --If so, delay between each tween	
)

local tweeningInformation2 = TweenInfo.new(	
1, --Length
Enum.EasingStyle.Quad, --Style
Enum.EasingDirection.InOut, --Direction
0, --Times it will repeate
false, --Toggles Repeate
0 --If so, delay between each tween	
)

local partProperties = {
	CFrame = part.CFrame * CFrame.new(0,0,0)
}

local partProperties2 = {
	CFrame = part.CFrame * CFrame.new(-4,0,0)
}


local tween = TweenService:Create(part, tweeningInformation, partProperties2)
local tween2 = TweenService:Create(part, tweeningInformation2, partProperties)

script.Parent.Parent.De.Touched:Connect(function()
	if not idle then return end
	idle = false
	script.Parent.Sound:Play()
	tween:Play()
	wait(2)
	script.Parent.Sound:Stop()
	wait(3)
	script.Parent.Sound2:Play()
	tween2:Play()
	wait(2)
	script.Parent.Sound2:Stop()
	wait()
	idle = true
end)