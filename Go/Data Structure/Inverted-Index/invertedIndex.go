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
}