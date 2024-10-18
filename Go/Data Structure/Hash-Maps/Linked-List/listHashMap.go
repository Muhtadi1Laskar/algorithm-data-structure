package main

import (
	"fmt"
	"hash/fnv"
)

type KeyValuePair struct {
	key string
	value interface{}
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

func (h *HashMap) Set(key string, value interface{}) {
	var hashedKey uint32 = hash(key)
	var index int = int(hashedKey) % h.size

	head := h.array[index]
	for head != nil {
		if head.key == key {
			head.value = value
			return
		}
		head = head.next
	}
	newPair := &KeyValuePair{
		key: key,
		value: value,
		next: h.array[index],
	}
	h.array[index] = newPair
}

func (h *HashMap) Print() {
	for i, head := range h.array {
		fmt.Printf("Index: %d: ", i)
		for head != nil {
			fmt.Printf("[%s: %v] -> ", head.key, head.value)
			head = head.next
		}
		fmt.Println("nil")
	}
}

func hash(value string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(value))
	return h.Sum32()
}

func main() {
	hashMap := NewHashMap(10)

	items := []struct{
		key string
		value interface{}
	}{
		{"Name", "Luffy"},
		{"Occupation", "Pirate"},
		{"Age", 20},
		{"Favourite Food", "Meat"},
		{"Devil Fruit User", true},
		{"Ship", "Thousand Sunny"},
		{"Captain", "Luffy"},
	}

	for _, item := range items {
		hashMap.Set(item.key, item.value)
	}
	hashMap.Print()
}