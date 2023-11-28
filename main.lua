local Oceans = workspace:WaitForChild('Oceans') -- // Anything here will have a buoyancy effect

-- // For this to work make sure studio setting gravity is set to realistic
-- // Explaination of buoyancy

--[[
    When a part in the act of colliding with water, 
    any object will have a force pushing up against gravity
]]

local function SetupBuoyancy(Part)
    local BodyGyro
end

for Properties, Part in pairs(Oceans:GetChildren()) do
    coroutine.wrap(SetupBuoyancy)(Part)
end
