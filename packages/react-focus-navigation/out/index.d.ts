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

    export function useContainerFocusBehavior<InnerRef extends GuiObject = GuiObject>(behavior: ContainerFocusBehavior, innerRef?: Ref<InnerRef>): Ref<InnerRef>
    export function useEventHandler<InnerRef extends GuiObject = GuiObject>(eventName: string, handler: EventHandler, phase?: EventPhase, innerRef?: Ref<InnerRef>): Ref<InnerRef>
    export function useEventHandlerMap<InnerRef extends GuiObject = GuiObject>(handlerMap: EventHandlerMap, innerRef?: Ref<InnerRef>): Ref<InnerRef>
    export function useEventMap<InnerRef extends GuiObject = GuiObject>(eventMap: EventMap, innerRef?: Ref<InnerRef>): Ref<InnerRef>
    export function useFocusedGuiObject(): GuiObject
    export function useFocusGuiObject(): (target?: GuiObject, silent?: boolean) => void;

    export function useDefaultFocusBehavior<DefaultRef extends GuiObject = GuiObject, InnerContainerRef extends GuiObject = GuiObject>(innerContanerRef?: Ref<InnerContainerRef>): LuaTuple<[Ref<DefaultRef>, Ref<InnerContainerRef>]>
    export function useMostRecentFocusBehavior<InnerRef extends GuiObject = GuiObject>(innerContainerRef?: Ref<InnerRef>): Ref<InnerRef>
    export function useMostRecentOrDefaultFocusBehavior<DefaultRef extends GuiObject = GuiObject, InnerContainerRef extends GuiObject = GuiObject>(innerContanerRef?: Ref<InnerContainerRef>): LuaTuple<[Ref<DefaultRef>, Ref<InnerContainerRef>]>
}

export = ReactFocusNavigation;