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

  def merge(sorted_left, sorted_right)
    combined_list = sorted_left + sorted_right
    size = combined_list.size

    combined_list.each_with_index do |_list, index|
      (index + 1..size).each do |comparable|
        if combined_list[comparable].nil?
          puts combined_list.inspect
          puts comparable
          puts
        end
        next unless combined_list[comparable] < combined_list[index]

        tmp = combined_list[index]
        combined_list[index] = combined_list[comparable]
        combined_list[comparable] = tmp
      end
    end

    combined_list
  end
end

array = [38, 27, 9, 12, 18]
puts MergeSort.new.sort(array).inspect
