-- BROKEN AS OF HSRF 3.0.0 Build 6

local TweenService = game:GetService("TweenService")
local Elev = game.Workspace:FindFirstChild("DevLift")
local TopDesk = game.Workspace:FindFirstChild("SealControl-UpperDesk")
local BottomDesk = game.Workspace:FindFirstChild("SealControl-LowerDesk")
local Pos = game.ServerScriptService.Topside.Elev1Stat
local Seal = game.ServerScriptService.Topside.Sealed
local ElevTime
local MinET = 50
local MaxET = 55

if not Elev then
	warn("Elevator not found")
else
	print("Elevator found")
end

if not TopDesk then
	warn("Top Desk not found")
else
	print("Top Desk found")
end

if not BottomDesk then
	warn("Bottom Desk not found")
else
	print("Bottom Desk found")
end

local TUBttn = TopDesk and TopDesk:FindFirstChild("E1U-Bttn")
local TDBttn = TopDesk and TopDesk:FindFirstChild("E1D-Bttn")
local LUBttn = BottomDesk and BottomDesk:FindFirstChild("E1U-Bttn")
local LDBttn = BottomDesk and BottomDesk:FindFirstChild("E1D-Bttn")

print("Variables Defined - E1C")
warn("Pos:" .. tostring(Pos.Value) .. "|Elev:" .. tostring(Elev) .. "|TD:" .. tostring(TopDesk) .. "|BD:" .. tostring(BottomDesk) .. "|TWN:" .. tostring(TweenService))

local function moveElevator(direction)
	print("Moving elevator with direction:", direction)
	local endSignal = Instance.new("BindableEvent")
	for _, part in ipairs(Elev:GetDescendants()) do
		if part:IsA("BasePart") then
			local newPosition = part.Position + Vector3.new(0, direction * 169, 0)
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
		print("Elevator moved. New Pos:", Pos.Value)
	end)
end

if TDBttn and TDBttn:FindFirstChild("ClickDetector") then
	TDBttn.ClickDetector.MouseClick:Connect(function()
		print("Top Down Button clicked")
		if not Pos.Value and not Seal.Value then
			ElevTime = math.random(50,55)
			moveElevator(-1)
			Pos.Value = not Pos.Value
			wait(ElevTime)
		end
	end)
else
	warn("Top Down Button or ClickDetector not found")
end

if LDBttn and LDBttn:FindFirstChild("ClickDetector") then
	LDBttn.ClickDetector.MouseClick:Connect(function()
		print("Lower Down Button clicked")
		if not Pos.Value and not Seal.Value then
			ElevTime = math.random(50,55)
			moveElevator(-1)
			Pos.Value = not Pos.Value
			wait(ElevTime)
		end
	end)
else
	warn("Lower Down Button or ClickDetector not found")
end

if TUBttn and TUBttn:FindFirstChild("ClickDetector") then
	TUBttn.ClickDetector.MouseClick:Connect(function()
		print("Top Up Button clicked")
		if Pos.Value and not Seal.Value then
			ElevTime = math.random(50,55)
			moveElevator(1)
			Pos.Value = not Pos.Value
			wait(ElevTime)
		end
	end)
else
	warn("Top Up Button or ClickDetector not found")
end

if LUBttn and LUBttn:FindFirstChild("ClickDetector") then
	LUBttn.ClickDetector.MouseClick:Connect(function()
		print("Lower Up Button clicked")
		if Pos.Value and not Seal.Value then
			ElevTime = math.random(50,55)
			moveElevator(1)
			Pos.Value = not Pos.Value
			wait(ElevTime)
		end
	end)
else
	warn("Lower Up Button or ClickDetector not found")
end
