require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    if index.between?(0, @length - 1)
      return @store[ (@start_idx + index) % @capacity ]
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def []=(index, val)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0

    popped_el = @store[@start_idx + @length - 1]
    @length -= 1

    popped_el
  end

  # O(1) ammortized
  def push(val)
    self.resize! if @length == @capacity

    @store[@start_idx + @length] = val
    @length += 1

    val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0

    shifted_el = @store[start_idx]
    @start_idx = @start_idx + 1
    @length -= 1

    shifted_el
  end

  # O(1) ammortized
  def unshift(val)
    self.resize! if @length == @capacity

    @store[(@start_idx - 1) % @capacity] = val
    @length += 1
    @start_idx -= 1

    val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  # def check_index(index)
  # end

  def resize!
    newstore = StaticArray.new(@capacity * 2)
    i = 0
    until i == @length
      newstore[i] = @store[(i + @start_idx) % @capacity]
      i += 1
    end
    @start_idx = 0
    @store = newstore
    @capacity *= 2
  end
end
