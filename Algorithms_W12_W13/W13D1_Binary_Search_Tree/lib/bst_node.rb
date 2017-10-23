class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end

  def insert(new_val)
    if new_val > @value
      if @right
        @right.insert(new_val)
      else
        @right = BSTNode.new(new_val)
        @right.parent = self
      end
    elsif new_val <= @value
      if @left
        @left.insert(new_val)
      else
        @left = BSTNode.new(new_val)
        @left.parent = self
      end
    end
  end

end
