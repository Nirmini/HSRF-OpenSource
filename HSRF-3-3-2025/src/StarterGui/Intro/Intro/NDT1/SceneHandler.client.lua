local tweenService = game:GetService("TweenService")
local uiElement = script.Parent
local uiParent = uiElement.Parent
local MainMenu = uiParent.Parent.Main
MainMenu.Visible = false

-- Ensure the starting position is set correctly
uiElement.Position = UDim2.new(0.24, 0, 0.395, 0)

-- Function to run when uiParent becomes visible
local function onUIVisible()
	if uiParent.Visible then
		-- Determine the correct audio based on the month
		local month = os.date("*t").month
		local audio
		if month == 10 then
			audio = uiParent.Halloween
		elseif month == 12 or month == 1 then
			audio = uiParent.Winter
		else
			audio = uiParent.Main
		end

		-- Play the audio
		audio:Play()

		-- Move the text UP first (~-0.4)
		local moveUpInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local moveUpGoal = { Position = UDim2.new(0.24, 0, -0.4, 0) }
		local moveUpTween = tweenService:Create(uiElement, moveUpInfo, moveUpGoal)
		moveUpTween:Play()
		moveUpTween.Completed:Wait()

		-- Wait ~2 seconds at the top position
		task.wait(2)

		-- Move the text DOWN to {0.24, 0}, {0.395, 0}
		local moveDownInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local moveDownGoal = { Position = UDim2.new(0.24, 0, 0.395, 0) }
		local moveDownTween = tweenService:Create(uiElement, moveDownInfo, moveDownGoal)
		moveDownTween:Play()
		moveDownTween.Completed:Wait()

		-- Wait 3 seconds before rising & fading out
		task.wait(3)

		-- Tween to rise by 1 unit (y +1.0) over 5 seconds
		local riseUpInfo = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local riseUpGoal = { Position = uiElement.Position + UDim2.new(0, 0, 1, 0) }
		local riseUpTween = tweenService:Create(uiElement, riseUpInfo, riseUpGoal)

		-- Gradually fade out the audio while rising
		local startVolume = audio.Volume
		local fadeOutTime = 5
		local fadeStep = 0.1

		riseUpTween:Play()

		for i = 1, fadeOutTime / fadeStep do
			audio.Volume = startVolume * (1 - i / (fadeOutTime / fadeStep))
			task.wait(fadeStep)
		end

		audio.Volume = 0  -- Ensure it's fully silent
		audio:Stop()  -- Stop the music
		uiParent.Visible = false  -- Hide the UI
		MainMenu.Visible = true
	end
end

-- Run the function once uiParent becomes visible
uiParent:GetPropertyChangedSignal("Visible"):Connect(onUIVisible)

-- Check if it's already visible when the script runs
if uiParent.Visible then
	onUIVisible()
end
