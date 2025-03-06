local Fan = script.Parent.FanOn
local FU1 = script.Parent.FuelUse1
local FU2 = script.Parent.FuelUse2
local CTCool = script.Parent.CTCoolLvl
local Cool = script.Parent.CoolantLvl
local ROnline = game.ServerScriptService.Reactor.ReactorOnline
local RTemp = game.ServerScriptService.Reactor.ReactorTemp
local GTemp = game.ReplicatedStorage.GTemp
local STemp = 1.2

local function UpdateTemperature()
	local tempIncrease = 0.1

	-- Calculate temperature based on FU1
	if FU1.Value == 1 then
		tempIncrease = tempIncrease + 0.3
	elseif FU1.Value == 2 then
		tempIncrease = tempIncrease + 0.5
	elseif FU1.Value == 3 then
		tempIncrease = tempIncrease + 0.9
	elseif FU1.Value == 4 then
		tempIncrease = tempIncrease + 1.4
	end

	-- Calculate temperature based on FU2
	if FU2.Value == 1 then
		tempIncrease = tempIncrease + 0.3
	elseif FU2.Value == 2 then
		tempIncrease = tempIncrease + 0.5
	elseif FU2.Value == 3 then
		tempIncrease = tempIncrease + 0.9
	elseif FU2.Value == 4 then
		tempIncrease = tempIncrease + 1.4
	end

	-- Calculate cooling based on CTCool
	if CTCool.Value == 1 then
		tempIncrease = tempIncrease - 0.1
	elseif CTCool.Value == 2 then
		tempIncrease = tempIncrease - 0.4
	elseif CTCool.Value == 3 then
		tempIncrease = tempIncrease - 0.7
	elseif CTCool.Value == 4 then
		tempIncrease = tempIncrease - 0.9
	end

	-- Calculate cooling based on Cool
	if Cool.Value == 1 then
		tempIncrease = tempIncrease - 0.3
	elseif Cool.Value == 2 then
		tempIncrease = tempIncrease - 0.5
	elseif Cool.Value == 3 then
		tempIncrease = tempIncrease - 0.8
	end

	-- Calculate cooling based on Fan
	if Fan.Value == true then
		tempIncrease = tempIncrease - 0.5
	elseif Fan.Value == false then
		tempIncrease = tempIncrease - 0.1
	end

	-- Update reactor temperature
	RTemp.Value = RTemp.Value + math.round(tempIncrease)
	GTemp.Value = GTemp.Value + math.round(tempIncrease)
end

local function StartLoop()
	while ROnline.Value do
		UpdateTemperature()
		wait(5)
	end
end

ROnline.Changed:Connect(function()
	if ROnline.Value then
		StartLoop()
	end
end)
