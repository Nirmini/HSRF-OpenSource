local Player = game.Players.LocalPlayer
script.Parent:WaitForChild("MainFrame"):WaitForChild("ScrollingFrame")
wait(0.1)

local ButtonCount = #script.Parent.MainFrame.ScrollingFrame:GetChildren() - 1
script.Parent.MainFrame.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ButtonCount * 32 + (ButtonCount - 1) * 3)
script.Parent.MainFrame.ScrollingFrame.UIGridLayout.CellSize = UDim2.new(0, script.Parent.MainFrame.ScrollingFrame.AbsoluteSize.X - script.Parent.MainFrame.ScrollingFrame.ScrollBarThickness - 5, 0, 32)


for i,v in pairs(script.Parent.MainFrame.ScrollingFrame:GetChildren()) do
	if v:IsA("TextButton") then
		v.MouseButton1Click:Connect(function()
			if v:FindFirstChild("Group Settings") then
				if Player:GetRankInGroup(v["Group Settings"].GroupId.Value) < v["Group Settings"].MinRank.Value then
					return
				end
			end
			
			if v:FindFirstChild("Gamepass Settings") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Player.UserId, 13600173502) then 
					return
				end
			end
			
			if game:FindFirstChild("Teams") == nil then
				ErrorMsg("ERROR: You haven't inserted any teams in your game.")
			elseif game.Teams:FindFirstChild(v.Text) == nil then
				ErrorMsg("ERROR: The text of the button must be the same as the team name.")
			else
				game.ReplicatedStorage.TeamChanger:FireServer(v.Text)
			end
		end)
	end
end


function ErrorMsg(Msg)
	local M = Instance.new("Message")
	M.Text = Msg
	M.Parent = game.Workspace
	game.Debris:AddItem(M, 5)
end
