--!strict
local FocusNavigation = require("./focusNavigation") :: any

local handleInput = require("./handleInput")

local function onPress(callback: FocusNavigation.EventHandler): FocusNavigation.EventHandler
	return handleInput({
		onPress = callback,
	})
end

return onPress
