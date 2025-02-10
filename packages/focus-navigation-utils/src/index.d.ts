declare namespace FocusNavigationUtils {
	export type Subscription = {
		unsubscribe(): void,
	}
	
	export interface Signal<T> {
		subscribe(self: Signal<T>, callback: (arg: T) => void): Subscription,
		getValue(): T,
	}
	
	export type FireSignal<T> = (arg: T) => void;
}

export = FocusNavigationUtils;