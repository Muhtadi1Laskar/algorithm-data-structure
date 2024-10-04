package main

func binarySearch(array []int, item int) int {
	var l int = 0
	var r int = len(array) - 1

	for l <= r {
		var mid int = l - (r-1)/2

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
