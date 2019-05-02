require_relative '../QuackBehavior/QuackMute'
require_relative '../QuackBehavior/Quack'
require_relative '../FlyBehavior/FlyNoWay'
require_relative '../FlyBehavior/FlyWithWings'
require_relative '../FlyBehavior/FlyRocketPowered'


class Duck
    attr_accessor :quack_behavior
    attr_accessor :fly_behavior
    
    def initialize(quack_behavior = QuackMute.new, fly_behavior = FlyNoWay.new)
        @quack_behavior = quack_behavior
        @fly_behavior = fly_behavior
    end

    def swim
        puts "All ducks float, even decoys!"
    end
    
    def display
        raise "I am a virtual method."
    end

    def perform_quack
        @quack_behavior.quack
    end

    def perform_fly
        @fly_behavior.fly 
    end

    def to_s
        "quack=> #{@quack_behavior}, fly=> #{@fly_behavior}"
    end

end

