local Text = script.Parent
local AP1Filter = game.ServerScriptService.Reactor["Fuel+Filter"].Filter1Use

while true do
	Text.Text = AP1Filter.Value .. "% Filter Use"
	task.wait(5)
end