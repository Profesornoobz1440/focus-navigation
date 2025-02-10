local EventPropagation = require("./eventPropagation")

local FocusNavigationService = require("./FocusNavigationService")
local isValidFocusTarget = require("./isValidFocusTarget")

local EngineInterface = require("./EngineInterface")
local types = require("./types")

type EventData = types.EventData

-- Forwarded types from event propagation service
export type EventPhase = EventPropagation.EventPhase

-- Forwarded types from event propagation service in which the
-- FocusNavigationService uses specific generics
export type Event = EventPropagation.Event<EventData>
export type EventHandler = EventPropagation.EventHandler<EventData>
export type EventHandlerMap = EventPropagation.EventHandlerMap<EventData>

-- FocusNavigationService types
export type EngineInterface = types.EngineInterface
export type InputEvent = types.InputEvent
export type EventMap = types.EventMap
export type ContainerFocusBehavior = types.ContainerFocusBehavior
export type FocusNavigationService = FocusNavigationService.FocusNavigationService

return {
	isValidFocusTarget = isValidFocusTarget,
	FocusNavigationService = FocusNavigationService,
	EngineInterface = {
		CoreGui = EngineInterface.CoreGui,
		PlayerGui = EngineInterface.PlayerGui,
	},
}
