# code block and yield
class Integer
    def my_times
        i = self
        while i > 0
            i -= 1
            puts "mytimes.#{i}"
            yield
        end
    end
end

3.times {puts "times"}
3.my_times {puts "my_times"}


# class
class Tree
    attr_accessor :children, :node_name
    
    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
puts "visiting a node."
ruby_tree.visit {|node| puts node.node_name}
puts 

puts "visitiong entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


# Mixin
module ToFile
    def filename
        "object_#{self.object_id}.txt"
    end

    def to_f
        File.open(filename, 'w') {|f| f.write(to_s)}
    end
end

class Person
    include ToFile
    attr_accessor :name

    def initialize(name)    
        @name = name
    end

    def to_s
        name
    end
end

#Person.new('matz').to_f




# print array
arr = %w(a b c e f g h i j h k l m n o p)
arr[0..3].each {|a| print "#{a} ---"}
puts
arr[4..7].each {|a| print "#{a} ---"}
puts
arr[8..11].each {|a| print "#{a} ---"}
puts
arr[12..15].each {|a| print "#{a} ---"}
puts

arr.each_slice(4) { |s| puts s.join(" ---")}



