package main

import (
	"fmt"
)

func binarySearch(array []string, item string) int {
	var l int = 0
	var r int = len(array) - 1

	for l <= r {
		mid := l + (r-l)/2

		if array[mid] == item {
			return mid
		} else if array[mid] > item {
			r = mid - 1
		} else {
			l = mid + 1
		}
	}
	return -1
}

func main() {
	var array []string = []string{"Assembly", "C", "JavaScript", "Machine Code", "Python"}

	fmt.Println(binarySearch(array, "C"))
}
