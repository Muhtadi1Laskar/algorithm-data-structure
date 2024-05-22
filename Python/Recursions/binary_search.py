def binary_search(li: list[int], item: int, l: int, r: int) -> int:
    if l <= r:
        mid = l + (r-l) // 2

        if li[mid] == item:
            return mid
        elif li[mid] > item:
            return binary_search(li, item, l, mid-1)
        else:
            return binary_search(li, item, mid+1, r)
    else:
        return -1

arr = [1, 2, 3, 4, 5]

print(binary_search(arr, 1, 0, len(arr)-1))