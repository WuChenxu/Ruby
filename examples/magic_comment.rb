# encoding: utf-8
# -*- encoding: utf-8 -*-
# 1st encoding takes effect, other options:binary, US-ASCII, UTF-16LE, big5

# frozen_string_literal: true
# warn_indent: true
puts "current used encoding: #{__ENCODING__}"
puts Encoding.name_list.join(", ")

def func_a
    str = 'a'
    #str << 'b' #there will be a FrozenError
    p str
    p str.frozen?
  end 

func_a
