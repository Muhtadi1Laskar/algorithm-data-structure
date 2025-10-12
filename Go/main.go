package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func hashFunction(text string) string {
	byteMessage := []byte(text)
	hash := sha256.New()
	hash.Write(byteMessage)

	hashedBytes := hash.Sum(nil)

	return hex.EncodeToString(hashedBytes)
}

func main() {
	var data string = "This is a text"

	fmt.Println(hashFunction(data))
}
