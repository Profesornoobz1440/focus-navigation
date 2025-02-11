--!strict
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation')):: any

local handleInput = require(script.Parent:WaitForChild('handleInput'));

local function onLongPress(
	durationSeconds: number,
	onHoldForDuration: handleInput.Callback,
	onHoldStep: handleInput.StepCallback?
): FocusNavigation.EventHandler
	return handleInput({
		hold = {
			durationSeconds = durationSeconds,
			onComplete = onHoldForDuration,
			onStep = onHoldStep,
		},
	})
end

return onLongPress
