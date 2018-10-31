#/bin/ruby 
if ARGV[0] && ARGV[1]
    filename, pattern = ARGV
else
    puts "usage: #{__FILE__} filename pattern"
    exit(0)
end

File.open(filename, 'r') do |f|
    f.each_line { |line| puts "#{f.lineno}  #{line}" if /#{pattern}/.match(line)}
end
