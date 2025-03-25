package main

import (
	"fmt"
)

func solve(goal int, standing []int, score int, dropped []int) []int {
	if goal == score {
		return dropped
	} else if score > goal || len(standing) == 0 {
		return nil
	} else {
		selected := standing[0]
		others := standing[1:]

		if result := solve(goal, others, selected + score, append(append([]int{}, dropped...), selected)); result != nil {
			return result
		}
		return solve(goal, others, score, dropped)
	}
}

func main() {
	result := solve(50, []int{15, 9, 30, 21, 19, 3, 12, 3, 2, 25, 27}, 0, []int{})
	fmt.Println(result)
}