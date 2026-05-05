local remote = Instance.new("RemoteEvent")
local before = gcinfo() 

for i = 1, 100 do
    remote:FireServer()
end

--[[ 
    should always be 0 bc fireserver is a native C function, It doesn't use memory. 
    
    If it's > 0, an exploit hooked it w/ a Lua function. This also should work on any other namecall hook
]]
print("gc delta on fireserver:", gcinfo() - before)
