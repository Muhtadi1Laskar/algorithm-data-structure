package main

func removeDuplicate(str string) string {
	if len(str) == 0 {
		return ""
	}

	if len(str) == 1 {
		return str
	}

	if str[0] == str[1] {
		return removeDuplicate(str[1:])
	}

	return string(str[0]) + removeDuplicate(str[1:])
}