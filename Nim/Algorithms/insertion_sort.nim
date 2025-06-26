proc insertion_sort(arr: var seq[int]): seq[int] = 
    for i in 1..<arr.len:
        var key: int = arr[i]
        var j: int = i - 1

        while j >= 0 and arr[j] > key:
            arr[j+1] = arr[j]
            j -= 1
        
        arr[j+1] = key
    
    return arr