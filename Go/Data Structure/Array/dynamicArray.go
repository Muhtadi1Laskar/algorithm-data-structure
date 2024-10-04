package main

import "fmt"

type DynamicArray struct {
	size int
	arr  []string
	len  int
}

func NewDynamicArray(arraySize int) *DynamicArray {
	return &DynamicArray{size: arraySize, arr: make([]string, arraySize), len: 0}
}

func (arr *DynamicArray) Push(item string) {
	fmt.Println(arr.arr)
	if arr.len == arr.size {
		arr.Resize()
	}
	arr.arr[arr.len] = item
	arr.len++
	return
}

func (arr *DynamicArray) GetLen() int {
	return arr.len
}

func (arr *DynamicArray) Search(item string) int {
	for i := 0; i < arr.len; i++ {
		if arr.arr[i] == item {
			return i;
		}
	}
	return -1;
}

func (arr *DynamicArray) Resize() *DynamicArray {
	newSize := arr.size * 2
	newArray := make([]string, newSize)

	for i := 0; i < len(arr.arr); i++ {
		newArray[i] = arr.arr[i]
	}
	arr.arr = newArray
	arr.size = newSize

	return arr
}

func main() {
	array := NewDynamicArray(10)

	array.Push("Assembly")
	array.Push("A.Net")
	array.Push("ALGOL")
	array.Push("Ada")
	array.Push("BASIC")
	array.Push("BCPL")
	array.Push("C")
	array.Push("C#")
	array.Push("COBOL")
	array.Push("Chuck")
	array.Push("Delphi")

	fmt.Println(array.arr)
}
