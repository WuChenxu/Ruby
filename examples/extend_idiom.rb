module Foo
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def bar
            puts 'class method'
        end

        def instance_methods
            include InstanceMethods
        end
    end

    def foo
        puts 'instance method'
    end

    module InstanceMethods
        def hello
            puts "hello"
        end

        def world
            puts "world"
        end
    end
end

class Baz
    include Foo
    instance_methods
end

Baz.bar # class method
Baz.new.foo # instance method
m = Baz.new
m.hello
m.world
#Baz.foo # NoMethodError: undefined method ‘foo’ for Baz:Class
#Baz.new.bar # NoMethodError: undefined method ‘bar’ for #<Baz:0x1e3d4>