proc fib(n: int): int = 
    if n <= 2:
        return 1
    return fib(n-1) + fib(n-2)

proc fib_iter(n: int): int = 
    if n <= 0:
        return 0
    elif n == 1:
        return 1

    var
        a = 0
        b = 1
        sum = 1 

    for i in 2..n:
        let next = a + b
        sum += next
        a = b
        b = next

    return sum


when isMainModule:
    let n: int = 10

    echo fib_iter(n)