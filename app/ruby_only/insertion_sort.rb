def insertion_sort(array)
  (1..array.size).each_with_index do |_num, i|   # Step 1
    j = i # Step 2
    while j.positive? # Step 3
      break unless array[j - 1] > array[j] # Step 4

      temp = array[j]
      array[j] = array[j - 1]
      array[j - 1] = temp

      j -= 1 # Step 5
    end
  end
  array
end

numbers = [12, 11, 13, 5, 6]
insertion_sort(numbers)
puts numbers.inspect
