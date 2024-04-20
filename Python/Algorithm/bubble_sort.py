def bubble_sort(li: list[int]) -> list[int]:
    for i in range(0, len(li)):
        for j in range(i + 1, len(li)):
            if li[i] > li[j]:
                temp = li[i]
                li[i] = li[j]
                li[j] = temp

    return li


li = [5, 4, 3, 2, 1]
sorted_li = bubble_sort(li)

print(sorted_li)
