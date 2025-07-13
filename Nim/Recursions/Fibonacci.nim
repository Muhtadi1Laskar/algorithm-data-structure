import tables

proc fib(n: int): int = 
    if n <= 2:
        return 1
    return fib(n-1) + fib(n-2)

func fibMemo(n: int, memo: var Table[int, int]): int =
    if n in memo:
        return memo[n]

    if n <= 2:
        return 1

    memo[n] = fibMemo(n - 1, memo) + fibMemo(n - 2, memo)

    return memo[n]

proc fib_iter(n: int): int = 
    if n <= 0:
        return 0
    elif n == 1:
        return 1

    var
        a: int = 0
        b: int = 1
        sum: int = 1 

    for i in 2..n:
        let next: int = a + b
        sum += next
        a = b
        b = next

    return sum


when isMainModule:
    var memoTable: Table[system.int, system.int] = initTable[int, int]()

    echo "Fibonacci(10): ", fibMemo(10, memoTable)
    echo "Fibonacci(20): ", fibMemo(20, memoTable)
    echo "Fibonacci(50): ", fibMemo(50, memoTable)