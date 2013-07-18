local error_novalue = "usage: #resetinsta"
return function(cn, value)
	server.cginsta = 0
	server.sginsta = 0
	server.rlinsta = 0
	server.glinsta = 0
	server.instaarmour = 0
	server.instahp = 1
	server.instaammo = 100
	for p in server.gplayers() do p:slay() end
	server.msg(string.format(server.resetinstagib_message, server.player_displayname(cn)))
end, "", readman("resetinsta")