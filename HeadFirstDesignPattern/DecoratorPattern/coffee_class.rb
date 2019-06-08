
# abstract class
class Beverage
    attr_reader :description

    def initialize
        raise "virtual class."
    end
end

class Espresso < Beverage

    def initialize
        @description = "Espresso"
    end

    def cost
        1.99
    end
end

class HouseBlend < Beverage
    def initialize
        @description = "House Blend Coffee"
    end

    def cost
        0.89
    end
end

class DarkRoast < Beverage
    def initialize
        @description = "Dark Roast Coffee"
    end

    def cost
        0.99
    end

end