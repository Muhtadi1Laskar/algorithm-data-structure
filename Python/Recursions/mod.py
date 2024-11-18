def mod(dividend, divisor):
    if divisor < 0:
        return 0
    
    if dividend < divisor:
        return dividend
    
    return mod(dividend - divisor, divisor)

print(mod(14, 2))