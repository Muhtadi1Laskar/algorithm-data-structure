def fn1(n):
    if n % 2 == 0:
        return 'Even'
    return 'Odd'

fn2 = lambda n: "EOVDEDN"[n&1::2]

def fn3(n):
    return str(n)[-1] in "02468"

def fn4(n):
    return (n // 2) * 2 == n

