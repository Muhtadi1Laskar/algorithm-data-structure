proc merge(left, right: seq[int]): seq[int] = 
    var 
        arr: seq[int] = @[]
        i: int = 0
        j: int = 0
    
    while i < left.len and j < right.len:
        if left[i] < right[j]:
            arr.add(left[i])
            i += 1
        else:
            arr.add(right[j])
            j += 1
    
    arr.add(left[i ..< left.len])
    arr.add(right[j ..< right.len])

    return arr
    


proc merge_sort(arr: seq[int]): seq[int] =
    if arr.len <= 1:
        return arr

    let mid: int = arr.len div 2
    let left: seq[int] = merge_sort(arr[0 ..< mid])
    let right: seq[int] = merge_sort(arr[mid ..< arr.len])
    
    return merge(left, right)