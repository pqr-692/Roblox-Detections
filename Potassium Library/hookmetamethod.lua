-- tracks how fast properties change to catch __newindex hooks
-- if the number jumps to the 70s or higher then its prob hookmetamethod

task.spawn(function()
    local objectValue = Instance.new("ObjectValue")
    local iterations = 100000

    while true do
        local t1 = os.clock()
        for _ = 1, iterations do
            objectValue.Value = workspace
        end
        local d1 = os.clock() - t1

        local t2 = os.clock()
        local controlVar
        for _ = 1, iterations do 
            controlVar = workspace
        end
        local d2 = os.clock() - t2

        print(d1 / d2)
        task.wait(2)
    end
end)
