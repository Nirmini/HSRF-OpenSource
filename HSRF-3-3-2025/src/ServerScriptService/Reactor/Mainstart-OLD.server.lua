local TweenService = game:GetService("TweenService")
local StartBttn = game.Workspace.StartShutDesk.Startup.Main
local PrimeAlert = game.Workspace["Audio-Main"].StartupPrimeWarning
local StartupAlert = game.Workspace["Audio-Main"].StartupAlert
local ElevLocked = script.Parent.Parent.ElevsDisabled.Value
local StartEvent = script.Parent.Startup
local EnableLights = script.Parent.EnableLights
local StartupUnlocked = script.Parent.StartupAvailible
local Reactor = game.Workspace.QBHNR
local ReactorOnline = game.ServerScriptService.Reactor.ReactorOnline
local PLA1 = game.Workspace["PowerLaser-A1"].Beam.Beam
local PLA2 = game.Workspace["PowerLaser-A2"].Beam.Beam
local PLB1 = game.Workspace["PowerLaser-B1"].Beam.Beam
local PLB2 = game.Workspace["PowerLaser-B2"].Beam.Beam
local PLC1 = game.Workspace["PowerLaser-C1"].Beam.Beam
local PLC2 = game.Workspace["PowerLaser-C2"].Beam.Beam
local PLD1 = game.Workspace["PowerLaser-D1"].Beam.Beam
local PLD2 = game.Workspace["PowerLaser-D2"].Beam.Beam
local Grav1 = game.Workspace["GRAVL-1"].Beam.Rope
local Grav2 = game.Workspace["GRAVL-2"].Beam.Rope
local GL1 = game.Workspace["GRAVL-1"]
local GL2 = game.Workspace["GRAVL-2"]
local CTA1 = game.Workspace["PowerLaser-A1"]
local CTA2 = game.Workspace["PowerLaser-A2"]
local CTB1 = game.Workspace["PowerLaser-B1"]
local CTB2 = game.Workspace["PowerLaser-B2"]
local CTC1 = game.Workspace["PowerLaser-C1"]
local CTC2 = game.Workspace["PowerLaser-C2"]
local CTD1 = game.Workspace["PowerLaser-D1"]
local CTD2 = game.Workspace["PowerLaser-D2"]
local StrtEvntNum = math.random(1, 1000)
local StartTemp = math.random(950, 1050)
local ReactorTemp = game.ServerScriptService.Reactor.ReactorTemp
local ManualToggle = game.ServerScriptService.Reactor.ManualAvailible
local GL1 = game.Workspace.QBHNR.QBHNR.L1.PointLight
local GL2 = game.Workspace.QBHNR.QBHNR.L2.PointLight
local GL3 = game.Workspace.QBHNR.QBHNR.L3.PointLight
local Bridge = script.Parent.BridgeConencted
local StatDisp = game.Workspace.ReactorInfoDisp
local Debounce = false
local Lock = script.Parent.ReactorLocked
local Keylock = game.ServerScriptService.Reactor.StartKeyTurned
local lighting = game.Lighting

--VoiceLines(Mostly)
local StartTheme = game.Workspace["Audio-Main"].StartMusic
local PriPos = game.Workspace["Audio-Main"]["-VoiceLines"].Startup["QBHR-PriPos"]
local StartCon = game.Workspace["Audio-Main"]["-VoiceLines"].Startup["QBHR-Startcon"]
local CombIg = game.Workspace["Audio-Main"]["-VoiceLines"].Startup.CobustionIgnition
local ReMove = game.Workspace["Audio-Main"]["-VoiceLines"].Startup.QBHRMove
local FCheck = game.Workspace["Audio-Main"]["-VoiceLines"].Startup.FinalChecks
local AppIg = game.Workspace["Audio-Main"]["-VoiceLines"].Startup.AppIg
local LzrIg = game.Workspace["Audio-Main"].LaserIg
local ReOnline = game.Workspace["Audio-Main"]["-VoiceLines"].Startup.ReOn
local VLA = game.Workspace["Audio-Main"]["-VoiceLines"].General.A
local VLB = game.Workspace["Audio-Main"]["-VoiceLines"].General.B
local VLC = game.Workspace["Audio-Main"]["-VoiceLines"].General.C
local VLD = game.Workspace["Audio-Main"]["-VoiceLines"].General.D
local VL1 = game.Workspace["Audio-Main"]["-VoiceLines"].General.One
local VL2 = game.Workspace["Audio-Main"]["-VoiceLines"].General.Two
local VLReady = game.Workspace["Audio-Main"]["-VoiceLines"].General.Ready
local VLOnline = game.Workspace["Audio-Main"]["-VoiceLines"].General["-Testing"].Online
local WHOST = game.Workspace["Audio-Main"].FinalMinutesOST
local LSwitch = game.Workspace["Audio-Main"].LSwitch
local VLAuto = game.Workspace["Audio-Main"]["-VoiceLines"].ManStart.Auto
local VLStartFail = game.Workspace["Audio-Main"]["-VoiceLines"].ManStart.SFail
local IOTheme = game.Workspace["Audio-Main"].IgnitionOvercharge

