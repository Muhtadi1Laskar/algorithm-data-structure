package main

import "fmt"

func binarySearch(array []int, item int) int {
	var l int = 0;
	var r int = len(array) - 1;

	for l <= r {
		var mid int = l + (r-l) / 2;

		if array[mid] == item {
			return mid;
		} else if array[mid] > item {
			r = mid - 1;
		} else {
			l = mid + 1;
		}
	}
	return -1;
}

func main() {
	array := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	fmt.Println(binarySearch(array, 10));
}