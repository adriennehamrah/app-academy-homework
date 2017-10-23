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

    nil
  end

  def delete(value)
    node = find(value)
    children = get_children(node)

    if children.empty?
      delete_parent_link(node)
    elsif children.length == 1
      children
      update_parent(children[0], node.parent)
    elsif children.length == 2
      max_node = maximum(node.left)
      max_node_children = get_children(max_node)
      update_parent(max_node, node.parent)

      unless max_node_children.empty?
        update_parent(max_node_children[0], max_node.parent)
      end
    end

    node
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    tree_node.right ? maximum(tree_node.right) : tree_node
  end

  def depth(tree_node = @root)
    return nil if tree_node.nil?

    if tree_node.left
      left_depth = 1 + depth(tree_node.left)
    else
      left_depth = 0
    end

    if tree_node.right
      right_depth = 1 + depth(tree_node.right)
    else
      right_depth = 0
    end

    [left_depth, right_depth, 0].max
  end

  def is_balanced?(tree_node = @root)
    return true unless tree_node

    if tree_node.left
      left_depth = depth(tree_node.left)
    else
      left_depth = 0
    end

    if tree_node.right
      right_depth = depth(tree_node.right)
    else
      right_depth = 0
    end

    return false if (left_depth - right_depth).abs > 1
    return false unless is_balanced?(tree_node.left)
    return false unless is_balanced?(tree_node.right)

    true
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?

    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
  end

  private
  def get_children(node)
    if node.left.nil? && node.right.nil?
      []
    elsif node.left.nil? && node.right
      [node.right]
    elsif node.right.nil? && node.left
      [node.left]
    else
      [node.left, node.right]
    end
  end

  def delete_parent_link(node)
    parent = node.parent
    if parent.nil?
      @root = nil
    else
      parent.left == node ? parent.left = nil : parent.right = nil
    end
  end

  def update_parent(node, parent)
    # update parent's link to child node
    if parent.nil?
      @root = node
    else
      parent.left ? parent.right = node : parent.left = node
    end

    #update child node's link to parent
    node.parent = parent
  end
end
