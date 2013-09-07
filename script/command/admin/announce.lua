local usage = "\"#announce message\". For more help see \"#man announce\"."
return function(cn, ...)
	local text = ""
    
	for _, item in ipairs({...}) do
		item = tostring(item)
		if #item > 0 then
			if #text > 0 then
				text = text .. " "
			end
			text = text .. item
		end
	end

	server.msg(text)
end, "", readman("announce")