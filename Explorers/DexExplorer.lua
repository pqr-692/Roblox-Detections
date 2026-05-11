local function randomString(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local result = ""
    for i = 1, length do
        local rand = math.random(1, #chars)
        result = result .. chars:sub(rand, rand)
    end
    return result
end

while task.wait(5) do
    --[[ 
    
        uses a weak table to see if an object gets garbage collected. if an explorer is open, it'll hold a reference to the object 

    ]]
    local weak = setmetatable({}, {__mode = "v"})
    local testObj = Instance.new("RemoteEvent")
    testObj.Name = randomString(math.random(8, 15))
    testObj.Parent = game:GetService("ReplicatedStorage") -- u can put this any where

    weak.trap = testObj
    testObj = nil 

    task.wait(5)

    if weak.trap then
        warn("Possible Dex")
        weak.trap:Destroy()
    end
end
