require "geoip"

local BANNER_DELAY = 500
local show_country_message = server.show_country_message == 1

local function sendServerBanner(cn)

    server.player_vars(cn).maploaded = true

    if server.player_vars(cn).shown_banner then return end

    local sid = server.player_sessionid(cn)

    server.sleep(BANNER_DELAY, function()

        -- cancel if not the same player from 1 second ago
        if sid ~= server.player_sessionid(cn) then return end

        server.player_msg(cn, server.motd)
        server.player_msg(cn, server.connect_info_message)
    server.player_msg(cn, server.info_message)

        server.player_vars(cn).shown_banner = true
    end)
end

function explode(div,str)
    if div == '' then
        return false
    end
    local pos,arr = 0,{}
    for st,sp in function() return string.find(str,div,pos,true) end do
        table.insert(arr,string.sub(str,pos,st-1))
        pos = sp + 1
    end
    table.insert(arr,string.sub(str,pos))
    return arr
end

function inArray(value,array)
    if value == '' then
        return false
    end
    for key,_value in pairs(array) do
        if _value == value then
            return true
        end
    end
    return false
end

function getKey(value,array)
    if value == '' then
        return false
    end
    for key,_value in pairs(array) do
        if _value == value then
            return key
        end
    end
    return false
end

function arraySort(key,array)
    local curarr  = {}
    local prevarr = {}
    local swapped = true
    while swapped do
        swapped = false
        for _,value in pairs(array) do
            if value ~= array[1] then
                if value[key]  > array[key-1] then
                    curarr     = array[_]
                    prevarr    = array[_-1]
                    array[_]   = prevarr
                    array[_-1] = curarr
                    curarr     = {}
                    prevarr    = {}
                    swapped    = true
                end
            end
        end
    end
    return array
end

local function getRanking(cn)
    local f = io.open("stats.txt", "r")
    local lines     = {}
    local words     = {}
    local stats     = {}
    local _key      = 0
    local curfrags  = 0
    local curdeaths = 0
    local curkpd    = 0.0
    local curtks    = 0
    local curacc    = 0.0
    local curmax    = 0
    local output    = 0
    if not f then
        return "Unknown"
    end
    for line in io.lines("stats.txt") do
        lines[#lines] = f:read()
    end
    f:close()
    if not lines then
        return "Unknown"
    end
    for key_,value_ in pairs(lines) do
        words = explode(' ', value_)
        if words[1] ~= "--[[" and words[#words] ~= "]]--" then -- if this line is not a comment
            if inArray(words[1], stats) then
                _key             = getKey(words[1], stats)
                stats[_key][2]   = stats[_key][2] + words[2]
                stats[_key][3]   = stats[_key][3] + words[3]
                stats[_key][4]   = stats[_key][4] + words[4]
                stats[_key][5]   = stats[_key][5] + words[5]
            else
                stats[#stats+1]  = {}
                stats[#stats][1] = words[1]
                stats[#stats][2] = words[2]
                stats[#stats][3] = words[3]
                stats[#stats][4] = words[4]
                stats[#stats][5] = words[5]
                stats[#stats][6] = 0
            end
        end
    end
    for key,value in pairs(stats) do
        curfrags  = stats[key][2]
        if stats[key][3] == 0 then
            stats[key][3] = 1
        end
        curdeaths = stats[key][3]
        curtks    = stats[key][4]
        curacc    = stats[key][5]
        curkpd    = curfrags / curdeaths
        stats[key][6] = curkpd - curtks + curacc -- The bigger this score is, the lower the ranking is.
    end
    stats = arraySort(6, stats)
    for key,value in pairs(stats) do
        if value[1] == server.player_displayname(cn) then
            return key
        end
    end
    return "Unknown"
end

local function onConnect(cn, is_spy)

    if is_spy or server.is_bot(cn) then return end

    server.unverify(cn)
    server.accmasterset(cn, false)
    server.accadminset(cn, false)
    server.accrootset(cn, false)

    local country = geoip.ip_to_country(server.player_ip(cn))
    local city = geoip.ip_to_city(server.player_ip(cn))
    if not city or #city < 1 then city = "Unknown" end

    if show_country_message and #country > 0 then

        local player_ranking = getRanking(cn)

        local normal_message = string.format(server.client_connect_message, server.player_displayname(cn), city, country, player_ranking)
        local admin_message = string.format(server.client_connect_admin_message, normal_message, server.player_ip(cn))

        for _, cn in ipairs(server.clients()) do

            local message = normal_message

            if server.player_priv_code(cn) >= server.PRIV_ADMIN then
                message = admin_message
            end

            server.player_msg(cn, message)
        end
    end
    local accounts = {}
    local line = ""

    local f = io.open("accounts.txt", "r")
    for _ in io.lines("accounts.txt") do
        line = f:read()
        accounts[#accounts] = line
    end
    local resnames = {}
    local curname  = {}
    local line = ""

    local _f = io.open("reserved_names.txt", "r")
    for _ in io.lines("reserved_names.txt") do
        line = _f:read()
        resnames[#resnames+1] = explode(" ", line)
    end
    _f:close()
    for item1,value1 in pairs(resnames) do
        curname = value1
        if server.player_displayname(cn) == curname[2] then
            server.setallowed(cn, false)
            server.requireverify(cn, true)
            server.player_msg(cn, "\f3>>> \f2[\f4INFO\f2] \f0You \f3are using a reserved name, please verify or change name.")
            server.sleep(5000, function()
                if not server.isallowed(cn) and server.player_displayname(cn) == curname[2] then
                    server.player_msg(cn, string.format("\f3>>> \f2[WARNING] \f3Please verify to use the name \f5'\f0%s\f5'\f3!", curname[2]))
                    server.sleep(5000, function()
                        if not server.isallowed(cn) and server.player_displayname(cn) == curname[2]  then
                            server.player_msg(cn, string.format("\f3>>> \f2[WARNING] \f3Please verify to use the name \f5'\f0%s\f5'\f3!", curname[2]))
                            server.sleep(5000, function()
                                if not server.isallowed(cn) and server.player_displayname(cn) == curname[2]  then
                                    server.player_msg(cn, string.format("\f3>>> \f2[\f3LAST\f4-\f2WARNING] \f3Please verify to use the name \f5'\f0%s\f5'\f3!", curname[2]))
                                    server.sleep(5000, function()
                                        if not server.isallowed(cn) and server.player_displayname(cn) == curname[2]  then
                                            server.disconnect(cn, 100, "Use of reserved name")
                                        end
                                    end)
                                end
                            end)
                        end
                    end)
                end
            end)
        end
    end
end

server.event_handler("connect",onConnect)
server.event_handler("maploaded", sendServerBanner)
server.event_handler("mapchange", function()
    for p in server.gclients() do
        p:vars().maploaded = nil
    end
end)
