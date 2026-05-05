local OriginalENV = getfenv()

local function dumpEnv(level)
    local status, env = pcall(getfenv, level)
    if status and env ~= OriginalENV then
        local genv = env.getgenv or _G.getgenv
        if genv and type(genv) == "function" then
            for k, v in pairs(genv()) do
                if type(v) == "function" then
                    print(tostring(k))
                end
            end
            return true
        end
    end
    return false
end

task.spawn(function()
    while task.wait(5) do
        xpcall(function()
            --[[ 
          
                if caller isnt xpcall, someone used hookfunction on it.

            ]]
            local caller = debug.info(2, "f")
            
            if caller ~= xpcall then
                for i = 2, 5 do
                    if dumpEnv(i) then break end
                end
            end
            
            error("trigger leak") 
        end, function()

            for i = 2, 5 do
                if dumpEnv(i) then break end
            end
        end)
    end
end)
