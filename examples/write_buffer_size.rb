filename = 'test.txt'
File.open(filename, 'w') do |file|
    loop do
        file.write('a')
        buf_size = File.size(filename) 
        if buf_size > 0
            puts "The current write buffer size is #{buf_size}(#{buf_size/1024}KB)"  
            return 
        end
    end
end


    