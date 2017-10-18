class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    step_1 = self.map(&:hash)

    step_2 = step_1.map.with_index do |el, idx|
      el^idx
    end

    step_2.reduce(:*).hash
  end
end

class String
  def hash
    self.chars.map{ |ch| ch.ord.hash }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort.hash
  end
end
