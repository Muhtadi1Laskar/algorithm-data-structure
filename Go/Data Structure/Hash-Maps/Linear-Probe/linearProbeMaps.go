package main

import (
	"fmt"
	"hash/fnv"
)

type HashMap struct {
	size int
	array []*KeyValuePair
}

type KeyValuePair struct {
	key string
	value interface{}
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

	for h.array[index] != nil && h.array[index].key != key {
		index = (index + 1) % h.size
	}
	h.array[index] = &KeyValuePair{
		key: key,
		value: value,
	}
}

func (h *HashMap) Get(key string) interface{} {
	var hashed_key uint32 = hash(key)
	var index int = int(hashed_key) % h.size

	for h.array[index] != nil && h.array[index].key != key {
		index = (index + 1) % h.size
	}

	if h.array[index] == nil {
		return nil
	}
	return h.array[index].value
}

func hash(s string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(s))
	return h.Sum32()
}

func main() {
	hm := NewHashMap(10)

	items := []struct {
		key   string
		value interface{}
	}{
		{"Name", "Luffy"},
		{"Occupation", "Pirate"},
		{"Age", 20},
		{"Favourite Food", "Meat"},
		{"Devil Fruit User", true},
	}

	for _, item := range items {
		hm.Set(item.key, item.value)
	}

	hm.Set("Rank", "Captain")

	for i, kv := range hm.array {
		if kv != nil {
			fmt.Printf("Index: %d, Key: %s, Value: %v\n", i, kv.key, kv.value)
		}
	}

	fmt.Println(hm.Get("Devil Fruit User"))
}