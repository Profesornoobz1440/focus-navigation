--!strict
local createSignal = require("./createSignal")
local shallowEqual = require("./shallowEqual")
local getAncestors = require("./getAncestors")
local mockableWarn = require("./mockableWarn")
local waitForEvents = require("./waitForEvents")

export type Signal<T> = createSignal.Signal<T>
export type FireSignal<T> = createSignal.FireSignal<T>
export type Subscription = createSignal.Subscription

return {
	createSignal = createSignal,
	shallowEqual = shallowEqual,
	getAncestors = getAncestors,
	mockableWarn = mockableWarn,
	waitForEvents = waitForEvents,
}
