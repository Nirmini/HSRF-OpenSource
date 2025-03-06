--[[Variables]]--
--Services--
local RunService = game:GetService("RunService");

--Main--
local cam = workspace.CurrentCamera;

local part : Part = workspace.QBHNR.QBHNR; --Assign a part here
local offset = Vector3.new(0, 0, 15); --Positional offset from the part. The Z axis is front and back.
offset = CFrame.new(offset);

local direction = Vector3.new(0, 3, 0); --This will be turned into a CFrame later. By default, this will be a simple horizontal rotation.

--[[Functions]]--
local cfAng = CFrame.Angles;
local rad = math.rad;

function radifyVector(vector : Vector3)
	return cfAng(rad(vector.X), rad(vector.Y), rad(vector.Z));
end

function spin()
	cam.CameraType = Enum.CameraType.Scriptable; --Makes it so we can manipulate the camera
	cam.CFrame = CFrame.new(part.Position) * offset;

	--OrbitingPart.CFrame = CFrame.new(PartToOrbit.Position) * CFrame.Angles(math.rad(RotStep), 0, 0)

	for i = 1, 120 do
		cam.CFrame = CFrame.new(part.Position) * radifyVector(direction * i) * offset;
		RunService.RenderStepped:Wait();
	end
end