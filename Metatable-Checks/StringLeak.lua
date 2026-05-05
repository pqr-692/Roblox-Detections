local str = "test"

while task.wait(1) do

        -- strings shouldn't have 'print'. if they do, it means the metatable was hijacked to link to the executor's env.

    if str.print ~= nil then
        -- finding 'print' means you can leak their whole env through a string.
        -- ex: str.getgenv or str.identifyexecutor would now work.
        print(str.print)
    end
end
