function merge(left, right)
    local result = {}
    local i = 1
    local j = 1
    
    while i <= #left and j <= #right do
        if left[i] < right[j] then
            table.insert(result, left[i])
            i = i + 1
        else
            table.insert(result, right[j])
            j = j + 1
        end
    end
    
    while i <= #left do
        table.insert(result, left[i])
        i = i + 1
    end
    
    while j <= #right do
        table.insert(result, right[j])
        j = j + 1
    end
    
    return result
end

function mergeSort(list)
    local n = #list
    if n <= 1 then
        return list
    end
    
    local mid = math.floor(n / 2)
    local left = {}
    local right = {}
    
    for k = 1, mid do
        table.insert(left, list[k])
    end
    
    for k = mid + 1, n do
        table.insert(right, list[k])
    end
    
    left = merge_sort(left)
    right = merge_sort(right)
    
    return merge(left, right)
end


local unsortedList = {5, 2, 8, 1, 9, 4, 7, 3, 6}

print(table.concat(mergeSort(unsortedList), ", "))
