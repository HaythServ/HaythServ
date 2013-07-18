local error_nocn = "Usage: #getip cn"
return function(cn, tcn)
	if not tcn then
		return false, error_nocn
	end
	server.player_msg(cn, string.format(server.getip_message, server.player_displayname(tcn), server.player_ip(tcn)))
end, "", readman("getip"), { "ip", "playerip", "player_ip" }