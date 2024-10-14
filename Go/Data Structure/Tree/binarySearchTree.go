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

func main() {
	fmt.Println("Hello World")
}
