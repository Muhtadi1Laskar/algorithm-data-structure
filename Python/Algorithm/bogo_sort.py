import random

def shuffle(array):
    if len(array) < 0:
        return None
    
    for i in range(len(array)-1, 0, -1):
        j = random.randint(0, i)

        array[i], array[j] = array[j], array[i]

    return array

def is_sorted(array):
    for i in range(0, len(array)-1):
        if array[i] > array[i+1]:
            return False
    return True

def bogo_sort(array):
    new_array = array
    while not is_sorted(new_array):
        new_array = shuffle(new_array)
    return new_array


print(bogo_sort([5, 4, 3, 2, 1]))