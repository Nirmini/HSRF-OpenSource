local Text = script.Parent
local Integ = game.ServerScriptService.Reactor.StructuralInteg

while true do
	Text.Text = Integ.Value .. "% Integ"
	task.wait(5)
end