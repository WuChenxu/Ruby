require_relative 'coffee_class.rb'

# all the condiments as decorator class
class CondimentDecorator < Beverage
    attr_reader :beverage
    def initialize(b)
        raise "virtual class"
    end

end

# decorator, need to hold the object be decorated
class Mocha < CondimentDecorator

    def initialize(beverage)
        @beverage = beverage
        @description = beverage.description + ", Mocha"
    end

    def cost
        0.20 + @beverage.cost
    end
end

class Milk < CondimentDecorator

    def initialize(beverage)
        @beverage = beverage
        @description = beverage.description + ", Milk"
    end

    def cost
        0.40 + @beverage.cost
    end
end

class Whip < CondimentDecorator
    def initialize(beverage)
        @beverage = beverage
        @description = beverage.description + ", Whip"
    end

    def cost
        0.10 + @beverage.cost
    end

end

class Soy < CondimentDecorator
    def initialize(beverage)
        @beverage = beverage
        @description = beverage.description + ", Soy"
    end

    def cost
        0.15 + @beverage.cost
    end

end
