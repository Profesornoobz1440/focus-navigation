--!strict
local FocusNavigation = require("./getFocusNavigation") :: any

local handleInput = require("./handleInput");

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
