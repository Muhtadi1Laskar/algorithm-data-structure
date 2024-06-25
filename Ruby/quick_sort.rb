def quicksort(array)
    return array if array.length <= 1

    pivot_index = median_of_three(array, 0, array.length - 1)
    pivot = array[pivot_index]
  
    array[0], array[pivot_index] = array[pivot_index], array[0]
  
    left, right = array.partition { |element| element <= pivot }
  
    sorted_left = quicksort(left)
    sorted_right = quicksort(right)

    sorted_left + [pivot] + sorted_right
  end

  def median_of_three(array, low, high)
    mid = (low + high) / 2
    left, right, pivot = array[low], array[high], array[mid]

    if left > right
      array[low], array[high] = array[high], array[low]
    end
    if left > mid
      array[low], array[mid] = array[mid], array[low]
    end
    if mid > right
      array[mid], array[high] = array[high], array[mid]
    end
  
    mid
  end

  unsorted_array = [7, 2, 1, 5, 3, 6, 4]
  sorted_array = quicksort(unsorted_array.dup)
  
  puts "Original array: #{unsorted_array}"
  puts "Sorted array: #{sorted_array}"
  