package main

import "fmt"

func linearSearch(array []int, item int) int {
	for i := 0; i < len(array); i++ {
		if array[i] == item {
			return i;
		}
	}
	return -1;
}

func main() {
	array := []int{1, 2, 3, 4, 5, 6, 7, 8, 10};
	fmt.Println(linearSearch(array, 5));
}