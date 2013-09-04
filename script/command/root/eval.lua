--[[

	A player command to execute a script on the server

]]
require "cubescript"
local evilcommands = { "shutdown", "os." } -- You can add more commands, which you dont want other roots to use... Checks for "os.", so it wont allow any of the "os." commands (e.G. os.execute)
return function(cn, ...)
	local code = ""
	for _, item in ipairs({...}) do	
		item = tostring(item)
		for k, v in pairs(evilcommands) do
			if string.find(item, v) then
				server.msg(string.format("\f3>>> W A R N I N G ! ! ! Evil command detected! o_O\n>>> \f1%s \f3tried to run an evil command! o_O\n>>> Revoking \f1%s\f3's privilages and banning him!", server.player_displayname(cn), server.player_displayname(cn)))
				server.unsetpriv(cn)
				server.kick(cn,15552000,"Evil commands protection","Trying to run an evil command! o_O") -- Kick the bastard who tried to run an evil command!
				return
			end
		end
		if #item > 0 then
			if #code > 0 then
				code = code .. " "
			end
			code = code .. item
		end
	end
	if code == "" then
		return false, "#eval <code>"
	end
	--server.player_msg(cn, server["do"](code) or "")
	server.player_msg(cn, cubescript.eval_string(code) or "")
end, "", readman("eval"), { "exec", "execute", "code" }