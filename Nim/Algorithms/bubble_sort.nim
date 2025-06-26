proc bubble_sort(array: var seq[int]): seq[int] = 
    for i in 0..<array.len:
        for j in i+1..<array.len:
            if array[i] < array[j]:
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
    return array