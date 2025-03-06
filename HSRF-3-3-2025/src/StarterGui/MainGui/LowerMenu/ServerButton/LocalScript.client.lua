local MainGui = script.Parent.Parent.Parent.MainMenu
local MainOpen = script.Parent
local MainIsOpen = false

MainOpen.MouseButton1Click:Connect(function()
	if MainIsOpen == false then
		MainGui.Visible = true
		MainIsOpen = true
	elseif MainIsOpen == true then
		MainGui.Visible = false
		MainIsOpen = false
	end
end)