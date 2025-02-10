--!strict
local FocusNavigation = require("./getFocusNavigation") :: any

local handleInput = require("./handleInput")

local function onPress(callback: FocusNavigation.EventHandler): FocusNavigation.EventHandler
	return handleInput({
		onPress = callback,
	})
end

return onPress
