function is_sorted(arr)
    for i in 1:(length(arr) - 1)
        if arr[i] > arr[i+1]
            return false
        end
    end
    return true
end

function bogosort!(arr)
    while !is_sorted(arr)
        shuffle!(arr)
    end
    return arr
end

my_array = [3, 1, 4, 1, 5, 9, 2, 6]
println("Original array: ", my_array)
bogosort!(my_array)
println("Sorted array: ", my_array)