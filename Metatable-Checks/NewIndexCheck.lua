local function checkNewIndexGarbage()
    while task.wait(1) do
        --[[ 
            setting properties is a native C function and should be 0.
            if it's > 0, someone hooked __newindex w/ a lua function.
        ]]
        local before = gcinfo()
        
        for i = 1, 1000 do
            workspace.StreamingEnabled = true 
        end
        
        local after = gcinfo()
        
        if after - before > 0 then
            warn("newindex hook detected")
        end
        
        print(after - before)
    end
end

task.spawn(checkNewIndexGarbage)
