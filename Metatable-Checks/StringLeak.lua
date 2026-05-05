local str = "test"

while task.wait(1) do
    --[[ 
        catches 'setrawmetatable' abuse. if an executor sets a string's metatable to getgenv(), strings leak the whole environment.
        ref: https://docs.sunc.su/Metatable/setrawmetatable/
    ]]
    if str.print ~= nil then
        -- finding 'print' means the metatable was hijacked to link to globals.
        -- ex: str.getgenv or str.identifyexecutor would now work.
        print(str.print)
    end
end
