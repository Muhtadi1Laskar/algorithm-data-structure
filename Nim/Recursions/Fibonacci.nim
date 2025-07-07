proc fib(n: int): int = 
    if n <= 2:
        return 1
    return fib(n-1) + fib(n-2)


when isMainModule:
    let n: int = 10

    echo fib(n)