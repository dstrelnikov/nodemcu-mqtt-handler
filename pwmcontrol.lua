local pwmcontrol = {}

function pwmcontrol.initialize()
    for key, object in pairs(config.objects) do
        if object.pwmpins then
            for pin, initial_value in pairs(object.pwmpins) do
                pwm.setup(pin, config.pwm.freq, initial_value)
                pwm.start(pin)
            end
        end
    end
end

function pwmcontrol.set(pin, pwmvalue)
    pwm.setduty(pin, pwmvalue)
end

return pwmcontrol
