--!strict
local React = require("./react")
local FocusNavigation = require("./focusNavigation")

local FocusNavigationContext = require("./FocusNavigationContext")
local useComposedRef = require("./useComposedRef")
local useEventLifecycleRef = require("./useEventLifecycleRef")

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
