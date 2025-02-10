--!strict
local FocusNavigation = require("./focusNavigation")
local FocusBehaviors = require("./focusBehaviors")
local React = require("./react")

local default = FocusBehaviors.defaultBehavior
local mostRecent = FocusBehaviors.mostRecentBehavior
local mostRecentOrDefault = FocusBehaviors.mostRecentOrDefaultBehavior

local useContainerFocusBehavior = require("./useContainerFocusBehavior")

type ContainerFocusBehavior = FocusNavigation.ContainerFocusBehavior

local function useDefaultFocusBehavior(
	innerContainerRef: React.Ref<Instance>?
): (React.Ref<Instance>, React.Ref<Instance>)
	local guiObject, setGuiObject = React.useState(nil :: GuiObject?)

	local behavior = React.useMemo(function()
		return default(guiObject)
	end, { guiObject })

	local containerRef = useContainerFocusBehavior(behavior, innerContainerRef)

	return (setGuiObject :: any) :: React.Ref<Instance>, containerRef
end

local function useMostRecentFocusBehavior(innerContainerRef: React.Ref<Instance>?): React.Ref<Instance>
	local behavior = React.useMemo(mostRecent, {})

	return useContainerFocusBehavior(behavior, innerContainerRef)
end

local function useMostRecentOrDefaultFocusBehavior(
	innerContainerRef: React.Ref<Instance>?
): (React.Ref<Instance>, React.Ref<Instance>)
	local guiObject, setGuiObject = React.useState(nil :: GuiObject?)

	local behavior = React.useMemo(function()
		return mostRecentOrDefault(guiObject)
	end, { guiObject })

	local containerRef = useContainerFocusBehavior(behavior, innerContainerRef)

	return (setGuiObject :: any) :: React.Ref<Instance>, containerRef
end

return {
	useDefaultFocusBehavior = useDefaultFocusBehavior,
	useMostRecentFocusBehavior = useMostRecentFocusBehavior,
	useMostRecentOrDefaultFocusBehavior = useMostRecentOrDefaultFocusBehavior,
}
