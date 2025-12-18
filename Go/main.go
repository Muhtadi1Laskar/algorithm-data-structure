package main

import (
	"fmt"
)

func partition(array []int, low int, high int) int {
	var pivot int = array[high]
	var i int = low - 1

	for j := low; j < high; j++ {
		if array[j] < pivot {
			i++
			array[i], array[j] = array[j], array[i]
		}
	}
	array[i+1], array[high] = array[high], array[i+1]
	return i + 1
}

func quickSort(array []int, low int, high int) []int {
	if low < high {
		var pivotIndex = partition(array, low, high)
		fmt.Println("Pivot: ", array[pivotIndex])
		fmt.Println("Array: ", array)
		quickSort(array, low, pivotIndex-1)
		quickSort(array, pivotIndex+1, high)
	}
	return array
}

func main() {
	array := []int{8, 4, 3, 1, 6, 7, 11, 9, 2, 10, 5}

	fmt.Println(quickSort(array, 0, len(array)-1))
}
