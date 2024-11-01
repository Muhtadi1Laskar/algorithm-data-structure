package main

func aliquotSum(n int) int {
	var result int = 0

	for i := 1; i < n; i++ {
		if n % i == 0 {
			result += i
		}
	}
	return result
}

func checkUntouchable(n int) bool {
	for i := 1; i <= n*n; i++ {
		if aliquotSum(i) == n {
			return false
		}
	}
	return true
}

func checkAbundant(n int) bool {
	if aliquotSum(n) > n {
		return true
	}
	return false
}