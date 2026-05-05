local _, err = pcall(function()
    coroutine.status("invalid")
end)

if not (err and err:find(":")) then
    warn("coroutine.status hook detected")
end
