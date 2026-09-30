local c = 0

local function f(max)

    c = c + 1

    if c < max then
        return pcall(f, max)
    end
end

local function runTest()


    c = 0

    --[[



        we only go to 300 calls since potassium will usually hit its limit before that


    ]]
    local maxDepth = 300

    task.spawn(function()
        pcall(f, maxDepth)
    end)

    task.wait(0.1)

    print("pcall depth:", c)

    --[[
        if stops much earlier than expected, potassium is most likely injected
    ]]

    if c < 250 then
        game.Players.LocalPlayer:Kick("Potassium detected")
    end
end

task.spawn(function()
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    runTest()

    while true do
        task.wait(5)
        runTest()
    end
end)
