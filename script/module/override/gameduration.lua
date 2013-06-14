
local map_time = server.default_maptime

local function changeTime()
    server.changetime(900000)
end

server.event_handler("mapchange", changeTime)
server.event_handler("started", changeTime)

