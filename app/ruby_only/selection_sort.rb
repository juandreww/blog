def selection_sort(arr)
  arr_size = arr.size - 1

  (0..arr_size).each do |i|
    min = i

    (i + 1..arr_size).each do |j|
      next unless arr[min] > arr[j]

      min = j
    end
    next unless min != i

    tmp = arr[i]
    arr[i] = arr[min]
    arr[min] = tmp
  end

  arr
end

arr = [10, 30, 20, 40, 30, 10]
puts "Array before sort: #{arr.inspect}"
puts "Array after sort: #{selection_sort(arr).inspect}"
