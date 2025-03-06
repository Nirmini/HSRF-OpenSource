local Integ = game.ServerScriptService.Reactor.StructuralInteg
local IsReactOn = game.ServerScriptService.Reactor.ReactorOnline
local OutTxt = script.Parent
local function mainloop()
	while IsReactOn.Value == true do
		if Integ.Value > 0 then
			OutTxt.Text = tostring(Integ.Value) .. "%"
		else
			OutTxt.Text = "ERR%"
		end
		task.wait(3)
	end
	if IsReactOn.Value == false then
		OutTxt.Text = "OFLN"
	end
end
mainloop()
game.ServerScriptService.Reactor.ReactorOnline:GetPropertyChangedSignal("Value"):Connect(mainloop)
