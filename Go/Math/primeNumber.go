package main

import (
	"fmt"
	"math"
)

func isPrime(n int) bool {
	for i := 2; i < n; i++ {
		if n%i == 0 {
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

func segmentedSieve(L, R int) []int {
	limit := int(math.Sqrt(float64(R))) + 1
	primes := sieve(limit)

	isPrimeRange := make([]bool, R-L+1)
	for i := range isPrimeRange {
		isPrimeRange[i] = true
	}

	for _, prime := range primes {
		start := max(prime*prime, (L+prime-1)/prime*prime)

		for j := start; j <= R; j += prime {
			isPrimeRange[j-L] = false
		}
	}

	var result []int
	for i, isPrime := range isPrimeRange {
		if isPrime && (L+i > 1) {
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
