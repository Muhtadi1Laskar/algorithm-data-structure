def odd_even_sort(li: list[int]) -> list[int]:
    n = len(li)
    sorted = False

    while not sorted:
        sorted = True

        for i in range(0, n - 1, 2):
            if li[i] > li[i + 1]:
                temp = li[i]
                li[i] = li[i + 1]
                li[i + 1] = temp
                sorted = False

        for i in range(1, n - 1, 2):
            if li[i] > li[i + 1]:
                temp = li[i]
                li[i] = li[i + 1]
                li[i + 1] = temp
                sorted = False

    return li


li = [5, 4, 3, 2, 1]

print(odd_even_sort(li))
