class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_top_cache = { 1 => [[1]],
                        2 => [[1, 1], [2]],
                        3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
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
    return cache if n <= 3

    soln = []
    (4..n).each do |step|
      frog_cache_builder(step - 1)[step - 1].each do |el|
        soln << (el << 1)
      end

      frog_cache_builder(step - 2)[step - 2].each do |el|
        soln << (el << 2)
      end

      frog_cache_builder(step - 3)[step - 3].each do |el|
        soln << (el << 3)
      end
    end
    cache[n] = soln
    cache
  end

  def frog_hops_top_down(n)
    return @frog_top_cache[n] unless @frog_top_cache[n].nil?

    frog_hops_top_down_helper(n)
    ans = @frog_hops_top_down[n - 1]

    @frog_top_cache[n] = ans
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
