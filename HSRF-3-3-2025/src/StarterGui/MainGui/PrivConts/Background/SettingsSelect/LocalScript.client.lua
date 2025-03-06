local SettGui = script.Parent.Parent.Settings
local OpenBttn = script.Parent
local SettOpen = false
local CurOp = script.Parent.Parent.CurOp

OpenBttn.MouseButton1Click:Connect(function()
	if CurOp.Value ~= 4 then
		SettGui.Visible = true
		CurOp.Value = 4
	elseif CurOp.Value == 4 then
		SettGui.Visible = false
		CurOp.Value = 0
	end
end)