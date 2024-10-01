package main

import "fmt"

type Bag struct {
	arr []string
}

func newBag() *Bag {
	return &Bag{ arr: []string{}}
}

func (b *Bag) Add(item string) []string {
	b.arr = append(b.arr, item);
	return b.arr;
}

func (b *Bag) Len() int {
	return len(b.arr);
}

func (b *Bag) Log() {
	for i := 0; i < len(b.arr); i++ {
		fmt.Println(b.arr[i]);
	}
}

func main() {
	arr := newBag();
	arr.Add("Saitama");
	arr.Add("Luffy");
	arr.Add("Zoro");
	arr.Add("Billy Bat");
	arr.Add("Zenetisu");

	arr.Log();
}