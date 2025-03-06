local TweenService = game:GetService("TweenService")
local StartBttn = game.Workspace.StartShutDesk.Startup.Main
local PrimeAlert = game.Workspace["Audio-Main"].StartupPrimeWarning
local StartupAlert = game.Workspace["Audio-Main"].StartupAlert
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
local Grav2 = game.Workspace.QBHNR.QBHNR.GravBeam
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
local Bridge = script.Parent.BridgeConencted
local StatDisp = game.Workspace.ReactorInfoDisp
local Debounce = false
local Lock = script.Parent.ReactorLocked
local Keylock = game.ServerScriptService.Reactor.StartKeyTurned

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
local MRCRL = game.Workspace.MRCRL

local FacilitySSF = game.ServerScriptService.Facility

local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif
local ClientShakeEvnt = game.ReplicatedStorage.ShakeScreen

local StartEvnt = game.ServerScriptService.Reactor.Startup



StartEvnt.Event:Connect(function()
	if Debounce == false then
		Debounce = true
		ClientNotifEvnt:FireAllClients("Really Black", "Reactor Systems", "Reactor Startup Engaged. Evacuate the core chamber at once!")
		StartBttn.ClickDetector.MaxActivationDistance = 0
		PrimeAlert:Stop()
		wait(0.5)
		PrimeAlert:Stop()
		PrimeAlert.Volume = 0
		StartTheme:Play()
		wait(5)
		StartupAlert:Play()
		wait(4.2)
		StartupAlert:Stop()
		wait(0.75)
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
		GL2.Enabled = true
		LzrIg:Play()
		StatDisp.G1.Stat.BrickColor = BrickColor.new("Lime green")
		StatDisp.G2.Stat.BrickColor = BrickColor.new("Lime green")
		wait(0.9)
		ReMove:Play(3)
		wait(7)
		Grav2.Transparency = 0
		moveReactorUp()
		wait(8.5)
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
	end
end)