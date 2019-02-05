
def dice
    srand(Time.now.to_i + (1..100).to_a.sample)
    rand(1..6)
end

def dice10
    (1..10).map { dice}
end

p dice10

    