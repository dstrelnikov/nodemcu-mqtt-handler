debugutils = {}

function debugutils.echo(object, message)
    mqttclient:publish(
            config.mqtt.prefix .. object.subtopic,
            message,
            0,
            0)
end

return debugutils
