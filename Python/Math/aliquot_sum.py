def check_aliquot(n):
    return sum([elem for elem in range(1, n) if elem % n])


def check_untouchable(n):
    for i in range(1, (n * n) + 1):
        if check_aliquot(i) == n:
            return False
    return True


def check_abundant(n):
    if check_aliquot(n) > n:
        return True
    return False



def check_deficient(n):
    if check_aliquot(n) < n:
        return True
    return False
