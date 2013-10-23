-- HaythServ Login System
-- Copyright (C) 2013   ~Haytham

-- Changelog:
-- 2013: Added this script to link an username to an account

-- Task list:
-- [ ] Limit usernames per account to a variable defined in the server.conf file

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

return function(cn, username)
    local user = ""
    if not username or username == '' then
        user = server.player_displayname(cn)
    else
        user = username
    end

    if not server.verified(cn) or not server.getuser(cn) then
        return false, "You have to verify to use this command"
    end
    local account = server.getuser(cn)
    local found   = 0
    local resnames = {}
    local f = io.open("reserved_names.txt", "r")
    for _ in io.lines("reserved_names.txt") do
        line = f:read()
        resnames[#resnames+1] = explode(" ", line)
    end
    for item,_ in pairs(resnames) do
        for _item,__ in pairs(_) do
            if __ == user then
                found = 1
            end
        end
    end
    if found == 1 then
        return false, "This username is already reserved"
    end
    if user == "unnamed" then
        return false, "You cannot reserve this username"
    end
    local _f = io.open("reserved_names.txt", "a")
    _f:write(string.format("%s %s\n", account, user))
    _f:close()
end
