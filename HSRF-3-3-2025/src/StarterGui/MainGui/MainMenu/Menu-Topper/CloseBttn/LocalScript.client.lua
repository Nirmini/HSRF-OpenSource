local MainGui = script.Parent.Parent.Parent
local MainClose = script.Parent

MainClose.MouseButton1Click:Connect(function()
	MainGui.Visible = false
end)