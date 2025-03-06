function onClicked(player)
	-- Check if the player is on the 'Administration' or 'Security' team
	local playerTeam = player.Team
	if playerTeam.Name == "Administration" or playerTeam.Name == "Security" then
		-- Check if the Power and Valid properties are true
		if script.Parent.Parent.Power.Value == true and script.Parent.Parent.Valid.Value == true then
			-- Toggle the Active property
			script.Parent.Parent.Active.Value = not script.Parent.Parent.Active.Value
		end
	end
end

script.Parent.ClickDetector.MouseClick:Connect(onClicked)
