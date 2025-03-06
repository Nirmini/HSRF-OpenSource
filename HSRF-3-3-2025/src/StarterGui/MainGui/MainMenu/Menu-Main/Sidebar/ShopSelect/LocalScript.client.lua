local ShopGui = script.Parent.Parent.Shop
local OpenBttn = script.Parent
local TeamOpen = false
local CurOp = script.Parent.Parent.CurOp

OpenBttn.MouseButton1Click:Connect(function()
	if CurOp.Value ~= 3 then
		ShopGui.Visible = true
		CurOp.Value = 3
	elseif CurOp.Value == 3 then
		ShopGui.Visible = false
		CurOp.Value = 0

	end
end)