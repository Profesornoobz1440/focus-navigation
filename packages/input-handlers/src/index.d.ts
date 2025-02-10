import { EventHandler } from "@profesornoobz1440x/focus-navigation"

export type StepCallback = (step: number) => void
export interface HandleInputConfiguration {
	onPress?: EventHandler;
	onRelease?: EventHandler;

	hold?: {
		durationSeconds: number;
		onComplete: () => void;
		onStep?: StepCallback;
		allowReleaseAfterHold?: boolean;
	}
}

export function handleInput(config: HandleInputConfiguration): EventHandler
export const HeartBeat: RunService["Heartbeat"]

export function onLongPress(
	durationSeconds: number,
	onHoldForDuration: () => void,
	onHoldStep?: StepCallback
): EventHandler;
export function onPress(callback: EventHandler): EventHandler;
export function onRelease(callback: EventHandler): EventHandler;