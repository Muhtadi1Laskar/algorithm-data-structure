package main

import "fmt"

type Node struct {
	value string
	next *Node
}

type Queue struct {
	top *Node
	bottom *Node
	len int
}

func NewListQueue() *Queue {
	return &Queue{}
}

func (q *Queue) Enqueue(value string) {
	newNode := &Node{ value: value }

	if q.top == nil {
		q.top = newNode
		q.bottom = newNode
		q.len++
		return
	}
	newNode.next = q.top
	q.top = newNode
	q.len++
	return
}

func (q *Queue) Log() []string {
	if q.top == nil {
		fmt.Println("The Queue is empty")
		return nil
	}
	currentNode := q.top
	var result []string

	for currentNode != nil {
		result = append(result, currentNode.value)
		currentNode = currentNode.next
	}
	return result
}

func main() {
	queue := NewListQueue()

	queue.Enqueue("Take note of the book Grokking Data Structure")
	queue.Enqueue("Practise writing")
	queue.Enqueue("Practise Golang")
	queue.Enqueue("Read the Learn Ethereum Book")

	fmt.Println(queue.Log())
}