package main

import (
	"fmt"
	"hash/fnv"
)

type KeyValuePair struct {
	key string
	valeu interface{}
	next *KeyValuePair
}

type HashMap struct {
	size int
	array []*KeyValuePair
}

func NewHashMap(size int) *HashMap {
	return &HashMap{
		size: size,
		array: make([]*KeyValuePair, size),
	}
}

func hash(value string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(value))
	return h.Sum32()
}

func main() {
	fmt.Println("Hello World")
}