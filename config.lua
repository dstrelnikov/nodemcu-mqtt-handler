local config = {}

config.station_config = {
    ssid = " ",
    pwd = " ",
    auto = true,
    save = false,
}

config.mqtt = {
    clientid = "nodemcu",
    broker = "192.168.178.2",
    prefix = "nodemcu",
    debug_topic = "/debug"
}

config.objects = {}

config.objects.led_warm = {
    pwmpins = {[1] = 0},
    subtopic = "/led_warm",
    qos = 0,

    handlers = {
        brightness = illumination.setbrightness
    }
}

config.objects.led_cold = {
    pwmpins = {[2] = 0},
    subtopic = "/led_cold",
    qos = 0,
    handlers = {
        brightness = illumination.setbrightness
    }
}

config.objects.led_builtin = {
    pwmpins = {[4] = 0},
    subtopic = "/led_builtin",
    qos = 0,
    handlers = {
        brightness = illumination.setbrightness,
    }
}

config.objects.debugger = {
    subtopic = "/debugger",
    qos = 0,
    handlers = {
        echo = debugutils.echo
    }
}


config.pwm = {}
config.pwm.freq = 1000
-- transition time from 0 to 100% brightness in seconds
config.pwm.transition_time = 1  -- not used yet

return config
