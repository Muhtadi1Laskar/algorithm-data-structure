package main

import "fmt"

func main() {
	var staticArray = [3]int{1, 2, 3}

	fmt.Println(&staticArray[0])
	fmt.Println(&staticArray[1])
	fmt.Println(&staticArray[2])
}