local FacilitySSF = game.ServerScriptService.Facility

local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif
local ClientShakeEvnt = game.ReplicatedStorage.ShakeScreen

local TestNotif = game.ReplicatedStorage.Game.Events.UI.Notification

local LastUClick = ""

local function LightsOn()
	print("Adjusting CT Lights")
	CTA1.Emitter.SpotLight.Enabled = true
	CTA1.Beam.PointLight.Enabled = true
	CTA1.FR1.Material = Enum.Material.Neon
	CTA1.FR1.BrickColor = BrickColor.new("Institutional white")
	CTA1.FR2.Material = Enum.Material.Neon
	CTA1.FR2.BrickColor = BrickColor.new("Institutional white")
	CTA1.BR1.Material = Enum.Material.Neon
	CTA1.BR1.BrickColor = BrickColor.new("Institutional white")
	CTA1.BR2.Material = Enum.Material.Neon
	CTA1.BR2.BrickColor = BrickColor.new("Institutional white")
	CTA1.BR3.Material = Enum.Material.Neon
	CTA1.BR3.BrickColor = BrickColor.new("Institutional white")
	CTA1.R1.Material = Enum.Material.Neon
	CTA1.R2.Material = Enum.Material.Neon
	CTA1.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTA1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("A1 Set")
	CTA2.Emitter.SpotLight.Enabled = true
	CTA2.Beam.PointLight.Enabled = true
	CTA2.FR1.Material = Enum.Material.Neon
	CTA2.FR1.BrickColor = BrickColor.new("Institutional white")
	CTA2.FR2.Material = Enum.Material.Neon
	CTA2.FR2.BrickColor = BrickColor.new("Institutional white")
	CTA2.BR1.Material = Enum.Material.Neon
	CTA2.BR1.BrickColor = BrickColor.new("Institutional white")
	CTA2.BR2.Material = Enum.Material.Neon
	CTA2.BR2.BrickColor = BrickColor.new("Institutional white")
	CTA2.BR3.Material = Enum.Material.Neon
	CTA2.BR3.BrickColor = BrickColor.new("Institutional white")
	CTA2.R1.Material = Enum.Material.Neon
	CTA2.R2.Material = Enum.Material.Neon
	CTA2.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTA2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("A2 Set")
	CTB1.Emitter.SpotLight.Enabled = true
	CTB1.Beam.PointLight.Enabled = true
	CTB1.FR1.Material = Enum.Material.Neon
	CTB1.FR1.BrickColor = BrickColor.new("Institutional white")
	CTB1.FR2.Material = Enum.Material.Neon
	CTB1.FR2.BrickColor = BrickColor.new("Institutional white")
	CTB1.BR1.Material = Enum.Material.Neon
	CTB1.BR1.BrickColor = BrickColor.new("Institutional white")
	CTB1.BR2.Material = Enum.Material.Neon
	CTB1.BR2.BrickColor = BrickColor.new("Institutional white")
	CTB1.BR3.Material = Enum.Material.Neon
	CTB1.BR3.BrickColor = BrickColor.new("Institutional white")
	CTB1.R1.Material = Enum.Material.Neon
	CTB1.R2.Material = Enum.Material.Neon
	CTB1.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTB1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("B1 Set")
	CTB2.Emitter.SpotLight.Enabled = true
	CTB2.Beam.PointLight.Enabled = true
	CTB2.FR1.Material = Enum.Material.Neon
	CTB2.FR1.BrickColor = BrickColor.new("Institutional white")
	CTB2.FR2.Material = Enum.Material.Neon
	CTB2.FR2.BrickColor = BrickColor.new("Institutional white")
	CTB2.BR1.Material = Enum.Material.Neon
	CTB2.BR1.BrickColor = BrickColor.new("Institutional white")
	CTB2.BR2.Material = Enum.Material.Neon
	CTB2.BR2.BrickColor = BrickColor.new("Institutional white")
	CTB2.BR3.Material = Enum.Material.Neon
	CTB2.BR3.BrickColor = BrickColor.new("Institutional white")
	CTB2.R1.Material = Enum.Material.Neon
	CTB2.R2.Material = Enum.Material.Neon
	CTB2.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTB2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("B2 Set")
	CTC1.Emitter.SpotLight.Enabled = true
	CTC1.Beam.PointLight.Enabled = true
	CTC1.FR1.Material = Enum.Material.Neon
	CTC1.FR1.BrickColor = BrickColor.new("Institutional white")
	CTC1.FR2.Material = Enum.Material.Neon
	CTC1.FR2.BrickColor = BrickColor.new("Institutional white")
	CTC1.BR1.Material = Enum.Material.Neon
	CTC1.BR1.BrickColor = BrickColor.new("Institutional white")
	CTC1.BR2.Material = Enum.Material.Neon
	CTC1.BR2.BrickColor = BrickColor.new("Institutional white")
	CTC1.BR3.Material = Enum.Material.Neon
	CTC1.BR3.BrickColor = BrickColor.new("Institutional white")
	CTC1.R1.Material = Enum.Material.Neon
	CTC1.R2.Material = Enum.Material.Neon
	CTC1.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTC1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("C1 Set")
	CTC2.Emitter.SpotLight.Enabled = true
	CTC2.Beam.PointLight.Enabled = true
	CTC2.FR1.Material = Enum.Material.Neon
	CTC2.FR1.BrickColor = BrickColor.new("Institutional white")
	CTC2.FR2.Material = Enum.Material.Neon
	CTC2.FR2.BrickColor = BrickColor.new("Institutional white")
	CTC2.BR1.Material = Enum.Material.Neon
	CTC2.BR1.BrickColor = BrickColor.new("Institutional white")
	CTC2.BR2.Material = Enum.Material.Neon
	CTC2.BR2.BrickColor = BrickColor.new("Institutional white")
	CTC2.BR3.Material = Enum.Material.Neon
	CTC2.BR3.BrickColor = BrickColor.new("Institutional white")
	CTC2.R1.Material = Enum.Material.Neon
	CTC2.R2.Material = Enum.Material.Neon
	CTC2.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTC2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("C2 Set")
	CTD1.Emitter.SpotLight.Enabled = true
	CTD1.Beam.PointLight.Enabled = true
	CTD1.FR1.Material = Enum.Material.Neon
	CTD1.FR1.BrickColor = BrickColor.new("Institutional white")
	CTD1.FR2.Material = Enum.Material.Neon
	CTD1.FR2.BrickColor = BrickColor.new("Institutional white")
	CTD1.BR1.Material = Enum.Material.Neon
	CTD1.BR1.BrickColor = BrickColor.new("Institutional white")
	CTD1.BR2.Material = Enum.Material.Neon
	CTD1.BR2.BrickColor = BrickColor.new("Institutional white")
	CTD1.BR3.Material = Enum.Material.Neon
	CTD1.BR3.BrickColor = BrickColor.new("Institutional white")
	CTD1.R1.Material = Enum.Material.Neon
	CTD1.R2.Material = Enum.Material.Neon
	CTD1.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTD1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("D1 Set")
	CTD2.Emitter.SpotLight.Enabled = true
	CTD2.Beam.PointLight.Enabled = true
	CTD2.FR1.Material = Enum.Material.Neon
	CTD2.FR1.BrickColor = BrickColor.new("Institutional white")
	CTD2.FR2.Material = Enum.Material.Neon
	CTD2.FR2.BrickColor = BrickColor.new("Institutional white")
	CTD2.BR1.Material = Enum.Material.Neon
	CTD2.BR1.BrickColor = BrickColor.new("Institutional white")
	CTD2.BR2.Material = Enum.Material.Neon
	CTD2.BR2.BrickColor = BrickColor.new("Institutional white")
	CTD2.BR3.Material = Enum.Material.Neon
	CTD2.BR3.BrickColor = BrickColor.new("Institutional white")
	CTD2.R1.Material = Enum.Material.Neon
	CTD2.R2.Material = Enum.Material.Neon
	CTD2.R3.Material = Enum.Material.Neon
	for _, part in ipairs(CTD2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon end
	end
	LSwitch:Play()
	wait(0.6)
	print("D2 Set")
	for _, part in ipairs(game.Workspace["RChamber-Lights"]:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Color = Color3.fromRGB(185, 172, 108)
			part.Material = Enum.Material.Neon
			part.SurfaceLight.Enabled = true
			LSwitch:Play(.435)
			wait(.02)
		end 
	end
end

local function IOLights()
	print("Adjusting CT Lights")
	CTA1.Emitter.SpotLight.Enabled = true
	CTA1.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTA1.Beam.PointLight.Enabled = true
	CTA1.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTA1.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTA1.FR1.Material = Enum.Material.Neon
	CTA1.FR1.BrickColor = BrickColor.new("Hot pink")
	CTA1.FR2.Material = Enum.Material.Neon
	CTA1.FR2.BrickColor = BrickColor.new("Hot pink")
	CTA1.BR1.Material = Enum.Material.Neon
	CTA1.BR1.BrickColor = BrickColor.new("Hot pink")
	CTA1.BR2.Material = Enum.Material.Neon
	CTA1.BR2.BrickColor = BrickColor.new("Hot pink")
	CTA1.BR3.Material = Enum.Material.Neon
	CTA1.BR3.BrickColor = BrickColor.new("Hot pink")
	CTA1.R1.Material = Enum.Material.Neon
	CTA1.R1.BrickColor = BrickColor.new("Hot pink")
	CTA1.R2.Material = Enum.Material.Neon
	CTA1.R2.BrickColor = BrickColor.new("Hot pink")
	CTA1.R3.Material = Enum.Material.Neon
	CTA1.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTA1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("A1 Set")
	CTA2.Emitter.SpotLight.Enabled = true
	CTA2.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTA2.Beam.PointLight.Enabled = true
	CTA2.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTA2.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTA2.FR1.Material = Enum.Material.Neon
	CTA2.FR1.BrickColor = BrickColor.new("Hot pink")
	CTA2.FR2.Material = Enum.Material.Neon
	CTA2.FR2.BrickColor = BrickColor.new("Hot pink")
	CTA2.BR1.Material = Enum.Material.Neon
	CTA2.BR1.BrickColor = BrickColor.new("Hot pink")
	CTA2.BR2.Material = Enum.Material.Neon
	CTA2.BR2.BrickColor = BrickColor.new("Hot pink")
	CTA2.BR3.Material = Enum.Material.Neon
	CTA2.BR3.BrickColor = BrickColor.new("Hot pink")
	CTA2.R1.Material = Enum.Material.Neon
	CTA2.R1.BrickColor = BrickColor.new("Hot pink")
	CTA2.R2.Material = Enum.Material.Neon
	CTA2.R2.BrickColor = BrickColor.new("Hot pink")
	CTA2.R3.Material = Enum.Material.Neon
	CTA2.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTA2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("A2 Set")
	CTB1.Emitter.SpotLight.Enabled = true
	CTB1.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTB1.Beam.PointLight.Enabled = true
	CTB1.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTB1.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTB1.FR1.Material = Enum.Material.Neon
	CTB1.FR1.BrickColor = BrickColor.new("Hot pink")
	CTB1.FR2.Material = Enum.Material.Neon
	CTB1.FR2.BrickColor = BrickColor.new("Hot pink")
	CTB1.BR1.Material = Enum.Material.Neon
	CTB1.BR1.BrickColor = BrickColor.new("Hot pink")
	CTB1.BR2.Material = Enum.Material.Neon
	CTB1.BR2.BrickColor = BrickColor.new("Hot pink")
	CTB1.BR3.Material = Enum.Material.Neon
	CTB1.BR3.BrickColor = BrickColor.new("Hot pink")
	CTB1.R1.Material = Enum.Material.Neon
	CTB1.R1.BrickColor = BrickColor.new("Hot pink")
	CTB1.R2.Material = Enum.Material.Neon
	CTB1.R2.BrickColor = BrickColor.new("Hot pink")
	CTB1.R3.Material = Enum.Material.Neon
	CTB1.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTB1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("B1 Set")
	CTB2.Emitter.SpotLight.Enabled = true
	CTB2.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTB2.Beam.PointLight.Enabled = true
	CTB2.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTB2.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTB2.FR1.Material = Enum.Material.Neon
	CTB2.FR1.BrickColor = BrickColor.new("Hot pink")
	CTB2.FR2.Material = Enum.Material.Neon
	CTB2.FR2.BrickColor = BrickColor.new("Hot pink")
	CTB2.BR1.Material = Enum.Material.Neon
	CTB2.BR1.BrickColor = BrickColor.new("Hot pink")
	CTB2.BR2.Material = Enum.Material.Neon
	CTB2.BR2.BrickColor = BrickColor.new("Hot pink")
	CTB2.BR3.Material = Enum.Material.Neon
	CTB2.BR3.BrickColor = BrickColor.new("Hot pink")
	CTB2.R1.Material = Enum.Material.Neon
	CTB2.R1.BrickColor = BrickColor.new("Hot pink")
	CTB2.R2.Material = Enum.Material.Neon
	CTB2.R2.BrickColor = BrickColor.new("Hot pink")
	CTB2.R3.Material = Enum.Material.Neon
	CTB2.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTB2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("B2 Set")
	CTC1.Emitter.SpotLight.Enabled = true
	CTC1.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTC1.Beam.PointLight.Enabled = true
	CTC1.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTC1.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTC1.FR1.Material = Enum.Material.Neon
	CTC1.FR1.BrickColor = BrickColor.new("Hot pink")
	CTC1.FR2.Material = Enum.Material.Neon
	CTC1.FR2.BrickColor = BrickColor.new("Hot pink")
	CTC1.BR1.Material = Enum.Material.Neon
	CTC1.BR1.BrickColor = BrickColor.new("Hot pink")
	CTC1.BR2.Material = Enum.Material.Neon
	CTC1.BR2.BrickColor = BrickColor.new("Hot pink")
	CTC1.BR3.Material = Enum.Material.Neon
	CTC1.BR3.BrickColor = BrickColor.new("Hot pink")
	CTC1.R1.Material = Enum.Material.Neon
	CTC1.R1.BrickColor = BrickColor.new("Hot pink")
	CTC1.R2.Material = Enum.Material.Neon
	CTC1.R2.BrickColor = BrickColor.new("Hot pink")
	CTC1.R3.Material = Enum.Material.Neon
	CTC1.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTC1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("C1 Set")
	CTC2.Emitter.SpotLight.Enabled = true
	CTC2.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTC2.Beam.PointLight.Enabled = true
	CTC2.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTC2.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTC2.FR1.Material = Enum.Material.Neon
	CTC2.FR1.BrickColor = BrickColor.new("Hot pink")
	CTC2.FR2.Material = Enum.Material.Neon
	CTC2.FR2.BrickColor = BrickColor.new("Hot pink")
	CTC2.BR1.Material = Enum.Material.Neon
	CTC2.BR1.BrickColor = BrickColor.new("Hot pink")
	CTC2.BR2.Material = Enum.Material.Neon
	CTC2.BR2.BrickColor = BrickColor.new("Hot pink")
	CTC2.BR3.Material = Enum.Material.Neon
	CTC2.BR3.BrickColor = BrickColor.new("Hot pink")
	CTC2.R1.Material = Enum.Material.Neon
	CTC2.R1.BrickColor = BrickColor.new("Hot pink")
	CTC2.R2.Material = Enum.Material.Neon
	CTC2.R2.BrickColor = BrickColor.new("Hot pink")
	CTC2.R3.Material = Enum.Material.Neon
	CTC2.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTC2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("C2 Set")
	CTD1.Emitter.SpotLight.Enabled = true
	CTD1.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTD1.Beam.PointLight.Enabled = true
	CTD1.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTD1.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTD1.FR1.Material = Enum.Material.Neon
	CTD1.FR1.BrickColor = BrickColor.new("Hot pink")
	CTD1.FR2.Material = Enum.Material.Neon
	CTD1.FR2.BrickColor = BrickColor.new("Hot pink")
	CTD1.BR1.Material = Enum.Material.Neon
	CTD1.BR1.BrickColor = BrickColor.new("Hot pink")
	CTD1.BR2.Material = Enum.Material.Neon
	CTD1.BR2.BrickColor = BrickColor.new("Hot pink")
	CTD1.BR3.Material = Enum.Material.Neon
	CTD1.BR3.BrickColor = BrickColor.new("Hot pink")
	CTD1.R1.Material = Enum.Material.Neon
	CTD1.R1.BrickColor = BrickColor.new("Hot pink")
	CTD1.R2.Material = Enum.Material.Neon
	CTD1.R2.BrickColor = BrickColor.new("Hot pink")
	CTD1.R3.Material = Enum.Material.Neon
	CTD1.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTD1.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("D1 Set")
	CTD2.Emitter.SpotLight.Enabled = true
	CTD2.Emitter.SpotLight.Color = Color3.fromRGB(255, 1, 240)
	CTD2.Beam.PointLight.Enabled = true
	CTD2.Beam.PointLight.Color = Color3.fromRGB(255, 1, 240)
	CTD2.Beam.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 1, 240))
	CTD2.FR1.Material = Enum.Material.Neon
	CTD2.FR1.BrickColor = BrickColor.new("Hot pink")
	CTD2.FR2.Material = Enum.Material.Neon
	CTD2.FR2.BrickColor = BrickColor.new("Hot pink")
	CTD2.BR1.Material = Enum.Material.Neon
	CTD2.BR1.BrickColor = BrickColor.new("Hot pink")
	CTD2.BR2.Material = Enum.Material.Neon
	CTD2.BR2.BrickColor = BrickColor.new("Hot pink")
	CTD2.BR3.Material = Enum.Material.Neon
	CTD2.BR3.BrickColor = BrickColor.new("Hot pink")
	CTD2.R1.Material = Enum.Material.Neon
	CTD2.R1.BrickColor = BrickColor.new("Hot pink")
	CTD2.R2.Material = Enum.Material.Neon
	CTD2.R2.BrickColor = BrickColor.new("Hot pink")
	CTD2.R3.Material = Enum.Material.Neon
	CTD2.R3.BrickColor = BrickColor.new("Hot pink")
	for _, part in ipairs(CTD2.NeonArea.Neon:GetDescendants()) do
		if part:IsA("BasePart") then part.Material = Enum.Material.Neon part.BrickColor = BrickColor.new("Hot pink") end
	end
	LSwitch:Play(1)
	wait(0.6)
	print("D2 Set")
	for _, part in ipairs(game.Workspace["RChamber-Lights"]:GetDescendants()) do
		if part:IsA("BasePart") then
			part.BrickColor = BrickColor.new("Royal purple")
			part.Material = Enum.Material.Neon
			part.SurfaceLight.Enabled = true
			LSwitch:Play(.435)
			wait(.15)
		end 
	end
