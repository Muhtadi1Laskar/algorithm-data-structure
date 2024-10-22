package main

import (
	"fmt"
	"hash/fnv"
)

type HashMap struct {
	size  int
	array [][]*KeyValuePair
}

type KeyValuePair struct {
	key   string
	value interface{}
}

func NewHashMap(size int) *HashMap {
	return &HashMap{
		size:  size,
		array: make([][]*KeyValuePair, size),
	}
}

func (h *HashMap) Set(key string, value interface{}) {
	var hashedKey uint32 = hash(key)
	var index int = int(hashedKey) % h.size

	for i := 0; i < len(h.array[index]); i++ {
		if h.array[index][i].key == key {
			h.array[index][i].value = value
			return
		}
	}
	h.array[index] = append(h.array[index], &KeyValuePair{
		key:   key,
		value: value,
	})
}

func (h *HashMap) Get(key string) interface{} {
	var hashKey uint32 = hash(key)
	var index int = int(hashKey) % h.size

	for i := 0; i < len(h.array[index]); i++ {
		if h.array[index][i].key == key {
			return h.array[index][i].value
		}
	}
	return ""
}

func hash(value string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(value))
	return h.Sum32()
}

func main() {
	hashMap := NewHashMap(10)

	items := []struct {
		key   string
		value interface{}
	}{
		{"Name", "Luffy"},
		{"Occupation", "Pirate"},
		{"Age", 20},
		{"Favourite Food", "Meat"},
		{"Devil Fruit User", true},
		{"Rank", "Captain"},
	}

	for _, item := range items {
		hashMap.Set(item.key, item.value)
	}

	for _, arr := range hashMap.array {
		if len(arr) > 0 {
			for _, pair := range arr {
				fmt.Printf("[%s: %v] \n", pair.key, pair.value)
			}
		}
	}

	fmt.Println(hashMap.Get("Favourite Food"))
}
