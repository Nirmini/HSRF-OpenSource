local MainModel = game.Workspace.ReactorInfoDisp
local IntegDisp = MainModel.ReactorIntegDisp
local TempDisp = MainModel.ReactorTempDisp
local TempVal = script.Parent.ReactorTemp
local IntegVal = script.Parent.StructuralInteg
local Sec1 = TempDisp.Pos1
local Sec2 = TempDisp.Pos2
local Sec3 = TempDisp.Pos3
local Sec4 = TempDisp.Pos4
local Sec5 = TempDisp.Pos5
local Sec6 = TempDisp.Pos6
local Sec7 = TempDisp.Pos7

local function SetDigit(Loc, segments, color)
	for _, part in ipairs(Loc:GetDescendants()) do
		if segments[part.Name] then
			part.Color = color
		end
	end
end

local segments = {
	MU = true, MM = true, ML = true,
	LU = true, LL = true, RU = true, RL = true
}

local digitColors = {
	[1] = Color3.new(0, 0, 0),  -- All off (black)
	[2] = Color3.new(117, 0, 0), -- Most segments on (red) -- Could be black (0, 0, 0) for digit 0
	[3] = Color3.new(117, 0, 0), -- Same color for most digits
	[4] = Color3.new(117, 0, 0),
	[5] = Color3.new(117, 0, 0),
	[6] = Color3.new(117, 0, 0),
	[7] = Color3.new(117, 0, 0),
	[8] = Color3.new(117, 0, 0),
	[9] = Color3.new(117, 0, 0),
	[0] = Color3.new(0, 0, 0)   -- Same color for digit 0 (black)
}

while true do
	local digit1, digit2, digit3, digit4, digit5, digit6, digit7 = GetTemp()

	SetDigit(Sec1, segments, digitColors[digit1])
	SetDigit(Sec2, segments, digitColors[digit2])
	SetDigit(Sec3, segments, digitColors[digit3])
	SetDigit(Sec4, segments, digitColors[digit4])
	SetDigit(Sec5, segments, digitColors[digit5])
	SetDigit(Sec6, segments, digitColors[digit6])
	SetDigit(Sec7, segments, digitColors[digit7])

	wait()
end

local function GetTemp()
	local number = TempVal.Value  -- Get the value from TempVal

	local digits = {}  -- Table to store the digits

	-- Loop to extract digits from right to left
	for i = 1, 9 do
		digits[i] = number % 10  -- Get the rightmost digit
		number = math.floor(number / 10)  -- Remove the rightmost digit
		if number == 0 then break end  -- Exit loop when no more digits
	end

	-- Assign the extracted digits (right to left) to Seg variables
	Seg7 = digits[1] or 0  -- Rightmost digit, default to 0 if not present
	Seg6 = digits[2] or 0
	Seg5 = digits[3] or 0
	Seg4 = digits[4] or 0
	Seg3 = digits[5] or 0
	Seg2 = digits[6] or 0
	Seg1 = digits[7] or 0  -- Leftmost digit, default to 0 if not present

	-- Return the extracted digits (optional, but useful for debugging)
	return digit1, digit2, digit3, digit4, digit5, digit6, digit7
end

-- Connect to the "Value" property change signal of TempVal
TempVal:GetPropertyChangedSignal("Value"):Connect(GetTemp)
