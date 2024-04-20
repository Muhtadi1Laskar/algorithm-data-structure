def selection_sort(li: list[int]) -> list[int]:
    for i in range(0, len(li)):
        min = i

        for j in range(i + 1, len(li)):
            if li[min] > li[j]:
                min = j

        if i != min:
            temp = li[i]
            li[i] = li[min]
            li[min] = temp

    return li


li = [5, 4, 3, 2, 1]
sorted_array = selection_sort(li)

print(sorted_array)
