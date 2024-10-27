package main

import "fmt"

func fibonacciSeries(n int) {
	var a int = 0
	var b int = 1

	for a < n {
		fmt.Printf("%d ", a)

		temp := a
		a = b
		b = temp + b
	}
	fmt.Println()
}