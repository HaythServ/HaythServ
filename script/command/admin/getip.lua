local error_nocn = "Usage: #getip cn"
return function(cn, tcn)
	if not tcn then
		return false, error_nocn
	end
	server.player_msg(cn, server.player_ip(tcn))
end
