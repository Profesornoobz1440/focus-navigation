
local a=require"./focusNavigation"::any

local b=require"./handleInput";

local function onLongPress(
c:number,
d:b.Callback,
e:b.StepCallback?
):a.EventHandler
return b{
hold={
durationSeconds=c,
onComplete=d,
onStep=e,
},
}
end

return onLongPress