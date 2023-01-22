def divide_array(array)
  pivot = array.size / 2

  array_1 = pivot.odd? ? array.first(pivot + 1) : array.first(pivot)
  array_2 = array.last(pivot)

  puts array_1.inspect
  puts array_2.inspect

  divide_array(array_1)
  divide_array(array_2)
end

def merge_sort(array)
  divide_array(array)
end

array = [38, 27, 9, 12, 18]
puts merge_sort(array).inspect
