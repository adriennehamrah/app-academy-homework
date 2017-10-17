require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    return @store[index] if @store[index]
    raise "index out of bounds"
  end

  # O(1)
  def []=(index, value)
    if index.between?(0, @capacity - 1)
      @store[index] = value
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0

    popped_el = @store[@length - 1]
    @store = @store[0...-1]
    @length -= 1

    popped_el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.resize! if @length == @capacity

    @store[@length] = val
    @length += 1

    val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0

    shifted_el = @store[0]

    i = 0
    until i == @length
      @store[i] = @store[i + 1]
      i += 1
    end
    @length -= 1

    shifted_el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.resize! if @length == @capacity

    i = 0
    until i == @length
      @store[@length - i] = @store[@length - 1 - i]
      i += 1
    end

    @store[0] = val
    @length += 1

    val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  # def check_index(index)
  # end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    newstore = StaticArray.new(@capacity)
    i = 0
    until i == @length
      newstore[i] = @store[i]
      i += 1
    end
    @store = newstore
  end

end
