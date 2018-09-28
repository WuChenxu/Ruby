# set cars as 100
cars = 100
# set space_in_a_car as 4.0
space_in_a_car = 4.0
# set drivers as 30
drivers = 30
# set passengers as 90
passengers = 90
# set cars_not_driven as cars minus drivers
cars_not_driven = cars - drivers
# set cars_driven as drivers
cars_driven = drivers
# set carpool_capacity as cars_driven multiple space_in_a_car
carpool_capacity = cars_driven * space_in_a_car
# set average_passengers_per_car = passengers / cars_driven
average_passengers_per_car = passengers / cars_driven

puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."

