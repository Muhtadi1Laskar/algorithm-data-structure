package main

import (
	"fmt"
	"hash/fnv"
)

type HashMap struct {
	size uint32
	array [][2]interface{}
}

func NewHashMap(size uint32) *HashMap {
	return &HashMap{
		size: size,
		array: make([][2]interface{}, size),
	}
}

func (h *HashMap) Set(key string, value string) {
	var hashed_key uint32 = hash(key)
	var index uint32 = hashed_key % h.size

	for h.array[index][0] != nil && h.array[index][0] != key {
		index = (index + 1) % h.size
	}
	h.array[index] = [2]interface{}{key, value}
	return
}

func hash(s string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(s))
	return h.Sum32()
}

func main() {
	hashMap := NewHashMap(10)

	var items [][]string = [][]string{
		{"Name", "Luffy"},
		{"Occupation", "Pirate"},
		{"Rank", "Captain"},
		{"Devil Fruit User", "True"},
		{"Devil Fruit Name", "Gomu Gomu No Mi"},
	}

	for _, item := range items {
		key := item[0]
		value := item[1]
		hashMap.Set(key, value)
	}

	fmt.Println(hashMap.array)
	hashMap.Set("Rank", "2nd Captain")

	for _, item := range hashMap.array {
		key := item[0]
		value := item[1]
		fmt.Println(key, value)
	}
}