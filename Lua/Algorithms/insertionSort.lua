function insertionSort(array)
    for i = 2, #array, 1 do
        key = array[i]
        j = i - 1

        while j >= 1 and array[j] > key do
            array[j+1] = array[j]
            j = j - 1
        end

        array[j+1] = key
    end
    
    return array
end

array = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

print(table.concat(insertionSort(array), ", "))