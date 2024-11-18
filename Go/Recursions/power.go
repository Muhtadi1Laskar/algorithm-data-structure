package main

func power(n int, e int) int {
	if e == 0 {
		return 1
	}
	return n * power(n, e-1)
}
