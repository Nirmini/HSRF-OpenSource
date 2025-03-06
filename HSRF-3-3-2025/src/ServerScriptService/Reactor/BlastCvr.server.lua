local TweenService = game:GetService("TweenService")
local BlastCvr = game.Workspace["RCR-BlastCover"]
local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif
local CvrDown = true -- True indicates the cover is down

-- Event listener for CvrUnlckd
script.Parent.CvrUnlckd.Event:Connect(function()
	if CvrDown then
		CvrDown = false -- Prevent further movement

		for _, part in ipairs(BlastCvr:GetDescendants()) do
			if part:IsA("BasePart") then
				-- Calculate the new CFrame for each part
				local newCFrame = part.CFrame * CFrame.new(0, 32.859, 0) -- Move upwards along the Y-axis
				-- Tween the CFrame of each part
				local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {CFrame = newCFrame})
				tween:Play()
			end
		end
	else
		-- Notify the player the cover cannot be moved again
		ClientNotifEvnt:FireClient(nil, "Really Black", "Reactor Systems", "The cover only moves up for now!")
	end
end)
