
local a=require"./focusNavigation"::any

local b=require"./handleInput"

local function onPress(c:a.EventHandler):a.EventHandler
return b{
onPress=c,
}
end

return onPress