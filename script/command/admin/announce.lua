local usage = "#announce message"
return function(cn, text)
	if not text then
		return false, usage
	end

	server.msg(text)
end, "message", "Send a message to the server."
