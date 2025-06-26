proc shuttle_sort(arr: var seq[int]): seq[int] = 
    for i in 1..<arr.len:
        var j: int = i

        while j > 0 and arr[j-1] > arr[j]:
            var temp: int = arr[j]
            arr[j] = arr[j-1]
            arr[j-1] = temp
            j -= 1
    
    return arr