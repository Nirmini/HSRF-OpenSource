local HttpService = game:GetService("HttpService")
local statuspageURL = "https://api.statuspage.io/v1/pages/266y9bdyj6sf/components/np87p58klkdz"
local apiKey = "[REMOVED FOR SECURITY REASONS]"
local function setServerStatusOperational()
	local headers = {
		["Authorization"] = "OAuth " .. apiKey,
		["Content-Type"] = "application/json"
	}
	local body = {
		component = {
			status = "operational"
		}
	}
	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = statuspageURL,
			Method = "PATCH",
			Headers = headers,
			Body = HttpService:JSONEncode(body)
		})
	end)
	if success then
		if response.Success then
			print("Successfully set the HSRF Roblox Game Servers to operational.")
		else
			warn("Failed to set the status. Status code: " .. response.StatusCode)
			warn("Response body: " .. response.Body)
		end
	else
		warn("Failed to set the status: " .. tostring(response))
	end
end
setServerStatusOperational()
while true do
	setServerStatusOperational()
	task.wait(600) -- 10 min
end
