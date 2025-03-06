local Door = script.Parent.Parent.Parent.Parent.Parent
working = false
function Connect()
	if Door.Inuse.Value==true and Door.ODoor.Value=="Door2" and working==false then
		working=true
		script.Parent.Text="CLOSING"
		script.Parent.TextColor3=Color3.new(255,0,0)
		wait(6)
		script.Parent.Text="IN USE"
		script.Parent.TextColor3=Color3.new(255,255,0)
		wait(22)
		script.Parent.Text="READY"
		script.Parent.TextColor3=Color3.new(0,255,0)
		wait(.1)
		working=false
	elseif Door.Inuse.Value==true and Door.ODoor.Value=="Door1" and working==false then
		working=true
		script.Parent.Text="CLOSING"
		script.Parent.TextColor3=Color3.new(255,0,0)
		wait(6)
		script.Parent.Text="IN USE"
		script.Parent.TextColor3=Color3.new(255,255,0)
		wait(22)
		script.Parent.Text="OPENNING"
		script.Parent.TextColor3=Color3.new(0,0,255)
		wait(6)
		script.Parent.Text="READY"
		script.Parent.TextColor3=Color3.new(0,255,0)
		wait(.1)
		working=false
	end
end

script.Parent.Parent.Parent.Parent.Parent.Inuse.Changed:Connect(Connect)