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
	length int
}

func (li *LinkedList) PreAppend(value string) {
	newNode := &Node{
		value: value,
		next: li.head,
	}
	li.head = newNode
	li.length++
	return
}

func (li *LinkedList) Append(value string) {
	newNode := &Node{
		value: value,
		next: nil,
	}
	if li.head == nil {
		li.head = newNode
		li.length++
		return 
	}
	currentNode := li.head

	for currentNode.next != nil {
		currentNode = currentNode.next
	}
	currentNode.next = newNode
	li.length++
	return
}

func (li *LinkedList) Log() string {
	var result []string
	currentNode := li.head

	for currentNode != nil {
		result = append(result, currentNode.value)
		currentNode = currentNode.next
	}
	return strings.Join(result, " ---> ")
}

func main() {
	lists := LinkedList{}

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
	fmt.Printf("%s\n", lists.head.value)
}
