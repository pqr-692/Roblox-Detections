local lvl

pcall(function()
    lvl = debug.info(2, "f") -- Checks what called this function
end)

--[[ 
    Should match bc pcall itself should be the caller.
    If it doesn't, pcall was tampered with or hooked.
]]
if lvl ~= pcall then
    warn("pcall Hook Detected: Stack mismatch.")
end
