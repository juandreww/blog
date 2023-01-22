def divide_array(array)
  return array if array.size < 2

  pivot = array.size / 2

  array_left = array.size.odd? ? array.first(pivot + 1) : array.first(pivot)
  array_right = array.last(pivot)

  puts array_left.inspect
  puts array_right.inspect
  puts

  [divide_array(array_left), divide_array(array_right)]
end

def merge_sort(array)
  array_divided = divide_array(array)
  
end

array = [38, 27, 9, 12, 18]
puts merge_sort(array).inspect
