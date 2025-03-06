local Text = script.Parent
local Temp = game.ServerScriptService.Reactor.ReactorTemp

while true do
	Text.Text = math.round(Temp.Value) .. "K"
	task.wait(5)
end