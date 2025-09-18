package main

import (
	"math/rand"
	"time"
)

func shuffle(array []int) []int {
	if len(array) == 0 {
		return nil
	}

	r := rand.New(rand.NewSource(time.Now().UnixNano()))

	for i := len(array) - 1; i > 0; i-- {
		j := r.Intn(i + 1)

		array[i], array[j] = array[j], array[i]
	}
	
	return array
}

func isSorted(array []int) bool {
	for i := 0; i < len(array) - 1; i++ {
		if array[i] > array[i+1] {
			return false
		}
	}
	return true
}

func BogoSort(array []int) []int {
	newArray := array
	for !isSorted(newArray) {
		newArray = shuffle(newArray)
	}
	return newArray
}
