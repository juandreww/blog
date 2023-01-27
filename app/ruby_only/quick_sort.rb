def quick_sort(array, first, last)
  if first < last
    j = partition(array, first, last)
    puts "After partition #{array.inspect}"
    quick_sort(array, first, j - 1)
    puts "After first sort #{array.inspect}"
    quick_sort(array, j + 1, last)
    puts "After second sort #{array.inspect}"
  end

  array
end

def partition(array, first, last)
  pivot = array[last]
  p_index = first
  i = first
  puts "Start with pivot index #{p_index} and array #{array.inspect}"
  puts

  while i < last
    if array[i].to_i <= pivot.to_i
      array[i], array[p_index] = array[p_index], array[i]
      p_index += 1
    end
    i += 1
  end
  puts "Swapping array of index #{p_index} with #{last} from #{array.inspect}"
  array[p_index], array[last] = array[last], array[p_index]

  puts "Ending with array #{array.inspect}"
  puts

  p_index
end
array = [30, 10, 40, 20]
puts array.inspect
array = quick_sort(array, 0, array.size - 1)
puts array.inspect
