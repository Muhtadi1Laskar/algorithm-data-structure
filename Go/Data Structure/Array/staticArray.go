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
	fmt.Println(array.len);
	if array.len >= size {
		fmt.Println("Array is full");
		return;
	}
	array.array[array.len] = item;
	array.len++;

	return;
}

func main() {
	array := newArray();

	array.Push(1);
	array.Push(2);
	array.Push(3);
	array.Push(4);
	array.Push(5);
	array.Push(6);
	array.Push(7);
	array.Push(8);
	array.Push(9);
	array.Push(10);
	array.Push(10);

	fmt.Println(array.array);
}