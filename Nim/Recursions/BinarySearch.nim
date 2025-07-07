proc binary_search(list: seq[int], item: int, l, r: int): int =
    if l <= r:
        var mid: int = l + (r - l) div 2

        if list[mid] == item:
            return mid
        elif list[mid] > item:
            return binary_search(list, item, l, mid-1)
        else:
            return binary_search(list, item, mid+1, r)
    return -1


when isMainModule:
    var list: seq[int] = @[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let item: int = 4
    var l: int = 0
    var r: int = list.len - 1


    echo binary_search(list, item, l, r)