local Door = script.Parent.Parent
local Door1 = Door.Door1
local Door2 = Door.Door2

function click()
	if Door.Inuse.Value==false and Door.ODoor.Value=="Door1" then
		Door.Door1.Open.Value=false
		Door.Inuse.Value=true
		wait(6)
		Door.Scanner.Script.Disabled=false
		wait(6)
		Door.Vents.Script.Disabled=false
		wait(12)
		Door.Door2.Open.Value=true
		wait(6)
		Door.Inuse.Value=false
		Door.ODoor.Value="Door2"
	end 
end
script.Parent.Button.ClickDetector.MouseClick:Connect(click)