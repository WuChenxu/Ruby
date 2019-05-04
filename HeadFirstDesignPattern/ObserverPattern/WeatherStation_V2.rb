require 'Observer'

class WeatherData
    include Observable
    attr_accessor :temperature, :huminity, :persure

    def meas_changed
        changed 
        notify_observers(Time.now, @temperature, @huminity, @persure)
    end

    def set_meas(t, h, p)
        @temperature, @huminity, @persure = t, h, p
        meas_changed
    end
end

class CurrentStatusDisplay
    def initialize(subject)
        subject.add_observer(self)
    end
    
    def update(time, t, h, p)
        puts "[1]#{time}  Current conditions:#{t} F degrees, and #{h}% huminity."
    end
end

class HeatIndexDisp 
    def initialize(subject)
        subject.add_observer(self)
    end
    
    def update(time, t, h, p)
        puts "[2]#{time}  Heat index:#{(t+h+p)/3}."
    end
end

weatherData = WeatherData.new
currDisp = CurrentStatusDisplay.new(weatherData)
heatIndexDisp = HeatIndexDisp.new(weatherData)
weatherData.set_meas(80, 65, 30.4)
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)
puts "====== delete one observer ======"
weatherData.delete_observer(heatIndexDisp)
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)