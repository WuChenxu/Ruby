require 'test/unit'
if ARGV[0] == '1'
    require_relative 'coffee_method_missing.rb'
    puts "testing coffee_method_missing.rb"
else
    require_relative 'coffee_plain_old_ruby_object.rb' 
    puts "testing coffee_plain_old_ruby_object.rb"
end


class TestOrderCoffee < Test::Unit::TestCase
    puts "=========== welcome to StarBuzzCoffee ========="
    def test_espresso
        # order one Espresso, no condiments
        espresso = Espresso.new
        assert_equal("#{espresso.description} $#{espresso.cost}", 'Espresso $1.99')
    end

    def test_darkroast_mocha_mocha_whip

        # new DarkRoast object
        component2 = DarkRoast.new
        # use Mocha to decorate
        component2 = Mocha.new(component2)
        # decorate again
        component2 = Mocha.new(component2)
        # decorate again
        component2 = Whip.new(component2)
        assert_equal("#{component2.description} $#{component2.cost}", 'Dark Roast Coffee, Mocha, Mocha, Whip $1.49')
    end

    def test_houseblen_soy_mocha_whip
        # new HouseBlend 
        component3 = Whip.new(Mocha.new(Soy.new(HouseBlend.new)))
        assert_equal("#{component3.description} $#{component3.cost}", 'House Blend Coffee, Soy, Mocha, Whip $1.34')
    end
end


    

    



