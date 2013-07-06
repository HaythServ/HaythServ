--[[

	A player command to execute a script on the server

]]
require "cubescript"
local error_not_root = "WARNING! Your privilege level is not ROOT!"
return function(cn, ...)
	if server.player_priv_code(cn) == server.PRIV_ROOT then
		local code = ""
	
		for _, item in ipairs({...}) do	
			item = tostring(item)
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
	else
		return false, error_not_root
	end
end

