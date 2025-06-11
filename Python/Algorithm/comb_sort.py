def comb_sort(li):
    shrink_factor = 1.3
    gap = len(li)
    swapped = True

    while gap > 1 or swapped:
        gap = int(gap / shrink_factor)

        if gap < 1:
            gap = 1

        swapped = False

        i = 0
        while i + gap < len(li):
            if li[i] > li[i + gap]:
                li[i], li[i + gap] = li[i + gap], li[i]
                swapped = True
            i += 1

    return li

