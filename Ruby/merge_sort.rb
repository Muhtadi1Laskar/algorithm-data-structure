def merge(left_array, right_array)
    if right_array.empty?
        return left_array
    end

    if left_array.empty?
        return right_array
    end

    smallest_number = if left_array.first <= right_array.first
        left_array.shift
    else
        right_array.shift
    end

    recursive = merge(left_array, right_array)

    [smallest_number].concat(recursive)
end

def merge_sort(array)
    size = array.length
    if size <= 1
        return array
    end

    mid = (size / 2).round
    left = array.take(mid)
    right = array.drop(mid)

    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    return merge(sorted_left, sorted_right)
end
