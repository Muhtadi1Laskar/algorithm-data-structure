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

func NewLinkedList() *LinkedList {
	return &LinkedList{}
}

func (list *LinkedList) IsEmpty() bool {
	return list.head == nil
}

func (list *LinkedList) PreAppend(data string) {
	newNode := &Node{value: data}

	if list.IsEmpty() {
		list.head = newNode
		list.tail = newNode
		list.length++
		return
	}
	newNode.next = list.head
	list.head = newNode
	list.length++
	return
}

func (list *LinkedList) Append(data string) {
	newNode := &Node{value: data}

	if list.IsEmpty() {
		list.head = newNode
		list.tail = newNode
		list.length += 1
		return
	}
	list.tail.next = newNode
	list.tail = newNode
	list.length += 1
	return
}

func (list *LinkedList) Insert(index int, data string) {
	if index <= 0 || index > list.length+1 {
		fmt.Println("Index out of bound")
		return
	}

	if index == 1 {
		list.PreAppend(data)
		return
	}

	previousNode := list.head
	for i := 1; i < index-1; i++ {
		previousNode = previousNode.next
	}

	newNode := &Node{value: data}

	newNode.next = previousNode.next
	previousNode.next = newNode
	list.length++
	return
}

func (list *LinkedList) Delete(index int) *Node {
	if index == 1 {
		currentNode := list.head
		list.head = currentNode.next
		list.length--
		return currentNode
	}
	if index <= 0 {
		fmt.Println("Index out of range")
		return nil
	}
	
	previousNode := list.head

	for i := 1; i < index-1; i++ {
		previousNode = previousNode.next
	}

	currentNode := previousNode.next

	previousNode.next = currentNode.next
	list.length--

	return currentNode
}

func (list *LinkedList) TraverseToIndex(index int) *Node {
	if list.head == nil {
		fmt.Println("The list is empty")
		return nil
	}

	if index < 0 {
		fmt.Println("Index out of range")
		return nil
	}

	currentNode := list.head

	for i := 1; i < index; i++ {
		currentNode = currentNode.next
	}
	return currentNode
}

func (list *LinkedList) Log() string {
	currentNode := list.head
	var nodeData []string

	for currentNode != nil {
		nodeData = append(nodeData, currentNode.value)
		currentNode = currentNode.next
	}
	outputString := strings.Join(nodeData, " ----> ")

	return outputString
}

func (list *LinkedList) SwapNodes(val1, val2 string) {
	if val1 == val2 {
		fmt.Println("Both nodes have the same value, no need to swap.")
		return
	}

	var prevX, prevY, nodeX, nodeY *Node
	current := list.head

	for current != nil {
		if current.next != nil && current.next.value == val1 {
			prevX = current
			nodeX = current.next
		} else if current.next != nil && current.next.value == val2 {
			prevY = current
			nodeY = current.next
		}
		if current.value == val1 {
			nodeX = current
		}
		if current.value == val2 {
			nodeY = current
		}
		current = current.next
	}

	if nodeX == nil || nodeY == nil {
		fmt.Println("One or both of the values were not found in the list.")
		return
	}

	if prevX != nil {
		prevX.next = nodeY
	} else {
		list.head = nodeY
	}

	if prevY != nil {
		prevY.next = nodeX
	} else {
		list.head = nodeX
	}

	nodeX.next, nodeY.next = nodeY.next, nodeX.next
}

func main() {
	lists := NewLinkedList()

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

	lists.SwapNodes("Go", "Julia")
	fmt.Println(lists.Log())

	lists.Insert(10, "Transistors")
	fmt.Println(lists.Log())

	lists.Delete(3)

	fmt.Println(lists.Log())
}
