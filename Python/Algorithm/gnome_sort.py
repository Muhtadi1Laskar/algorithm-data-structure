def gnome_sort(li: list[int]) -> list[int]:
    index: int = 0

    while index < len(li):
        if index == 0:
            index += 1
        elif li[index] >= li[index - 1]:
            index += 1
        else:
            temp = li[index]
            li[index] = li[index - 1]
            li[index - 1] = temp
            index -= 1
    return li


print(gnome_sort([5, 4, 3, 2, 1]))
