package main

func ShuttleSort(array []int) []int {
	for i := 1; i < len(array); i++ {
		j := i
		for j > 0 && array[j-1] > array[j] {
			temp := array[j]
			array[j] = array[j-1]
			array[j-1] = temp
			j--
		}
	}
	return array
}