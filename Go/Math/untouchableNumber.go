package main


func checkUntouchable(n int) bool {
	for i := 1; i <= n*n; i++ {
		if aliquotSum(i) == n {
			return false
		}
	}
	return true
}