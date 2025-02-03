package main

import (
	"fmt"
	"sort"
)

type Bags struct {
	bag    map[string]int
	length int
}

func newBags() *Bags {
	return &Bags{bag: make(map[string]int)}
}

func (b *Bags) isEmpty() bool {
	return b.length == 0
}

func (b *Bags) greatest() string {
	if b.isEmpty() {
		return "empty"
	}
	keys := make([]string, len(b.bag))

	for k := range b.bag {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	return keys[len(keys)-1]
}

func (b *Bags) find(value string) bool {
	_, exists := b.bag[value]
	return exists
}

func (b *Bags) add(value string) {
	b.length++
	if b.find(value) {
		b.bag[value]++
	} else {
		b.bag[value] = 1
	}
}

func (b *Bags) remove(value string) {
	if b.find(value) {
		b.length--
		if b.bag[value] > 1 {
			b.bag[value]--
		} else {
			delete(b.bag, value)
		}
	}
}

func main() {
	bag := newBags()

	bag.add("React")
	bag.add("React")
	bag.add("React")
	bag.add("React")
	bag.add("React")
	bag.add("Django")
	bag.add("Flasks")
	bag.add("Solid.js")
	bag.add("Ruby on Rails")
	bag.add("Angular")
	bag.add("Angular")
	bag.add("Angular")
	bag.add("Angular")

	fmt.Printf("%+v\n", bag.bag)

	bag.remove("React")
	bag.remove("React")
	bag.remove("React")
	bag.remove("React")
	bag.add("Ruby on Rails")

	fmt.Printf("%+v\n", bag.bag)

	fmt.Printf("%s\n", bag.greatest())
}
