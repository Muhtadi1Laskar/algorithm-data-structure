package main

import "fmt"

type Array struct {
	array []int
	len   int
}

const size int = 10

func newArray() *Array {
	return &Array{
		array: make([]int, size),
		len:   0,
	}
}

func (array *Array) Push(item int) {
	if array.len >= size {
		fmt.Println("Array is full")
		return
	}
	array.array[array.len] = item
	array.len++

	return
}

func (array *Array) Delete(index int) []int {
	if index < 0 || index > array.len {
		fmt.Println("Index out of Range")
		return nil
	}
	for i := index; i < len(array.array)-1; i++ {
		array.array[i] = array.array[i+1]
	}
	array.len--
	array.array[array.len] = 0

	return array.array[:array.len]
}

func (array *Array) Traverse(fn func(int) int) []int {
	var resultArray []int

	for i := 0; i < len(array.array); i++ {
		resultArray = append(resultArray, fn(array.array[i]))
	}
	return resultArray
}

func (array *Array) GetLength() int {
	return array.len
}

func double(num int) int {
	return num * num
}

// func main() {
// 	array := newArray();

// 	for i := 1; i <= 10; i++ {
// 		array.Push(i);
// 	}

// 	fmt.Println(array.array);
// 	fmt.Println(array.len);

// 	fmt.Println(array.Traverse(double));

// 	fmt.Println(array.Delete(0));
// 	fmt.Println(array.Delete(1));
// 	fmt.Println(array.Delete(2));
// 	fmt.Println(array.Delete(3));
// 	fmt.Println(array.Delete(4));
// 	fmt.Println(array.Delete(5));
// 	fmt.Println(array.array);

// 	array.Push(100);
// 	array.Push(200);
// 	array.Push(300);
// 	array.Push(400);
// 	array.Push(500);
// 	array.Push(600);

// 	fmt.Println(array.array);
// }
