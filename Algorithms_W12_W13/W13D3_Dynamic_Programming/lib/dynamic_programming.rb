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

  # knapsack takes in an array of weights, an array of values, and a
  # weight capacity and returns the maximum value possible given the
  # weight constraint.
  def knapsack(weights, values, capacity)
      return 0 if capacity == 0 || weights.length == 0
      solution_table = knapsack_table(weights, values, capacity)
      solution_table[capacity][-1]
  end

# Helper method for bottom-up implementation
def knapsack_table(weights, values, capacity)
  solution_table = []
  # Build solutions for knapsacks of increasing capacity
  (0..capacity).each do |i|
    solution_table[i] = []
    # go through the weights one by one, by index
    (0..weights.length - 1).each do |j|
      if i == 0
        # if the capacity is 0, then 0 is how much value can be placed in any slot
        solution_table[i][j] = 0
      elsif j == 0
        # for the first item in our list, you must check for capacity
        # if there is, then you enter its value in the first slot, otherwise 0
        solution_table[i][j] = weights[0] > i ? 0 : values[0]
      else
        # the first option is the entry from considering the previous item at this capacity
        option1 = solution_table[i][j - 1]
        # the second option (assuming enough capacity) is the entry from a smaller bag
        # (with enough room for this item) plus this item's value
        option2 = i < weights[j] ? 0 : solution_table[i - weights[j]][j - 1] + values[j]
        # the actual entry for this item is the optimum of the two choices
        optimum = [option1, option2].max
        solution_table[i][j] = optimum
      end
    end
  end

  solution_table
end

  def maze_solver(maze, start_pos, end_pos)
  end
end
