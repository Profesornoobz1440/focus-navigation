--!strict
local React = require("./react")
local FocusNavigation = require("./focusNavigation")

local FocusNavigationContext = require("./FocusNavigationContext")
local useComposedRef = require("./useComposedRef")
local useEventLifecycleRef = require("./useEventLifecycleRef")

type Ref = React.Ref<Instance>

local function useEventMap(eventMap: FocusNavigation.EventMap, innerRef: Ref?): Ref
	local focusNavigationService = React.useContext(FocusNavigationContext)

	local bindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			focusNavigationService:registerEventMap(instance, eventMap)
		end
	end, { focusNavigationService, eventMap } :: { any })

	local unbindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			focusNavigationService:deregisterEventMap(instance, eventMap)
		end
	end, { focusNavigationService, eventMap } :: { any })

	local lifecycleRef = useEventLifecycleRef(bindCallback, unbindCallback)
	return useComposedRef(lifecycleRef, innerRef)
end

return useEventMap
