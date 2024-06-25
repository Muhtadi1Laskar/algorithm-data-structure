function insertion_sort(array)
    for i in 1:length(array)
        key = array[i]
        j = i - 1

        while j >= 1 && array[j] > key
            array[j+1] = array[j]
            j -= 1
        end

        array[j+1] = key
    end
    return array
end

array = [-5, 4, 3, 2, 10]

println(insertion_sort(array))