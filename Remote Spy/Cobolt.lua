-- [[ https://github.com/notpoiu/cobalt ]]

if game:GetService("RunService"):IsClient() then
    task.spawn(function()
        while true do
            local BaitRemote = Instance.new("RemoteEvent")
            
            --[[  wax.shared.Hooking.HookMetaMethod(game, "__newindex", function(...) ]]
            local _, err = pcall(function()
                BaitRemote[{}] = true
            end)
            
            if err then
                local line = tonumber(err:match(":(%d+):"))
                if line and line > 50 then
                    warn("Detected cobalt")
                end
            end
            
            BaitRemote:Destroy()
            task.wait(1)
        end
    end)
end
