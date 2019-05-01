require_relative 'Duck'

class RedHeadDuck < Duck
    def initialize(quack_behavior = Quack.new, fly_behavior = FlyWithWings.new)
        super
        @quack_behavior = quack_behavior
        @fly_behavior = fly_behavior
    end

    def display
        puts "I am a real red head duck."
    end
end