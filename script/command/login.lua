-- HaythServ Login System
-- Copyright (C) 2012        Jed
-- Copyright (C) 2012-2013   ~Haytham

-- Changelog:
-- 2012: First release by Jed
-- 2012: Improvements by ~Haytham
-- 2013: Rewritten by ~Haytham
-- 2013: Added name protection by ~Haytham
-- 2013: Added invisible privileges support (~Haytham)

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

local verified    = "\f3>>> \f0%s \f6verified \f4as \f5\"%s\""
local failed      = "\f3>>> \f0%s \f6failed \f4the login as \f5\"%s\""
local unknownuser = "\f3>>> \f4No such user: \f0%s"
local found       = 0
local account     = {}

return function(cn, username, password)
    if not username or not password then
        return false, "Usage: #login username password"
    end
    if server.verified(cn) and server.getuser(cn) then
        return false, "You have already verified."
    end
    local accounts = {}
    local line = ""

    local f = io.open("accounts.txt", "r")
    for _ in io.lines("accounts.txt") do
        line = f:read()
        accounts[#accounts+1] = explode(" ", line)
    end
    f:close()
    for item,_ in pairs(accounts) do
        for _item,__ in pairs(_) do
            if __ == username then
                found = 1
                account = accounts[item]
            end
        end
    end
    if not account then return end
    if account[1] ~= server.player_displayname(cn) then
        return false, "It seems that you don't own this account"
    end
    if found then
        if password == account[2] then
            server.setusername(cn, username)
            server.msg(string.format(verified, server.player_displayname(cn), username))
            if account[3] == "master" then
                server.accmasterset(cn, true)
                server.accadminset(cn, false)
                server.accrootset(cn, false)
            elseif account[3] == "admin" then
                server.accmasterset(cn, true)
                server.accadminset(cn, true)
                server.accrootset(cn, false)
            elseif account[3] == "root" then
                server.accmasterset(cn, true)
                server.accadminset(cn, true)
                server.accrootset(cn, true)
            else
                server.accmasterset(cn, false)
                server.accadminset(cn, false)
                server.accrootset(cn, false)
            end
        else
            if username == account[1] then
                server.msg(string.format(failed, server.player_displayname(cn), username))
                return
            else
                server.player_msg(cn, string.format(unknownuser, username))
                return
            end
        end
    else
        server.player_msg(cn, string.format(unknownuser, username))
        return
    end
    server.verify(cn)
end
