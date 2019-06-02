require 'Singleton'

class SingleClass
    include Singleton
end

threads = []
instances = []
(1..100).each do
    threads << Thread.new{
        class1 = SingleClass.instance
        instances << class1
    }
end



threads.each {|i| i.join}
if instances.uniq.size == 1
    puts "thread safe!!!!"
    puts "unique instance #{instances[0]}" 
else
    puts "thread unsafe!!!!!!"
    puts instances.uniq
end


