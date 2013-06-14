local error_novalue = "usage: #adminleft 1|0"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="0" then
		server.mastermode = 1
		server.unspecall(true)
		server.msg(string.format(server.adminconnected_message, server.player_displayname(cn)))
		server.adminleft = 0
	else
		server.mastermode = 2
		server.specall(true)
		server.msg(string.format(server.adminleft_message, server.player_displayname(cn)))
		server.adminleft = 1
	end
end, "1|0", "Toggles admin-left mode"
