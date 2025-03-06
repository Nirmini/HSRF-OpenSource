-- Sprisingly still works after HSRF 3.0.0 Build 6

local TweenService = game:GetService("TweenService")
local wingParts = {}

--Audio (Local - Global)
local SLock = game.Workspace.Seal06.SealLock
local Alarm = game.Workspace.Seal06.Alarm

--ServerVariables
local Fan = script.Parent.FanOn
local E1Pos = script.Parent.Elev1Stat
local E2Pos = script.Parent.Elev2Stat
local SecLock = script.Parent.Locked
local SealPhase = script.Parent.Sealed
local Sealtime
local Debounce = false
--Server-Client Events
--Coming Soon

--Bottomside Desk
local BottomDesk = game.Workspace["SealControl-LowerDesk"]
local LCycleBttn = BottomDesk["Cycle-Bttn"]
local LSecBttn = BottomDesk["Sec-Bttn"]
local LSealG = BottomDesk.SealStatGreen
local LSealY = BottomDesk.SealStatYellow
local LSealR = BottomDesk.SealStatRed
local LE1U = BottomDesk["E1Con-Up"]
local LE2U = BottomDesk["E2Con-Up"]
local LE1D = BottomDesk["E1Con-Dwn"]
local LE2D = BottomDesk["E2Con-Dwn"]
local LE1Stat = BottomDesk.E1Stat
local LE2Stat = BottomDesk.E2Stat
local LFStat = BottomDesk.FanStat

--Topside Desk
local TopDesk = game.Workspace["SealControl-UpperDesk"]
local TCycleBttn = TopDesk["Cycle-Bttn"]
local TSecBttn = TopDesk["Sec-Bttn"]
local TSealG = TopDesk.SealStatGreen
local TSealY = TopDesk.SealStatYellow
local TSealR = TopDesk.SealStatRed
local TE1U = TopDesk["E1Con-Up"]
local TE2U = TopDesk["E2Con-Up"]
local TE1D = TopDesk["E1Con-Dwn"]
local TE2D = TopDesk["E2Con-Dwn"]
local TE1Stat = TopDesk.E1Stat
local TE2Stat = TopDesk.E2Stat
local TFStat = TopDesk.FanStat

--Lights
local AL1 = game.Workspace.TSAlarmLight1.Base.Main
local AL2 = game.Workspace.TSAlarmLight2.Base.Main
local function ALOn()
	AL1.SP0.Enabled = true
	AL1.SP1.Enabled = true
	AL1.SpotLight0.Enabled = true
	AL1.SpotLight1.Enabled = true
	AL2.SP0.Enabled = true
	AL2.SP1.Enabled = true
	AL2.SpotLight0.Enabled = true
	AL2.SpotLight1.Enabled = true
end
local function ALOff()
	AL1.SP0.Enabled = false
	AL1.SP1.Enabled = false
	AL1.SpotLight0.Enabled = false
	AL1.SpotLight1.Enabled = false
	AL2.SP0.Enabled = false
	AL2.SP1.Enabled = false
	AL2.SpotLight0.Enabled = false
	AL2.SpotLight1.Enabled = false
end

-- Collect the Wing parts
for i = 1, 10 do
	local part = game.Workspace.Seal06:FindFirstChild("Wing" .. i)
	if part then
		table.insert(wingParts, part)
	end
end

-- Function to create and play a tween
local function rotatePart(part, rotationAngle, duration)
	-- Ensure the part has a PivotOffset property set
	local pivotOffset = part.PivotOffset

	-- Calculate the target rotation CFrame for the Y-axis
	local targetRotation = CFrame.Angles(0, math.rad(rotationAngle), 0)

	-- Calculate the target CFrame using the pivot offset
	local targetCFrame = part.CFrame * pivotOffset * targetRotation * pivotOffset:Inverse()

	-- Create the tween
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(part, tweenInfo, {CFrame = targetCFrame})

	-- Play the tween
	tween:Play()
end

