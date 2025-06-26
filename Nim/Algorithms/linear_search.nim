proc linear_search(arr: seq[int], item: int): int = 
    for i in 0..<arr.len:
        if arr[i] == item:
            return i
    
    return -1 
