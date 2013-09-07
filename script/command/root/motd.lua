--[[
	A player command to set a message of the day
	Rewritten by ~Haytham
]]

--[[local usage = "#motd <text>"

return function(cn,text)
    if not text then
        return false, usage
    end

    server.motd = text
    server.player_msg(cn, string.format(server.motd_modification_message, text))
end, "", readman("motd")]]
return function(cn, ...)
	local usage = "\"\fs\f5#\frmotd <text>\", for more help, see \"\fs\f5#\frman motd\"."
	local text = ""
	for _, item in ipairs({...}) do
		item = tostring(item)
		if #item > 0 then
			if #text > 0 then
				text = text .. " "
			end
			text = text .. item
		else
			return false, usage
		end
	end
	server.motd = text
	server.player_msg(cn, string.format(server.motd_modification_message, text))
end, "", readman("motd")
