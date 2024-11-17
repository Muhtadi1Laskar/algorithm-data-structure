package main

func sqaure(n int) int {
	if n == 0 {
		return 0
	}
	return sqaure(n-1) + (2 * n) - 1
}