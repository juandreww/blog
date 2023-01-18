def bubble_sort(arr)
  arr_size = arr.size

  arr_size.times do |i|
    (arr_size - i).times do |j|
      if arr[i] > arr[i + j]

      end
    end
  end
end

arr = [10, 30, 20, 40, 30, 10]
bubble_sort(arr)
