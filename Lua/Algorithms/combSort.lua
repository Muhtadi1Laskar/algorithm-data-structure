function combSort(array)
    local n = #array
    local gap = n
    local swapped = true

    while gap > 1 or swapped do
        gap = math.floor(gap / 1.3)

        if gap < 1 then
            gap = 1
        end

        swapped = false

        for i = 1, n-gap, 1 do
            if array[i] > array[i+gap] then
                temp = array[i]
                array[i] = array[i+gap]
                array[i+gap] = temp
                swapped = true
            end
        end
    end

    return array
end

array = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

print(table.concat(combSort(array), ", "))