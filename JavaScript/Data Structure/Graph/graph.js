class Graph {
    constructor() {
        this.adjList = {};
    }

    addVertex(u) {
        if(!this.adjList[u]) {
            this.adjList[u] = [];
        }
    }

    addEdge(u, v) {
        this.addVertex(u);
        this.adjList[u].push(v);
    }
}

const graph = new Graph();

graph.addEdge("A", "B");
graph.addEdge("A", "C");
graph.addEdge("B", "D");
graph.addEdge("C", "E");
graph.addEdge("D", "F");
graph.addEdge("E", "F");

console.log(graph.adjList);