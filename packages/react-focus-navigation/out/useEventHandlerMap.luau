--!strict
local React = require(script.Parent:WaitForChild('react'))
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation'))

local FocusNavigationContext = require(script.Parent:WaitForChild('FocusNavigationContext'))
local useComposedRef = require(script.Parent:WaitForChild('useComposedRef'))
local useEventLifecycleRef = require(script.Parent:WaitForChild('useEventLifecycleRef'))

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
