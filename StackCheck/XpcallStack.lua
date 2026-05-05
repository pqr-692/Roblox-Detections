local lvl

xpcall(function()
    lvl = debug.info(2, "f") -- grabs whatever called this
end, function() end)

-- if it's not xpcall, it means something else is sitting in between.
-- basically if it doesnt match, it's hooked.
if lvl ~= xpcall then
    warn("xpcall hook detected")
end
