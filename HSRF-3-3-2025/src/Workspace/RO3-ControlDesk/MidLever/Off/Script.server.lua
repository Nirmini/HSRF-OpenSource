switchOn = script.Parent.Parent.On
switchOff= script.Parent.Parent.Off
SLight = script.Parent.Parent.Parent["RO3-StatusLight"]

function onClicked()
	switchOn.Transparency = 0
	switchOff.Transparency = 1
	SLight.BrickColor = BrickColor.new("Lime Green")
	script.Parent.Parent.Center.ToggleSound.Playing = true
	switchOn.ClickDetector.MaxActivationDistance = 32
	switchOff.ClickDetector.MaxActivationDistance = 0
	--Canceling Script Here--
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)