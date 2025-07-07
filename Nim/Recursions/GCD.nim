proc gcd(a: int, b: int): int = 
    if a == b:
        return a
    if a > b:
        return gcd(a-b, b)
    return gcd(a, b-a)