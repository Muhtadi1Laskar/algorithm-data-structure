package main

import "fmt"

func aliquotSum(n int) int {
	var result int = 0

	for i := 1; i <= n/2; i++ {
		if n % i == 0 {
			result += i
		}
	}
	return result
}

func main() {
	fmt.Println(aliquotSum(10))
}