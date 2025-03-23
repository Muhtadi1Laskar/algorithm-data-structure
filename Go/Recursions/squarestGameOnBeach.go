package main

import (
	"fmt"
)

func solve(goal int, standing []int, score int, dropped []int) []int {
	if score == goal {
		return dropped
	} else if score > goal || len(standing) == 0 {
		return nil
	} else {
		chosen := standing[0]
		others := standing[1:]

		if result := solve(goal, others, chosen+score, append(append([]int{}, dropped...), chosen)); result != nil {
			return result
		}
		return solve(goal, others, score, dropped)
	}

}

func main() {
	result := solve(50, []int{15, 9, 30, 21, 19, 3, 12, 6, 25, 27}, 0, []int{})
	fmt.Println(result)
}