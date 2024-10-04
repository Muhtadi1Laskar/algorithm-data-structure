package main

import "fmt"

type DynamicStack struct {
	array []string
	top   int
}

func NewDynamicStack(size int) *DynamicStack {
	return &DynamicStack{array: make([]string, size), top: -1}
}

func (s *DynamicStack) Push(item string) {
	if s.top >= len(s.array)-1 {
		s.Resize()
	}
	s.top++
	s.array[s.top] = item
}

func (s *DynamicStack) Pop() string {
	var poppedItem string

	if s.top > -1 {
		poppedItem = s.array[s.top]
		s.top--
	}
	return poppedItem
}

func (s *DynamicStack) Peak() string {
	if s.top <= -1 {
		return "The stack is empty"
	}
	return s.array[s.top]
}

func (s *DynamicStack) Log() []string {
	return s.array
}

func (s *DynamicStack) Resize() *DynamicStack {
	newSize := len(s.array) * 2
	newArray := make([]string, newSize)

	for i := 0; i < len(s.array); i++ {
		newArray[i] = s.array[i]
	}
	s.array = newArray

	fmt.Println()
	return s
}

// func main() {
// 	stack := NewDynamicStack(10);

// 	stack.Push("C");
// 	stack.Push("Python");
// 	stack.Push("Julia");
// 	stack.Push("Go");
// 	stack.Push("Groovy");
// 	stack.Push("Ada");
// 	stack.Push("Assembly");
// 	stack.Push("B");
// 	stack.Push("Rust");
// 	stack.Push("Jai");
// 	stack.Push("Haskell");
// 	stack.Push("Clojure");
// 	stack.Push("Dart");

// 	fmt.Println(stack.Log());

// 	stack.Pop();

// 	fmt.Println(stack.Peak());
// 	stack.Push("Ruby");

// 	fmt.Println(stack.Peak());
// }
