first, second, third = ARGV

puts "The script is called:#{$0}"
print "who?"
#d = gets.chomp()
d = $stdin.gets.chomp()
puts "This is from your #{d}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

