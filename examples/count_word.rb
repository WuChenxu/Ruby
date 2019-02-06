FILE_NAME = 'test.txt'

h = Hash.new
File.open(FILE_NAME) do |f|
    f.each_line do |line|
        words = line.split
        words.each do |word|
            if h.has_key?(word)
                h[word] += 1
            else
                h[word] = 1
            end
        end
    end
end

puts h
puts "======== words ========="

h.each do |key, value|
    puts "#{key} : #{value}" if key =~ /\w/
end
puts "======== character ========="

h.each do |key, value|
    puts "#{key} : #{value}" if key !~ /\w/
end


