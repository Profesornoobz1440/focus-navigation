--!strict
local FocusNavigation = require("./focusNavigation")

local FocusNavigationContext = require("./FocusNavigationContext")
local useActiveEventMap = require("./useActiveEventMap")
local useFocusedGuiObject = require("./useFocusedGuiObject")
local useFocusGuiObject = require("./useFocusGuiObject")
local useEventMap = require("./useEventMap")
local useEventHandler = require("./useEventHandler")
local useEventHandlerMap = require("./useEventHandlerMap")
local useContainerFocusBehavior = require("./useContainerFocusBehavior")
local FocusBehaviorHooks = require("./FocusBehaviorHooks")

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
