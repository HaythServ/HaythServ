local error_novalue = "usage: #rlinsta 0|1"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="0" then
		server.cginsta = 0
		server.sginsta = 0
		server.rlinsta = 0
		server.glinsta = 0
                for p in server.gplayers() do p:slay() end
                server.msg(string.format(server.change_instatype_message, server.player_displayname(cn), "normal instagib"))
	end
	if value=="1" then
		server.cginsta = 0
		server.sginsta = 0
		server.rlinsta = 1
		server.glinsta = 0
                for p in server.gplayers() do p:slay() end
                server.msg(string.format(server.change_instatype_message, server.player_displayname(cn), "rocket launcher instagib"))
	end
end, "0|1", "toggles/untoggles rocketlauncher insta gamemode"
