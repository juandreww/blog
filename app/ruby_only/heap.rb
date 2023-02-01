require "Heap"

b_heap = Heap::BinaryHeap::MinHeap.new([2, 3, 1, -1])
print("\n")
print("#{b_heap.elements}\n")
print("#{b_heap.class}\n")
print("#{b_heap.extract_min}\n")

print("\n")
