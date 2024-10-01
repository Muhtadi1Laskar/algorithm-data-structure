package main

import "fmt"

type Bag struct {
	arr []string
}

func newBag() *Bag {
	return &Bag{ arr: []string{}}
}



func main() {
	fmt.Println("Hello World")
}