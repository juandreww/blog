def insertion_sort(numbers)
  numbers.each_with_index do |num, index|
    num_to_compare = num

    prev_index = index
    while prev_index >= 0 && num_to_compare < numbers[prev_index]
      
    end
  end
end

numbers = [12, 11, 13, 5, 6]
insertion_sort(numbers)
puts numbers.inspect
