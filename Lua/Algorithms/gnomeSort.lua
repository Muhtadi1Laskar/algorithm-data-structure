function gnomeSort(array)
    local index = 1
    
    while index <= #array do
        if index == 1 then
            index = index + 1
        elseif array[index] >= array[index - 1] then
            index = index + 1
        else
            local temp = array[index]
            array[index] = array[index - 1]
            array[index - 1] = temp
            index = index - 1
        end
    end
    return array
end

array = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

print(table.concat(gnomeSort(array), ", "))
