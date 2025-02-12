--!strict
local Event = require("./eventPropagationEvent")
local EventPropagationService = require("./eventPropagationService")

export type EventPhase = Event.EventPhase
export type Event<T> = Event.Event<T>

export type EventHandler<T> = EventPropagationService.EventHandler<T>
export type EventHandlerMap<T> = EventPropagationService.EventHandlerMap<T>
export type EventPropagationService<T> = EventPropagationService.EventPropagationService<T>

return EventPropagationService;