package main

import "fmt"

func checkVowel(c byte) int {
	var vowels string = "aeiou"

	for i := 0; i < len(vowels); i++ {
		if c == vowels[i] {
			return 1 
		}
	}
	return 0
}

func countVowels(str string, n int) int {
	if n  == 1 {
		return checkVowel(str[0])
	}
	return countVowels(str, n-1) + checkVowel(str[n - 1])
}

func main() {
	var str string = "educativeio"
	fmt.Println(countVowels(str, len(str)))
}
