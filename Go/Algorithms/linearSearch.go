package main

import "fmt"

func linearSearch(array []int, item int) int {
	for idx, elem := range array {
		if elem == item {
			return idx;
		}
	}
	return -1;
}

func main() {
	array := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	fmt.Println(linearSearch(array, 10));
}