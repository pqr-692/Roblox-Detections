local results = {}
pcall(function()
    for i = 1, 5 do
        local name = debug.info(i, "n")
        table.insert(results, name or "unknown")
    end
end)

-- checks the order of names in the stack. 
-- if it's hooked, the names will change or show extra stuff.
print("Stack Path:", table.concat(results, " -> "))
-- clean:  -> pcall ->  -> unknown -> unknown
