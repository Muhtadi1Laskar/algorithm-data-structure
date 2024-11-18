package main

import "fmt"

func decimalToBinary(n int) string {
	if n <= 1 {
		return fmt.Sprint(n)
	}
	return decimalToBinary(n / 2) + decimalToBinary(n % 2)
}