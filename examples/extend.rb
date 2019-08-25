dice = Object.new
def dice.each
    10.times do 
        yield rand(6)+1
    end
end

dice.extend(Enumerable)

p dice.reject{|x| x<=3}

