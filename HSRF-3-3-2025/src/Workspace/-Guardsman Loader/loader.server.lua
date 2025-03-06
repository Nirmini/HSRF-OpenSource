-- @name loader.server.luau
-- @description Loads the Guardsman administrative suite
-- @author imskyyc
-- @date 7 Apr 2024 @ 1:48 PM PST
-- @copyright Bunker Bravo Interactive

-- services
local ServerStorage = game:GetService("ServerStorage")

-- data
local this = script
local container = this.Parent
local settingOverrides = container.config

-- main --
local config = require(settingOverrides)

local guardsman = require(
	if config.USE_LOCAL_MODULE then ServerStorage:WaitForChild("MainModule")
	else config.MAINMODULE_ID
)

guardsman:configure(config)

local plugins = {}

for _, plugin in container.plugins:GetChildren() do
	plugins[plugin.Name] = require(plugin)
end

local loaded, response = guardsman:load(plugins)

if loaded then
	print(`[Guardsman Loader]: {response}`)
else
	warn(`[Guardsman Loader]: FAILED TO LOAD:`)
	warn(`[Guardsman Loader]: {response}`)
end 
