package main

import (
	"fmt"
	"strings"
)

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

func (q *Queue) Dequeue() string {
	if q.top == nil {
		return "The queue is empty"
	}
	if q.top.next == nil {
		n := q.top
		q.top = nil
		q.bottom = nil
		q.len--
		return n.value
	}
	nodeToDelete := q.top

	for nodeToDelete.next.next != nil {
		nodeToDelete = nodeToDelete.next
	}
	nodeToDelete.next = nil
	q.bottom = nodeToDelete
	q.len--

	return nodeToDelete.value
}

func (q *Queue) Log() string {
	if q.top == nil {
		return "The queue is empty"
	}
	currentNode := q.top
	var result []string

	for currentNode != nil {
		result = append(result, currentNode.value)
		currentNode = currentNode.next
	}
	return strings.Join(result, "|---|")
}

func main() {
	queue := NewListQueue()

	queue.Enqueue("C")
	queue.Enqueue("JavaScript")
	queue.Enqueue("Python")
	queue.Enqueue("C#")

	fmt.Println(queue.Log())

	queue.Dequeue()
	queue.Dequeue()
	queue.Dequeue()

	fmt.Println(queue.Log())
}