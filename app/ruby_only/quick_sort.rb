def quick_sort(array, low, high)
  return unless low < high

  pi = partition(array, low, high)
  quick_sort(array, low, pi - 1)
  quick_sort(array, pi + 1, high)
end

def partition(array, low, high)
  pivot = array[high]
  i = low - 1

  low..high.each do |index|
    next unless array[index] <= pivot

    i += 1

    array[i], array[index] = array[index], array[i]
  end

  i += 1
  array[i], array[high] = array[high], array[i]
  i
end

array = [10, 20, 30, 40]
puts array.inspect
quick_sort(array, 0, array.size - 1)
