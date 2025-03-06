local Text = script.Parent
local AP2Fuel = game.ServerScriptService.Reactor["Fuel+Filter"].Fuel2Lvl

while true do
	Text.Text = AP2Fuel.Value .. "% Fuel"
	task.wait(5)
end