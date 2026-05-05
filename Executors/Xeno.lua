-- only works if injected in-game, not in menu

local seen = {}

while task.wait(1) do
    local cp = game:GetService("ContentProvider")
    local ok, err = pcall(function()
        cp:PreloadAsync({game}, function(a, s)
            local assetString = tostring(a)
          
            if (assetString:find("Xeno") or assetString:find("{.-}{.-}")) and s == Enum.AssetFetchStatus.Success then
                local k = assetString .. tostring(s)
                if not seen[k] then
                    seen[k] = true
                    warn("Xeno Detected.")
                end
            end
        end)
    end)

    local k = tostring(ok) .. tostring(err)
    if not seen[k] then
        seen[k] = true
        print(ok, err)
    end
end
