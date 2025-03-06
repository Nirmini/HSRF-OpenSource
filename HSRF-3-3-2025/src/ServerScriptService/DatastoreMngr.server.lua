local DataStore2 = require(game.ServerScriptService:WaitForChild("DataStore2")) -- Make sure DataStore2 is in ServerScriptService
local DATASTORE_NAME = "HSRF-UserData"

local DEFAULT_DATA = {
	credits = 0,
	emptxp = 0,
	maintxp = 0,
	raidtxp = 0,
	visitortxp = 0,
	mngrtxp = 0,
	corptxp = 0,
	engineertxp = 0,
	plumbertxp = 0,
	playtime = 0, -- in minutes
	inventory = {}, -- Inventory stored as a table
	gblexp = 0
}

local AUTO_SAVE_INTERVAL = 300 -- Auto-save every 5 minutes

-- Function to get or create a DataStore for the player
local function getPlayerDataStore(player)
	local dataStore = DataStore2(DATASTORE_NAME, player)
	local savedData = dataStore:Get(DEFAULT_DATA) -- Load stored data or default if new
	return dataStore, savedData
end

-- Function to save player data
local function savePlayerData(player)
	local dataStore, playerData = getPlayerDataStore(player)
	if playerData then
		dataStore:Set(playerData) -- Save the player's data
		print("[DataStore] Successfully saved data for", player.Name)
	end
end

-- Function to load player data when they join
local function loadPlayerData(player)
	local dataStore, playerData = getPlayerDataStore(player)
	print("[DataStore] Loaded data for", player.Name, ":", playerData)

	-- Assign the player's data to their leaderstats (if using a UI)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	-- Example: Display credits as a leaderboard stat
	local creditsStat = Instance.new("IntValue")
	creditsStat.Name = "Credits"
	creditsStat.Value = playerData.credits
	creditsStat.Parent = leaderstats

	-- Attach data to the player for easy reference
	player:SetAttribute("PlayerData", playerData)
end

-- Function to auto-save data every few minutes
local function autoSaveData()
	while true do
		wait(AUTO_SAVE_INTERVAL)
		for _, player in pairs(game.Players:GetPlayers()) do
			savePlayerData(player)
		end
	end
end

-- Player joins the game
game.Players.PlayerAdded:Connect(function(player)
	loadPlayerData(player)
end)

-- Player leaves the game (save data)
game.Players.PlayerRemoving:Connect(function(player)
	savePlayerData(player)
end)

-- Start Auto-Saving
task.spawn(autoSaveData)
