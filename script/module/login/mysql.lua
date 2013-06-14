local luasql = require("luasql_mysql")
local servername
local connection
local open_settings
local queue = {}

local function escape_string(s)
    s = string.gsub(s, "\\", "\\\\")
    s = string.gsub(s, "%\"", "\\\"")
    s = string.gsub(s, "%'", "\\'")
    return s
end

local function execute_statement(statement)
    local cursor, errorinfo = connection:execute(statement)
    if not cursor then
        server.log_error(string.format("Buffering stats data because of a MySQL stats failure: %s", errorinfo))
        connection:close()
        connection = nil
    end
    return cursor
end

local function install_db(connection, settings)
    local schema = server.read_whole_file(settings.schema)
    for statement in string.gmatch(schema, "CREATE TABLE[^;]+") do
        local cursor, err = execute_statement(statement)
        if not cursor then error(err) end
    end
    local triggers = server.read_whole_file(settings.triggers)
    for statement in string.gmatch(triggers, "CREATE TRIGGER[^~]+") do
        local cursor, err = execute_statement(statement)
        if not cursor then error(err) end
    end
end

local function open(settings)
    connection = luasql.mysql():connect(settings.database, settings.username, settings.password, settings.hostname, settings.port)  
    if not connection then
        server.log_error(string.format("couldn't connect to MySQL server at %s:%s", settings.hostname, settings.port))
        return nil
    end  
    servername = settings.servername   
    if settings.install then
        install_db(connection, settings)
    end
    open_settings = settings 
    return true
end

player_command_function("register", function(cn, _username, _password)
    local usage = "#register username password"
    if not _username then
        return false, usage
    end
    if not _password then
        return false, usage
    end
    local adduser = [[INSERT INTO logins (username, password, privileges)
        VALUES ('%s', '%s', 'verify')]]
    if not execute_statement(string.format(
        adduser,
        escape_string(_username),
        escape_string(_password))) then return nil end
    local cursor = execute_statement("SELECT last_insert_id()")
    if not cursor then return nil end
    return cursor:fetch()
end)

local function _privileges(__username, __password) {
    local __privileges = [[SELECT privileges FROM logins WHERE username='%s' AND password='%s']]
    return execute_statement(string.format(
        __privileges,
        escape_string(__username),
        escape_string(__password)
    ))
}

player_command_function("login", function(cn, _username, _password)
    local _usernames = [[SELECT username FROM logins]]
    local error_user_not_found = "user does not exist!"
    local usage = "#login username password"
    if not _username then
        return false, usage
    end
    if not _password then
        return false, usage
    end
    if _usernames[_username] then
        local checkpassword = [[SELECT password FROM logins WHERE username='%s']]
        if not execute_statement(string.format(
            checkpassword,
            escape_string(_username))) then return nil
        else
            _privs = _privileges(escape_string(_username), escape_string(_password))
            if _privs == "verify" then
                server.msg(string.format(server.verify_message, server.player_displayname(cn), _username))
            end
            if _privs == "master" then
                server.msg(string.format(server.claimmaster_message, server.player_displayname(cn), _username))
                server.setauth(cn)
            end
            if _privs == "admin" then
                server.msg(string.format(server.claimadmin, server.player_displayname(cn), _username))
                server.setadmin(cn)
            end
        end
    else
        return false, error_user_not_found
    end
end)

player_command_function("setloginprivs", function(cn, _username, _privileges)
    local _usernames = [[SELECT username FROM logins]]
    local error_user_not_found = "user does not exist!"
    local usage = "#setloginprivs username privilege-level"
    if not _username then
        return false, usage
    end
    if not _privileges then
        return false, usage
    end
    if _usernames[_username] then
        local _changeprivs = [[UPDATE logins SET privileges='%s' WHERE username='%s']]
        execute_statement(string.format(
            _changeprivs,
            escape_string(_privileges),
            escape_string(_username)))
    else
        return false, error_user_not_found
    end
end)
