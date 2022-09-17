def binary_search(array, value)
    lower_bound = 0
    upper_bound = array.length - 1

    while lower_bound <= upper_bound do
        mid_point = (upper_bound + lower_bound) / 2
        mid_value = array[mid_point]

        if value < mid_value
            upper_bound = mid_point - 1 
        elsif value > mid_value
            lower_bound = mid_point + 1
        elsif value == mid_value
            return mid_point
        end
    end
    return nil
end




