function open()
	if script.Parent.Open.Value==true then
		script.Parent.D1.Open.Disabled=false
		script.Parent.D2.Open.Disabled=false
		script.Parent.Frame.Sound.Sound:Play()
		wait(5)
		script.Parent.D1.Open.Disabled=true
		script.Parent.D2.Open.Disabled=true
	elseif script.Parent.Open.Value==false then
		script.Parent.D1.Close.Disabled=false
		script.Parent.D2.Close.Disabled=false
		script.Parent.Frame.Sound.Sound:Play()
		wait(5)
		script.Parent.D1.Close.Disabled=true
		script.Parent.D2.Close.Disabled=true
	end
end

script.Parent.Open.Changed:Connect(open)