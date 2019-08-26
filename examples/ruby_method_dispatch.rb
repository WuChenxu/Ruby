# encoding: utf-8
module A
    def foo; end
    def bar; end
end

module B
    def hello; end
    def bye; end
end

module C
    include B
    def start; end
    def stop; end
end

module D 
    include A 
    include C
end

#                                         +-----------+
#                                         | module B  |
#                                         +-----------+
#                                         | def hello |
#                                         | def bye   |
#                                         +-----------+
#                                               ^
# +-----------+                           +-----+-----+
# | module A  |                           | module C  |
# +-----------+                           +-----------+
# | def foo   |                           | def start |
# | def bar   |                           | def stop  |
# +-----------+                           +-----------+
#       ^                                       ^ 
#       +-------------------+-------------------+
#                           |
#                     +-----+-----+
#                     | module D  |
#                     +-----------+
# [C, B]
p C.ancestors
# [D, C, B, A]，method搜索的时候按照从前往后的顺序
p D.ancestors

# show all the instance methods（不含singleton）, 只对module或者class有用
p D.instance_methods(true)
# Returns an UnboundMethod representing the given instance method in mod.
# D(A)#foo
p D.instance_method(:foo)

class K
    include D 
end

k = K.new
p K.instance_methods
# empty
p k.singleton_methods
p k.method(:start)


def k.mart ; end
def B.roll ; end

p k.method(:mart)
p B.method(:roll)
p k.singleton_class.instance_method(:mart)
p k.singleton_methods