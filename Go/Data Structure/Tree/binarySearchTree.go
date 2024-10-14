package main

import "fmt"

type Node struct {
	left  *Node
	right *Node
	value string
}

type BinarySearchTree struct {
	root *Node
}

func NewBST () *BinarySearchTree {
	return &BinarySearchTree{ }
}

func (bst *BinarySearchTree) Insert(value string) {
	if bst.root == nil {
		bst.root = &Node{ value: value }
	} else {
		bst._insert(bst.root, value)
	}
}

func (bst *BinarySearchTree) _insert(node *Node, value string) {
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

func (bst *BinarySearchTree) Search(value string) string {
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
	return ""
}

func (bst *BinarySearchTree) BreadthFirstSearch() []string {
	if bst.root == nil {
		return nil
	}
	var list []string = []string{}
	var queue []*Node = []*Node{bst.root}

	for len(queue) > 0 {
		currentNode := queue[0]
		queue = queue[1:]
		list = append(list, currentNode.value)

		if currentNode.left != nil {
			queue = append(queue, currentNode.left)
		}
		if currentNode.right != nil {
			queue = append(queue, currentNode.right)
		}
	}
	return list
}

func (bst *BinarySearchTree) DFSInOrder() []string {
	return bst.traverseInOrder(bst.root, []string{})
}

func (bst *BinarySearchTree) traverseInOrder(node *Node, list []string) []string {
	if node == nil {
		return list
	}
	list = bst.traverseInOrder(node.left, list)
	list = append(list, node.value)
	list = bst.traverseInOrder(node.right, list)
	return list
}

func (bst *BinarySearchTree) DFSPreOrder() []string {
	return bst.traversePreOrder(bst.root, []string{})
}

func (bst *BinarySearchTree) traversePreOrder(node *Node, list []string) []string {
	if node == nil {
		return list
	}
	list = append(list, node.value)
	list = bst.traversePreOrder(node.left, list)
	list = bst.traversePreOrder(node.right, list)
	return list
}

func (bst *BinarySearchTree) DFSPostOrder() []string {
	return bst.traversePostOrder(bst.root, []string{})
}

func (bst *BinarySearchTree) traversePostOrder(node *Node, list []string) []string {
	if node == nil {
		return list
	}
	list = bst.traversePostOrder(node.left, list)
	list = bst.traversePostOrder(node.right, list)
	list = append(list, node.value)
	return list
}

func main() {
	bst := NewBST()

	bst.Insert("C")
	bst.Insert("JavaScript")
	bst.Insert("Python")
	bst.Insert("Odin")
	bst.Insert("Haskell")

	fmt.Println(bst.Search("Haskell"))
	// fmt.Println(bst.BreadthFirstSearch())
	fmt.Println(bst.DFSInOrder())
	fmt.Println(bst.DFSPreOrder())
	fmt.Println(bst.DFSPostOrder())
}
