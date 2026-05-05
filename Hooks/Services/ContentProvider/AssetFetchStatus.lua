local ContentProvider = game:GetService("ContentProvider")

local _, err = pcall(function()
    ContentProvider.GetAssetFetchStatus()
end)

if not (err and err:find("Expected ':' not '.'")) then
    warn("ContentProvider.GetAssetFetchStatus Hook Detected.")
end
