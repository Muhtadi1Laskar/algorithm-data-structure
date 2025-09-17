import random

proc isSorted(array: seq[int]): bool = 
    for i in 0..<array.len - 1:
        if array[i] > array[i+1]:
            return false
    return true

proc bogoSort(array: seq[int]): seq[int] = 
    var arr: seq[int] = array
    while not isSorted(array):
        shuffle(arr)
    return array

when isMainModule:
    var array: seq[int] = @[5, 4, 3, 2, 1]

    echo bogoSort(array)