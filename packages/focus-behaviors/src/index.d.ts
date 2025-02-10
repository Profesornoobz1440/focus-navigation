import { ContainerFocusBehavior } from "@profesornoobz1440x/focus-navigation"

declare namespace FocusBehaviors {
    export function defaultBehavior(initial?: GuiObject): ContainerFocusBehavior;
    export function mostRecentDescendantBehavior(): ContainerFocusBehavior;
    export function mostRecentDescendantOrDefaultBehavior(initial?: GuiObject): ContainerFocusBehavior

    export function composeFocusBehaviors(...args: ContainerFocusBehavior[]): ContainerFocusBehavior
}
export = FocusBehaviors;