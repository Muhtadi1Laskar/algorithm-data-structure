package main

import (
	"fmt"
)

func insertionSort(array []int) []int {
	for i := 0; i < len(array); i++ {
		key := array[i]
		j := i - 1

		for j >= 0 && array[j] > key {
			array[j+1] = array[j]
			j--
		}
		array[j+1] = key
	}
	return array
}

func main() {
	array := []int{5, -
		4, -3, 2, 1}

	fmt.Println(insertionSort(array))
}