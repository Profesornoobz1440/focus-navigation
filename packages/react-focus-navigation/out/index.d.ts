import {
    EventPhase,
    Event,
    EventHandler,
    EventHandlerMap,
    EngineInterface,
    InputEvent,
    EventMap,
    FocusNavigationService,
    ContainerFocusBehavior
} from "@profesornoobz1440x/focus-navigation";
import { Context, Ref } from "@rbxts/react";

declare namespace ReactFocusNavigation {
    // Forwarded types from FocusNavigation and EventPropagation
    export {
        EventPhase,
        Event,
        EventHandler,
        EventHandlerMap,
        EngineInterface,
        InputEvent,
        EventMap,
        FocusNavigationService
    };
}

declare namespace ReactFocusNavigation {
    export const FocusNavigationContext: Context<FocusNavigationService>;

    export function useActiveEventMap(): EventMap;

    export function useContainerFocusBehavior(behavior: ContainerFocusBehavior, innerRef?: Ref<Instance>): Ref<Instance>
    export function useEventHandler(eventName: string, handler: EventHandler, phase?: EventPhase, innerRef?: Ref<Instance>): Ref<Instance>
    export function useEventHandlerMap(handlerMap: EventHandlerMap, innerRef?: Ref<Instance>): Ref<Instance>
    export function useEventMap(eventMap: EventMap, innerRef?: Ref<Instance>): Ref<Instance>
    export function useFocusedGuiObject(): GuiObject
    export function useFocusGuiObject(): (target?: GuiObject, silent?: boolean) => void;

    export function useDefaultFocusBehavior(innerContanerRef?: Ref<Instance>): LuaTuple<[Ref<Instance>, Ref<Instance>]>
    export function useMostRecentFocusBehavior(innerContainerRef?: Ref<Instance>): Ref<Instance>
    export function useMostRecentOrDefaultFocusBehavior(innerContanerRef?: Ref<Instance>): LuaTuple<[Ref<Instance>, Ref<Instance>]>
}

export = ReactFocusNavigation;