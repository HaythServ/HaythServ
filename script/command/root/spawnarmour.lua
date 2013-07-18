local error_novalue = "usage: #spawnarmour armour"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" or value=="0" then
		server.spawnarmour = 0
		server.msg(string.format(server.reset_spawnarmour_message, server.player_displayname(cn)))
	else
		server.spawnarmour = value
		server.msg(string.format(server.change_spawnarmour_message, server.player_displayname(cn), value))
	end
	for p in server.gplayers() do p:slay() end
end, "", readman("spawnarmour")