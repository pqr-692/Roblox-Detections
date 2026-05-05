local _, err = pcall(function()
    -- passing a table instead of a level/function forces a C error
    getfenv({})
end)

if not (err and err:find(":")) then
    warn("getfenv hook detected")
end
