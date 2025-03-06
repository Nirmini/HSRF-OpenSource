local ServerScriptService = game:GetService("ServerScriptService")
local function disableLights()
	for _, light in ipairs(game.Workspace:GetDescendants()) do
	if light:IsA("PointLight") or light:IsA("SpotLight") or light:IsA("SurfaceLight") then
		light.Enabled = false
	end
	end
end
local function enableLights()
	for _, light in ipairs(game.Workspace:GetDescendants()) do
	if light:IsA("PointLight") or light:IsA("SpotLight") or light:IsA("SurfaceLight") then
		light.Enabled = true
	end
	end
end
ServerScriptService.Reactor.Startup.Event:Connect(function()
	disableLights()
end)
ServerScriptService.Reactor.EnableLights.Event:Connect(function()
	enableLights()
end)
