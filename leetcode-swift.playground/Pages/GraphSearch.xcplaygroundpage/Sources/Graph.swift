import Foundation

public class Node {
    public var label: String
    public var visited: Bool
    public var neighbors: [Edge]


    public init(_ label: String) {
      self.label = label
      neighbors = []
      visited = false
    }
}

public class Edge {
    public var neighbor: Node
    public init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

public class Graph {
    public private(set) var nodes: [Node] = []

    public init() {
        nodes = []
    }

    @discardableResult
    public func addNode(_ label: String) -> Node {
      let node = Node(label)
      nodes.append(node)
      return node
    }

    public func addEdge(_ source: Node, neighbor: Node) {
        let edge = Edge(neighbor)
        source.neighbors.append(edge)
    }
}
