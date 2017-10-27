class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_top_cache = [ [[]], [[1]], [[1, 1], [2]] ]
  end

  def blair_nums(n)
    # The first Blair number, b1, is 1,
    # The second Blair number, b2, is 2,
    # The kth Blair number is the sum of the previous two Blair numbers
    # plus the (k - 1)th odd number. For example,
    # b3 = b2 + b1 + 2nd odd = 1 + 2 + 3 = 6.

    return @blair_cache[n] if @blair_cache[n]
    blair_num = blair_nums(n - 1) + blair_nums(n - 2) + ((n - 1) * 2 - 1)
    @blair_cache[n] = blair_num
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = [ [[]], [[1]], [[1, 1], [2]] ]
    return cache if n < 3

    (3..n).each do |i|
      new_way_set = []
      (1..3).each do |first_step|
        cache[i - first_step].each do |way|
          new_way = [first_step]
          way.each do |step|
            new_way << step
          end
          new_way_set << new_way
        end
      end
      cache << new_way_set
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_top_cache[n] if @frog_top_cache[n]
    new_way_set = []
    (1..3).each do |first_step|
      frog_hops_top_down_helper(n - first_step).each do |way|
        new_way = [first_step]
        way.each do |step|
          new_way << step
        end
        new_way_set << new_way
      end
    end
    @frog_top_cache[n] = new_way_set
  end

  def super_frog_hops(n, k)
    # n = num of stairs
    # k = max stairs that can be hopped at once

    all_ways = [ [[]], [[1]] ]

    return all_ways[n] if n < 2

    (2..n).each do |i|
      new_way_set = []
      (1..k).each do |first_step|
        next if i - first_step < 0
        all_ways[i - first_step].each do |way|
          new_way = [first_step]
          way.each do |step|
            new_way << step
          end
          new_way_set << new_way
        end
      end
      all_ways << new_way_set
    end

    all_ways[n]
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
