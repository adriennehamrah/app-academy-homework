require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  counter = HashMap.new(string.length)

  string.each_char do |ch|
    if counter[ch]
      count = counter[ch]
    else
      count = 0
    end
    counter[ch] = count + 1
  end

  odds = 0
  counter.each do |key, val|
    odds += 1 if val.odd?
  end

  return true if odds.between?(0, 1)

  false
end
