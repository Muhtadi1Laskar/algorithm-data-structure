package main

import "fmt"

func fn1(n int) string {
	if n % 2 == 0 {
		return "Even"
	} 
	return "Odd"
}

func main() {
	fmt.Printf("%s\n", fn1(10))
	fmt.Printf("%s\n", fn1(11))
}