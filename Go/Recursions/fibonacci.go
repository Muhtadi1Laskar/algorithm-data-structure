package main

import (
	// "fmt"
	"math/big"
)

func fib(n int) int {
	if n <= 2 {
		return 1
	}
	return fib(n-1) + fib(n-2)
}

func fibMemo(n int, memo map[int]*big.Int) *big.Int {
	if val, exists := memo[n]; exists {
		return val
	}

	if n <= 2 {
		return big.NewInt(1)
	}

	memo[n] = new(big.Int).Add(fibMemo(n-1, memo), fibMemo(n-2, memo))
	return memo[n]
}

func fibIter(n int) *big.Int {
	if n == 0 {
		return big.NewInt(0)
	}
	last := big.NewInt(0)
	next := big.NewInt(1)

	for i := 1; i < n; i++ {
		temp := new(big.Int).Set(last)
		last.Set(next)
		next.Add(temp, next)
	}
	return next
}

// func main() {
// 	number := 200
// 	memo := make(map[int]*big.Int)

// 	fmt.Println(fibMemo(number, memo))
// }