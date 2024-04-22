def insert_in_order(li, item):
    idx = 0
    for i in range(0, len(li)):
        if li[i] < item:
            idx += 1
    li.append(None)
    for i in range(len(li)-1, idx, -1):
        li[i] = li[i-1]
    li[idx] = item
    return li

li = [1, 3, 5, 7]

print(insert_in_order(li, 2))