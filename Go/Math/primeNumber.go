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

func main() {
	for i := 1; i <= 20; i++ {
		fmt.Printf("%d --> %t\n", i, isPrime(i))
	}
}