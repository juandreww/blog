def bubble_sort(arr)
  arr_size = arr.size - 1

  (0..arr_size).each do |i|
    (i + 1..arr_size).each do |j|
      next unless arr[i] > arr[j]

      tmp = arr[i]
      arr[i] = arr[j]
      arr[j] = tmp
    end
  end

  arr
end

arr = [10, 30, 20, 40, 30, 10]
puts "Array before sort: #{arr.inspect}"
puts "Array after sort: #{bubble_sort(arr).inspect}"
