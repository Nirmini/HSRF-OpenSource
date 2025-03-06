while true do
	wait()
	script.Parent.PointLight.Enabled = false
	script.Parent.Material = Enum.Material.Snow
	wait(2)
	script.Parent.PointLight.Enabled = true
	script.Parent.Material = Enum.Material.Neon
	wait(2)
end

