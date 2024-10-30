package main

func gnomeSort(array []int) []int {
	var index int = 0

	for index < len(array) {
		if index == 0 {
			index++
		} else if (array[index] >= array[index-1]) {
			index++
		} else {
			temp := array[index]
			array[index] = array[index-1]
			array[index-1] = temp
			index--
		}
	}
	return array
}

