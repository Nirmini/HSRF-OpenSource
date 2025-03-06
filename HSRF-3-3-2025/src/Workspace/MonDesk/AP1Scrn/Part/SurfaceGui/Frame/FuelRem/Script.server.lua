local Text = script.Parent
local AP1Fuel = game.ServerScriptService.Reactor["Fuel+Filter"].Fuel1Lvl

while true do
	Text.Text = AP1Fuel.Value .. "% Fuel"
	task.wait(5)
end