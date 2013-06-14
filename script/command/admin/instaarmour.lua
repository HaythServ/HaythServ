local error_novalue = "usage: #instaarmour armour"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.instaarmour = 0
	else
		server.instaarmour = value
	end
	for p in server.gplayers() do p:slay() end
        server.msg(string.format(server.change_insta_ammoorhp, server.player_displayname(cn), "armour", value))
end, "armour", "Changes insta gamemodes' armour"
