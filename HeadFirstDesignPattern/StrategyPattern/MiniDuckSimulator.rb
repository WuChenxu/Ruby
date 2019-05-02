require_relative 'Duck/RedHeadDuck'
require_relative 'QuackBehavior/Quack.rb'
require_relative 'QuackBehavior/Squeak'
require_relative 'FlyBehavior/FlyWithWings'
require_relative 'Duck/ModelDuck'

red_head = RedHeadDuck.new
red_head.display
red_head.swim
red_head.perform_quack
red_head.perform_fly

puts "==== model duck ===="
model_duck = ModelDuck.new
model_duck.display
model_duck.perform_quack
model_duck.perform_fly

puts "==== make a runtime change ===="
puts model_duck.to_s

model_duck.fly_behavior = FlyRocketPowered.new
model_duck.quack_behavior = Squeak.new

puts model_duck.to_s

model_duck.perform_quack
model_duck.perform_fly

puts "==== init a duck with behavior ===="
new_duck = ModelDuck.new(Squeak.new, FlyWithWings.new)
new_duck.display
new_duck.perform_fly
new_duck.perform_quack

puts model_duck.to_s

model_duck.fly_behavior = FlyNoWay.new
model_duck.quack_behavior = Squeak.new

puts model_duck.to_s

new_duck.perform_fly
new_duck.perform_quack



