package main

import (
	"fmt"
	"strings"
)

type Node struct {
	value string
	next *Node
}

type LinkedList struct {
	head *Node
	length int
}

func (li *LinkedList) PreAppend(value string) {
	newNode := &Node{
		value: value,
		next: li.head,
	}
	li.head = newNode
	li.length++
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

func (li *LinkedList) Insert(value string, index int) {
	if index <= 0 {
		fmt.Println("Invalid index")
		return
	}
	newNode := &Node{
		value: value,
		next: nil,
	}
	
	if index == 1 {
		newNode.next = li.head
		li.head = newNode
		li.length++
		return
	}

	currentNode := li.head
	count := 1

	for currentNode.next != nil && count < index - 1 {
		currentNode = currentNode.next
		count++
	}

	newNode.next = currentNode.next
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
	list := LinkedList{}

	list.Append("C")
	list.Append("Python")
	list.Append("JavaScript")
	list.Append("Ruby")
	list.Append("Haskell")
	list.Append("Odin")
	list.PreAppend("Assembly")

	fmt.Println(list.Log())

	list.Insert("Machine Code", 9)

	fmt.Printf("%s", list.Log())
}