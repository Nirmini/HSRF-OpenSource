local Temp = game.ServerScriptService.Reactor.ReactorTemp
local Integ = game.ServerScriptService.Reactor.StructuralInteg
local ROn = game.ServerScriptService.Reactor.ReactorOnline
local Stalls = game.ServerScriptService.Reactor.REvents.StallCnt

local function CheckConditions()
	if Temp.Value >= 4250 then
		Integ.Value = Integ.Value - math.random(1, 3)
	end
	if Temp.Value <= 100 and Stalls.Value == 3 then
		Integ.Value = Integ.Value - math.random(1, 3)
	end
end

local function Mainloop()
	while ROn.Value do
		CheckConditions()
		wait(5)
	end
end

ROn.Changed:Connect(function()
	if ROn.Value then
		Mainloop()
	end
end)
