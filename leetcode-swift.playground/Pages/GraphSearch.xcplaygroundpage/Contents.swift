//: [Previous](@previous)

import Foundation

func dfs(_ graph: Graph, source: Node) -> [String] {
    var result = [source.label]
    source.visited = true

    for edge in source.neighbors {
        if !edge.neighbor.visited {
            result += dfs(graph, source: edge.neighbor)
        }
    }
    return result
}

func bfs(_ graph: Graph, source: Node) -> [String] {
    // 存储已经访问过的node
    var queue: [Node] = []

    queue.append(source)
    var result = [source.label]
    source.visited = true

    while let node = queue.first {
        queue.removeFirst()
        // 访问node的所有邻接点
        for edge in node.neighbors {
            let neighbor = edge.neighbor
            if !neighbor.visited {
                queue.append(neighbor)
                result.append(neighbor.label)
                neighbor.visited = true
            }
        }
    }
    return result
}

let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)
graph.addEdge(nodeE, neighbor: nodeF)
graph.addEdge(nodeF, neighbor: nodeG)



let graph2 = Graph()
let nodev1 = graph2.addNode("v1")
let nodev2 = graph2.addNode("v2")
let nodev3 = graph2.addNode("v3")
let nodev4 = graph2.addNode("v4")
let nodev5 = graph2.addNode("v5")
let nodev6 = graph2.addNode("v6")
let nodev7 = graph2.addNode("v7")
let nodev8 = graph2.addNode("v8")

graph2.addEdge(nodev1, neighbor: nodev2)
graph2.addEdge(nodev1, neighbor: nodev3)
graph2.addEdge(nodev2, neighbor: nodev4)
graph2.addEdge(nodev2, neighbor: nodev5)
graph2.addEdge(nodev3, neighbor: nodev6)
graph2.addEdge(nodev3, neighbor: nodev7)
graph2.addEdge(nodev4, neighbor: nodev8)
graph2.addEdge(nodev5, neighbor: nodev8)
graph2.addEdge(nodev6, neighbor: nodev7)

//let dfsNodesExplored = dfs(graph2, source: nodev1)
//print(dfsNodesExplored)

//let bfsNodesExplored = bfs(graph2, source: nodev1)
//print(bfsNodesExplored)
//: [Next7(@next7

let graph3 = Graph()
let node1 = graph3.addNode("1")
let node2 = graph3.addNode("2")
let node3 = graph3.addNode("3")
let node4 = graph3.addNode("4")
let node5 = graph3.addNode("5")
let node6 = graph3.addNode("6")

graph3.addEdge(node1, neighbor: node3)
graph3.addEdge(node1, neighbor: node2)
graph3.addEdge(node1, neighbor: node4)
graph3.addEdge(node3, neighbor: node5)
graph3.addEdge(node3, neighbor: node6)

let bfsNodesExplored = dfs(graph3, source: node1)
print(bfsNodesExplored)
