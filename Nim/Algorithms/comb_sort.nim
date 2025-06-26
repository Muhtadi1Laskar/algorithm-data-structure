proc comb_sort(arr: var seq[int]): seq[int] = 
    var 
        n: int = arr.len
        gap: int = n
        swapped: bool = true

    while gap > 1 or swapped:
        gap = (gap.float / 1.3).int

        if gap < 1:
            gap = 1
        
        swapped = false

        for i in 0..<n-gap:
            if arr[i] > arr[i+gap]:
                var temp: int = arr[i]
                arr[i] = arr[i+gap]
                arr[i+gap] = temp
                swapped = true
    
    return arr