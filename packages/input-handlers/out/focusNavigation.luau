
local a=script:FindFirstAncestor"@rbxts";
if(a)then
local b=(a.Parent::Instance):FindFirstChild"@profesornoobz1440x"
if(b)then
local c=b:FindFirstChild"focus-navigation"
if(c)then
return require(c)::any
end
end
end

error(`Couldnt find "FocusNavigation" package`)
return nil