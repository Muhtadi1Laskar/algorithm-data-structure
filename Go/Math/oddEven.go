package main

import "fmt"

func fn1(n int) string {
	if n % 2 == 0 {
		return "Even"
	} 
	return "Odd"
}

func fn2(n int) string {
	var str string = "EOVDEDN"
	var result string

	for i := n & 1; i < len(str); i+=2 {
		result += string(str[i])
	}
	return result
}

func main() {
	fmt.Printf("%s\n", fn2(10))
	fmt.Printf("%s\n", fn2(11))
}