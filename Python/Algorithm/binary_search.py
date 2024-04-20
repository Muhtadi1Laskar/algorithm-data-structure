def binary_search(li: list[int], item: int) -> int:
    l = 0
    r = len(li) - 1

    while l <= r:
        mid = l + (r - l) // 2

        if li[mid] == item:
            return mid
        elif li[mid] > item:
            r = mid - 1
        else:
            l = mid + 1

    return -1


li = [1, 2, 3, 4, 5]
item = 3
result = binary_search(li, item)

print(result)
