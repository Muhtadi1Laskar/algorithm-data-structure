function bubble_sort!(array)
    for i in 1:length(array)
        for j in i+1:length(array)
            if array[i] > array[j]
                array[i], array[j] = array[j], array[i]
            end
        end
    end
    return array
end

println(bubble_sort!([10, 9, 8, 7, 6, -5, 4, 3, 2, 1]))