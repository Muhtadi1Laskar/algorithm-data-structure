def linear_search(li: list[int], item: int) -> int:
    length = len(li)
    idx = 0

    while idx < length:
        if li[idx] == item:
            return idx
        idx += 1
    return -1


li = [i for i in range(11)]
item = 3
result = linear_search(li, item)

print(result)
