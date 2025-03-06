switchOn = script.Parent.Parent.On
switchOff= script.Parent.Parent.Off
SLight = script.Parent.Parent.Parent["RO3-StatusLight"]

function onClicked()
	switchOn.Transparency = 1
	switchOff.Transparency = 0
	SLight.BrickColor = BrickColor.new("Really Red")
	script.Parent.Parent.Center.ToggleSound.Playing = true
	switchOn.ClickDetector.MaxActivationDistance = 0
	switchOff.ClickDetector.MaxActivationDistance = 32
	--Canceling Script Here--
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)