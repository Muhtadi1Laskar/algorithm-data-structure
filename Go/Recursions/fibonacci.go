package main

import "fmt"

func fib(n int) int {
	if n <= 2 {
		return 1
	}
	return fib(n-1) + fib(n-2)
}

func main() {
	var number int = 10

	fmt.Println(fib(number))
}