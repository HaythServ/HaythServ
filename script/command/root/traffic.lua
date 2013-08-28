-- (C) 2010 by Thomas
-- Player command to see how much traffic the server caused
--
-- (C) 2013 by ~Haytham
-- Improved very much, it's like a little rewrite ;)

return function(cn, option1)
    local t_in, t_out, t_sum

    local function set_traffic()
        t_in = server.rx_bytes
        t_out = server.tx_bytes
        t_sum = t_in + t_out
    end

    local function do_traffic(input)
        local output = input
        if input >= 1024 then
            output = math.round((input/1024), 2)
        end
        if output >= 1024 then
            output = math.round((output/1024), 2)
        end
        if output >= 1024 then
            output = math.round((output/1024), 2)
        end
        if output >= 1024 then
            output = math.round((output/1024), 2)
        end
        return output
    end

    local function do_traffic_size(input)
        local size = "B"
        local output
        if input >= 1024 then
            output = math.round((input/1024), 2) 
            size = "KB"
        end
        if output >= 1024 then
            output = math.round((output/1024), 2)
            size = "MB"
        end
        if output >= 1024 then
            output = math.round((output/1024), 2)
            size = "GB"
        end
        if output >= 1024 then
            size = "TB"
        end
        return size
    end

    set_traffic()

    server.player_msg(cn, string.format(
    "Used Traffic => IN: %d%s OUT: %d%s SUM: %d%s", 
        do_traffic(t_in), do_traffic_size(t_in),
        do_traffic(t_out), do_traffic_size(t_out),
        do_traffic(t_sum), do_traffic_size(t_sum)
    ))

    local function do_speed(input)
        local output = input
        if input >= 1024 then
            output = math.round((input/1024), 2)
        end
        return output
    end

    local function do_speed_size(input)
        local size = "KB"
        if input >= 1024 then
            size = "MB"
        end
        return size
    end

    local function print_speed()
        if not server.valid_cn(cn) then return end
        local tmp_in  = math.round((server.rx_bytes/1024) - do_speed(t_in), 2)
        local tmp_out = math.round((server.tx_bytes/1024) - do_speed(t_out), 2)
        local tmp_sum = tmp_in + tmp_out
        server.player_msg(cn, string.format(
        "Traffic Speed => IN: %d%s/s OUT: %d%s/s SUM: %d%s/s", 
            do_speed(tmp_in), do_speed_size(tmp_in),
            do_speed(tmp_out), do_speed_size(tmp_out),
            do_speed(tmp_sum), do_speed_size(tmp_sum)
        ))   
        
        set_traffic()
    end

    if not option1 then
        option1 = "-t5"
    end

    local bob = string.sub(option1, 1, -2)

    if bob == "--times" then
        option1 = string.sub(option1, 8)
    else
        option1 = string.sub(option1, 3)
    end

    local times = tonumber(option1)

    if not times then
        times = 5
    end

    for i = 1,times do
        server.sleep(i*1000, print_speed)
    end
end, "", readman("traffic"), { "traffic_usage", "traffic_monitor" }
