--!strict
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation')):: any

local handleInput = require(script.Parent:WaitForChild('handleInput'))

local function onRelease(callback: FocusNavigation.EventHandler): FocusNavigation.EventHandler
	return handleInput({
		onRelease = callback,
	})
end

return onRelease
