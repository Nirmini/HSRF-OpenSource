local TeamsGui = script.Parent.Parent.Teams
local OpenBttn = script.Parent
local TeamOpen = false
local CurOp = script.Parent.Parent.CurOp

OpenBttn.MouseButton1Click:Connect(function()
	if CurOp.Value ~= 1 then
		TeamsGui.Visible = true
		CurOp.Value = 1
	elseif CurOp.Value == 1 then
		TeamsGui.Visible = false
		CurOp.Value = 0
		
	end
end)