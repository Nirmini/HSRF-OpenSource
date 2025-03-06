function onTouch(part) 
	local humanoid = part.Parent:FindFirstChild("Humanoid") 
	if (humanoid ~= nil) then	-- if a humanoid exists, then
		humanoid.Health = 0	-- damage the humanoid
	end 
end

script.Parent.Touched:connect(onTouch)
