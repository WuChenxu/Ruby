class Integer
    def prime?
        return false if self == 1
        (2..self/2).each do |i|
            return false if self % i == 0
        end
        return true
    end
end


