local Can = true

local function Open(hit : BasePart)
	if hit and hit.Parent and hit.Parent:IsA("Tool") and hit.Parent:GetAttribute("Kind") == "AdminKey" then
		if hit.Parent:GetAttribute("ID") == script.Parent:GetAttribute("ID") then
			if Can then
				Can = false
				script.Parent.Main.granted:Play()
				wait(script.Parent.Main.granted.TimeLength-0.11)
				script.Parent.Main.open:Play()
				script.Parent.HingeConstraint.TargetAngle = 80
				wait(5)
				script.Parent.HingeConstraint.TargetAngle = 0
				repeat wait() until math.ceil(script.Parent.HingeConstraint.CurrentAngle) == math.floor(script.Parent.HingeConstraint.TargetAngle)
				script.Parent.Main.close:Play()
				Can = true
			end
		else
			script.Parent.Main.denied:Play()
		end
	end
end

script.Parent.Detector1.Touched:Connect(Open)
script.Parent.Detector2.Touched:Connect(Open)