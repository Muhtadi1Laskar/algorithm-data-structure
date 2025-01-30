package main

import "fmt"

type Bag struct {
	arr []string
}

func newBag() *Bag {
	return &Bag{arr: []string{}}
}

func (b *Bag) Add(item string) []string {
	b.arr = append(b.arr, item)
	return b.arr
}

func (b *Bag) Len() int {
	return len(b.arr)
}

func (b *Bag) Log() {
	for i := 0; i < len(b.arr); i++ {
		fmt.Println(b.arr[i])
	}
}

func (b *Bag) Search(item string) int {
	for i := 0; i < len(b.arr); i++ {
		if b.arr[i] == item {
			return i
		}
	}
	return -1
}

func (b *Bag) Remove(item string) {
	for i, val := range b.arr {
		if val == item {
			b.arr = append(b.arr[:i], b.arr[i+1:]...)
			return
		}
	}
}

func (b *Bag) Greatest() string {
	max := b.arr[0]

	for i := 0; i < len(b.arr); i++ {
		if max < b.arr[i] {
			max = b.arr[i]
		}
	}
	return max
}

// func main() {
// 	arr := newBag();
// 	arr.Add("Saitama");
// 	arr.Add("Luffy");
// 	arr.Add("Zoro");
// 	arr.Add("Billy Bat");
// 	arr.Add("Zenetisu");

// 	arr.Remove("Saitama");

// 	arr.Log();
// 	fmt.Println(arr.Search("Zoro"));
// }
