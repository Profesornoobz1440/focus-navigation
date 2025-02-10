--!strict
local rbxtsModules = script:FindFirstAncestor("@rbxts");
if (rbxtsModules) then
    local profesornoobz1440xModules = (rbxtsModules.Parent :: Instance):FindFirstChild("@profesornoobz1440x")
    if (profesornoobz1440xModules) then
        local focusNavigation = profesornoobz1440xModules:FindFirstChild("focus-navigation-utils")
        if (focusNavigation) then
            return require(focusNavigation:FindFirstChild("src")) :: any
        end
    end
end

error(`Couldnt find "FocusNavigationUtils" package`)
return nil