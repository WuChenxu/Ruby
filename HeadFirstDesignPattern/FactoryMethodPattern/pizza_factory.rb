class Pizza
    attr_accessor :name, :dough, :sauce, :toppings
    def initialize
        @toppings = Array.new
        raise 'abstract class pizza'
    end

    def pepare
        puts "Peparing " + @name
        puts "Tossing dough..."
        puts "Adding source..."
        @toppings.each {|i| puts i}
    end

    def bake
        puts "Bake for 25 minutes at 350."
    end

    def cut
        puts "Cutting the pizza into diagonal slices."
    end

    def box
        puts "Place pizza in official PizzaStore box."
    end

    def get_name
        @name
    end
end

class NYStyleCheesePizza < Pizza
    def initialize
        @name = "NY Style Sauce and Cheese Pizza"
        @dough = "Thin Crust Dough"
        @sauce = "Marinara Sauce"
        @toppings = [] << "Grated Reggiano Cheese"
    end
end

class ChicagoStyleCheesePizza < Pizza
    def initialize
        @name = "Chicago Style Deep Dish Cheese Pizza"
        @dough = "Extra Thick Crust Dough"
        @sauce = "Plum Tomato Sauce"
        @toppings = []
        @toppings << "Shredded Mozzarellla Cheese"
    end

    def cut
        puts "Cutting the pizza into square slices"
    end

end

class PizzaStore
    def order_pizza(type)
        pizza = create_pizza(type)
        pizza.pepare
        pizza.bake
        pizza.cut
        pizza.box
        pizza
    end
    
    def create_pizza(type)
        raise "abstract class PizzaStore."
    end
end

class NYPizzaStore < PizzaStore
    def create_pizza(type)
        case type
        when  "cheese"
            NYStyleCheesePizza.new
        when "veggie"
            NYStyleVeggiePizza.new
        when "clam"
            NYStyleClamPizza.new
        when "pepperoni"
            NYStylePepproniPizza.new
        else
            raise 'error pizza type'
        end
    end
end

class ChicagoPizzaStore < PizzaStore
    def create_pizza(type)
        case type
        when "cheese"
            ChicagoStyleCheesePizza.new
        else
            raise 'error pizza type'
        end
    end
end


nyStore = NYPizzaStore.new
chicagoStore = ChicagoPizzaStore.new
pizza = nyStore.order_pizza("cheese")
puts "Ethan ordered a #{pizza.get_name}"
pizza = chicagoStore.order_pizza("cheese")
puts "Joel ordered a #{pizza.get_name}"
