local Button = script.Parent
local Enabled = false
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChangeLighting = ReplicatedStorage:WaitForChild("ChangeLighting")

Button.MouseButton1Click:Connect(function()
	if Enabled == true then
		ChangeLighting:FireServer("ShadowMap")
		Button.Text = "Enable"
		Enabled = false
	elseif Enabled == false then
		ChangeLighting:FireServer("Future")
		Button.Text = "Disable"
		Enabled = true
	end
end)