-- BROKEN AS OF HSRF 3.0.0 Build 6

--ServerVariables
local Fan = script.Parent.FanOn
local E1Pos = script.Parent.Elev1Stat
local E2Pos = script.Parent.Elev2Stat
local SecLock = script.Parent.Locked
local SealPhase = script.Parent.Sealed

--Bottomside Desk
local BottomDesk = game.Workspace["SealControl-LowerDesk"]
local LFStat = BottomDesk.FanStat
local LFanCon = BottomDesk.FanCon
local LFanBttn = BottomDesk["Fan-Bttn"]

--Topside Desk
local TopDesk = game.Workspace["SealControl-UpperDesk"]
local TFStat = TopDesk.FanStat
local TFanCon = TopDesk.FanCon
local TFanBttn = TopDesk["Fan-Bttn"]

TFanBttn.ClickDetector.MouseClick:Connect(function()
	print("FanBttnClicked - Low")
	if SealPhase.Value == false and Fan.Value == false then
		Fan.Value = true
		LFStat.BrickColor = BrickColor.new("Really black")
	elseif SealPhase.Value == false and Fan.Value == true then
		Fan.Value = false
		LFStat.BrickColor = BrickColor.new("Lime green")
	end
end)
LFanBttn.ClickDetector.MouseClick:Connect(function()
	print("FanBttnClicked - Top")
	if SealPhase.Value == false and Fan.Value == false then
		Fan.Value = true
		LFStat.BrickColor = BrickColor.new("Really black")
	elseif SealPhase.Value == false and Fan.Value == true then
		Fan.Value = false
		LFStat.BrickColor = BrickColor.new("Lime green")
	end
end)