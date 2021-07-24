illumination = {}

function illumination.setbrightness(object, message)
    -- object: a table from config corresponding to a certain object
    -- message: receved via MQTT message as a string
    value = tonumber(message)

    if value and (value >= 0) and (value <= 100) then
        for pin, initial_value in pairs(object.pwmpins) do
            pwmcontrol.set(pin, math.floor(10.23 * value))
        end
    else
        mqttclient:publish(
            config.mqtt.prefix .. config.mqtt.debug_topic,
            tostring(tmr.now()) .. " " .. config.mqtt.clientid .. ": " .. message .. " is not a valid value for " .. config.mqtt.prefix .. object.subtopic,
            0,
            0)
    end
end

return illumination
