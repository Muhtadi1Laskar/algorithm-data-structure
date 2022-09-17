def insertion_sort(array)
    start = 0
    finish = array.length - 1
    i = start + 1

    while i <= finish
        j = i
        while j > start and array[j-1] > array[j]
            array[j-1], array[j] = array[j], array[j-1]
            j = j - 1
        end 
        i = i + 1
    end
    return array
end
