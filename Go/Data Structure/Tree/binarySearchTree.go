package main

import "fmt"

type Node struct {
	left  *Node
	right *Node
	value int
}

type BinarySearchTree struct {
	root Node
}

func NewBST () *BinarySearchTree {
	return &BinarySearchTree{}
}

func main() {
	binarySearchTree := NewBST()

	fmt.Println(binarySearchTree)
}
