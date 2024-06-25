function binary_search(array, item)
    l = 1
    r = length(array)

    while l <= r
        mid = floor(div(l + r, 2)) 

        if array[mid] == item
            return mid
        elseif array[mid] > item
            r = mid - 1
        else
            l = mid + 1
        end
    end
    return nothing
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


println(binary_search(array, 4))