task.spawn(function()
    task.wait(3)
    local t=setmetatable({},{__mode="v"})
    while true do
        t[1]={} t[2]=game:GetService("InsertService")
        while t[1]~=nil do t[3]=string.rep("ab",2048) t[3]=nil task.wait() end
        if t[2]~=nil then warn("Infinite Yield") end
        task.wait(3)
    end
end)
