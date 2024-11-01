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

func main() {

}