proc merge(left, right: seq[int]): seq[int] = 
    var 
        result: seq[int] = @[]
        i: int = 0
        j: int = 0
    
    while i < left.len and j < right.len:
        if left[i] < right[j]:
            result.add(left[i])
            i += 1
        else:
            result.add(right[j])
            j += 1
    
    result.add(left[i ..< left.len])
    result.add(right[j ..< right.len])

    return result
    


proc merge_sort(arr: seq[int]): seq[int] =
    if arr.len <= 1:
        return arr

    let mid: int = arr.len div 2
    let left = merge_sort(arr[0 ..< mid])
    let right = merge_sort(arr[mid ..< arr.len])
    
    return merge(left, right)