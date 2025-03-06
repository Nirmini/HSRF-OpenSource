local a=game:GetService("ReplicatedStorage")
local b=a:WaitForChild("Cerberus"):WaitForChild("83z28e"):WaitForChild("NCT")

local c=game.Players.LocalPlayer
local d=c.Character or c.CharacterAdded:Wait()
local e=d:WaitForChild("HumanoidRootPart")

local function f()
	while true do
		wait(35)
		local g=false

		local h=e:GetTouchingParts()
		for i,j in pairs(h) do
			local k=j.Size
			local l=j.Position
			local m=e.Position

			if math.abs(l.X-m.X)<=k.X/2 and
				math.abs(l.Y-m.Y)<=k.Y/2 and
				math.abs(l.Z-m.Z)<=k.Z/2 then
				g=true
				break
			end
		end

		if g then
			b:FireServer(true)
		else
			b:FireServer(false)
		end
	end
end

local function n()
	if script:IsDescendantOf(game)==false then
		b:FireServer(true)
	end
end

f()
n()
