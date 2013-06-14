local error_novalue = "usage: #instahp hp"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.instahp = 1
	else
		server.instahp = value
	end
	for p in server.gplayers() do p:slay() end
        server.msg(string.format(server.change_insta_ammoorhp, server.player_displayname(cn), "hp", value))
end, "hp", "Changes insta gamemodes' hp"
