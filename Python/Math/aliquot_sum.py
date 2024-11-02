def check_aliquot(n):
    return sum([elem for elem in range(1, n) if elem % n])


num = 10

print(check_aliquot(num))