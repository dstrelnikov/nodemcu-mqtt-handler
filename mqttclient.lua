local function event_connect(client)
    print "Connected to MQTT broker"

    client:subscribe(
        mqtthandler.topics,
        function(conn)
            print "Subscribed to:"
            for topic, qos in pairs(mqtthandler.topics) do
                print("\t" .. topic .. " (qos=" .. qos .. ")")
            end
        end
    )

end

local function event_connfail(client, reason)
    print ("Connection to MQTT broker failed:", reason)
end

local function event_offline(client, reason)
    print "Diconnected from MQTT broker"
end

local function event_message(client, topic, message)
    print("received :: " .. topic .. " " .. message)
    -- if the message was received there exists a handler for it
    mqtthandler.map[topic](message)
end


local events = {
    connect = event_connect,
    connfail = event_connfail,
    offline = event_offline,
    message = event_message,
}


mqttclient = mqtt.Client(config.mqtt.clientid, 120)


for event, callback in pairs(events) do
    mqttclient:on(event, callback)
end

return mqttclient
