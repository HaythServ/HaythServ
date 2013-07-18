local error_novalue = "usage: #masterkicktime seconds"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.masterkicktime = 0
	else
		server.masterkicktime = value
	end
        server.msg(string.format(server.change_masterkicktime, server.player_displayname(cn),  value))
end, "", readman("masterkicktime"), { "mkt" }