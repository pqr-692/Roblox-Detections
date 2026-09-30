task.spawn(function()
    --[[
        catches dex dumping functions. dex turns values into text to show them, and that runs our proxy's tostring inside dex's own code.
    ]]
    local Be = Instance.new("BindableEvent")
    local Proxy = newproxy(true)
    getmetatable(Proxy).__tostring = function()
        -- key trick. table key forces tostring when dex reads it.
        for lvl = 1, 20 do
            local ok, env = pcall(getfenv, lvl)
            if ok and env and env ~= getfenv() then
                -- cloneref in env means dex env most likley
                if rawget(env, "nodes") or rawget(env, "InstanceList") or rawget(env, "cloneref") then
                    warn("L" .. lvl .. " Dex env")
                    for k, v in pairs(env) do warn(" " .. k) end
                end
            end
        end
        return ""
    end
    while true do pcall(function() Be:Fire({[Proxy] = {}}) end) task.wait(0.5) end
end)
