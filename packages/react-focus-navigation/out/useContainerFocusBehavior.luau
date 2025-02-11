--!strict
local React = require(script.Parent:WaitForChild('react'))
local FocusNavigation = require(script.Parent:WaitForChild('focusNavigation'))

local FocusNavigationContext = require(script.Parent:WaitForChild('FocusNavigationContext'))
local useComposedRef = require(script.Parent:WaitForChild('useComposedRef'))
local useEventLifecycleRef = require(script.Parent:WaitForChild('useEventLifecycleRef'))

type Ref = React.Ref<Instance>
type ContainerFocusBehavior = FocusNavigation.ContainerFocusBehavior

local function useContainerFocusBehavior(behavior: ContainerFocusBehavior, innerRef: Ref?): Ref
	local focusNavigationService = React.useContext(FocusNavigationContext)

	local bindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			focusNavigationService:registerFocusBehavior(instance, behavior)
		end
	end, { focusNavigationService, behavior } :: { any })

	local unbindCallback = React.useCallback(function(instance: Instance)
		if focusNavigationService then
			assert(instance:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			focusNavigationService:deregisterFocusBehavior(instance, behavior)
		end
	end, { focusNavigationService, behavior } :: { any })

	local lifecycleRef = useEventLifecycleRef(bindCallback, unbindCallback)
	return useComposedRef(lifecycleRef, innerRef)
end

return useContainerFocusBehavior
