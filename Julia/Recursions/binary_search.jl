function binary_search(array, item, l, r)
    if l <= r
        mid = floor(div(l+r, 2))

        if array[mid] == item
            return mid
        elseif array[mid] > item
            return binary_search(array, item, l, mid-1)
        else
            return binary_search(array, item, mid+1, r)
        end
    else 
        return -1
    end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println(binary_search(array, 5, 1, length(array)))