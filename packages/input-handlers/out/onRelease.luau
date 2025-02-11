
local a=require"./focusNavigation"::any

local b=require"./handleInput"

local function onRelease(c:a.EventHandler):a.EventHandler
return b{
onRelease=c,
}
end

return onRelease