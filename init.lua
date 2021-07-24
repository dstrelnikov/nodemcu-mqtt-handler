illumination = require "illumination"
debugutils = require "debugutils"
config = require "config"
pwmcontrol = require "pwmcontrol"
mqtthandler = require "mqtthandler"
mqttclient = require "mqttclient"
app = require "app"
setup = require "setup"

print "Waiting 3 seconds..."
tmr.create():alarm(3000, tmr.ALARM_SINGLE, setup.startup)
