require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == "english"

open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)}
}

def craft_names(rand_words, snippet, pattern, caps=false)
  p "craft_names:1--#{rand_words}, 2---#{snippet}, 3---#{pattern}"
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    caps ? word.capitalize : word
  end
  puts "in craft_names #{names *2}"
  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  p "craft_params:1--#{rand_words}, 2---#{snippet}, 3---#{pattern}"
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) + 1
    params = (0...param_count).map {|x| rand_words.pop() }
    params.join(', ')
  end

  puts "in craft_params #{names *2}"
  return names * 2
end

def convert(snippet, phrase)
  p "snippet=#{snippet}, phrase=#{phrase}"
  rand_words = WORDS.sort_by {rand}
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  puts "class_names = #{class_names}"
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  puts "other_names = #{other_names}"
  param_names = craft_params(rand_words, snippet, /@@@/)
  puts "param_names = #{param_names}"
  results = []

  [snippet, phrase].each do |sentence|
    puts "sentence=#{sentence}"
    # fake class names, also copies sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }
puts "0-------#{result}"
    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }
puts "1-------#{result}"
    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop }
puts "2-------#{result}"
    results.push(result)
  end
puts "3-------#{results}"
  return results
end

# keep going until they hit CTRL-D
loop do
  snippets = PHRASES.keys().sort_by {rand}
  puts "snippets = #{snippets}"
  for snippet in snippets
    phrase = PHRASES[snippet]
    question, answer = convert(snippet, phrase)
    puts "question=#{question}, answer=#{answer}."

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER:  %s\n\n" % answer
  end
end
