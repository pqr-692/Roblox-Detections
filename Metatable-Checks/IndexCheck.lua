local function checkIndexGarbage()
    while task.wait(1) do
        --[[ 
            reading properties is handled in C and should be 0.
            if it's > 0, someone hooked __index w/ a lua function.
        ]]
        local testPart = workspace:FindFirstChildOfClass("Part") or Instance.new("Part")
        local before = gcinfo()
        
        for i = 1, 1000 do
            local _ = testPart.Anchored
        end
        
        local after = gcinfo()
        
        if after - before > 0 then
            warn("index hook detected")
        end
        
        print(after - before)
    end
end

task.spawn(checkIndexGarbage)
