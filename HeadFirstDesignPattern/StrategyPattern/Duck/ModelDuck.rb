require_relative 'Duck'

class ModelDuck < Duck
    def initialize(quack_behavior = QuackMute.new, fly_behavior = FlyNoWay.new)
        super
        @quack_behavior = quack_behavior
        @fly_behavior = fly_behavior
    end

    def display
        puts "I am a model duck."
    end
end