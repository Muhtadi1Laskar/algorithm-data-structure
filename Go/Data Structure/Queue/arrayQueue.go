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

func (queue *CircularQueue) isFull() bool {
	return queue.count == queue.size
}

func (queue *CircularQueue) isEmpty() bool {
	return queue.count == 0
}


func main() {
	queue := NewCircularQueue(10)

	fmt.Println(queue)
}