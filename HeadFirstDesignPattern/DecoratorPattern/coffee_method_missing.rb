require_relative 'coffee_class.rb'

# refer to https://thoughtbot.com/blog/evaluating-alternative-decorator-implementations-in
module Decorator
    def initialize(component)
        @component = component
    end

    def method_missing(meth, *args)
        if @component.respond_to?(meth)
            @component.send(meth,  *args)
        else
            super
        end
    end

    def respond_to?(meth)
        @component.respond_to?(meth)
    end
end


# decorator
class Mocha < Beverage
    include Decorator
    
    def initialize(component)
        super
        @description =  @component.description + ", Mocha"
    end

    def cost
        0.20 + @component.cost
    end

end

class Milk < Beverage
    include Decorator

    def initialize(component)
        super 
        @description = component.description + ", Milk"
    end

    def cost
        0.40 + @component.cost
    end
end

class Whip < Beverage
    include Decorator

    def initialize(component)
        super
        @description = component.description + ", Whip"
    end

    def cost
        0.10 + @component.cost
    end

end

class Soy < Beverage
    include Decorator

    def initialize(component)
        super
        @description = component.description + ", Soy"
    end

    def cost
        0.15 + @component.cost
    end

end


