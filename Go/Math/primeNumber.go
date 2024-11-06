package main

import "fmt"

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

func main() {
	fmt.Println(generatePrimes(1000))
}