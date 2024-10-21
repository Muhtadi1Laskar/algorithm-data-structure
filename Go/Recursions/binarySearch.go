package main

// import "fmt"

func binarySearch(array []int, item, l, r int) int {
	if l <= r {
		var mid int = l + (r-l) / r

		if array[mid] == item {
			return mid
		} else if array[mid] > item {
			return binarySearch(array, item, l, mid-1)
		} else {
			return binarySearch(array, item, mid+1, r)
		}
	} else {
		return -1
	}
}

// func main() {
// 	var array []int = []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
// 	var item int = 9
// 	var left int = 0
// 	var right int = len(array) - 1

// 	fmt.Println(binarySearch(array, item, left, right))
// }