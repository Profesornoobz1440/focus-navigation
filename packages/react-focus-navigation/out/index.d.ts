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

    export function useContainerFocusBehavior<ContainerRef extends GuiObject = GuiObject>(behavior: ContainerFocusBehavior, innerRef?: Ref<ContainerRef>): Ref<ContainerRef>
    export function useEventHandler<ObjectRef extends GuiObject = GuiObject>(eventName: string, handler: EventHandler, phase?: EventPhase, innerRef?: Ref<ObjectRef>): Ref<ObjectRef>
    export function useEventHandlerMap<ObjectRef extends GuiObject = GuiObject>(handlerMap: EventHandlerMap, innerRef?: Ref<ObjectRef>): Ref<ObjectRef>
    export function useEventMap<ObjectRef extends GuiObject = GuiObject>(eventMap: EventMap, innerRef?: Ref<ObjectRef>): Ref<ObjectRef>
    export function useFocusedGuiObject(): GuiObject
    export function useFocusGuiObject(): (target?: GuiObject, silent?: boolean) => void;

    export function useDefaultFocusBehavior<defaultRef extends GuiObject = GuiObject, ContainerRef extends GuiObject = GuiObject>(innerContanerRef?: Ref<ContainerRef>): LuaTuple<[Ref<defaultRef>, Ref<ContainerRef>]>
    export function useMostRecentFocusBehavior<defaultRef extends GuiObject = GuiObject>(innerContainerRef?: Ref<defaultRef>): Ref<defaultRef>
    export function useMostRecentOrDefaultFocusBehavior<defaultRef extends GuiObject = GuiObject, ContainerRef extends GuiObject = GuiObject>(innerContanerRef?: Ref<ContainerRef>): LuaTuple<[Ref<defaultRef>, Ref<ContainerRef>]>
}

export = ReactFocusNavigation;