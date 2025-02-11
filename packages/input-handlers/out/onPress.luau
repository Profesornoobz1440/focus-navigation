--!strict
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation')):: any

local handleInput = require(script.Parent:WaitForChild('handleInput'))

local function onPress(callback: FocusNavigation.EventHandler): FocusNavigation.EventHandler
	return handleInput({
		onPress = callback,
	})
end

return onPress
