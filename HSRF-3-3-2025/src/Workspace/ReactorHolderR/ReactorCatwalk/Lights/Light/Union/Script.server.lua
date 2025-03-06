local Part = script.Parent
local Att = script.Parent.Attachment
local Light = Att.PointLight

while true do
	Light.Enabled = false
	Part.Material = Enum.Material.Snow
	wait(3)
	Light.Enabled = true
	Part.Material = Enum.Material.Neon
	wait(3)
end