require_relative 'QuackBehavior'

class QuackMute < QuackBehavior
    def quack
        puts "<< Silence >>"
    end
end