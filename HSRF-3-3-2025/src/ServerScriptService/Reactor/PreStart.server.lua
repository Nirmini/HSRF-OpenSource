--Main
local Lock1 = script.Parent["Fuel+Filter"].AP1Locked
local Lock2 = script.Parent["Fuel+Filter"].AP2Locked
local SL1 = game.Workspace.StartShutDesk["Startup-FilterLock-Status"].F1
local SL2 = game.Workspace.StartShutDesk["Startup-FilterLock-Status"].F2
local Key = game.Workspace.StartShutDesk["ReactorStartup-Key"].Key
local KeyActive = game.ServerScriptService.Reactor.StartKeyTurned
local TweenService = game:GetService("TweenService")
local KeyStatus = game.Workspace.StartShutDesk["ReactorStartup-Key"].Status

--Audio
local PrimeAlert = game.Workspace["Audio-Main"].StartupPrimeWarning
local StartupAlert = game.Workspace["Audio-Main"].StartupAlert
local KeySound = game.Workspace["Audio-Main"].KeyClick

--QBHR(Quantum Blackhole Reactor)
local QBHR = game.Workspace.QBHNR

--Events
local StartEvent = script.Parent.Startup
local EnableLights = script.Parent.EnableLights
local ElevLocked = script.Parent.Parent.ElevsDisabled
local Startunlocked = script.Parent.StartupAvailible
local MSScript = script.Parent.MainStart

local Debounce = false

local function updateLockStatus()
	if Lock1.Value then
		SL1.BrickColor = BrickColor.new("Lime green")
	else
		SL1.BrickColor = BrickColor.new("Really red")
	end

	if Lock2.Value then
		SL2.BrickColor = BrickColor.new("Lime green")
	else
		SL2.BrickColor = BrickColor.new("Really red")
	end
end

updateLockStatus()

local function rotateKey()
	local rotationGoal = Key.Orientation + Vector3.new(0, 0, 90) -- Rotate by 90 degrees around the Z-axis
	local tweenInfo = TweenInfo.new(0.62, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local tween = TweenService:Create(Key, tweenInfo, {Orientation = rotationGoal})
	tween:Play()
	tween.Completed:Connect(function()
		if not Startunlocked.Value then
			Debounce = false
			KeyActive.Value = true
			PrimeAlert:Play()
			Startunlocked.Value = true
			Key.ClickDetector.MaxActivationDistance = 0
			task.wait(10)
			PrimeAlert:Stop()
			rotateKey()
		end
	end)
end

Key.ClickDetector.MouseClick:Connect(function()
	if Lock1.Value and Lock2.Value and not Startunlocked.Value and not Debounce then
		Debounce = true
		KeySound:Play()
		rotateKey()
		KeyStatus.BrickColor = BrickColor.new("Lime green")
	end
end)
