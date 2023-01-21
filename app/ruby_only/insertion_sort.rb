def insertion_sort(numbers)
  numbers.each_with_index do |number, index|
    number_to_compare = numbers[index + 1]

    index_less_one = index
    while index_less_one >= 0 && number_to_compare < numbers[index_less_one]
      numbers[index_less_one + 1] = number[index_less_one]
      index_less_one -= 1
    end
    numbers[index_less_one + 1] = number_to_compare
  end
end

numbers = [12, 11, 13, 5, 6]
insertion_sort(numbers)
puts numbers.inspect
