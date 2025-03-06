-- BROKEN AS OF HSRF 3.0.0 Build 6

local E1Pos = script.Parent.Elev1Stat.Value
local E2Pos = script.Parent.Elev2Stat.Value
local FToggle = script.Parent.FanOn.Value
local TDesk = game.Workspace["SealControl-UpperDesk"]
local LDesk = game.Workspace["SealControl-LowerDesk"]
while true do
	--Stuff
	if E1Pos.Value == false then
		LDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
		TDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
	elseif E1Pos.Value == true then
		LDesk.E1Stat.BrickColor = BrickColor.new("Really black")
		TDesk.E1Stat.BrickColor = BrickColor.new("Really black")
	end
	if E2Pos == false then
		LDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
		TDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
	elseif E2Pos == true then
		LDesk.E1Stat.BrickColor = BrickColor.new("Really black")
		TDesk.E1Stat.BrickColor = BrickColor.new("Really black")
	end
	if FToggle == false then
		LDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
		TDesk.E1Stat.BrickColor = BrickColor.new("Lime green")
	elseif FToggle == true then
		LDesk.E1Stat.BrickColor = BrickColor.new("Really black")
		TDesk.E1Stat.BrickColor = BrickColor.new("Really black")
	end
	task.wait(5)
end