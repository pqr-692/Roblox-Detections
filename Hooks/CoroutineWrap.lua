local _, err = pcall(function()
    coroutine.wrap(nil)
end)

--[[ 
    native should be a clean C error. 
    if hooked, the lua wrapper leaks a line number (":").
]]
if not (err and err:find(":")) then
    warn("coroutine.wrap hook detected")
end
