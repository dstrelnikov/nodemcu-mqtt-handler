NodeMCU: MQTT handler
===================================

A [NodeMCU](https://nodemcu.readthedocs.io/) app implementing control over verious devices such as LEDs, motors, fans, etc via MQTT.

License: [MIT](https://mit-license.org/)

## Features
- declare devices and their features in the config file
- assign functions to process messagess addressed to a certain device (handlers)


## Usage

Adjust the config file to your needs: Wi-Fi network, MQTT broker IP, MQTT client ID, etc. Declare devices in the config file according to the following example:

```lua
config.objects.example = {
    pwmpins = {[1] = 0, [2] = 0, [3] = 0}, -- {pin_no = initial_value}
    subtopic = "/example",
    qos = 0,
    -- handlers must be a flat table
    handlers = {
        feature_1 = handler_1, -- handler is a function of (object, message)
        feature_2 = handler_2
    }
}
```

Implement more handlers for your devices if neccessary and import them in `init.lua`.


## TODO
- [ ] add telnet server for debugging
- [ ] implement OTA updates
