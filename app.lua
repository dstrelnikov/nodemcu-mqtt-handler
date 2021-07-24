local app = {}

function app.start()
	print "Running application..."
	pwmcontrol.initialize()
	mqtthandler.createmap()
	mqttclient:connect(config.mqtt.broker)
end

return app
