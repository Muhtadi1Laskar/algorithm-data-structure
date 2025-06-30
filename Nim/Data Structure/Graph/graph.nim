import std/tables

type
    Graph = ref object
        adj_list: Table[string, seq[string]]
        length: int

proc new_graph(): Graph = 
    return Graph(adj_list: initTable[string, seq[string]](), length: 0)

proc add_vertex(self: Graph, u: string) = 
    if not self.adj_list.hasKey(u):
        self.adj_list[u] = @[]

proc add_edge(self: Graph, u: string, v: string) = 
    self.add_vertex(u)
    self.add_vertex(v)
    self.adj_list[u].add(v) 
    self.length += 1

when isMainModule:
    let graph = new_graph()

    graph.add_edge("A", "B")
    graph.add_edge("A", "C")
    graph.add_edge("B", "D")
    graph.add_edge("C", "E")
    graph.add_edge("D", "F")
    graph.add_edge("E", "F")

    echo graph.adj_list