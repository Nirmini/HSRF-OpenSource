local ROnline = game.ServerScriptService.Reactor.ReactorOnline
local Integ = game.ServerScriptService.Reactor.StructuralInteg
local Temp = game.ServerScriptService.Reactor.ReactorTemp

-- Events
local FltrEvnt = game.ServerScriptService.Reactor.REvents.Filter --[]
local FrzzEvnt = game.ServerScriptService.Reactor.REvents.Freeze --##
local FuelEvnt = game.ServerScriptService.Reactor.REvents.Fuel   --[]
local MeltEvnt = game.ServerScriptService.Reactor.REvents.Melt   --##
local PMltEvnt = game.ServerScriptService.Reactor.REvents.PMelt  --##
local StllEvnt = game.ServerScriptService.Reactor.REvents.Stall  --##
local StllCnt = game.ServerScriptService.Reactor.REvents.StallCnt--##

local function CheckConditions()
	if Temp.Value >= 4250 and Integ.Value <= 99 and Integ.Value > 50 then
		PMltEvnt:Fire()
	end
	if Temp.Value >= 4250 and Integ.Value <= 20 then
		MeltEvnt:Fire()
	end
	if Temp.Value <= 100 and Integ.Value <= 20 then
		FrzzEvnt:Fire()
	end
	if Temp.Value <= 100 and Integ.Value > 20 then
		StllEvnt:Fire()
	end
end

local function StartLoop()
	while ROnline.Value do
		CheckConditions()
		wait(5)
	end
end

ROnline.Changed:Connect(function()
	if ROnline.Value then
		StartLoop()
	end
end)
