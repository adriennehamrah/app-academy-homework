class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.next.prev = self.prev if self.next
    self.prev.next = self.next if self.prev
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    idx = 0
    self.each do |node|
      return node if idx == i
      idx += 1
    end

    nil
  end

  def first
    self.empty? ? nil : @head.next
  end

  def last
    self.empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    self.any? { |node| node.key == key }
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node

    node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end

    nil
  end

  def each
    current = @head.next
    until current == @tail
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
