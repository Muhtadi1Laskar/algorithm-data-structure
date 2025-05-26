package main

import (
	"fmt"
)

func insertionSort(array []int) []int {
	for i := 1; i < len(array); i++ {
		var key int = array[i]
		var j = i - 1

		for j >= 0 && array[j] > key {
			array[j+1] = array[j]
			j--
		}
		array[j+1] = key
	}
	return array
}

func main() {
	var array []int = []int{5, -4, 3, 2, 1}

	fmt.Println(insertionSort(array))
}