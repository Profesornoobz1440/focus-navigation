--!strict
local createSignal = require(script:WaitForChild('createSignal'))
local shallowEqual = require(script:WaitForChild('shallowEqual'))
local getAncestors = require(script:WaitForChild('getAncestors'))
local mockableWarn = require(script:WaitForChild('mockableWarn'))
local waitForEvents = require(script:WaitForChild('waitForEvents'))

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
