--!strict

---------------------------------------------types for developers---------------------------------------------
type Array<T> = { T }
type Dictionary<I, V> = { [I]: V }
type CommandArgument = {
	Type: string,
	Name: string,
	Description: string
}

type Command = {
	prefix: string,
	commands: Array<string>,
	args: Array<CommandArgument>,
	description: string,
	position: number?,
	serverload: () -> ()?,
	execute: (Player: Player, ...any) -> nil | string
}

type Guardsman = {
	config: typeof(require("../config")),
	
	logs: {
		server: {},
		command: {},
		player: {},
		remote: {},
		chat: {}
	},
	
	core: any,
	commands: any,
	functions: any,
	cross_server: any,
	http: any,
	process: any,
	remote: any
}
---------------------------------------------types for developers---------------------------------------------

---------------------------------------------       plugin      ---------------------------------------------
return function (guardsman: Guardsman)
	--warn(`[Guardsman]: Test Server Load Loaded! Hello from {script:GetFullName()}!`)
	
	guardsman.commands.test = {
		prefix = guardsman.config.PLAYERPREFIX,
		commands = {"test"},
		args = {
			{
				Type = "string",
				Name = "string",
				Description = "Just a test string"
			}
		},
		position = 0,
		description = "Just a test string",
		execute = function(Player: Player, test: string)
			return test
		end,
	}
end
---------------------------------------------       plugin      ---------------------------------------------