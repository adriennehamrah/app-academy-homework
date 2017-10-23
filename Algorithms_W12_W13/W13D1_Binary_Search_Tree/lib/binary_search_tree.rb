# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      @root.insert(value)
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?

    case value <=> tree_node.value
    when 0
      return tree_node
    when -1
      return find(value, tree_node.left)
    when 1
      return find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value)
    children = count_children(node)

    if children.zero?
      delete_parent(node)
    elsif children == 1
      delete_parent(node)
      parent node.parent

    elsif children == 2
      delete_parent(node)
    end



  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def self.count_children(node)
    if node.left.nil? && node.right.nil?
      0
    elsif (node.left.nil? && node.right) || (node.right.nil? && node.left)
      1
    else
      2
    end
  end

  def self.delete_parent(node)
    parent = node.parent
    if parent.nil?
      @root = nil
    else
      parent.left == node ? parent.left = nil : parent.right = nil
    end
  end
end
