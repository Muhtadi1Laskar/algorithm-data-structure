def fn1(n):
    if n % 2 == 0:
        return 'Even'
    return 'Odd'

fn2 = lambda n: "EOVDEDN"[n&1::2]

print(fn2(11))
    