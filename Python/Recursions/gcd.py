def gcd(a, b):
    if a == b:
        return a
    
    if a > b:
        return gcd(a-b, b)
    return gcd(a, b-a)

print(gcd(6, 9))