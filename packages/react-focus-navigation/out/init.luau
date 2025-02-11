--!strict
local FocusNavigation = require(script:WaitForChild('focusNavigation'))

local FocusNavigationContext = require(script:WaitForChild('FocusNavigationContext'))
local useActiveEventMap = require(script:WaitForChild('useActiveEventMap'))
local useFocusedGuiObject = require(script:WaitForChild('useFocusedGuiObject'))
local useFocusGuiObject = require(script:WaitForChild('useFocusGuiObject'))
local useEventMap = require(script:WaitForChild('useEventMap'))
local useEventHandler = require(script:WaitForChild('useEventHandler'))
local useEventHandlerMap = require(script:WaitForChild('useEventHandlerMap'))
local useContainerFocusBehavior = require(script:WaitForChild('useContainerFocusBehavior'))
local FocusBehaviorHooks = require(script:WaitForChild('FocusBehaviorHooks'))
-- Forwarded types from FocusNavigation and EventPropagation

export type EventPhase = FocusNavigation.EventPhase
export type Event = FocusNavigation.Event
export type EventHandler = FocusNavigation.EventHandler
export type EventHandlerMap = FocusNavigation.EventHandlerMap
export type EngineInterface = FocusNavigation.EngineInterface
export type InputEvent = FocusNavigation.InputEvent
export type EventMap = FocusNavigation.EventMap
export type FocusNavigationService = FocusNavigation.FocusNavigationService

return {
	-- Re-export FocusNavigationService logic
	FocusNavigationService = FocusNavigation.FocusNavigationService,
	EngineInterface = FocusNavigation.EngineInterface,

	-- Context
	FocusNavigationContext = FocusNavigationContext,

	-- Observable properties
	useActiveEventMap = useActiveEventMap,
	useFocusedGuiObject = useFocusedGuiObject,

	-- Focus control
	useFocusGuiObject = useFocusGuiObject,

	-- Event mapping and binding
	useEventMap = useEventMap,
	useEventHandler = useEventHandler,
	useEventHandlerMap = useEventHandlerMap,

	-- Container focus behavior
	useContainerFocusBehavior = useContainerFocusBehavior,

	useDefaultFocusBehavior = FocusBehaviorHooks.useDefaultFocusBehavior,
	useMostRecentFocusBehavior = FocusBehaviorHooks.useMostRecentFocusBehavior,
	useMostRecentOrDefaultFocusBehavior = FocusBehaviorHooks.useMostRecentOrDefaultFocusBehavior,
}
