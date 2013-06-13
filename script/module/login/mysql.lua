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

return {open = open}
