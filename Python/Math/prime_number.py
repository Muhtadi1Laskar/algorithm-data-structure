def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    
    return True

def generate_prime(n):
    return [i for i in range(1, n+1) if is_prime(i)]


print(generate_prime(20))