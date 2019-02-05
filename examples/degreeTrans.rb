module Degree
    def cels2fahr
        self.to_f * 9 / 5 + 32
    end

    def fahr2cels
        (self.to_f - 32) * 5 /9
    end  
end

class Float
    include Degree
end

class Integer
    include Degree
end

class String 
    include Degree
end

puts 1.cels2fahr.fahr2cels
puts 1.0.fahr2cels.cels2fahr
(1..100).each do |i|
    printf("%3d fahr = %3.1f cels\n", i, i.fahr2cels)
end