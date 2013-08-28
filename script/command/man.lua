
local function readextman(cn, command)
    local f = io.open(string.format("script/man/ext_%s.man", command), "r")
    if f == nil then
        server.player_msg(cn, string.format("\fs\f3>>> \f4[\f1MAN\f4]\fr: No manpage for the command \fs\f5#\fr%s could be found.", command))
        return false
    end 
    server.player_msg(cn, string.format("\fs\f3>>> \f4[\f1MAN\f4]\fr: Manpage for the command \fs\f4\"\f1%s\f4\"\fr:", command))
    for _ in io.lines(string.format("script/man/ext_%s.man", command)) do
        server.player_msg(cn, f:read())
    end
    f:close()
end

return function(cn, command_name, option1)
    
    local privilege = server.player_priv_code(cn)
    
    if command_name then
    
        local command = player_commands[command_name]
        
        if not command then
            return false, "unknown command"
        end
        
        if not is_player_command_enabled(command_name) then
            return false, "this command is disabled"
        end
        
        if privilege < command.permission then
            return false, "access denied"
        end
        
        if option1 ~= "-s" and option1 ~= "--short" then
            readextman(cn, command_name)
        else
            server.player_msg(cn, string.format("\fs\f3>>> \f4[\f1COMMAND\f4]\fr\fs: \f5#\fr%s\n%s", command_name, command.help_message or ""))
        end
        return
    end
    server.player_msg(cn, string.format("\fs\f3>>> \f4[\f1COMMAND\f4]\fr\fs: \f5#\frman\n%s", readman("man")))
end, "", readman("man")
