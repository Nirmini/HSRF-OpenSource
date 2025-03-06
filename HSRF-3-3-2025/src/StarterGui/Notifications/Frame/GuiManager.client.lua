local Frame = script.Parent
local Player = game.Players.LocalPlayer
local Evnt = game.ReplicatedStorage.ClientNotif

Evnt.OnClientEvent:Connect(function( color, title, body)
		Frame.BackgroundColor = BrickColor.new(color)
		Frame.Title.Text = title
		Frame.ContentField.Content.Text = body
		Frame:TweenPosition(UDim2.new(-0.001, 0, 0.757, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
		wait(5)
		Frame:TweenPosition(UDim2.new(-0.646, 0, 0.757, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quint, 0.5, true)
end)
