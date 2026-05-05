local _, err = pcall(function()
    -- passing nil to Instance.new forces a C error
    Instance.new(nil)
end)

-- if hooked via hookfunction, the lua hook leaks a line number (":").

if not (err and err:find(":")) then
    warn("Instance.new hook detected")
end
