package main

import (
	"fmt"
)

type Graph struct {
	adjList map[string][]string
}

func NewGraph() *Graph {
	return &Graph{adjList: make(map[string][]string)}
}

func (g *Graph) AddEdge(u, v string) {
	g.adjList[u] = append(g.adjList[u], v)
}

func main() {
	graph := NewGraph()

	graph.AddEdge("A", "B")
	graph.AddEdge("A", "C")
	graph.AddEdge("B", "D")
	graph.AddEdge("C", "E")
	graph.AddEdge("D", "F")
	graph.AddEdge("E", "F")

	fmt.Print(graph.adjList)
}
