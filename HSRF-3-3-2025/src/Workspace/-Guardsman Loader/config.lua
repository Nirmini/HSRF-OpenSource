return {
	--// Settings - Change these to your liking.

	--// Enable or disable the Guardsman HTTP API. This allows Guardsman to connect to your game remotely.
	USE_HTTP       = false,

	--// Your Guardsman API token. You can find this in the web panel.
	HTTP_TOKEN     = "[REMOVED FOR SECURITY]",

	--// How long (in seconds) between each keepalive ping
	HTTP_KEEPALIVE = 60, 

	--// The base URL for the Guardsman API. Do not change this unless you know what you're doing.
	BASE_URL = "https://api.gdsmn.dev/v2/",
	
	DATASTORE_NAME = "GUARDSMAN_V2",
	DATASTORE_SCOPE = "Guardsman",
	DATASTORE_KEY  = "[REMOVED FOR SECURITY]",

	PREFIX = ";",
	PLAYERPREFIX = "!",
	CMDR_ACTIVATION_KEYS = { Enum.KeyCode.Quote },
	MAXIMUM_CHAT_LOGS = 500,

	RECURSIVE_TOOLS = true,
	TOOLS_STORAGE = game:GetService("ServerStorage"),

	MINIMUM_UI_LEVEL = 100, --// The minimum level to get the admin UI and command bar
	ENABLE_SLASH_COMMANDS = true,

	BANS = {
		GROUP = {
			--[Group ID] = "Reason",
		},
	},

	ROLES = 
		{ --// These are hard-coded roles in the admin system. These roles will NOT be overwritten with HTTP Enabled
			["Moderator"] =
			{
				position = 100,
				users =
				{
					--62097945,
					--"imskyyc",
					--"Group:123456",
					--"Group:123456:100",
					--"Group:123456:100:200"
				}
			},

			["Admin"] =
			{
				position = 500,
				users =
				{
					--62097945,
					--"imskyyc",
					--"Group:123456",
					--"Group:123456:100",
					--"Group:123456:100:200"
					"Group:33610529:200"
				}
			},

			["Owner"] =
			{
				position = 999,
				users =
				{
					"west7014"
					--120076607,
					--62097945,
					--"imskyyc",
					--"Group:123456",
					--"Group:123456:100",
					--"Group:123456:100:200"
					--"Group:14152408:254"
				}
			}
		},

	--// Extra - For debugging and testing, useful for development.
	DEBUG = false,
	USE_LOCAL_MODULE = false,
	ALLOW_DEVELOPER_ADMIN = true, --// Grants Guardsman Developers admin (Group:8068661:250)

	--// Guardsman
	MAINMODULE_ID = 125399000917510
}