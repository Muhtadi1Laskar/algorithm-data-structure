def check_aliquot(n):
    return sum([elem for elem in range(1, n) if elem % n])


def check_untouchable(n):
    for i in range(1, (n*n)+1):
        if check_aliquot(i) == n:
            return False
    return True

num = 10

print(check_aliquot(num))
print(check_untouchable(53))