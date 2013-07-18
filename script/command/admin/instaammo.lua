local error_novalue = "usage: #instaammo ammo"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.instaammo = 100
	else
		server.instaammo = value
	end
	for p in server.gplayers() do p:slay() end
        server.msg(string.format(server.change_insta_ammoorhp, server.player_displayname(cn), "ammo", value))
end, "", readman("instaammo")