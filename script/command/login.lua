-- HaythServ Login System
-- Copyright (C) 2012        Jed
-- Copyright (C) 2012-2013   ~Haytham

-- Changelog:
-- 2012: First release by Jed
-- 2012: Improvements by ~Haytham
-- 2013: Rewritten by ~Haytham
-- 2013: Added name protection by ~Haytham
-- 2013: Added invisible privileges support (~Haytham)
-- 2013: Added function to reserve names + bugfixes (~Haytham)
-- 2013: Bugfix (~Haytham)

function explode(div,str)
    if not div or div == '' then
        div = ' '
    end
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
    local accounts       = {}
    local reserved_names = {}
    local reserved_name  = {}
    local line           = ""
    local allowusename   = 0
    local found          = 0

    local f1 = io.open("accounts.txt", "r")
    if not f1 then
        return false, "Could not open accounts.txt for read"
    end
    for _ in io.lines("accounts.txt") do
        line = f1:read()
        accounts[#accounts+1] = explode(" ", line)
    end
    f1:close()
    for item,_ in pairs(accounts) do
        for _item,__ in pairs(_) do
            if __ == username then
                found = 1
                account = accounts[item]
            end
        end
    end
    if server.verified(cn) and server.getuser(cn) == username then
        return false, "You have already verified."
    end
    if found and account then
        local f2 = io.open("reserved_names.txt", "r")
        if not f2 then
            return false, "Could not open reserved_names.txt for read"
        end
        for _ in io.lines("reserved_names.txt") do
            line = f2:read()
            reserved_names[#reserved_names+1] = explode(" ", line)
            reserved_name = reserved_names[#reserved_names]
            if reserved_name[1] == account[1] then
                allowusename = 1
            end
        end
        if password == account[2] then
            if allowusename then
                server.setallowed(cn, true)
            elseif server.hastoverfy and not allowusename then
                server.player_msg(cn, "\f3>>> \f2[\f4NOTE\f2] \f4Please note that you have to verify via another account to use this name.")
            end
            server.verify(cn)
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
            else
                server.player_msg(cn, string.format(unknownuser, username))
            end
        end
    else
        server.player_msg(cn, string.format(unknownuser, username))
    end
end

