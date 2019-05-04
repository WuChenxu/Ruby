module Observable
    attr_accessor :observers

    def initialize
        @observers = []
    end

    def add_observer(o)
        @observers << o unless @observers.include?(o)
    end

    def delete_observer(o)
        @observers.delete(o) if @observers.include?(0)
    end

    def notify_observers
        @observers.each do |o| 
            o.update self
        end
    end
end

class Observer
    def update obj
        display obj
    end
end

class WeatherData 
    
    include Observable

    attr_accessor :temperature, :humidity, :presure

    def meas_changed
        notify_observers
    end

    def set_meas(temperature, humidity, presure)
        @temperature = temperature
        @humidity = humidity
        @presure = presure
        meas_changed
    end

end

class CurrentConditionDisplay < Observer
    def display obj
        puts "[1]Current conditions: #{obj.temperature} F degrees and #{obj.humidity}% humidity."
    end
end

class StatisticsDisplay < Observer
    attr_accessor :all_temperature
    def initialize
        super
        @all_temperature = []
    end

    def display obj
        @all_temperature << obj.temperature
        puts "[2]Avg/Max/Min temperature = #{all_temperature.sum/all_temperature.size}/#{all_temperature.max}/#{all_temperature.min}."
    end
end

# Formula reference http://www.srh.noaa.gov/images/ffc/pdf/ta_htindx.PDF
module HeatIndex

    # 
    # This method uses an approximation. 
    # Formula is described in http://www.srh.noaa.gov/images/ffc/pdf/ta_htindx.PDF
    #
    # ==== Attributes
    #
    # * +t+ - temperature in F
    # * +r+ - relative humidity
    # HI = c_1 + c_2 T + c_3 R + c_4 T R + c_5 T^2 + c_6 R^2 + c_7 T^2R + c_8 T R^2 + c_9 T^2 R^2
    # HI is heat index
    # c_1, c_2, c_3... are constants  
   
    def self.calculate(t, r)
      heat_index = -42.379 + 2.04901523*t + 10.14333127*r - 0.22475541*t*r - 6.83783*10**-3*t**2 - 5.481717*10**-2*r**2 +
          1.22874*10**-3*t**2*r + 8.5282*10**-4*t*r**2 - 1.99*10**-6*t**2*r**2
    end
    
end

class HeatIndexDisplay < Observer
    include HeatIndex
    def display obj
        puts "[3]Heat index is #{HeatIndex.calculate(obj.temperature, obj.humidity)}."
    end
    
end

weatherData = WeatherData.new
curDisp = CurrentConditionDisplay.new
statisticsDisp = StatisticsDisplay.new
heatDisp = HeatIndexDisplay.new
weatherData.delete_observer(heatDisp)
weatherData.add_observer(curDisp)
weatherData.add_observer(curDisp)
weatherData.add_observer(statisticsDisp)
weatherData.add_observer(heatDisp)

weatherData.set_meas(80, 65, 30.4)
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)

weatherData.delete_observer(heatDisp)
weatherData.set_meas(82, 70, 29.2)
weatherData.set_meas(78, 90, 29.2)



