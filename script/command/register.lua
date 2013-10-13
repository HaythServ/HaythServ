-- HaythServ Login System
-- Copyright (C) 2013   ~Haytham

-- Changelog:
-- 2013: Added this register script for the HSLS
--       (HaythServ Login System).

function explode(div,str)
    if (div=='') then return false end
    local pos,arr = 0,{}
    for st,sp in function() return string.find(str,div,pos,true) end do
        table.insert(arr,string.sub(str,pos,st-1))
        pos = sp + 1
    end
    table.insert(arr,string.sub(str,pos))
    return arr
end

local accounts = {}
local line = ""

local  f = io.open("accounts.txt", "r")
local _f = io.open("accounts.txt", "a")
for _ in io.lines("accounts.txt") do
    line = f:read()
    accounts[#accounts+1] = explode(" ", line)
end
f:close()

return function(cn, username, password)
    if not username or not password then
        return false, "Usage: #register username password"
    end
    for item,_ in pairs(accounts) do
        for _item,__ in pairs(_) do
            if __ == username then
                found = 1
            end
        end
    end
    if account or found then
        return false, "Account already exists!"
    end
    _f:write(string.format("%s %s none\n", username, password))
    _f:close()
    server.player_msg(cn, string.format("\f3>>> \f4Your account has been succsessfully created, wait for an admin to approve it.", username, password))
    -- For now, you need to "approve" accounts, by #reload
end
