import math

def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False

    return True


def generate_prime(n):
    return [i for i in range(1, n + 1) if is_prime(i)]

def sieve(n):
    """ Simple sieve of Eratosthenes to generate primes up to n """
    is_prime = [True] * (n + 1)
    is_prime[0] = is_prime[1] = False
    for i in range(2, int(math.sqrt(n)) + 1):
        if is_prime[i]:
            for j in range(i * i, n + 1, i):
                is_prime[j] = False
    return [i for i in range(2, n + 1) if is_prime[i]]

def segmented_sieve(L, R):
    """ Segmented sieve to find all primes in range [L, R] """
    limit = int(math.sqrt(R)) + 1
    primes = sieve(limit)  # Small primes up to sqrt(R)

    # Initialize the range [L, R] as all prime
    is_prime_range = [True] * (R - L + 1)
    
    # Mark multiples of each prime in the range [L, R]
    for prime in primes:
        # Find the starting point to mark multiples of `prime` within [L, R]
        start = max(prime * prime, (L + prime - 1) // prime * prime)
        
        # Mark non-prime numbers in the range [L, R]
        for j in range(start, R + 1, prime):
            is_prime_range[j - L] = False

    # Collect all primes in the range [L, R]
    if L == 1:  # Special case, 1 is not prime
        is_prime_range[0] = False

    return [L + i for i, is_prime in enumerate(is_prime_range) if is_prime]

# Example usage:
L, R = 10, 50
primes_in_range = segmented_sieve(L, R)
print(f"Primes between {L} and {R}:", primes_in_range)

