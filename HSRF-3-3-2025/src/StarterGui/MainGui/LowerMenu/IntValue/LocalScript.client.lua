local TxtLbl = script.Parent
local credits = game.Players.LocalPlayer.leaderstats.Credits

local function mainloop()
	TxtLbl.Text = tostring(credits.Value)
end

credits.Changed:Connect(mainloop)

mainloop()
