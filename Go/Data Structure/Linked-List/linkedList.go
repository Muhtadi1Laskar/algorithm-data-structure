package main

import "fmt"

type Node struct {
	value string
	next *Node
}


type LinkedList struct {
	head *Node
	tail *Node
	length int
}

func NewLinkedList() *LinkedList {
	return &LinkedList{};
}

func (list *LinkedList) IsEmpty() bool {
	return list.head == nil;
}

func (list *LinkedList) PreAppend(data string) {
	newNode := &Node{value: data};

	if list.IsEmpty() {
		list.head = newNode;
		list.tail = newNode;
		list.length++;
		return;
	}
	newNode.next = list.head;
	list.head = newNode;
	list.length++;
	return;
}

func (list *LinkedList) Append(data string) {
	newNode := &Node{ value: data };

	if list.IsEmpty() {
		list.head = newNode;
		list.tail = newNode;
		list.length += 1;
		return
	}
	list.tail.next = newNode;
	list.tail = newNode;
	list.length += 1;
	return
}

func (list *LinkedList) TraverseToIndex(index int) *Node {
	if list.head == nil {
		fmt.Println("The list is empty");
		return nil;
	}

	if index < 0 {
		fmt.Println("Index out of range");
		return nil;
	}
	
	currentNode := list.head;

	for i := 1; i < index; i++ {
		currentNode = currentNode.next;
	}
	return currentNode;
}

func (list *LinkedList) Log() []string {
	currentNode := list.head;
	var nodeData []string;

	for currentNode != nil {
		nodeData = append(nodeData, currentNode.value);
		currentNode = currentNode.next;
	}
	return nodeData;
}

func main() {
	lists := NewLinkedList();

	lists.Append("C");
	lists.Append("JavaScript");
	lists.Append("Python");
	lists.Append("Go");
	lists.Append("Julia");
	lists.Append("Odin");
	lists.Append("Haskell");

	fmt.Println(lists.Log());

	lists.PreAppend("Assembly");
	lists.PreAppend("Machine Code");

	fmt.Println(lists.Log());
}


