package main

import (
	"fmt"
)

type DynamicArray struct {
	size int
	arr  []string
	len  int
}

func NewDynamicArray(arraySize int) *DynamicArray {
	return &DynamicArray{size: arraySize, arr: make([]string, arraySize), len: 0}
}

func (arr *DynamicArray) Push(item string) {
	if arr.len == arr.size {
		arr.Resize()
	}
	arr.arr[arr.len] = item
	arr.len++
	return
}

func (arr *DynamicArray) Insert(index int, item string) {
	if index < 0 || index > arr.len {
		fmt.Println("Index out of Range")
		return
	}

	for i := arr.len; i >= index; i-- {
		arr.arr[i] = arr.arr[i-1]
	}
	arr.arr[index] = item
	arr.len++
	return
}

func (arr *DynamicArray) Delete(index int) {
	if index < 0 || index > arr.len {
		fmt.Println("Index out of Range")
		return
	}

	for i := index; i < arr.len-1; i++ {
		arr.arr[i] = arr.arr[i+1]
	}
	arr.arr[arr.len-1] = ""
	arr.len--
	return
}

func (arr *DynamicArray) GetLen() int {
	return arr.len
}

func (arr *DynamicArray) Search(item string) int {
	for i := 0; i < arr.len; i++ {
		if arr.arr[i] == item {
			return i
		}
	}
	return -1
}

func (arr *DynamicArray) Resize() {
	newSize := arr.size * 2
	newArray := make([]string, newSize)

	for i := 0; i < len(arr.arr); i++ {
		newArray[i] = arr.arr[i]
	}
	arr.arr = newArray
	arr.size = newSize
}

func (arr *DynamicArray) Shrink() {
	if arr.len < arr.size/2 {
		newSize := int(arr.size / 2)
		newArray := make([]string, newSize)

		for i := range arr.len {
			newArray[i] = arr.arr[i]
		}
		arr.arr = newArray
		arr.size = newSize
	}
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

	array.Delete(5)

	fmt.Println(array.arr)

	array.Insert(9, "Machine Code")

	array.Delete(9)
	array.Delete(8)
	array.Delete(7)
	array.Delete(6)

	fmt.Println(array.arr, array.size, array.len)

	array.Shrink()

	fmt.Println(array.arr, array.size, array.len)
}
