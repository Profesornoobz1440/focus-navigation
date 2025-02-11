import {
    Event as _Event,
    EventHandler as _EventHandler,
    EventHandlerMap as _EventHandlerMap,
    EventPhase,
    EventPropagationService as _EventPropagationService,
} from "@profesornoobz1440x/event-propagation";
import { Signal } from "@profesornoobz1440x/focus-navigation-utils";

declare namespace FocusNavigation {
    export { EventPhase }
    export type EngineInterface = {
        getSelection: () => GuiObject | undefined;
        setSelection: (guiObject: GuiObject | undefined) => void;
        SelectionChanged: RBXScriptSignal;
        InputBegan: RBXScriptSignal;
        InputChanged: RBXScriptSignal;
        InputEnded: RBXScriptSignal;
    };
    
    export type InputEvent = {
        KeyCode: Enum.KeyCode;
        UserInputState: Enum.UserInputState;
        UserInputType: Enum.UserInputType;
        Position?: Vector3;
        Delta?: Vector3;
        wasProcessed?: boolean;
    };
    
    // TODO: Union with whatever data we end up using for focus/blur events
    export type EventData = InputEvent | undefined;
    
    // We have to do a map because we cant put enums in objects
    export type EventMap = Map<Enum.KeyCode, string>;
    
    export type ContainerFocusBehavior = {
        onDescendantFocusChanged: ((guiObject?: GuiObject) => void) | null;
        getTargets: () => GuiObject[];
    };

    // FocusNavigationService types
    export class FocusNavigationService {
        constructor(engineInterface: EngineInterface)

        public registerEventMap(guiObject: GuiObject, eventMap: EventMap): void;
        public deregisterEventMap(guiObject: GuiObject, eventMap: EventMap): void;
        public registerEventHandlers(guiObject: GuiObject, eventHandlerMap: _EventHandlerMap): void;
        public deregisterEventHandlers(guiObject: GuiObject, eventHandlerMap: _EventHandlerMap): void;
        public registerEventHandler(guiObject: GuiObject, eventName: string, eventHandler: _EventHandler, phase?: EventPhase): void;
        public deregisterEventHandler(guiObject: GuiObject, eventName: string, eventHandler: _EventHandler, phase?: EventPhase): void;
        public registerFocusBehavior(guiObject: GuiObject, containerFocusBehavior: ContainerFocusBehavior): void;
        public deregisterFocusBehavior(guiObject: GuiObject, containerFocusBehavior: ContainerFocusBehavior): void;
        public focusGuiObject(guiObject: GuiObject | undefined, flag: boolean): void;
        public teardown(): void;
    
        public activeEventMap: Signal<EventMap>;
        public focusedGuiObject: Signal<GuiObject | undefined>;
    }

    export function isValidFocusTarget(maybeInstance?: Instance): LuaTuple<[true]> | LuaTuple<[false, string]>;
    export namespace EngineInterface {
        export const PlayerGui: EngineInterface;
    }

    export type Event = _Event<EventMap>
    export type EventHandler = _EventHandler<EventData>
    export type EventHandlerMap = _EventHandlerMap<EventData>
}

export = FocusNavigation