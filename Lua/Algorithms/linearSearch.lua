function linearSearch(array, item)
    for i = 1, #array, 1 do
        if array[i] == item then
            return i
        end
    end
    return nil
end

array = {1, 2, 3, 4, 5}

print(linearSearch(array, 4))