function bubbleSort(array)
    for i = 1, #array, 1 do
        for j = i + 1, #array, 1 do
            if array[i] > array[j] then
                local temp = array[i]
                array[i] = array[j]
                array[j] = temp
            end
        end
    end
    return array
end


print(table.concat(bubbleSort({5, 4, 3, 2, 1}), ", "))
