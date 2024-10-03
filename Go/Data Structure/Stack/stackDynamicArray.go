package main

import "fmt"

type DynamicStack struct {
	array []string
	top int
}

func NewDynamicStack(size int) *DynamicStack { 
	return &DynamicStack{ array: make([]string, size), top: -1 }
}

func (s *DynamicStack) Push(item string) {
	if s.top >= len(s.array) - 1 {
		s.Resize();
	}
	s.top++;
	s.array[s.top] = item;
}

func (s *DynamicStack) Log() []string {
	return s.array;
}

func (s *DynamicStack) Resize() *DynamicStack {
	newSize := len(s.array) * 2;
	newArray := make([]string, newSize);
	
	for i := 0; i < len(s.array); i++ {
		newArray[i] = s.array[i];
	}
	s.array = newArray;
	
	return s;
}

func main() {
	stack := NewDynamicStack(10);

	stack.Push("C");
	stack.Push("Python");
	stack.Push("Julia");
	stack.Push("Go");
	stack.Push("Groovy1");
	stack.Push("Groovy2");
	stack.Push("Groovy3");
	stack.Push("Groovy4");
	stack.Push("Groovy5");
	stack.Push("Groovy6");
	stack.Push("Groovy7");
	stack.Push("Groovy11");
	stack.Push("Groovy12");

	fmt.Println(stack.Log());
}