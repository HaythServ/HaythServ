--[[
        HaythServ Login System
        Copyright (C) 2013 ~Haytham

        Changelog
        =========
        Added this #invmaster command
]]

return function(cn)
        if not server.verified(cn) then
                return false, "You need to verify to use this command."
        end
        if not server.getaccmaster(cn) then
                return false, "Your account has not got any master rights."
        end
        if not server.getuser(cn) then
                return false, "You need to verify to use this command."
        end
        server.set_invisible_master(cn)
end
