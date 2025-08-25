function shuttleSort(array)
    for i = 2, #array, 1 do
        local j = i

        while j > 1 and array[j-1] > array[j] do
            local temp = array[j]
            array[j] = array[j-1]
            array[j-1] = temp
             j = j - 1
        end
    end
    return array
end

array = {5, 4, 3, 2, 1}

print(table.concat(shuttleSort(array), ", "))