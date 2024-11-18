package main

func mod(dividend int, divisor int) int {
	if divisor < 0 {
		return 0
	}
	if dividend < divisor {
		return dividend
	}
	return mod(dividend - divisor, divisor)
}