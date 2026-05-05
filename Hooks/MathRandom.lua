local _, err = pcall(function()
    
    math.random(10, 1)
    
end)

if not (err and err:find(":")) then
    warn("math.random hook detected")
end
