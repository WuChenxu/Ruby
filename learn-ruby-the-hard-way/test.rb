def sum(arg1, arg2)
    total = arg1 + arg2
    puts "Inside the function: #{total}."
    return total
end

puts "1+2=%{first}" %{first: sum(1,2)}

unless true
    puts "the value is false"
else
    puts "the value is true"
end

class String
    def is_i?
        p self
        puts self
       # /\A[-+]?\d+\z/ === self
        /\A[-+]?\d+\z/.match?(self)
        
    end
end

print "input an number:"
num = $stdin.gets.chomp
puts "you entered: #{num}"
num_i = num.is_i?
puts num_i
if num_i
    puts "this is a number!"
else
    puts "This is not a num!"
end
