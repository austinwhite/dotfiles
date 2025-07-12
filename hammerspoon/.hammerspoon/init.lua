-- TODO:
-- - handle when app is running, but has no visible window.

local config = {
	fontName = "JetBrainsMono Nerd Font",
	fontSize = 18,
	keyColor = { red = 0.7, green = 0.7, blue = 0.7, alpha = 1 },
	appColor = { red = 1, green = 1, blue = 1, alpha = 1 },
	box = {
		width = 253,
		height = 370,
		paddingX = 24,
		paddingY = 24,
		fill = { red = 0, green = 0, blue = 0, alpha = 0.90 },
		stroke = { red = 1, green = 1, blue = 1, alpha = 0.5 },
		strokeWidth = 1.5,
		cornerRadius = 10,
	},
	overlayDuration = 2,
}

local appBindings = {
	{ "1", "Ghostty" },
	{ "2", "Cursor" },
	{ "3", "Google Chrome" },
	{ "4", "Figma" },
	-- { "5", "" },
	-- { "6", "" },
	{ "7", "Guitar Pro" },
	{ "8", "Logic Pro" },
	{ "9", "Spotify" },
	{ "0", "Discord" },
}

local function buildAppBindingMap(bindings)
	local map = {}
	for _, binding in ipairs(bindings) do
		local key, appName = binding[1], binding[2]
		if appName and appName ~= "" then
			map[key] = appName
		end
	end
	return map
end

local appBindingMap = buildAppBindingMap(appBindings)

local function bindAppHotkey(key, appName)
	hs.hotkey.bind({ "alt" }, key, function()
		local app = hs.application.find(appName)
		if app then
			app:activate()
			app:unhide()
		else
			hs.application.launchOrFocus(appName)
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
		local win = app:mainWindow()
		if win then
			win:maximize()
		end
	end)
end

for _, binding in ipairs(appBindings) do
	local key, appName = binding[1], binding[2]
	if appName and appName ~= "" then
		bindAppHotkey(key, appName)
	end
end

hs.hotkey.bind({ "alt", "shift" }, ".", function()
	for _, binding in ipairs(appBindings) do
		local appName = binding[2]
		if appName and appName ~= "" then
			local app = hs.application.find(appName)
			if not app then
				hs.application.launchOrFocus(appName)
			else
				app:activate()
				app:unhide()
				local win = app:mainWindow()
				if win then
					win:maximize()
				end
			end
		end
	end
end)

local Overlay = {}
Overlay.drawings = nil
Overlay.timer = nil

function Overlay:show(appBindingMap, cfg)
	if self.timer then
		self.timer:stop()
		self.timer = nil
	end
	if self.drawings then
		for _, d in ipairs(self.drawings) do
			d:delete()
		end
		self.drawings = nil
	end

	local screen = hs.screen.mainScreen()
	local frame = screen:frame()
	local x = frame.x + (frame.w - cfg.box.width) / 2
	local y = frame.y + (frame.h - cfg.box.height) / 2

	local box = hs.drawing.rectangle(hs.geometry.rect(x, y, cfg.box.width, cfg.box.height))
	box:setFillColor(cfg.box.fill)
	box:setStrokeColor(cfg.box.stroke)
	box:setStrokeWidth(cfg.box.strokeWidth)
	box:setRoundedRectRadii(cfg.box.cornerRadius, cfg.box.cornerRadius)
	box:setLevel(hs.drawing.windowLevels.overlay)
	box:show()

	local drawings = { box }
	local lineHeight = cfg.fontSize + 7
	local startY = y + cfg.box.paddingY
	local keyX = x + cfg.box.paddingX
	local appX = keyX + 60

	local keyOrder = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
	for i, key in ipairs(keyOrder) do
		local appName = appBindingMap[key] or "--"
		local keyText = string.format("󰘵 %s :", key)

		local keyDrawing =
			hs.drawing.text(hs.geometry.rect(keyX, startY + (i - 1) * lineHeight, 60, lineHeight), keyText)
		keyDrawing:setTextFont(cfg.fontName)
		keyDrawing:setTextSize(cfg.fontSize)
		keyDrawing:setTextColor(cfg.keyColor)
		keyDrawing:setLevel(hs.drawing.windowLevels.overlay)
		keyDrawing:show()
		table.insert(drawings, keyDrawing)

		local appDrawing = hs.drawing.text(
			hs.geometry.rect(
				appX,
				startY + (i - 1) * lineHeight,
				cfg.box.width - (appX - x) - cfg.box.paddingX,
				lineHeight
			),
			appName
		)
		appDrawing:setTextFont(cfg.fontName)
		appDrawing:setTextSize(cfg.fontSize)
		appDrawing:setTextColor(cfg.appColor)
		appDrawing:setLevel(hs.drawing.windowLevels.overlay)
		appDrawing:show()
		table.insert(drawings, appDrawing)
	end

	local helpKeyText = string.format("󰘵 > :")
	local helpAppText = "Open all apps"
	local helpY = startY + #keyOrder * lineHeight + 16

	local helpKeyDrawing = hs.drawing.text(hs.geometry.rect(keyX, helpY, 100, lineHeight), helpKeyText)
	helpKeyDrawing:setTextFont(cfg.fontName)
	helpKeyDrawing:setTextSize(cfg.fontSize)
	helpKeyDrawing:setTextColor(cfg.keyColor)
	helpKeyDrawing:setLevel(hs.drawing.windowLevels.overlay)
	helpKeyDrawing:show()
	table.insert(drawings, helpKeyDrawing)

	local helpAppDrawing = hs.drawing.text(
		hs.geometry.rect(appX, helpY, cfg.box.width - (appX - x) - cfg.box.paddingX, lineHeight),
		helpAppText
	)
	helpAppDrawing:setTextFont(cfg.fontName)
	helpAppDrawing:setTextSize(cfg.fontSize)
	helpAppDrawing:setTextColor(cfg.appColor)
	helpAppDrawing:setLevel(hs.drawing.windowLevels.overlay)
	helpAppDrawing:show()
	table.insert(drawings, helpAppDrawing)

	local help2KeyText = string.format("󰘵 / :")
	local help2AppText = "Help"
	local help2Y = helpY + lineHeight + 4

	local help2KeyDrawing = hs.drawing.text(hs.geometry.rect(keyX, help2Y, 100, lineHeight), help2KeyText)
	help2KeyDrawing:setTextFont(cfg.fontName)
	help2KeyDrawing:setTextSize(cfg.fontSize)
	help2KeyDrawing:setTextColor(cfg.keyColor)
	help2KeyDrawing:setLevel(hs.drawing.windowLevels.overlay)
	help2KeyDrawing:show()
	table.insert(drawings, help2KeyDrawing)

	local help2AppDrawing = hs.drawing.text(
		hs.geometry.rect(appX, help2Y, cfg.box.width - (appX - x) - cfg.box.paddingX, lineHeight),
		help2AppText
	)
	help2AppDrawing:setTextFont(cfg.fontName)
	help2AppDrawing:setTextSize(cfg.fontSize)
	help2AppDrawing:setTextColor(cfg.appColor)
	help2AppDrawing:setLevel(hs.drawing.windowLevels.overlay)
	help2AppDrawing:show()
	table.insert(drawings, help2AppDrawing)

	self.drawings = drawings
	self.timer = hs.timer.doAfter(cfg.overlayDuration, function()
		for _, d in ipairs(self.drawings) do
			d:delete()
		end
		self.drawings = nil
		self.timer = nil
	end)
end

hs.hotkey.bind({ "alt" }, "/", function()
	Overlay:show(appBindingMap, config)
end)
