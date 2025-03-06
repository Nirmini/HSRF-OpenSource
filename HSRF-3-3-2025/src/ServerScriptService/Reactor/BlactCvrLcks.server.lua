local TweenService = game:GetService("TweenService")
local BlastCvr = game.Workspace["RCR-BlastCvrLocks"]
local BCvrBttn = game.Workspace.StartShutDesk.BCvrBttn.Main
local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif
local CvrDown = true

-- Button click event
BCvrBttn.ClickDetector.MouseClick:Connect(function(player)
	if CvrDown then
		CvrDown = false -- Prevent further movement

		local children = BlastCvr:GetChildren()
		if #children >= 2 then
			-- Move the first child positively in the Z-axis
			local firstChild = children[1]
			if firstChild:IsA("BasePart") then
				local newCFrame = firstChild.CFrame * CFrame.new(137.226, 0, 0) -- Move along the Z-axis
				local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(firstChild, tweenInfo, {CFrame = newCFrame})
				tween:Play()
			end

			-- Move the second child negatively in the X-axis
			local secondChild = children[2]
			if secondChild:IsA("BasePart") then
				local newCFrame = secondChild.CFrame * CFrame.new(-137.226, 0, 0) -- Move along the X-axis
				local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(secondChild, tweenInfo, {CFrame = newCFrame})
				tween:Play()
			end
			wait(8)
			script.Parent.CvrUnlckd:Fire()
		else
			-- Notify the player if the model does not have at least two children
			ClientNotifEvnt:FireClient(player, "Really Black", "Reactor Systems", "An error occured in the script running this!")
		end
	else
		-- Notify the player the cover cannot be moved again
		ClientNotifEvnt:FireClient(player, "Really Black", "Reactor Systems", "The cover only moves up for now!")
	end
end)
