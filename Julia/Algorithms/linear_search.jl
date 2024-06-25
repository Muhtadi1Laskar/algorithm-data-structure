function linear_search(li, item)
    idx = 1

    while idx <= length(li)
        if li[idx] == item
            return idx
        end
        idx += 1
    end
    return -1
end

li = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println(linear_search(li, -1))