end


while ReactorOnline.Value == false do
	if StartBttn.ClickDetector.MouseClick and Lock.Value == false then
		StartBttn.ClickDetector.MouseClick:Connect(function()
			if Debounce == false and StartupUnlocked.Value == true then
				if FacilitySSF.Grid.CurrentGrid.Value >= 1 and FacilitySSF.Grid.CurrentGridActive.Value == true then
					if math.random(1,1000) > 1 then
						Debounce = true
						Keylock.Value = true
						ClientNotifEvnt:FireAllClients("Lime Green", "Reactor Controls", "Reactor Core Startup Initiated.")
						StartBttn.ClickDetector.MaxActivationDistance = 0
						PrimeAlert:Stop()
						LightsOn()
						wait(0.5)
						PrimeAlert:Stop()
						PrimeAlert.Volume = 0
						StartTheme:Play()
						for i = 1, 5, 1 do
							lighting.Atmosphere.Haze = lighting.Atmosphere.Haze + 0.1
							lighting.Atmosphere.Density = lighting.Atmosphere.Density + 0.01
							wait(0.2)
						end
						wait(5)
						StartupAlert:Play()
						wait(4.2)
						StartupAlert:Stop()
						wait(0.75)
						ElevLocked = true
						StartEvent:FireAllClients()
						local endSignal = Instance.new("BindableEvent")
						local function moveReactorUp()
							for _, part in ipairs(Reactor:GetDescendants()) do
								if part:IsA("BasePart") then
									local newPosition = part.Position + Vector3.new(0, 66, 0) -- Move each part upwards by 10 units along the Y-axis
									local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
									local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
									if tween then
										tween:Play()
										tween.Completed:Connect(function()
											endSignal:Fire()
										end)
									end
								end
							end

							local endEvent = endSignal.Event
							local connection
							connection = endEvent:Connect(function()
								connection:Disconnect()
								endSignal:Destroy()
							end)
						end
						AppIg:Play()
						StatDisp.G1.Stat.BrickColor = BrickColor.new("New Yeller")
						StatDisp.G2.Stat.BrickColor = BrickColor.new("New Yeller")
						wait(3.8)
						Grav1.Enabled = true
						Grav2.Enabled = true
						GL1.Enabled = true
						GL2.Enabled = true
						LzrIg:Play()
						StatDisp.G1.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.G2.Stat.BrickColor = BrickColor.new("Lime green")
						wait(0.9)
						ReMove:Play(3)
						wait(7)
						moveReactorUp()
						wait(8.5)
						GL3.Enabled = true
						wait(5)
						StatDisp.A1.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLA:Play()
			wait(1.119)
			VL1:Play()
			wait(1.147)
			VLReady:Play()
			print("Combustion Laser A1 Ready")]]
						wait(1.2)
						StatDisp.A2.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLA:Play()
			wait(1.119)
			VL2:Play()
			wait(1.103)
			VLReady:Play()
			print("Combustion Laser A2 Ready")]]
						wait(1.2)
						StatDisp.B1.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLB:Play()
			wait(1.102)
			VL1:Play()
			wait(1.147)
			VLReady:Play()
			print("Combustion Laser B1 Ready")]]
						wait(1.2)
						StatDisp.B2.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLB:Play()
			wait(1.102)
			VL2:Play()
			wait(1.103)
			VLReady:Play()
			print("Combustion Laser B2 Ready")]]
						wait(1.2)
						StatDisp.C1.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLC:Play()
			wait(1.327)
			VL1:Play()
			wait(1.147)
			VLReady:Play()
			print("Combustion Laser C1 Ready")]]
						wait(1.2)
						StatDisp.C2.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLC:Play()
			wait(1.327)
			VL2:Play()
			wait(1.103)
			VLReady:Play()
			print("Combustion Laser C2 Ready")]]
						wait(1.2)
						StatDisp.D1.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLD:Play()
			wait(1.374)
			VL1:Play()
			wait(1.147)
			VLReady:Play()
			print("Combustion Laser D1 Ready")]]
						wait(1.2)
						StatDisp.D2.Stat.BrickColor = BrickColor.new("New Yeller")
			--[[wait(0.5)
			VLD:Play()
			wait(1.374)
			VL2:Play()
			wait(1.103)
			VLReady:Play()
			print("Combustion Laser D2 Ready")]]
						wait(0.8)
						--Voice: Igniting Combustion Lasers
						CombIg:Play()
						wait(4)
						PLA1.Enabled = true
						PLA2.Enabled = true
						PLB1.Enabled = true
						PLB2.Enabled = true
						PLC1.Enabled = true
						PLC2.Enabled = true
						PLD1.Enabled = true
						PLD2.Enabled = true
						LzrIg:Play()
						ClientShakeEvnt:FireAllClients()
						StatDisp.A1.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.A2.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.B1.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.B2.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.C1.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.C2.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.D1.Stat.BrickColor = BrickColor.new("Lime green")
						StatDisp.D2.Stat.BrickColor = BrickColor.new("Lime green")
						lighting.Atmosphere.Haze = 0
						lighting.Atmosphere.Density = 0.2
						if StrtEvntNum >= 94 and StrtEvntNum <= 106 then
							if StrtEvntNum > 96 and StrtEvntNum <= 106 then
								--Voice: Automated Startup Failure. Shutting Down for. Manual. Startup.
								print("Manual Startup")
								VLAuto:Play()
								wait(0.884)
								VLStartFail:Play()
								wait(2)
								PLA1.Enabled = false
								PLA2.Enabled = false
								PLB1.Enabled = false
								PLB2.Enabled = false
								PLC1.Enabled = false
								PLC2.Enabled = false
								PLD1.Enabled = false
								PLD2.Enabled = false
								wait(1)
								--Voice: Combustion Lasers Shut Down. Lowering Reactor into. Holding. Position
								wait(.5)
								local endSignal = Instance.new("BindableEvent")
								local function moveReactorDown()
									for _, part in ipairs(Reactor:GetDescendants()) do
										if part:IsA("BasePart") then
											local newPosition = part.Position + Vector3.new(0, -66, 0) -- Move each part upwards by 10 units along the Y-axis
											local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
											if tween then
												tween:Play()
												tween.Completed:Connect(function()
													endSignal:Fire()
												end)
											end
										end
									end
									local endEvent = endSignal.Event
									local connection
									connection = endEvent:Connect(function()
										connection:Disconnect()
										endSignal:Destroy()
									end)
								end
								moveReactorDown()
								wait(8)
								--Voice: Reactor Lowered into. Holding. Position.
								--wait(2)
								--Voice: Shutting down. Appuratus Control Lasers.
								wait(2)
								Grav1.Enabled = false
								Grav2.Enabled = false
								ManualToggle.Value = true
								--Voice: Awaiting. Manual. Startup.
							elseif StrtEvntNum >= 94 and StrtEvntNum <= 96 then
								print("Start Failure")
								--Startup Failure
								--Voice: Ignition Failure. Shutting Down Combustion Lasers.
								--wait(4)
								--Voice: Combustion Lasers Shut down. Lowering Reactor into. Holding. Position for immediate maintenance.
								--wait(5)
								local endSignal = Instance.new("BindableEvent")
								local function moveReactorDown()
									for _, part in ipairs(Reactor:GetDescendants()) do
										if part:IsA("BasePart") then
											local newPosition = part.Position + Vector3.new(0, -66, 0) -- Move each part upwards by 10 units along the Y-axis
											local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
											local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
											if tween then
												tween:Play()
												tween.Completed:Connect(function()
													endSignal:Fire()
												end)
											end
										end
									end
									local endEvent = endSignal.Event
									local connection
									connection = endEvent:Connect(function()
										connection:Disconnect()
										endSignal:Destroy()
									end)
								end
								moveReactorDown()
							end

						else
							wait(3)
							FCheck:Play()
							wait(10.5)
							ReOnline:Play()
							wait(6)
							EnableLights:FireAllClients()
							ReactorOnline.Value = true
							StartupAlert:Stop()
							ReactorTemp.Value = StartTemp
							print(ReactorTemp.Value)
							wait(4)
							print("Extending Bridge")
							--Voice: Extending. Primary. Reactor Bridge.
							Bridge.Value = true
							StatDisp.Bridge.BrickColor = BrickColor.new("New Yeller")
							wait(8.5)
							StatDisp.Bridge.BrickColor = BrickColor.new("Lime green")
							--Voice: Reactor Primary Bridge Connected.
							wait(5)
							for i=0, 25, 1 do
								StartTheme.Volume = StartTheme.Volume - 0.05
								wait(0.3)
							end
							StartTheme:Stop()
							Debounce = false
							Keylock.Value = false
							PrimeAlert:Stop()
						end
					end
				else
					IOLights()
					IOTheme:Play()
				end
			else
				--No Power
				--ClientNotifEvnt:FireClient(LastUClick,"Really Black", "Reactor Controls", "Please Provide Power to Start the Reactor.")
			end
		end)
	end
	task.wait(10)	
end
