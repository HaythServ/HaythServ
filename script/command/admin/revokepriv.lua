--[[
	Revoke a guy's privileges
]]--

return function(cn, target)
	server.unsetpriv(target)
	server.msg(string.format(server.revokeprivmessage, server.player_displayname(cn), server.player_displayname(target)))
end, "", readman("revokepriv")