def decimal_to_binary(n):
    if n <= 1:
        return str(n)
    
    return decimal_to_binary(n // 2) + decimal_to_binary(n % 2)

print(decimal_to_binary(11))