package main

func sum(n int) int {
	if n == 1 {
		return 1
	}
	return n + sum(n-1)
}
