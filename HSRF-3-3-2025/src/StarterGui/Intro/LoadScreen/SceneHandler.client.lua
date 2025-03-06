local tweenService = game:GetService("TweenService")
local contentProvider = game:GetService("ContentProvider")

local uiElement = script.Parent
local loadedBar = uiElement.LoadedBar
local funFacts = uiElement.FunFacts
local intro = uiElement.Parent.Intro
local skipButton = uiElement.SkipBttn

uiElement.Visible = true
intro.Visible = false

-- Get all assets in the game
local assetsToLoad = game:GetDescendants()
local totalAssets = #assetsToLoad
local assetsLoaded = 0
local skipRequested = false

-- Fun facts list
local funFactPairs = {
	{"Did You Know?", "The HSRF was built back in [TBD]. That's [TBD] years old!"},
	{"Did You Know?", "The QBHR is a completely stable blackhole, totally.."},
	{"Did You Know?", "The HSRF is the Quantum Research Corporation's 2nd building."},
	{"Did You Know?", "SealO9 required such precise measurements that a whole field of science was made for it?"},
	{"Did You Know?", "HSRF has a cafeteria?"},
	{"Fun Fact", "HSRF is made by one person! Must be a lot of work."},
	{"Fun Fact", "The blackhole in the QBHR is almost always on the brink of collapse."},
	{"Fun Fact", "The QBHR can act as a portal when conditions are just right.."},
	{"Fun Fact", "We regret to inform you that you cannot sleep in the employee lounge."},
	{"Fun Fact", "HSRF started development back in 2022 as a game demonstration."},
}

-- Function to update fun facts every 10-15 seconds
local function updateFunFacts()
	while assetsLoaded < totalAssets and not skipRequested do
		local randomFactIndex = math.random(1, #funFactPairs)
		local selectedTitle, selectedContent = unpack(funFactPairs[randomFactIndex])

		funFacts.Title.Text = selectedTitle
		funFacts.ContentArea.Content.Text = selectedContent

		wait(math.random(10, 15)) -- Update every 10-15 seconds
	end
end

-- Function to preload assets and update the loading bar
local function updateLoadingBar()
	local batchSize = math.max(1, math.floor(totalAssets / 10)) -- Load 10% at a time

	for i = 1, totalAssets, batchSize do
		if skipRequested then break end -- Exit early if the player skips

		local batch = {}
		for j = i, math.min(i + batchSize - 1, totalAssets) do
			table.insert(batch, assetsToLoad[j])
		end

		-- Preload a batch of assets safely
		local success, err = pcall(function()
			contentProvider:PreloadAsync(batch)
		end)

		-- Prevent softlocking due to a failed asset
		if not success then
			warn("Failed to preload some assets:", err)
		end

		-- Update progress
		assetsLoaded = math.min(assetsLoaded + #batch, totalAssets)
		local progress = assetsLoaded / totalAssets

		-- Smooth transition for the loading bar
		tweenService:Create(loadedBar, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {Size = UDim2.new(progress, 0, 1, 0)}):Play()

		wait(0.01) -- Extremely fast update
	end

	-- Hide loading UI and show intro screen
	uiElement.Visible = false
	intro.Visible = true
end

-- Skip loading when button is clicked
skipButton.MouseButton1Click:Connect(function()
	skipRequested = true
	uiElement.Visible = false
	intro.Visible = true
end)

-- Start both functions
task.spawn(updateFunFacts) -- Run fun facts separately
task.spawn(updateLoadingBar) -- Load assets asynchronously
