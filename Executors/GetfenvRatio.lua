-- Credit: https://devforum.roblox.com/t/awp-injection-detection-hook-detection-infinite-yield-detection-dex-explorer-detection/3560554
-- this is also detected on seliware, potassium, and madium

-- 9382
-- on-inject detection targetted at the awp executor (targets getfenv timing flaws)
-- >when I'm so undetectable a LocalScript can detect me :muscle:

if game:GetService("RunService"):IsStudio() then
    return
end
 
-- ratio stats:
-- avg 12.5, avg range 11.5-13.5, 98% ~17.5
-- awp averages about 31, so the difference is more than enough

-- we use a ratio so that slow pcs arent punished for being slow,
-- instead comparing execution time between a base test and getfenv

-- GETIMPORT gets slower after running getfenv, so this matters a lot
local getfenv = getfenv
local tick = tick

local violations = 0
while task.wait(0.2) do
    local t1 = tick()
    for i = 1, 1e4 do
        getfenv()
    end
    local t2 = tick()
    for i = 1, 1e4 do
        -- do nothing lol
    end
    local t3 = tick()
    
    --[[ 
        compares speed of getfenv vs empty loop. 
        if getfenv is way slower (ratio > 25), it means 
        the executor's environment is slowing it down.
    ]]
    local ratio = (t2-t1)/(t3-t2)
    if ratio > 25 then
        -- dont punish lag spikes, require 8 fails in a row
        violations = violations + 1
        if violations >= 8 then
            warn("executor detected via getfenv timing (r8: "..ratio..")")
            break
        end
    else
        violations = 0
    end
end
