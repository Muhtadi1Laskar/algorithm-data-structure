package main 

import "fmt"

func bubbleSort(array []int) []int {
	for i := 0; i < len(array); i++ {
		for j := i+1; j < len(array); j++ {
			if array[i] > array[j] {
				temp := array[i];
				array[i] = array[j];
				array[j] = temp;
			}
		}
	}
	return array;
}

func main() {
	array := []int{5, 4, 3, 2, 1};
	fmt.Println(bubbleSort(array));
}