=begin
if ARGV.length > 0
    ARGV.each do |filename|
        puts File.read(filename)
    end
else
    puts $stdin.gets
end
=end
# can hadle command line like: echo "hello" | ruby argf.rb file1 - file2
#puts ARGF.read

=begin
p ARGF.file
p ARGF.read
p ARGF.file
p ARGF.read
p ARGF.file

ARGF.each do |line|
    puts "\n#{ARGF.filename}: " if ARGF.file.lineno == 1
    puts line
end
=end

ARGF.each_line do |line|
    puts line
end
