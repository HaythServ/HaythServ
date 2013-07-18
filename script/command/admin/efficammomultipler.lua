local error_novalue = "usage: #efficammomultipler multipler"
return function(cn, value)
	if not value then
		return false, error_novalue
	end
	if value=="default" then
		server.efficammomultipler = 2
	else
		server.efficammomultipler = value
	end
	for p in server.gplayers() do p:slay() end
        server.msg(string.format(server.change_efficammomultipler, server.player_displayname(cn), value))
end, "", readman("efficammomultipler"), { "effic_am", "efficam", "eam" }