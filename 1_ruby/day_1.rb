sentence = 'Hello, Ruby'
puts sentence

def find_word(string, word)
  str_idx = 0
  wrd_idx = 0
  res = nil
  while wrd_idx < word.length() && str_idx < string.length()
    if string[str_idx] == word[wrd_idx]
      res = str_idx
      wrd_idx += 1
    else
      res = nil
      wrd_idx = 0
    end
    str_idx += 1
  end
  return (res + 1 - word.length())
end

def find_word_regex(string, word)
  return (string =~ /#{word}/)
end

ruby_idx = find_word_regex(sentence, 'Ruby')

puts "Word Ruby starts at index #{ruby_idx}"


# Using inclusive range (From 1 to 3, 3 included)
(1..3).each do |n|
  puts n
end

# Using exclusive range (From 0 to 4, 5 excluded)
puts sentence[0...5]