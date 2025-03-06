function blood(hit)
	local name = hit.Name
	if (name == "Head") then
		local human = hit.Parent:findFirstChild("Humanoid") or hit.Parent:findFirstChild("Zombie") or hit.Parent:findFirstChild("Alien")
		if (human ~= nil) then
			local h = hit.Parent:findFirstChild("Head")
			local t = hit.Parent:findFirstChild("Torso")
			if (h ~= nil) and (t ~= nil) then
				local x = h.Position.x
				local y = h.Position.y
				local z = h.Position.z
				local x1 = x + 1
				local y1 = y + 1
				local z1 = z + 1
				local x2 = x - 1
				local y2 = y - 1
				local z2 = z - 1
				local b1 = Instance.new("Part")
				b1.Parent = h.Parent
				b1.BrickColor = BrickColor.new(21)
				b1.formFactor = 2
				b1.Name = "Part"
				b1.Size = Vector3.new(1, 0.4, 1)
				b1.Position = Vector3.new(x, y1, z)
				b1.BottomSurface = 1
				b1.TopSurface = 1
				b1.Locked = true
				local b2 = Instance.new("Part")
				b2.Parent = h.Parent
				b2.BrickColor = BrickColor.new(21)
				b2.formFactor = 2
				b2.Name = "Part"
				b2.Size = Vector3.new(1, 0.4, 1)
				b2.Position = Vector3.new(x1, y, z)
				b2.BottomSurface = 1
				b2.TopSurface = 1
				b2.Locked = true
				local b3 = Instance.new("Part")
				b3.Parent = h.Parent
				b3.BrickColor = BrickColor.new(21)
				b3.formFactor = 2
				b3.Name = "Part"
				b3.Size = Vector3.new(1, 0.4, 1)
				b3.Position = Vector3.new(x, y, z1)
				b3.BottomSurface = 1
				b3.TopSurface = 1
				b3.Locked = true
				local b4 = Instance.new("Part")
				b4.Parent = h.Parent
				b4.BrickColor = BrickColor.new(21)
				b4.formFactor = 2
				b4.Name = "Part"
				b4.Size = Vector3.new(1, 0.4, 1)
				b4.Position = Vector3.new(x, y2, z)
				b4.BottomSurface = 1
				b4.TopSurface = 1
				b4.Locked = true
				local b5 = Instance.new("Part")
				b5.Parent = h.Parent
				b5.BrickColor = BrickColor.new(21)
				b5.formFactor = 2
				b5.Name = "Part"
				b5.Size = Vector3.new(1, 0.4, 1)
				b5.Position = Vector3.new(x2, y, z)
				b5.BottomSurface = 1
				b5.TopSurface = 1
				b5.Locked = true
				local b6 = Instance.new("Part")
				b6.Parent = h.Parent
				b6.BrickColor = BrickColor.new(21)
				b6.formFactor = 2
				b6.Name = "Part"
				b6.Size = Vector3.new(1, 0.4, 1)
				b6.Position = Vector3.new(x, y, z2)
				b6.BottomSurface = 1
				b6.TopSurface = 1
				b6.Locked = true
				h:remove()
				local bd1 = Instance.new("Decal")
				bd1.Parent = t
				bd1.Name = "Blood"
				bd1.Texture = "http://www.roblox.com/asset/?id=0"
				bd1.Face = 0
				local bd2 = Instance.new("Decal")
				bd2.Parent = t
				bd2.Name = "Blood"
				bd2.Texture = "http://www.roblox.com/asset/?id=0"
				bd2.Face = 1
				local bd3 = Instance.new("Decal")
				bd3.Parent = t
				bd3.Name = "Blood"
				bd3.Texture = "http://www.roblox.com/asset/?id=0"
				bd3.Face = 2
				local bd4 = Instance.new("Decal")
				bd4.Parent = t
				bd4.Name = "Blood"
				bd4.Texture = "http://www.roblox.com/asset/?id=0"
				bd4.Face = 3
				local bd5 = Instance.new("Decal")
				bd5.Parent = t
				bd5.Name = "Blood"
				bd5.Texture = "http://www.roblox.com/asset/?id=0"
				bd5.Face = 4
				local bd6 = Instance.new("Decal")
				bd6.Parent = t
				bd6.Name = "Blood"
				bd6.Texture = "http://www.roblox.com/asset/?id=0"
				bd6.Face = 5
			end
		end
	end
end

connection = script.Parent.Touched:connect(blood)
