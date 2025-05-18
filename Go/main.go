package main

import (
	"fmt"
	"strings"
)

type Node[T comparable] struct {
	value T
	next *Node[T]
}

type LinkedList[T comparable] struct {
	head *Node[T]
	length int
}

func NewLinkesList[T comparable]() *LinkedList[T] {
	return &LinkedList[T]{}
}

func (list *LinkedList[T]) isEmpty() bool {
	return list.head == nil
}

func (list *LinkedList[T]) PreAppend(data T) {
	newNode := &Node[T]{value: data, next: list.head}
	list.head = newNode
	list.length++
	return
}

func (list *LinkedList[T]) Append(data T) {
	newNode := &Node[T]{value: data}

	if list.isEmpty() {
		list.head = newNode
		list.length++
		return
	}
	currentNode := list.head

	for currentNode.next != nil {
		currentNode = currentNode.next
	}
	currentNode.next = newNode
	list.length++
	return
}

func (list *LinkedList[T]) Delete(value T) {
	if list.head == nil {
		fmt.Println("The list is empty")
		return
	}

	if list.head.value == value {
		list.head = list.head.next
		list.length--
		return
	}
	currentNode := list.head

	for currentNode.next != nil {
		if currentNode.next.value == value {
			currentNode.next = currentNode.next.next
			list.length--
			return
		}
		currentNode = currentNode.next
	}
}

func (list *LinkedList[T]) Insert(data T, index int) {
	if index <= 0 || index > list.length + 1 {
		fmt.Println("Index out of range")
		return
	}

	if index == 1 {
		list.PreAppend(data)
		return
	}
	newNode := &Node[T]{value: data}
	prevNode := list.head

	for i := 1; i < index - 1; i++ {
		prevNode = prevNode.next
	}
	newNode.next = prevNode.next
	prevNode.next = newNode
	list.length++
	return
}

func (list *LinkedList[T]) Log() string {
	currentNode := list.head

	var result []string

	for currentNode != nil {
		result = append(result, fmt.Sprintf("%v", currentNode.value))
		currentNode = currentNode.next
	}
	return strings.Join(result, " ----> ")
}

func main() {
	lists := NewLinkesList[string]()

	lists.Append("C")
	lists.Append("JavaScript")
	lists.Append("Python")
	lists.Append("Go")
	lists.Append("Julia")
	lists.Append("Odin")
	lists.Append("Haskell")

	fmt.Println(lists.Log())

	lists.PreAppend("Assembly")
	lists.PreAppend("Machine Code")

	fmt.Println(lists.Log())

	lists.Insert("Transistors", 10)
	fmt.Println(lists.Log())

	lists.Delete("Machine Code")

	fmt.Println(lists.Log())
}