def extent
    n = 0
    #lambda {
    -> {
        n += 1
        printf "n=%d\n", n
    }
end

extent.call
f = extent
f.call
f.call
f.()