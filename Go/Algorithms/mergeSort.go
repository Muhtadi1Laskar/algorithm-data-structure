package main

import "fmt"

func merge(left, right []int) []int {
	var result []int
	var i int = 0
	var j int = 0

	for i < len(left) && j < len(right) {
		if left[i] < right[j] {
			result = append(result, left[i])
			i++
		} else {
			result = append(result, right[j])
			j++
		}
	}

	result = append(result, left[i:]...)
	result = append(result, right[j:]...)

	return result
}

func mergeSort(array []int) []int {
	if len(array) <= 1 {
		return array
	}
	var mid int = len(array) / 2
	var left []int = mergeSort(array[:mid])
	var right []int = mergeSort(array[mid:])

	return merge(left, right)
}

func main() {
	unsortedArray := []int{10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
	fmt.Println(mergeSort(unsortedArray))
}