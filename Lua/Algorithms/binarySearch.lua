function binarySearch(array, item)
    local l = 1
    local r = #array
    print(item)

    while l <= r do
        local mid = math.floor((l + r) / 2)

        if array[mid] == item then
            return mid
        elseif array[mid] > item then
            r = mid - 1
        else 
            l = mid + 1
        end
    end

    return nil
end



local array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

print(binarySearch(array, 10))