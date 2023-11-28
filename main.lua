local Oceans = workspace:WaitForChild('Oceans') -- // Anything here will have a buoyancy effect

-- // For this to work make sure studio setting gravity is set to realistic and make sure the parts have custom physical properties turned on
-- // Explanation of buoyancy

--[[
    When a part in the act of colliding with water, 
    any object will have a force pushing up against gravity; this is called buoyancy
]]

local function SetupBuoyancy(WaterPart)
    WaterPart.Touched:Connect(function(Part)
        local Height = Part.Size.Y
        local PartD = Part.Density
        local WaterD = WaterPart.Density
        local Gravity = workspace.Gravity
        local BuoyantForce = (WaterD * Height / 2 * Gravity)
        local UpwardForce = Instance.new('BodyForce')
        UpwardForce.Force = Vector3.new(0, BuoyantForce, 0)
        UpwardForce.Parent = Part

        local BodyGyro = Instance.new('BodyGyro')
        BodyGyro.Parent = Part -- // Keeps the part afloat

        -- Raycasting and bounding box checks
        local Ray = Ray.new(Part.Position, Vector3.new(0, -1, 0) * Height) -- Ray from the part's position downwards

        local Hit, Position = workspace:FindPartOnRay(Ray)
        if Hit and Hit:IsDescendantOf(WaterPart) then
            UpwardForce.Enabled = true
        else
            UpwardForce.Enabled = false
        end
    end)
end

for _, Part in pairs(Oceans:GetChildren()) do
    coroutine.wrap(SetupBuoyancy)(Part)
end
