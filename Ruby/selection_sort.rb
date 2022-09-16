def selection_sort(array)
    for i in (0..array.length)
        min = i
        for j in (i+1..array.length-1)
            if array[j] < array[min]
                min = j
            end
        end
        if i != min
            array[i], array[min] = array[min], array[i]
        end
    end
    return array
end

puts selection_sort([5, 4, 3, 2, 1])