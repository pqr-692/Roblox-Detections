local testRemote = Instance.new("RemoteEvent")
local _, err = pcall(function()
    -- using a dot instead of a colon on FireServer
    testRemote.FireServer()
end)

if not (err and err:find("Expected ':' not '.'")) then
    warn("RemoteEvent.FireServer hook detected")
end
testRemote:Destroy()
