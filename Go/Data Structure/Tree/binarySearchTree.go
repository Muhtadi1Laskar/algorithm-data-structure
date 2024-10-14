package main

import "fmt"

type Node struct {
	left  *Node
	right *Node
	value int
}

type BinarySearchTree struct {
	root *Node
}

func NewBST () *BinarySearchTree {
	return &BinarySearchTree{ }
}

func (bst *BinarySearchTree) Insert(value int) {
	if bst.root == nil {
		bst.root = &Node{ value: value }
	} else {
		bst._insert(bst.root, value)
	}
}

func (bst *BinarySearchTree) _insert(node *Node, value int) {
	if value < node.value {
		if node.left == nil {
			node.left = &Node{value: value}
		} else {
			bst._insert(node.left, value)
		}
	} else {
		if node.right == nil {
			node.right = &Node{ value: value }
		} else {
			bst._insert(node.right, value)
		}
	}
}

func (bst *BinarySearchTree) Search(value int) int {
	currentNode := bst.root
	for currentNode != nil {
		if value < currentNode.value {
			currentNode = currentNode.left
		} else if value > currentNode.value {
			currentNode = currentNode.right
		} else {
			return currentNode.value
		}
	}
	return -1
}

func main() {
	binarySearchTree := NewBST()

	binarySearchTree.Insert(10)
	binarySearchTree.Insert(3)
	binarySearchTree.Insert(2)
	binarySearchTree.Insert(6)
	binarySearchTree.Insert(11)
	binarySearchTree.Insert(17)
	binarySearchTree.Insert(120)

	fmt.Println(binarySearchTree.Search(11))
}
