package main

import (
	"errors"
	"fmt"
)

type CircularQueue struct {
	array []int
	size  int
	front int
	rear  int
	count int
}

func NewCircularQueue(size int) *CircularQueue {
	return &CircularQueue{
		array: make([]int, size),
		size:  size,
		front: 0,
		rear:  0,
		count: 0,
	}
}

func (queue *CircularQueue) Enqueue(value int) error {
	if queue.isFull() {
		return errors.New("Queue is full")
	}
	queue.array[queue.rear] = value
	queue.rear = (queue.rear + 1) % queue.size
	queue.count++
	return nil
}

func (queue *CircularQueue) Dequeue() (int, error) {
	if queue.isEmpty() {
		return 0, errors.New("Queue is empty")
	}
	value := queue.array[queue.front]
	queue.front = (queue.front + 1) % queue.size
	queue.count--
	return value, nil
}

func (queue *CircularQueue) isFull() bool {
	return queue.count == queue.size
}

func (queue *CircularQueue) isEmpty() bool {
	return queue.count == 0
}

func (queue *CircularQueue) getSize() int {
	return queue.size
}

func main() {
	queue := NewCircularQueue(10)

	error := queue.Enqueue(2)

	if error != nil {
		fmt.Println(error)
	}

	queue.Enqueue(3)
	queue.Enqueue(2)
	queue.Enqueue(4)
	queue.Enqueue(5)
	queue.Enqueue(6)
	queue.Enqueue(7)
	queue.Enqueue(8)
	queue.Enqueue(9)
	queue.Enqueue(10)

	fmt.Println(queue.array)

	deletedItem, err := queue.Dequeue()
	if err != nil {
		fmt.Println(error)
	}
	fmt.Println(deletedItem)
	fmt.Println(queue.array, queue.rear, queue.front)

	queue.Enqueue(100)
	fmt.Println(queue.array)
}
