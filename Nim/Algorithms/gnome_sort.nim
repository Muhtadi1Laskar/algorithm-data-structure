proc gnome_sort(arr: var seq[int]): seq[int] = 
    var index: int = 0

    while index < arr.len:
        if index == 0:
            index += 1
        elif arr[index] >= arr[index-1]:
            index += 1
        else:
            var temp: int = arr[index]
            arr[index] = arr[index-1]
            arr[index-1] = temp
            index -= 1
    
    return arr