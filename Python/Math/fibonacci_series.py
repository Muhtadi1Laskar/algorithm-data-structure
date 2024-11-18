def fib(n):
    a, b = 0, 1

    while a < n:
        print(a, end=' ')
        temp = a
        a = b
        b = temp + b
    print()

fib(1000)