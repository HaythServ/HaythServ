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
    if (div=='') then return false end
    local pos,arr = 0,{}
    for st,sp in function() return string.find(str,div,pos,true) end do
        table.insert(arr,string.sub(str,pos,st-1))
        pos = sp + 1
    end
    table.insert(arr,string.sub(str,pos))
    return arr
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

        if server.player_ranking then
            player_ranking = server.player_ranking(server.player_name(cn))
        end
        if not player_ranking then
            player_ranking = "Unknown"
        end

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


