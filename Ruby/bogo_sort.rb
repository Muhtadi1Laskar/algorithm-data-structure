def bogosort(array)
  until sorted?(array)
    array.shuffle!
  end
  array
end

def sorted?(array)
  (array.length - 1).times do |i|
    if array[i] > array[i + 1]
      return false
    end
  end
  true 
end

unsorted_array = [3, 1, 4, 1, 5, 9, 2, 6]

sorted_array = bogosort(unsorted_array)
puts "Sorted array: #{sorted_array.inspect}"