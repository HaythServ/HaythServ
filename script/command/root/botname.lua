local error_novalue = "usage: #botname name"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.botname = "bot"		-- Oops the "" were missing :/
	else
		server.botname = value
	end
        server.msg(string.format(server.change_botname_message, server.player_displayname(cn), value))
end, "", readman("botname")
