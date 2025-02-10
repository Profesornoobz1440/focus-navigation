--!strict
local React = require("./react")
local FocusNavigation = require("./focusNavigation")

local FocusNavigationContext = require("./FocusNavigationContext")
local useComposedRef = require("./useComposedRef")
local useEventLifecycleRef = require("./useEventLifecycleRef")

type Ref = React.Ref<Instance>

local function useEventHandlerMap(handlerMap: FocusNavigation.EventHandlerMap, innerRef: Ref?): Ref
	local focusNavigationService = React.useContext(FocusNavigationContext)

	local bindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "Event handler maps can only be applied to GuiObjects")
			focusNavigationService:registerEventHandlers(instance, handlerMap)
		end
	end, { focusNavigationService, handlerMap } :: { any })

	local unbindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "Event handler maps can only be applied to GuiObjects")
			focusNavigationService:deregisterEventHandlers(instance, handlerMap)
		end
	end, { focusNavigationService, handlerMap } :: { any })

	local lifecycleRef = useEventLifecycleRef(bindCallback, unbindCallback)
	return useComposedRef(lifecycleRef, innerRef)
end

return useEventHandlerMap
