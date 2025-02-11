
local a=require"./focusNavigation"::any

local b=require"./Heartbeat";

export type Callback=()->()
export type StepCallback=(number)->()

type Config={
onPress:a.EventHandler?,
onRelease:a.EventHandler?,

hold:{
durationSeconds:number,
onComplete:Callback,
onStep:StepCallback?,
allowReleaseAfterHold:boolean?
}?
}


type CancellableDelay={
cancel:()->()
}
local function cancellableDelay(c,d)
local e=false
task.delay(c,function()
if not e then
d()
end
end)
return{
cancel=function()
e=true
end,
}
end

local function handleInput(c:Config):a.EventHandler
local d=c.hold
local e:CancellableDelay?
local f:RBXScriptConnection?

local g=false

local function clearHeldState()
if e then
e.cancel()
e=nil
end
if f then
f:Disconnect()
f=nil
end
g=false
end

return function(h)
local i=if h.eventData then h.eventData.UserInputState else nil

if i==Enum.UserInputState.Begin then

if c.onPress then
c.onPress(h)
end


clearHeldState()

if d then
e=cancellableDelay(d.durationSeconds,function()


if not d.allowReleaseAfterHold then
g=false
end
d.onComplete()
if f then
f:Disconnect()
f=nil
end
end)
f=if d.onStep then b:Connect(d.onStep)else nil
end


g=true
end

if i==Enum.UserInputState.End then

if c.onRelease and g then
c.onRelease(h)
end


clearHeldState()
end

if i==Enum.UserInputState.Cancel then

clearHeldState()
end
end
end

return handleInput