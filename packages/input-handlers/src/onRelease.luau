--!strict
local FocusNavigation = require("./focusNavigation") :: any

local handleInput = require("./handleInput")

local function onRelease(callback: FocusNavigation.EventHandler): FocusNavigation.EventHandler
	return handleInput({
		onRelease = callback,
	})
end

return onRelease
