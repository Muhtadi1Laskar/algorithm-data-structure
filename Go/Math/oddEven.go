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

func fn3(n int) bool {
	var str string = fmt.Sprint(n)
	var evenStr string = "02468"
	
	for i := 0; i < len(evenStr); i++ {
		if evenStr[i] == str[len(str)-1] {
			return true
		}
	}
	return false
}

func fn4(n int) bool {
	return (n / 2) * 2 == n
}

func fn5(n int) bool {
	hashMap := map[int]bool{
		0: true,
		1: false, 
	}
	return hashMap[n % 2]
}

func fn6(n int) bool {
	return n | 1 == n
}

func fn7(n int) bool {
	return float64(n%2) == 0
}

func fn8(n int) bool {
	if n == 0 {
		return true
	} else if n == 1 {
		return false
	} else {
		return fn8(n-2)
	}
}

func fn9(n int) string {
	if n & 1 == 0 {
		return "Even"
	} 
	return "Odd"
}
