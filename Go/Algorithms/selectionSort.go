package main

func selectionSort(array []int) []int {
	for i := 0; i < len(array); i++ {
		var min int = i;

		for j := i+1; j < len(array); j++ {
			if array[min] > array[j] {
				min = j;
			}
		}
		if min != i {
			temp := array[i];
			array[i] = array[min];
			array[min] = temp;
		}
	}
	return array;
}