begin
    puts "try to open file"
    f = open('testensure.txt')
rescue
    puts "exec rescue"
ensure
    puts "exec ensure"
    f.close
end
