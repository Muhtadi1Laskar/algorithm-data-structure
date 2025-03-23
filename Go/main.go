package main

import (
	"fmt"
)

type Node struct {
	value string
	next *Node
}

type Stack struct {
	head *Node
	length int
}

func NewStack() *Stack {
	return &Stack{
		head: nil,
		length: 0,
	}
}

func (s *Stack) Push(value string) {
	newNode := &Node{
		value: value,
		next: s.head,
	}

	s.head = newNode
	s.length++
	return
}

func (s *Stack) Pop() {
	if s.head == nil {
		fmt.Println("The stack is empty")
		return
	}

	s.head = s.head.next
	s.length--
	return
}

func (s *Stack) Peak() string {
	if s.head == nil {
		return "The stack is empty"
	}
	return s.head.value
}

func (s *Stack) Print() []string {
	if s.head == nil {
		fmt.Println("The stack is empty")
		return nil
	}
	result := make([]string, s.length)
	currentNode := s.head

	for i := 0; currentNode != nil; i++ {
		result[i] = currentNode.value
		currentNode = currentNode.next
	}
	return result
}


func main() {
	stack := NewStack()

	stack.Push("x = 10")
	stack.Push("y = 20")
	stack.Push("z = 40")
	stack.Push("m = 50")
	stack.Push("n = 60")
	stack.Push("k = 70")
	stack.Push("l = 80")

	fmt.Println(stack.Print())
	fmt.Println(stack.head.value)

	stack.Pop()

	fmt.Println(stack.Print())

	fmt.Println(stack.Peak())
}