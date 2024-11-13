def fn1(n):
    if n % 2 == 0:
        return 'Even'
    return 'Odd'

fn2 = lambda n: "EOVDEDN"[n&1::2]

def fn3(n):
    return str(n)[-1] in "02468"

def fn4(n):
    return (n // 2) * 2 == n

def fn5(n):
    return {0: True, 1: False}[n%2]

def fn6(n):
    return n | 1 == n

def fn7(n):
    return (n % 2j).imag == 0

def fn8(n):
    return (n / 2).is_integer()