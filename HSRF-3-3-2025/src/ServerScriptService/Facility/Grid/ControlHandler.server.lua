local Control = game.Workspace.GridCon
local ActGrid = script.Parent.CurrentGrid.Value
local AGActive = script.Parent.CurrentGridActive
local PStat = script.Parent.PriStat.Value
local AStat = script.Parent.AuxStat.Value
local EStat = script.Parent.EStat.Value
local ROnline = game.ServerScriptService.Reactor.ReactorOnline.Value
local LClick = game.Workspace["Audio-Main"].LeverClick
local GenGridLock = true

local ClientNotifEvnt = game.ReplicatedStorage.ClientNotif


Control.PriSwitch.Handle.Bar.ClickDetector.MouseClick:Connect(function()
	local Base = Control.PriSwitch.Base
	local Handle = Control.PriSwitch.Handle
	local Pos = Control.PriSwitch.InDownPos
	local TweenService = game:GetService("TweenService")
	local endSignal = Instance.new("BindableEvent")
	local function moveLeverUp()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, 1.2, 0)
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	local function moveLeverDown()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, -1.2, 0)
				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	if Handle.Bar.ClickDetector.MouseClick then
		Handle.Bar.ClickDetector.MouseClick:Connect(function()
			if Pos.Value == false and ROnline == true then
				moveLeverDown()
				LClick:Play(0.25)
				Pos.Value = true
				wait(2)
				ActGrid = 0
				ClientNotifEvnt:FireAllClients("Orange","Facility Grid","Facility Grid now on Primary.")
			elseif Pos.Value == true then
				moveLeverUp()
				Pos.Value = false
			end
		end)
	end
end)
Control.AuxSwitch.Handle.Bar.ClickDetector.MouseClick:Connect(function()
	local Base = Control.AuxSwitch.Base
	local Handle = Control.AuxSwitch.Handle
	local Pos = Control.AuxSwitch.InDownPos
	local TweenService = game:GetService("TweenService")
	local endSignal = Instance.new("BindableEvent")
	local function moveLeverUp()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, 1.2, 0)
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	local function moveLeverDown()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, -1.2, 0)
				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	if Handle.Bar.ClickDetector.MouseClick then
		Handle.Bar.ClickDetector.MouseClick:Connect(function()
			if Pos.Value == false then
				moveLeverDown()
				LClick:Play(0.25)
				Pos.Value = true
			elseif Pos.Value == true then
				moveLeverUp()
				Pos.Value = false
			end
		end)
	end
end)
Control.GenAct.Handle.Bar.ClickDetector.MouseClick:Connect(function()
	local Base = Control.GenAct.Base
	local Handle = Control.GenAct.Handle
	local Pos = Control.GenAct.InDownPos
	local TweenService = game:GetService("TweenService")
	local endSignal = Instance.new("BindableEvent")
	local function moveLeverUp()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, 1.2, 0)
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	local function moveLeverDown()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, -1.2, 0)
				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	if Handle.Bar.ClickDetector.MouseClick then
		Handle.Bar.ClickDetector.MouseClick:Connect(function()
			if Pos.Value == false then
				moveLeverDown()
				LClick:Play(0.25)
				Pos.Value = true
			elseif Pos.Value == true then
				moveLeverUp()
				Pos.Value = false
			end
		end)
	end
end)
Control.EGridPrep.Handle.Bar.ClickDetector.MouseClick:Connect(function()
	local Base = Control.EGridPrep.Base
	local Handle = Control.EGridPrep.Handle
	local Pos = Control.EGridPrep.InDownPos
	local TweenService = game:GetService("TweenService")
	local endSignal = Instance.new("BindableEvent")
	local function moveLeverUp()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, 1.2, 0)
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	local function moveLeverDown()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, -1.2, 0)
				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	if Handle.Bar.ClickDetector.MouseClick then
		Handle.Bar.ClickDetector.MouseClick:Connect(function()
			if Pos.Value == false then
				moveLeverDown()
				LClick:Play(0.25)
				Pos.Value = true
				wait(20)
				GenGridLock = false
			elseif Pos.Value == true then
				moveLeverUp()
				Pos.Value = false
			end
		end)
	end
end)
Control.EGridSwitch.Handle.Bar.ClickDetector.MouseClick:Connect(function()
	local Base = Control.EGridSwitch.Base
	local Handle = Control.EGridSwitch.Handle
	local Pos = Control.EGridSwitch.InDownPos
	local TweenService = game:GetService("TweenService")
	local endSignal = Instance.new("BindableEvent")
	local function moveLeverUp()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, 1.2, 0)
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	local function moveLeverDown()
		for _, part in ipairs(Handle:GetDescendants()) do
			if part:IsA("BasePart") then
				local newPosition = part.Position + Vector3.new(0, -1.2, 0)
				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(part, tweenInfo, {Position = newPosition})
				if tween then
					tween:Play()
					tween.Completed:Connect(function()
						endSignal:Fire()
					end)
				end
			end
		end

		local endEvent = endSignal.Event
		local connection
		connection = endEvent:Connect(function()
			connection:Disconnect()
			endSignal:Destroy()
		end)
	end
	if Handle.Bar.ClickDetector.MouseClick then
		Handle.Bar.ClickDetector.MouseClick:Connect(function()
			if Pos.Value == false and GenGridLock == false then
				moveLeverDown()
				LClick:Play(0.25)
				Pos.Value = true
			elseif Pos.Value == true then
				moveLeverUp()
				Pos.Value = false
			end
		end)
	end
end)