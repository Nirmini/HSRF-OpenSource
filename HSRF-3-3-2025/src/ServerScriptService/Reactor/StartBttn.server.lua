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
local Grav2 = game.Workspace["GRAVL-2"].Beam.Rope
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

local FacilitySSF = game.ServerScriptService.Facility

local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif
local ClientShakeEvnt = game.ReplicatedStorage.ShakeScreen

local LastUClick = ""

local StartEvnt = script.Parent.Startup

local Debounce = false

print("StartBttn: Pre-`while` Loop Run")
while ReactorOnline.Value == false do
	print("StartBttn: `while` Loop Run")
	if StartBttn.ClickDetector.MouseClick then
		print("Startbttn: Passed `if` 1")
		StartBttn.ClickDetector.MouseClick:Connect(function(player) -- Player who clicked the button
			print("Startbttn: Passed `if` 2")
			if StartupUnlocked.Value == true and Lock.Value == false then
				print("Startbttn: Passed `if` 3")
				if FacilitySSF.Grid.CurrentGrid.Value >= 1 and FacilitySSF.Grid.CurrentGridActive.Value == true then
					if Debounce == false then
					Debounce = true
					LastUClick = player.Name -- Store the name of the player who clicked
					StartEvnt:Fire()
					print("Reactor Start Triggered by: " .. player.Name) -- Print to see who clicked
					Debounce = false
					end
				else
					-- No Power
					ClientNotifEvnt:FireClient(player, "Really Black", "Reactor Controls", "Please Ensure The Grid Is Online To Start the Reactor.")
				end
			else
				ClientNotifEvnt:FireClient(player, "Really Black", "Reactor Controls", "Startup Locked")
			end
		end)
	end
task.wait(10)
end

