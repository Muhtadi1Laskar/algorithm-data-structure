package main

import (
	"fmt"
)

type Graph struct {
	adj map[string][]string
}

func NewGraph() *Graph {
	return &Graph{
		adj: make(map[string][]string),
	}
}


func (g *Graph) AddEdge(v1, v2 string) {
	g.adj[v1] = append(g.adj[v1], v2)
	g.adj[v2] = append(g.adj[v2], v1)
}

func (g *Graph) BFS(start string) []string {
	visited := make(map[string]bool)
	queue := []string{start}
	visited[start] = true

	result := []string{}

	for len(queue) > 0 {
		curr := queue[0]
		queue = queue[1:]
		result = append(result, curr)

		for _, neighbor := range g.adj[curr] {
			if !visited[neighbor] {
				visited[neighbor] = true
				queue = append(queue, neighbor)
			}
		}
	}
	return result
}

func main() {
	graph := NewGraph()

	graph.AddEdge("A", "B")
	graph.AddEdge("A", "C")
	graph.AddEdge("B", "D")
	graph.AddEdge("C", "E")
	graph.AddEdge("D", "F")
	graph.AddEdge("E", "F")
	
	fmt.Println(graph.BFS("A"))
}