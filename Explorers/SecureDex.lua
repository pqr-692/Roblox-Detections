-- this method most likely just works on potassium since potassium leaks their pcall stack. you can still detect this with the XpcallPath method

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local last = tick()

RunService.Heartbeat:Connect(function()
    if tick() - last < 3 then return end
    last = tick()

    local c = 0

    local function f()
        c = c + 1
        xpcall(f, function() end)
    end

    task.spawn(function()
        pcall(f)
    end)

    task.wait()

    --[[ 
        uses stack overflow to catch dex. 
        dex hooks pcall/xpcall to log errors, which blocks recursion and keeps it at 1.
    ]]
    if c == 1 then
        lp:Kick("Secure Dex")
    end
end)
