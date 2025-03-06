local moving



local originalLeft = script.Parent.Left.PrimaryPart.CFrame
local originalRight = script.Parent.Right.PrimaryPart.CFrame


function move()
	for i=1,30 do
		script.Parent.Left:SetPrimaryPartCFrame(originalLeft * CFrame.new(-9.2*(i/30),0,0))
		script.Parent.Right:SetPrimaryPartCFrame(originalRight * CFrame.new(9.6*(i/30),0,0))
		wait()
	end
	
	wait(4)
	
	for i=29,0,-1 do
		script.Parent.Left:SetPrimaryPartCFrame(originalLeft * CFrame.new(-9.2*(i/30),0,0))
		script.Parent.Right:SetPrimaryPartCFrame(originalRight * CFrame.new(9.6*(i/30),0,0))
		wait()
	end
	
	wait(1)
end




script.Parent.Collision.Touched:connect(function(hit)
	if not moving then
		moving = true
		move()
		moving = false
	end
end)