--!strict
local rbxtsModules = script:FindFirstAncestor("@rbxts");
if (rbxtsModules) then
    local focusNavigation = rbxtsModules:FindFirstChild("react")
    if (focusNavigation) then
        return require(focusNavigation:FindFirstChild("src")) :: any
    end
end

error(`Couldnt find "FocusNavigation" package`)
return nil