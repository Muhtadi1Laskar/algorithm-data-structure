package main

import (
	"fmt"
	"strings"
)

type Node struct {
	value string
	next  *Node
}

type LinkedList struct {
	head   *Node
	tail   *Node
	length int
}

func NewListBag() *LinkedList {
	return &LinkedList{}
}

func (b *LinkedList) isEmpty() bool {
	return b.head == nil
}

func (b *LinkedList) Push(item string) {
	newNode := &Node{value: item}

	if b.isEmpty() {
		b.head = newNode
		b.tail = newNode
		b.length += 1
		return
	}
	b.tail.next = newNode
	b.tail = newNode
	b.length += 1
}

func (b *LinkedList) Delete(index int) {
	if index < 0 || index > b.length {
		fmt.Println("Index out of Range")
		return
	}

	if index == 1 {
		current := b.head
		b.head = current.next
		b.length--
		return
	}
	previousNode := b.head

	for i := 1; i < index-1; i++ {
		previousNode = previousNode.next
	}
	currentNode := previousNode.next
	previousNode.next = currentNode.next
	b.length--
}

func (b *LinkedList) Greatest() *Node {
	current := b.head
	max := b.head

	for current != nil {
		if len(max.value) < len(current.value) {
			max = current
		}
		current = current.next
	}
	return max
}

func (b *LinkedList) Log() string {
	if b.isEmpty() {
		return "The bag is empty"
	}
	currentNode := b.head
	var result []string

	for currentNode != nil {
		result = append(result, currentNode.value)
		currentNode = currentNode.next
	}
	formattedStr := strings.Join(result, " ---> ")

	return formattedStr
}

// func main() {
// 	bag := NewListBag()

// 	bag.Push("James")
// 	bag.Push("Mark")
// 	bag.Push("Randall")
// 	bag.Push("William")
// 	bag.Push("Chris Jackson")

// 	fmt.Println(bag.Log())

// 	bag.Delete(2)
// 	fmt.Println(bag.Log())

// 	fmt.Println(bag.Greatest().value)
// }