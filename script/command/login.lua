local error_user_none = "Command usage: #login username password"
local error_pass_none = "Please specify a password"
local error_user = "Invalid username"
local error_pass = "Invalid password"
return function(cn, user, pass)
	if not user then
		return false, error_user_none
	end
	if not pass then
		return false, error_pass_none
	end
	if user=="TheAdmin" then
		if pass=="ThePassword" then
			server.msg(string.format(server.claimadmin_message, server.player_displayname(cn), user))
			server.setadmin(cn)
		else
			return false, error_pass
		end
	else
		if user=="TheAuther" then
			if pass=="ThePassword" then
				server.msg(string.format(server.claimauth_message, server.player_displayname(cn), user))
				server.setauth(cn)
			else
				return false, error_pass
			end
		else
			if user=="TheMaster" then
				if pass=="ThePassword" then
				server.msg(string.format(server.claimmaster_message, server.player_displayname(cn), user))
					server.setmaster(cn)
				else
					return false, error_pass
				end
			else
				return false, error_user
			end
		end
	end
end, "username password", "A script to authentificate to the server and raise your privilege level." 

