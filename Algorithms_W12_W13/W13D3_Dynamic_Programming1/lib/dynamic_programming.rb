class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_bottom_cache = {}
    @frog_top_cache = {}
    @super_frog_cache = {}
    @knapsack_cache = {}
    @maze_cache = {}
  end

  def blair_nums(n)
    # The first Blair number, b1, is 1,
    # The second Blair number, b2, is 2,
    # The kth Blair number is the sum of the previous two Blair numbers
    # plus the (k - 1)th odd number. For example,
    # b3 = b2 + b1 + 2nd odd = 1 + 2 + 3 = 6.

    return @blair_cache[n] unless @blair_cache[n].nil?
    blair_num = blair_nums(n - 1) + blair_nums(n - 2) + ((n - 1) * 2 - 1)
    @blair_cache[n] = blair_num

    blair_num
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)

    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]],
              2 => [[1, 1], [2]],
              3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }

    return cache[n] if n <= 3
    i = 1
    first_jump_count = cache[i]

    until first_jump_count > n
      soln = frog_cache_builder(n-1).each {|el| el + cache[first_jump_count] }

      first_jump_count += cache[i][0]
    end
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
