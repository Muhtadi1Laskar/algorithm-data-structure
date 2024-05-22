def fib(n: int) -> int:
    if n <= 2:
        return 1
    return fib(n-1) + fib(n-2)

def fib_memo(n: int, memo: dict = {}) -> int:
    if n in memo:
        return memo[n]
    
    if n <= 2:
        return 1
    
    memo[n] = fib_memo(n-1, memo) + fib_memo(n-2, memo)
    return memo[n]

def fib_loop(n: int) -> int:
    if n == 0:
        return n
    
    last: int = 0
    nexts: int = 1

    for _ in range(1, n):
        last, nexts = nexts, last + nexts
    
    return nexts


# print(fib(10))

# print(fib_memo(100))

print(fib_loop(100))