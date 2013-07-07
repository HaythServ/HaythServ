local error_novalue = "usage: #spawnhealth hp"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" or value=="0" then
		server.spawnhealth = 0
		server.msg(string.format(server.reset_spawnhp_message, server.player_displayname(cn)))
	else
		server.spawnhealth = value
		server.msg(string.format(server.change_spawnhp_message, server.player_displayname(cn), value))
	end
	for p in server.gplayers() do p:slay() end
end, "hp", "Changes default health at spawn."
