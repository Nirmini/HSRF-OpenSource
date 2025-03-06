Tool = script.Parent
gyro = Instance.new("BodyGyro")
script.Gyro.Value = gyro 

onMouseMove=function(mouse)
	vCharacter = Tool.Parent
	if vCharacter ~= nil then 
		local tp = vCharacter.Humanoid.TargetPoint
		tp = Vector3.new(tp.X,Tool.Parent.Torso.Position.Y,tp.Z) 
		local dir = (tp - Tool.Parent.Torso.Position).unit
		local spawnPos = Tool.Parent.Torso.Position
		local pos = spawnPos + (dir * 1)
		script.Gyro.Value.cframe = CFrame.new(pos,  pos + dir)
	end
end

onEquipped=function(mouse)
	for i,k in pairs(Tool.Parent.Torso:GetChildren()) do
		if k:IsA("BodyGyro") then 
			k.Parent=nil 	
		end
	end
	wait(0.1) 
	script.Gyro.Value.Parent = Tool.Parent:findFirstChild("Torso")
	script.Gyro.Value.maxTorque = Vector3.new(math.huge,math.huge,math.huge)
	mouse.Move:connect(function() onMouseMove(mouse) end)
end 

onUnequipped=function()
	script.Gyro.Value.Parent = nil 
	wait(0.1) 
	for i,k in pairs(Tool.Parent.Torso:GetChildren()) do
		if k:IsA("BodyGyro") then 
			k.Parent=nil 	
		end
	end
end 

Tool.Equipped:connect(onEquipped)
Tool.Unequipped:connect(onUnequipped)