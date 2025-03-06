local laserModels = {
	'CollectorLaser-Bottom',
	'CoolLaser-Left',
	'CoolLaser-Right',
	'PowerLaser-BackLeft',
	'PowerLaser-BackRight',
	'PowerLaser-Top',
	'PowerLaser-TopLeft',
	'PowerLaser-TopRight'
}
local function rotateModels()
	while true do
	wait(1/60)
	for _, modelName in ipairs(laserModels) do
		local model = game.Workspace["SL2-RO2"]:FindFirstChild(modelName)
		if model then
			local head = model:FindFirstChild('Head')
		if head then
			head.CFrame = head.CFrame * CFrame.Angles(math.rad(-3), 0, 0)
		end
		end
		end
	end
end
rotateModels()
