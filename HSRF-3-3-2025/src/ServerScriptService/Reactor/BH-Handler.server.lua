local MainPart = game.Workspace["Black Hole"]
local BHE = script.Parent.BHenabled

local function StartBH()
	for cnt = 0, 20, 1 do
		MainPart["Black Hole"].Transparency = MainPart["Black Hole"].Transparency - 0.05
		wait(.05)
	end
	
	
	
	MainPart["Extra Detail (Inner Only)"].Enabled = true
	MainPart["Extra Detail (Outer Only)"].Enabled = true
	MainPart["Middle Disk"].Enabled = true
	MainPart["Outer Disk"].Enabled = true
	MainPart["Black Hole"].Transparency = 0
	MainPart["Black Hole"].Attachment.Aura.Enabled = true
	MainPart["Black Hole"].Attachment.Aura2.Enabled = true
	MainPart["Black Hole"].Attachment.Flare.Enabled = true
	MainPart["Black Hole"].Attachment.Flare2.Enabled = true
	MainPart["Black Hole"].Attachment["Inner Disk"].Enabled = true
	MainPart["Black Hole"].SelectionSphere.Visible = 0
end

BHE.Changed:Connect(StartBH)