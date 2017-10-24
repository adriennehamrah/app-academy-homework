def in_order_traversal_iteratively(tree_node = @root, stack = [])
  # saves space

  # 1. create an empty stack
  # 2. initialize current node as root
  # 3. push current into stack, set current = current.left until current.nil?
  # 4. if current.nil? and stack is not empty
  #     1. pop top item from stack and print
  #     2. set current to popped item.right
  #     3. go back to step 3
  # 5. if current.nil? and stack.empty? then we are done

  curr_node = tree_node
  stack << curr_node
  until curr_node.nil?
    curr_node = curr_node.left
  end

  if curr_node.nil? && !stack.empty?
    print popped = stack.pop
    curr_node = popped.right
  end
end
