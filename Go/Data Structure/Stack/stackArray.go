package main

import "fmt"

const size int = 5;

type Stack struct {
	array [5]string
	top int
}

func NewStack() *Stack {
	return &Stack{array: [5]string{}, top: -1}
}

func (s *Stack) Push(item string) {
	if s.top == size-1 {
		fmt.Println("Index out of Range");
		return;
	}
	s.top++;
	s.array[s.top] = item;
}

func (s *Stack) Log() string {
	return s.array[s.top];
}

func main() {
	stack := NewStack();

	stack.Push("James");
	stack.Push("Ice Cude");
	stack.Push("Kevin Hart");
	stack.Push("Conan");
	stack.Push("Bill");

	fmt.Println(stack.Log());
}