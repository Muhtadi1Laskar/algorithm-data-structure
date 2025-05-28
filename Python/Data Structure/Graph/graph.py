class Graph:
    def __init__(self):
        self.adj_list = {}
    
    def add_vertex(self, u):
        if u not in self.adj_list:
            self.adj_list[u] = []
    
    def add_edge(self, u, v):
        self.add_vertex(u)
        self.adj_list[u].append(v)
    

graph = Graph()

graph.add_edge("A", "B")
graph.add_edge("A", "C")
graph.add_edge("B", "D")
graph.add_edge("C", "E")
graph.add_edge("D", "F")
graph.add_edge("E", "F")


print(graph.adj_list)
