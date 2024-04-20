def insertion_sort(li: list[int]) -> list[int]:
    for i in range(1, len(li)):
        key = li[i]
        j = i - 1

        while j >= 0 and li[j] > key:
            li[j + 1] = li[j]
            j -= 1

        li[j + 1] = key

    return li


li = [5, 4, 3, -2, 1]
sorted_list = insertion_sort(li)

print(li)
