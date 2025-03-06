local Temp = game.ServerScriptService.Reactor.ReactorTemp
local IsReactOn = game.ServerScriptService.Reactor.ReactorOnline
local OutTxt = script.Parent
local function mainloop()
	while IsReactOn.Value == true do
		if Temp.Value < 50000 then
			OutTxt.Text = tostring(Temp.Value) .. "K"
		else
			OutTxt.Text = "ERROR"
		end
		task.wait(3)
	end
	if IsReactOn.Value == false then
		OutTxt.Text = "OFFLINE"
	end
end
mainloop()
game.ServerScriptService.Reactor.ReactorOnline:GetPropertyChangedSignal("Value"):Connect(mainloop)
