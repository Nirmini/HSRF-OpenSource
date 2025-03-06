local CredGui = script.Parent.Parent.Settings
local OpenBttn = script.Parent
local CredOpen = false
local CurOp = script.Parent.Parent.CurOp

OpenBttn.MouseButton1Click:Connect(function()
	if CurOp.Value ~= 2 then
		CredGui.Visible = true
		CurOp.Value = 2
	elseif CurOp.Value == 2 then
		CredGui.Visible = false
		CurOp.Value = 0
	end
end)