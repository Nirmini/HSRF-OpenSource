local button = script.Parent
local CallEvnt = game.ReplicatedStorage.CallAdmin
local Cooldown = false
button.MouseButton1Click:Connect(function()
	if Cooldown == false then
	CallEvnt:FireServer()
	button.Text = "Admin Called!"
	Cooldown = true
	wait(3)
	button.TextColor3 = "Call An Admin"
	end
	wait(60)
	Cooldown = false
end)