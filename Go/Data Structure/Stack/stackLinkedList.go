package main

import (
	"fmt"
	"strings"
)

type Node struct {
	value string
	next  *Node
}

type StackList struct {
	top    *Node
	bottom *Node
	length int
}

func NewStackList() *StackList {
	return &StackList{}
}

func (s *StackList) Push(item string) {
	newNode := &Node{value: item}

	if s.top == nil {
		s.top = newNode
		s.bottom = newNode
		s.length++
		return
	}

	newNode.next = s.top
	s.top = newNode
	s.length++
}

func (s *StackList) Log() string {
	if s.top == nil {
		return "The list is empty"
	}
	currentNode := s.top
	var result []string

	for currentNode != nil {
		result = append(result, currentNode.value)
		currentNode = currentNode.next
	}
	formattedStr := strings.Join(result, " <-|||| ")

	return formattedStr
}

func (s *StackList) Pop() {
	if s.top == nil {
		fmt.Println("The stack is empty")
		return
	}
	currentNode := s.top
	s.top = currentNode.next
	s.length--
}

func (s *StackList) Peak() string {
	if s.top == nil {
		return "The stack is empty"
	}
	return s.top.value
}

func main() {
	stack := NewStackList()

	stack.Push("James")
	stack.Push("Ice Cude")
	stack.Push("Kevin Hart")
	stack.Push("Conan")
	stack.Push("Bill")

	fmt.Println(stack.Log())

	stack.Pop()
	stack.Pop()

	fmt.Println(stack.Log())
	fmt.Println(stack.Peak())
}
