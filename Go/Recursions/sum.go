package main

import "fmt"

func sum(n int) int {
	if n == 1 {
		return 1 
	}
	return n + sum(n-1)
}

func main() {
	fmt.Println(sum(5))
}