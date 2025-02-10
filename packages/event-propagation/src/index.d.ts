declare namespace EventPropagation {
	export type EventPhase = "Bubble" | "Capture" | "Target"

	export type Event<T = unknown> = {
		cancelled: boolean,
		phase: EventPhase,
		currentInstance: Instance,
		targetInstance: Instance,
		eventName: string,
		eventData: T,

		cancel(): void,
	}

	export type EventHandler<T = unknown> = (e: Event<T>) => void;
	export type EventHandlerMap<T = unknown> = {
		[key: string]: {
			handler: EventHandler<T>,
			phase?: EventPhase,
		}
	}

	export type BoundEventHandlers = Record<string, boolean>;

	export class EventPropagationService<T = unknown> {
		public registerEventHandler(
			instance: Instance,
			eventName: string,
			eventHandler: EventHandler<T>,
			phase?: EventPhase
		): void;
		public registerEventHandlers(instance: Instance, map: EventHandlerMap<T>): void
		public deregisterEventHandlers(instance: Instance, map: EventHandlerMap<T>): void
		public deregisterEventHandler(
			instance: Instance,
			eventName: string,
			handler: EventHandler<T>,
			phase?: EventPhase
		): void;
		public getRegisteredEventHandlers(instance: Instance): BoundEventHandlers | undefined;
		public 	propagateEvent(
			instance: Instance,
			eventName: string,
			eventData: T,
			silent?: boolean
		): void;
	}
}

export = EventPropagation;