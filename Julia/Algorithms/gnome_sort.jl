function gnome_sort!(array)
    index = 1

    while index <= length(array)
        if index == 1
            index += 1
        elseif array[index] > array[index-1]
            index += 1
        else
            array[index], array[index-1] = array[index-1], array[index]
            index -= 1
        end
    end
    return array
end

array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

println(gnome_sort!(array))
