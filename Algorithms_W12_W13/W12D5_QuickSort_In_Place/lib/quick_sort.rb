class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array.first

    left_sorted = sort1(array[1..-1].select {|el| el < pivot })
    right_sorted = sort1(array[1..-1].select {|el| el > pivot })

    sorted = left_sorted + [pivot] + right_sorted
  end

  QuickSort.sort1([1, 3, 10, 6, 2, -1])

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    if start < length - 1
      pivot_idx = partition(array, start, length, &prc)
      sort2!(array, start, pivot_idx - 1, &prc)
      sort2!(array, pivot_idx + 1, length, &prc)
    end

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    curr_idx = start
    # pivot_idx = rand(start...length)

    (start...length).each do |idx|
      # if prc.call(array[idx], array[-1] <= 0)
      if array[idx] < array[-1]
        array[idx], array[curr_idx] = array[curr_idx], array[idx]
        curr_idx += 1
      end
    end

    array[curr_idx], array[-1] = array[-1], array[curr_idx]
    curr_idx
  end
end
