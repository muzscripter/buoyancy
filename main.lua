local Oceans = workspace:WaitForChild('Oceans') -- // Anything here will have a buoyancy effect

-- // For this to work make sure studio setting gravity is set to realistic
-- // Explaination of buoyancy

--[[
    When a part in the act of colliding with water, 
    any object will have a force pushing up against gravity this is called buoyancy
]]
https://www.youtube.com/watch?v=qF_3la-gFbU
-- coming soon gang
local function SetupBuoyancy(WaterPart)
    WaterPart.Touched:Connect(function(Part)
        local PartMass = Part:GetMass()

        local UpwardForce = Instance.new('BodyVelocity')
        UpwardForce.Velocity = Vector3.new(0, -5, 0)

    end)
end

for Properties, Part in pairs(Oceans:GetChildren()) do
    coroutine.wrap(SetupBuoyancy)(Part)
end
