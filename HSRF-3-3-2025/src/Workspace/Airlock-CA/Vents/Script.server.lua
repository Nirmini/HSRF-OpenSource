
script.Parent.Sound.Sound:Play()
wait(.3)
script.Parent.Sound.Steam:Play()
script.Parent.V1.Smoke.Enabled=true
script.Parent.V2.Smoke.Enabled=true
script.Parent.V3.Smoke.Enabled=true
script.Parent.V4.Smoke.Enabled=true
script.Parent.V5.Smoke.Enabled=true
script.Parent.V6.Smoke.Enabled=true
wait(10)
script.Parent.V1.Smoke.Enabled=false
script.Parent.V2.Smoke.Enabled=false
script.Parent.V3.Smoke.Enabled=false
script.Parent.V4.Smoke.Enabled=false
script.Parent.V5.Smoke.Enabled=false
script.Parent.V6.Smoke.Enabled=false
script.Parent.Sound.Sound:Play()
wait(.3)
script.Parent.Sound.Steam:Stop()
script.Disabled=true