# count word 
count = Hash.new(0)

File.open(ARGV[0]) do |f|
    f.each_line do |line|
        words = line.split
        words.each do |word|
            count[word] += 1
        end
    end
end

# output result
count.sort_by{|item|
    -item[1]
}.each do |key, value|
    puts "#{key}    #{value}"
end
