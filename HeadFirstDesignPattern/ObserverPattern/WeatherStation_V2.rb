require 'Observer'

class WeatherData
    include Observable
    attr_accessor :time, :temperature, :huminity, :persure

    def meas_changed
        changed 
        notify_observers(self)
    end

    def set_meas(t, h, p)
        @time, @temperature, @huminity, @persure = Time.now, t, h, p
        meas_changed
    end
end

class CurrentStatusDisplay
    def initialize(subject)
        subject.add_observer(self)
    end
    
    def update(obj)
        puts "[1]#{obj.time}  Current conditions:#{obj.temperature} F degrees, and #{obj.huminity}% huminity."
    end
end

class HeatIndexDisp 
    def initialize(subject)
        subject.add_observer(self)
    end
    
    def update(obj)
        puts "[2]#{obj.time}  Heat index:#{(obj.temperature+obj.huminity+obj.persure)/3}."
    end
end

weatherData = WeatherData.new
currDisp = CurrentStatusDisplay.new(weatherData)
heatIndexDisp = HeatIndexDisp.new(weatherData)
puts "==observers : #{weatherData.count_observers}."
weatherData.set_meas(80, 65, 30.4)
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)
puts "====== delete one observer ======"
weatherData.delete_observer(heatIndexDisp)
puts "==observers : #{weatherData.count_observers}."
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)