LCycleBttn.ClickDetector.MouseClick:Connect(function()
	print("FanBttnClicked - Low")
	if Fan.Value == false and E1Pos.Value == false and E2Pos.Value == false and SecLock.Value == false and SealPhase.Value == false and Debounce == false then
		Debounce = true
		Sealtime = math.random(4, 6)
		--Sealing
		Alarm:Play()
		ALOn()
		LSealR.Material = Enum.Material.Glass
		TSealR.Material = Enum.Material.Glass
		LSealY.Material = Enum.Material.Neon
		TSealY.Material = Enum.Material.Neon
		print("Seal Closing - Low")
		for _, part in ipairs(wingParts) do
			rotatePart(part, -52, Sealtime)
		end
		SealPhase.Value = true
		wait(Sealtime+0.2)
		Alarm:Stop()
		ALOff()
		SLock:Play()
		wait(2)
		LSealY.Material = Enum.Material.Glass
		TSealY.Material = Enum.Material.Glass
		LSealG.Material = Enum.Material.Neon
		TSealG.Material = Enum.Material.Neon
		Debounce = false
	elseif Fan.Value == false and E1Pos.Value == false and E2Pos.Value == false and SecLock.Value == false and SealPhase.Value == true and Debounce == false then
		Debounce = true
		Sealtime = math.random(4, 6)
		--Opening
		print("Seal Opening - Low")
		SLock:Play()
		wait(3)
		Alarm:Play()
		ALOn()
		LSealG.Material = Enum.Material.Glass
		TSealG.Material = Enum.Material.Glass
		LSealY.Material = Enum.Material.Neon
		TSealY.Material = Enum.Material.Neon
		for _, part in ipairs(wingParts) do
			rotatePart(part, 52, Sealtime)
		end
		SealPhase.Value = false
		wait(Sealtime+0.2)
		Alarm:Stop()
		ALOff()
		LSealY.Material = Enum.Material.Glass
		TSealY.Material = Enum.Material.Glass
		LSealR.Material = Enum.Material.Neon
		TSealR.Material = Enum.Material.Neon
		Debounce = false
	end
end)

TCycleBttn.ClickDetector.MouseClick:Connect(function()
	print("FanBttnClicked - Top")
	if Fan.Value == false and E1Pos.Value == false and E2Pos.Value == false and SecLock.Value == false and SealPhase.Value == false and Debounce == false then
		Debounce = true
		Sealtime = math.random(4, 6)
		--Main open
		Alarm:Play()
		ALOn()
		LSealR.Material = Enum.Material.Glass
		TSealR.Material = Enum.Material.Glass
		LSealY.Material = Enum.Material.Neon
		TSealY.Material = Enum.Material.Neon
		print("Seal Closing - Top")
		for _, part in ipairs(wingParts) do
			rotatePart(part, -52, Sealtime)
		end
		SealPhase.Value = true
		wait(Sealtime+0.2)
		Alarm:Stop()
		ALOff()
		SLock:Play()
		wait(2)
		LSealY.Material = Enum.Material.Glass
		TSealY.Material = Enum.Material.Glass
		LSealG.Material = Enum.Material.Neon
		TSealG.Material = Enum.Material.Neon
		Debounce = false
	elseif Fan.Value == false and E1Pos.Value == false and E2Pos.Value == false and SecLock.Value == false and SealPhase.Value == true and Debounce == false then
		Debounce = true
		Sealtime = math.random(4, 6)
		print("Seal Opening - Top")
		SLock:Play()
		wait(3)
		Alarm:Play()
		ALOn()
		LSealG.Material = Enum.Material.Glass
		TSealG.Material = Enum.Material.Glass
		LSealY.Material = Enum.Material.Neon
		TSealY.Material = Enum.Material.Neon
		for _, part in ipairs(wingParts) do
			rotatePart(part, 52, Sealtime)
		end
		SealPhase.Value = false
		wait(Sealtime+0.2)
		Alarm:Stop()
		ALOff()
		LSealY.Material = Enum.Material.Glass
		TSealY.Material = Enum.Material.Glass
		LSealR.Material = Enum.Material.Neon
		TSealR.Material = Enum.Material.Neon
		Debounce = false
	end
end)