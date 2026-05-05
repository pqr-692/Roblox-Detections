local results = {}
xpcall(function()
    for i = 1, 5 do
        local name = debug.info(i, "n")
        table.insert(results, name or "unknown")
    end
end, function() end)

-- if this path looks different, xpcall is likely hooked.
print("Stack Path:", table.concat(results, " -> "))
-- clean:  -> xpcall ->  -> unknown -> unknown
