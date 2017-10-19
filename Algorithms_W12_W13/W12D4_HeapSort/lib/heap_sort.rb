require_relative "heap"

class Array
  def heap_sort!
    prc ||= Proc.new { |a, b| a <=> b }
    heap = BinaryMinHeap.new(&prc)
    self.each do |el|
      heap.push(el)
    end

    BinaryMinHeap.heapify_down(heap.store, 0, heap.count, &prc)

    heap
  end
end
