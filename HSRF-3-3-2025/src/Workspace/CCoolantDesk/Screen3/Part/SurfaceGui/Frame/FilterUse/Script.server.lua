local Text = script.Parent
local AP2Filter = game.ServerScriptService.Reactor["Fuel+Filter"].Filter2Use

while true do
	Text.Text = AP2Filter.Value .. "% Filter Use"
	task.wait(5)
end