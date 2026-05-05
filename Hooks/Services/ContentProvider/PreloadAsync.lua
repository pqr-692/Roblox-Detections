local ContentProvider = game:GetService("ContentProvider")

local _, err = pcall(function()
    ContentProvider.PreloadAsync()
end)

if not (err and err:find("Expected ':' not '.'")) then
    warn("ContentProvider.PreloadAsync Hook Detected.")
end
