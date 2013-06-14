--[[
	Change people's privilege level
]]--

return function(cn, target, privs)
	if privs=="admin" then
		server.setadmin(target)
		server.msg(string.format(server.changepriv_message, server.player_displayname(cn), server.player_displayname(target), (orange "admin")))
	else
		if privs=="auth" then
       		        server.setauth(target)
      	         	server.msg(string.format(server.changepriv_message, server.player_displayname(cn), server.player_displayname(target), (blue "auth")))
       		else
			if privs=="master" then
                		server.setmaster(target)
                		server.msg(string.format(server.changepriv_message, server.player_displayname(cn), server.player_displayname(target), (green "master")))
			end
        	end
	end
end, "cn privilegelevel", "changes a player's privilege level."
