proc fact(n: int): int = 
    if n <= 0:
        return 1
    return fact(n-1) * n

when isMainModule:
    let n: int = 4

    echo fact(n)