function merged(left, right)
    array = []
    i = j = 1

    while i <= length(left) && j <= length(right)
        if left[i] <= right[j]
            push!(array, left[i])
            i += 1
        else
            push!(array, right[j])
            j += 1
        end
    end

    push!(array, left[i:end]...)
    push!(array, right[j:end]...)

    return array
end

function merge_sort(array)
    if length(array) <= 1
        return array
    end

    half = floor(div(length(array), 2))

    left = merge_sort(array[1:half])
    right = merge_sort(array[half+1:end])

    return merged(left, right)
end

array = [9, -8, 7, 6, 5, 4, 3, 2, 1, 10]

println(merge_sort(array))