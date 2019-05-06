class Singleton

    @@unique_instance = Singleton.new

    def self.instance
        @@unique_instance
    end
    # make the class constructor :new as private, should put below
    private_class_method :new
end

threads = []
instances = []
(1..100).each do
    threads << Thread.new{
        class1 = Singleton.instance
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





