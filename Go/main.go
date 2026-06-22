package main

import (
	"fmt"
)

func factorial(x int) int {
	var result int = 1

	for i := x; i >= 2; i-- {
		result *= i
	}
	return result
}

func main() {
	// var array [6]int = [6]int{5, 4, 3, 55, 2, 1}

	// fmt.Println(insertionSort(array[:]))
	fmt.Printf("%d", factorial(7))
}