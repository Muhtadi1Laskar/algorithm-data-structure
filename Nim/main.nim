import std/[random]

proc shuffles[T](array: var seq[T]) = 
    if array.len <= 1:
        return

    randomize()

    for i in countdown(array.len - 1, 1):
        let j: int = rand(i + 1)
        (array[i], array[j]) = (array[j], array[i])

proc isSorted(array: seq[int]): bool = 
    for i in 0..<array.len - 1:
        if array[i] > array[i+1]:
            return false
    return true

proc bogoSort(array: seq[int]): seq[int] = 
    var arr: seq[int] = array
    while not isSorted(arr):
        shuffles(arr)
    return arr

when isMainModule:
    var arr: seq[int] = @[5, 4, 3, 2, 1]

    # echo bogoSort(arr)
    shuffles(arr)

    echo arr