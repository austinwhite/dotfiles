local appBindings = {
	{ "1", "Ghostty" },
	{ "2", "Cursor" },
	{ "3", "Google Chrome" },
	-- {"4", ""},
	-- {"5", ""},
	-- {"6", ""},
	-- {"7", ""},
	-- {"8", "Messages"},
	{ "9", "Spotify" },
	{ "0", "Discord" },
}

for _, binding in ipairs(appBindings) do
	local key = binding[1]
	local appName = binding[2]
	hs.hotkey.bind({ "alt" }, key, function()
		local app = hs.application.find(appName)
		if app then
			app:activate()
			app:unhide()
		else
			hs.application.launchOrFocus(appName)
			-- Wait a moment for the app to launch before maximizing
			hs.timer.doAfter(1, function()
				local launchedApp = hs.application.find(appName)
				if launchedApp then
					local win = launchedApp:mainWindow()
					if win then
						win:maximize()
					end
				end
			end)
			return
		end
		-- Maximize the main window if the app is already running
		local win = app:mainWindow()
		if win then
			win:maximize()
		end
	end)
end
