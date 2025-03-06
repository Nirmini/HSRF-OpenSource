local MainGui = script.Parent.Parent.Parent.MainMenu
local MainClose = script.Parent

MainClose.MouseButton1Click:Connect(function()
	MainGui.Visible = false
end)