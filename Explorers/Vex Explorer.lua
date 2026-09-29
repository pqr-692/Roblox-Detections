local Services = {

    game:GetService("Workspace"),
    game:GetService("Players"),
    game:GetService("ReplicatedFirst"),
    game:GetService("ReplicatedStorage"),
    game:GetService("ServerStorage"),

}

--[[
    when u click a service vex hooks a refresh onto it so ur 100 flips stop being free and the timer spikes.
    works on other explorers like infinite yield too but vex spikes the highest.
]]

while task.wait(1) do

    for _, s in Services do

        pcall(function()

            local t = os.clock()

            for i = 1, 100 do

                s.Archivable = not s.Archivable

            end

            if math.floor((os.clock() - t) * 1000) > 0 then

                warn("Possible VEX")

            end

        end)

    end

end
