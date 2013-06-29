local error_novalue = "usage: #spawnammo ammo gun"
local error_wronggunall_usage = "wrong GUN_ALL usage! Usage: #spawammo default/0 GUN_ALL"
return function(cn, gun, value)
	if not value or not gun then
		return false, error_novalue
	end
	if value=="default" then
		server.spawnammo(server.weapon_defaultammo(gun), gun);
		server.msg(string.format(server.reset_spawnammo_message, server.player_displayname(cn), gun))
	else
		server.spawnammo(value, gun);
		server.msg(string.format(server.change_spawnammo_message, server.player_displayname(cn), gun, value))
	end
	for p in server.gplayers() do p:slay() end
end, "ammo gun", "Changes default ammo at spawn for the choosed gun."
