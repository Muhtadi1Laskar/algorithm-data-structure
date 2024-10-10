package main

import "fmt"

type CircularQueue struct {
	array []int
	size int
	front int
	rear int
	count int
}

func NewCircularQueue(size int) *CircularQueue {
	return &CircularQueue{
		array: make([]int, size),
		size: size,
		front: 0,
		rear: 0,
		count: 0,
	}
}




func main() {
	queue := NewCircularQueue()

	fmt.Println(queue)
}