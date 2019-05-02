module FlyWithWings 
    def fly
        puts "I'm flying!"
    end
end

module FlyNoWay 
    def fly
        puts "I can't fly."
    end
end

module Quack 
    def quack
        puts "Quack"
    end
end

module MuteQuack 
    def quack
        puts "<< Silence >>"
    end
end

module Squeak 
    def quack
        puts "Squeak"
    end
end

class Duck 
    def swim
        puts "All ducks float, even decoys!"
    end
end

class MallardDuck < Duck
    include FlyWithWings
    include Quack
    def display
        puts "I'm a real Mallard Duck"
    end
end

class ModelDuck < Duck
    include FlyNoWay
    include Quack
    def display
        puts "I'm a model duck"
    end
end

module FlyRocketPowered
    def fly
        puts "I'm flying with a rocket!" 
    end
end  


model = ModelDuck.new
model.fly # => "I can't fly."
model.extend(FlyRocketPowered)
model.fly # => "I'm flying with a rocket!"