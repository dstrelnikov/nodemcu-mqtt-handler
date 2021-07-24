local setup = {}

local wifi_connect_event = function(T)
    print("Connection to AP("..T.SSID..") established!")
    print("Waiting for IP address...")
    if disconnect_ct ~= nil then disconnect_ct = nil end
end

local wifi_got_ip_event = function(T)
    print("Wifi connection is ready! IP address is: "..T.IP)
    app.start()
end

local function register_wifi_events()
    print "Registering Wi-Fi events..."
    wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, wifi_connect_event)
    wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, wifi_got_ip_event)
    wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, wifi_disconnect_event)
end

local function connect()
    print("Connecting to Wi-Fi access point...")
    wifi.setmode(wifi.STATION)
    wifi.sta.config(config.station_config)
end

-- starting the main application fail-safe to avoid a PANIC loop in init.lua
function setup.startup()
    print "Fail-safe startup..."
    if file.open "init.lua" == nil then
        print("init.lua deleted or renamed")
    else
        file.close "init.lua"
        register_wifi_events()
        connect()
    end
end

return setup
