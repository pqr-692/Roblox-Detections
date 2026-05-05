local function checkGarbage()
    while task.wait(1) do
        --[[ 
            game:IsA is a native C function. it shouldn't use lua memory.
            if it's > 0, someone hooked via __namecall 
        ]]
        local before = gcinfo()
        
        for i = 1, 1000 do
            game:IsA("DataModel")
        end
        
        local after = gcinfo()
        
        if after - before > 0 then
            warn("namecall hook detected")
        end
        
        print(after - before)
    end
end

task.spawn(checkGarbage)
