def linear_search(array, item)
    for index in (0..array.length)
        if array[index] == item
            return array[index]
        end
    end
    return -1
end
