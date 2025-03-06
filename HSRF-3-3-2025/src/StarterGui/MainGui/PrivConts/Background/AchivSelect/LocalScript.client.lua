local ShopGui = script.Parent.Parent.Shop
local OpenBttn = script.Parent
local TeamOpen = false
local CurOp = script.Parent.Parent.CurOp

OpenBttn.MouseButton1Click:Connect(function()
	if CurOp.Value ~= 5 then
		ShopGui.Visible = true
		CurOp.Value = 5
	elseif CurOp.Value == 5 then
		ShopGui.Visible = false
		CurOp.Value = 0

	end
end)