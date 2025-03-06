local anim = script.Animation
local animController = script.Parent.AnimationController
local LoadAnim = animController:LoadAnimation(anim)

local triggerCount = {} -- Table to store the trigger count for each player

local function explodePlayer(player)
	local character = player.Character
	if character then
		-- Create an explosion at the character's position
		local explosion = Instance.new("Explosion")
		explosion.Position = character.PrimaryPart.Position
		explosion.BlastRadius = 10
		explosion.BlastPressure = 500000
		explosion.Parent = workspace

		-- Apply damage to the character
		for _, part in ipairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				part:BreakJoints()
			end
		end
	end
end

script.Parent.ProximityPrompt.Triggered:Connect(function(player)
	local playerId = player.UserId
	triggerCount[playerId] = (triggerCount[playerId] or 0) + 1 -- Increment the trigger count for the player

	LoadAnim:Play()
	script.Parent.Base.InteractSound:Play()

	if triggerCount[playerId] >= 4 then
		explodePlayer(player)
		triggerCount[playerId] = 0 -- Reset the count after exploding the player
	end
end)
