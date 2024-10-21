package main

func factorial(n int) int {
	if n <= 0 {
		return 1
	}
	return factorial(n-1) * n
}