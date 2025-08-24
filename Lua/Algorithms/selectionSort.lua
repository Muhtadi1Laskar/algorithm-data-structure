function selectionSort(array)
    for i = 1, #array, 1 do
        min = i

        for j = i + 1, #array, 1 do
            if array[j] < array[min] then
                min = j
            end
        end

        if min ~= i then
            temp = array[i]
            array[i] = array[min]
            array[min] = temp
        end
    end
    return array
end

array = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

print(table.concat(selectionSort(array), ", "))