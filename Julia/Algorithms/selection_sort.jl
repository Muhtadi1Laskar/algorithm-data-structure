function selection_sort(array)
    for i in 1:length(array)
        min = i
        for j in i+1:length(array)
            if array[min] >  array[j]
                min = j
            end
        end
        if min != i
            array[i], array[min] = array[min], array[i]
        end
    end
    return array
end

array = [5, 4, 3, 2, 1]

println(selection_sort(array))
