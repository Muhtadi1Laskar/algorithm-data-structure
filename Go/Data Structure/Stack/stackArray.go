package main

import "fmt"

const size int = 5

type Stack struct {
	array [5]string
	top   int
}

func NewStack() *Stack {
	return &Stack{array: [5]string{}, top: -1}
}

func (s *Stack) Push(item string) {
	if s.top == size-1 {
		fmt.Println("Index out of Range")
		return
	}
	s.top++
	s.array[s.top] = item
}

func (s *Stack) Pop() string {
	var result string

	if s.top > -1 {
		result = s.array[s.top]
		s.top--
	}
	return result
}

func (s *Stack) Log() [5]string {
	return s.array
}

func (s *Stack) Peak() string {
	if s.top <= -1 {
		return "The stack is empty"
	}
	fmt.Println(s.array[s.top])
	return s.array[s.top]
}

// func main() {
// 	stack := NewStack();

// 	stack.Push("James");
// 	stack.Push("Ice Cude");
// 	stack.Push("Kevin Hart");
// 	stack.Push("Conan");
// 	stack.Push("Bill");

// 	fmt.Println(stack.Log());

// 	stack.Pop();
// 	fmt.Println(stack.Log());
// 	stack.Push("Gloria");
// 	fmt.Println(stack.Log());
// 	fmt.Println(stack.Peak());

// 	stack.Pop();
// 	stack.Pop();
// 	stack.Pop();

// 	fmt.Println(stack.Peak());
// }
