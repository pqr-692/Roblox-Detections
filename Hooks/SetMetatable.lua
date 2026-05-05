local _, err = pcall(function()
    setmetatable(nil, {})
end)


if not (err and err:find(":")) then
    warn("setmetatable hook detected")
end
