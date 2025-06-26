proc binary_search(arr: seq[int], item: int): int = 
    var l = 0
    var r = arr.len - 1

    while l <= r:
        var mid = l + (r - l) div 2

        if arr[mid] == item:
            return mid
        elif arr[mid] > item:
            r = mid - 1
        else:
            l = mid + 1
    return -1 