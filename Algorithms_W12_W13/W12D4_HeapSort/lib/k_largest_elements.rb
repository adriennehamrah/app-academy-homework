require_relative 'heap'

# time: O(nlogk)
def k_largest_elements(array, k)
  res = BinaryMinHeap.new

  # use heap that is size k
  k.times do
    res.push(array.pop)
  end

  until array.empty?
    res.push(array.pop)
    res.extract # maintain a heap of size k
  end

  res.store
end
