return function(cn, tcn)
	if not tcn then
		return false, "usage: #getpriv <cn>"
	end
	server.player_msg(cn, string,format(server.player_privileges, server.player_displayname(tcn), server.player_priv_code(tcn)))
end
