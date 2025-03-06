local Mainclick = script.Parent.Handle.Bar.ClickDetector
local LeftBarClick = script.Parent.Handle.LBar.ClickDetector
local RightBarClick = script.Parent.Handle.RBar.ClickDetector
local DownPosActive = script.Parent.InDownPos
local HandleModel = script.Parent.Handle
local MoveModule = require(game.ServerScriptService.Reactor.MoveModule)

HandleModel.Move = function(x, y, z, seconds)
	MoveModule.Move(HandleModel, x, y, z, seconds)
end


HandleModel:Move(-170.529, 65.735, 400.957, 0)



if Mainclick.MouseClickk or RightBarClick.MouseClick or LeftBarClick.MouseClick then 
DownPosActive = true
	HandleModel:Move(-170.733, 64.576, 400.957, 2)
end