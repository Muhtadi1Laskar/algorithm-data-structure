package main

import (
	"fmt"
	"math"
)

func isPrime(n int) bool {
	for i := 2; i < n; i++ {
		if n % i == 0 {
			return false
		}
	}
	return true
}

func generatePrimes(n int) []int {
	var result []int

	for i := 1; i <= n; i++ {
		if isPrime(i) {
			result = append(result, i)
		}
	}
	return result
}


// Sieve of Eratosthenes to generate all primes up to n
func sieve(n int) []int {
	isPrime := make([]bool, n+1)
	for i := 2; i <= n; i++ {
		isPrime[i] = true
	}

	for i := 2; i*i <= n; i++ {
		if isPrime[i] {
			for j := i * i; j <= n; j += i {
				isPrime[j] = false
			}
		}
	}

	var primes []int
	for i := 2; i <= n; i++ {
		if isPrime[i] {
			primes = append(primes, i)
		}
	}
	return primes
}

// Segmented sieve to find all primes in range [L, R]
func segmentedSieve(L, R int) []int {
	limit := int(math.Sqrt(float64(R))) + 1
	primes := sieve(limit) // Get small primes up to sqrt(R)

	// Initialize range [L, R] as all true (prime)
	isPrimeRange := make([]bool, R-L+1)
	for i := range isPrimeRange {
		isPrimeRange[i] = true
	}

	// Mark non-prime numbers in the range [L, R]
	for _, prime := range primes {
		// Find the starting point to mark multiples of `prime` within [L, R]
		start := max(prime*prime, (L+prime-1)/prime*prime)
		
		for j := start; j <= R; j += prime {
			isPrimeRange[j-L] = false
		}
	}

	// Collect all primes in the range [L, R]
	var result []int
	for i, isPrime := range isPrimeRange {
		if isPrime && (L+i > 1) { // Exclude 1 as it's not a prime
			result = append(result, L+i)
		}
	}
	return result
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {
	L, R := 10, 50
	primesInRange := segmentedSieve(L, R)
	fmt.Printf("Primes between %d and %d: %v\n", L, R, primesInRange)
}
