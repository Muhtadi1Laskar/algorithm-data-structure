proc selection_sort(arr: var seq[int]): seq[int] = 
    for i in 0..<arr.len:
        var min: int = i

        for j in i+1..<arr.len:
            if arr[min] > arr[j]:
                min = j
        
        if min != i:
            var temp: int = arr[i]
            arr[i] = arr[min]
            arr[min] = temp
    
    return arr