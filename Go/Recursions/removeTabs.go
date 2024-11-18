package main

func removeTabs(str string) string {
	if len(str) == 0 {
		return ""
	}

	if  str[0] == '\t' || str[0] == ' ' {
		return removeTabs(str[1:])
	}

	return string(str[0]) + removeTabs(str[1:])
}
