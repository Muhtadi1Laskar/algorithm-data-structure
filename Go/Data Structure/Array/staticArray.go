package main

import "fmt"

type Array struct {
	array []int
	len int
}

const size int = 10;

func newArray() *Array {
	return &Array{array: make([]int, size), len: 0};
}

func (array *Array) Push(item int) {
	if array.len >= size {
		fmt.Println("Array is full");
		return;
	}
	array.array[array.len] = item;
	array.len++;

	return;
}

func (array *Array) GetLength() int {
	return array.len;
}

func main() {
	array := newArray();

	for i := 1; i <= 10; i++ {
		array.Push(i);
	}

	fmt.Println(array.array);
	fmt.Println(array.len);
}