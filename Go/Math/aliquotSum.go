package main

func aliquotSum(n int) int {
	var result int = 0

	for i := 1; i <= n; i++ {
		if n % i == 0 {
			result += i
		}
	}
	return result
}