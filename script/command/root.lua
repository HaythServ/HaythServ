--[[
        HaythServ Login System
        Copyright (C) 2013 ~Haytham

        Changelog
        =========
        Added this #root command
]]

return function(cn)
        if not server.verified(cn) then
                return false, "You need to verify to use this command."
        end
        if not server.getaccroot(cn) then
                return false, "Your account has not got any root rights."
        end
        if not server.username(cn) then
                return false, "You need to verify to use this command."
        end
        server.setroot(cn)
        server.msg(string.format(server.claimroot_message, server.player_displayname(cn), server.getuser(cn)))
end
