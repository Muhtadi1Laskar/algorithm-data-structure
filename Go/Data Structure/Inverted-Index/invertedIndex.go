package main

import (
	"fmt"
	"strings"
)

type Document struct {
	ID int
	Text string
}

type InvertedIndex struct {
	index map[string][]int
}

func NewInvertedIndex() *InvertedIndex {
	return &InvertedIndex{
		index: make(map[string][]int),
	}
}

func (li *InvertedIndex) AddDocument(doc Document) {
	words := strings.Fields(strings.ToLower(doc.Text))

	for _, word := range words {
		if !contains(li.index[word], doc.ID) {
			li.index[word] = append(li.index[word], doc.ID)
		}
	}
}

func (li *InvertedIndex) Search(word string) []int {
	return li.index[strings.ToLower(word)]
}

func contains(slice []int, item int) bool {
	for _, v := range slice {
		if v == item {
			return true
		}
	}
	return false
}

func main() {
	docs := []Document{
		{ID: 1, Text: "The quick brown fox"},
		{ID: 2, Text: "The quick blue fox"},
		{ID: 3, Text: "The fast red fox"},
	}

	invertedIndex := NewInvertedIndex()

	for _, doc := range docs {
		invertedIndex.AddDocument(doc)
	}

	fmt.Println(invertedIndex.index)
	fmt.Println()

	fmt.Println("Documents containing 'quick':", invertedIndex.Search("quick"))
	fmt.Println("Documents containing 'fox':", invertedIndex.Search("fox"))
	fmt.Println("Documents containing 'fast':", invertedIndex.Search("fast"))
	fmt.Println("Documents containing 'elephant':", invertedIndex.Search("elephant"))
}