local Bttn = script.Parent.ClickDetector
local Blogs = game.ReplicatedStorage.BlogsEvnt
local TweenService = game:GetService("TweenService")
local StartLock = game.ServerScriptService.Reactor.StartupAvailible
local Debounce = false

Bttn.MouseClick:Connect(function(player)
	if StartLock.Value == true and Debounce == false then
		Debounce = true
	-- Fire the ReplicatedStorage event
	Blogs:Fire(player.Name, "RStart")

	-- Get the original position of the button
	local buttonParent = script.Parent
	local originalPosition = buttonParent.Position

	-- Create tween info for moving the button down
	local downTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local downGoal = {}
	downGoal.Position = originalPosition + Vector3.new(0, -0.105, 0)
	local downTween = TweenService:Create(buttonParent, downTweenInfo, downGoal)

	-- Create tween info for moving the button back up
	local upTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
	local upGoal = {}
	upGoal.Position = originalPosition
	local upTween = TweenService:Create(buttonParent, upTweenInfo, upGoal)

	-- Play the down tween, then the up tween after the down tween completes
	downTween:Play()
	downTween.Completed:Connect(function()
		upTween:Play()
	end)
		Debounce = false
	end
end)
