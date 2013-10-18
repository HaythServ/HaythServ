--[[
        HaythServ Login System
        Copyright (C) 2013 ~Haytham

        Changelog
        =========
        Added this #admin command
]]

return function(cn)
        if not server.verified(cn) then
                return false, "You need to verify to use this command."
        end
        if not server.getaccadmin(cn) then
                return false, "Your account has not got any master rights."
        end
        server.setadmin(cn)
        server.msg(string.format(server.claimadmin_message, server.player_displayname(cn), server.getuser(cn)))
end
