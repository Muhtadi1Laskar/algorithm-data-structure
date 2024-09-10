package main 

func linearSearch(array []int, item int) int {
	for idx, elem := range array {
		if elem == item {
			return idx;
		}
	}
	return -1;
}