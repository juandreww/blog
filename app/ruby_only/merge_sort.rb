class MergeSort
  def sort(array)
    return array if array.size < 2

    pivot = (array.size / 2.0).ceil

    array_left = array.take(pivot)
    array_right = array.drop(pivot)

    puts array_left.inspect
    puts array_right.inspect
    puts

    sorted_left = sort(array_left)
    sorted_right = sort(array_right)

    merge(sorted_left, sorted_right)
  end

  def merge(array)
    array_divided = divide_array(array)
  end
end

array = [38, 27, 9, 12, 18]
puts merge_sort(array).inspect
