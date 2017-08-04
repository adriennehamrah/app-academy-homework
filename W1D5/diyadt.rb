class Stack
  def initialize
    @stack = []
  end

  def add(*el)
    @stack.concat(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    index = @map.index { |pair| pair[0] = key }
    index ? @map[index][1] = val : @map << [key, val]
    [key, val]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
