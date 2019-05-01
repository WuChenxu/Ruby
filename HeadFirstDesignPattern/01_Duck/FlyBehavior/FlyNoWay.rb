require_relative 'FlyBehavior'

class FlyNoWay < FlyBehavior
    def fly 
        puts "I can't fly."
    end
end
