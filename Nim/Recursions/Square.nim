proc square(n: int): int = 
    if n == 0:
        return 0
    return square(n-1) + (2 * n) - 1

