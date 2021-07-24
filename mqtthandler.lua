mqtthandler = {}

function mqtthandler.createmap()
    mqtthandler.map = {}
    mqtthandler.topics = {}
    for key, object in pairs(config.objects) do
        print(key .. ":: assigned a handler for:")
        subtopic = config.mqtt.prefix .. object.subtopic
        qos = object.qos
        for key, handler in pairs(object.handlers) do
            topic = subtopic .. '/' .. key
            mqtthandler.topics[topic] = qos
            mqtthandler.map[topic] = function(message) handler(object, message) end
            print("\t" .. topic)
        end
    end
end

return mqtthandler
