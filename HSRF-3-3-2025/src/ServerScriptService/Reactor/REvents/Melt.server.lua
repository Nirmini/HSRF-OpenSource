local audio = game.Workspace["Audio-Main"]
local QBHRPtcles = game.Workspace.QBHNR.Particles
local M1Evnt = script.Parent.PMelt
local M2Evnt = script.Parent.Melt

local MWarn = audio["-VoiceLines"].Meltdown.CritTemps
local PMlt = audio["-EventThemes"].Meltdown.PMelt

M1Evnt.Event:Connect(function()
	PMlt:Play()
	wait(5)
	MWarn:Play()
end)