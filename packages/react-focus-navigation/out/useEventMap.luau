--!strict
local React = require(script.Parent:WaitForChild('react'))
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation'))

local FocusNavigationContext = require(script.Parent:WaitForChild('FocusNavigationContext'))
local useComposedRef = require(script.Parent:WaitForChild('useComposedRef'))
local useEventLifecycleRef = require(script.Parent:WaitForChild('useEventLifecycleRef'))

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
