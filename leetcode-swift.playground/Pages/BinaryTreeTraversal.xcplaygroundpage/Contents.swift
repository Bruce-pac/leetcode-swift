import Foundation

 public class TreeNode<T> {
     public var val: T
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: T) {
         self.val = val
         self.left = nil
         self.right = nil
     }

    var leftNode: Node<T>?
    var rightNode: Node<T>?


    /// leetcode的表示二叉树方法的字面量初始化实现
    /// https://support.leetcode-cn.com/hc/kb/article/1194353/
    /// - Parameter elements: ；leetcode 的表示二叉树的序列
    public required convenience init(arrayLiteral elements: TreeNode.ArrayLiteralElement...) {
        if elements.count == 1 {
            self.init(elements.first!.value!)
            return
        }
        var dic: [Int: TreeNode] = [:]

        let first = elements[0]
        self.init(first.value!)
        dic[0] = self

        elementsLoop: for (n, x) in elements.enumerated() {
            if n == 0 {
                continue elementsLoop
            }
            NodeLoop: for (n1, _) in elements.enumerated() {
                guard let tree = dic[n1] else { continue NodeLoop }
                if tree.leftNode != nil {
                    if tree.rightNode != nil {
                        continue NodeLoop
                    }else {
                        switch x {
                        case .node(let t):
                            tree.right = TreeNode(t)
                            tree.rightNode = x
                            dic[n] = tree.right
                        case .null:
                            tree.right = nil
                            tree.rightNode = .null
                        }
                        break NodeLoop
                    }
                } else {
                    switch x {
                    case .node(let t):
                        tree.left = TreeNode(t)
                        tree.leftNode = x
                        dic[n] = tree.left
                    case .null:
                        tree.left = nil
                        tree.leftNode = .null
                    }
                    break NodeLoop
                }
            }
        }

    }
}

extension TreeNode: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Node<T>

}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        return "value: \(val), left = [\(left?.description ?? "")], right = [\(right?.description ?? "")]"
    }
}

public enum Node<T>: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .null
    }

    case node(T)
    case null

    var value: T? {
        switch self {
        case .node(let t):
            return t
        default:
            return nil
        }
    }
}

extension Node: ExpressibleByIntegerLiteral where T == Int {
    public init(integerLiteral value: Int) {
        self = .node(value)
    }

    public typealias IntegerLiteralType = T
}


class RecursiveSolution {
    func postorderTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        let left = postorderTraversal(root.left)
        let right = postorderTraversal(root.right)
        let res = left + right + [root.val]
        return res.compactMap { $0 }
    }
    func preorderTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        let left = preorderTraversal(root.left)
        let right = preorderTraversal(root.right)
        let res = [root.val] + left + right
        return res.compactMap { $0 }
    }
    func inorderTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        let left = inorderTraversal(root.left)
        let right = inorderTraversal(root.right)
        let res = left + [root.val] + right
        return res.compactMap { $0 }
    }
}

let recursive = RecursiveSolution()

let tree: TreeNode = [1,nil,2,3]
//print(tree)
//print("递归先序遍历", recursive.preorderTraversal(tree))
//print("递归中序遍历", recursive.inorderTraversal(tree))
//print("递归后序遍历", recursive.postorderTraversal(tree))

let exam: TreeNode = [5, 4, 7, 3, nil, 2, nil, -1, nil, 9]
print(exam)
print("递归先序遍历", recursive.preorderTraversal(exam))
print("递归中序遍历", recursive.inorderTraversal(exam))
print("递归后序遍历", recursive.postorderTraversal(exam))

class NonRecursiveSolution {
    func preorderTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        var result: [T] = []
        var flag: TreeNode<T>? = root
        var stack: [TreeNode] = [TreeNode<T>]()
        var top = 0

        while flag != nil || top != 0 {
            while let current = flag {
                result.append(current.val)
                stack.insert(current, at: top)
                top += 1
                flag = current.left
            }
            if top != 0 {
                top -= 1
                let last = stack[top]
                flag = last.right
            }
        }
        return result
    }

    func inorderTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        var result: [T] = []
        var flag: TreeNode<T>? = root
        var stack: [TreeNode] = [TreeNode<T>]()
        var top = 0

        while flag != nil || top != 0 {
            while let current = flag {
                stack.insert(current, at: top)
                top += 1
                flag = current.left
            }
            if top != 0 {
                top -= 1
                let last = stack[top]
                result.append(last.val)
                flag = last.right
            }
        }
        return result
    }

    func levelTraversal<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        var queue: [TreeNode<T>] = [root]
        var result: [T] = []

        while let node = queue.first {
            queue.removeFirst()
            result.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return result
    }

    func levelOrder<T>(_ root: TreeNode<T>?) -> [[T]] {
        guard let root = root else { return [] }
        var queue: [[TreeNode<T>]] = [[root]]
        var result: [[T]] = []

        while let level = queue.first {
            queue.removeFirst()
            let vals = level.map { $0.val }
            result.append(vals)

            var nodeLevel: [TreeNode<T>] = []
            for node in level {
                if let left = node.left {
                    nodeLevel.append(left)
                }
                if let right = node.right {
                    nodeLevel.append(right)
                }
            }
            if !nodeLevel.isEmpty {
                queue.append(nodeLevel)
            }
        }
        return result
    }

    func rightSideView<T>(_ root: TreeNode<T>?) -> [T] {
        guard let root = root else { return [] }
        let levels = levelOrder(root)
        let res = levels.compactMap { $0.last }
        return res
    }
}

let nonRec = NonRecursiveSolution()

//print("非递归先序遍历", nonRec.preorderTraversal(tree))
//print("非递归中序遍历", recursive.inorderTraversal(tree))

//print("非递归先序遍历", nonRec.preorderTraversal(exam))
//print("非递归先序遍历", nonRec.preorderTraversal(exam))

let levelExam: TreeNode = [1,2,3,4,nil,nil,5]

print("非递归层次遍历", nonRec.levelTraversal(exam))
print("非递归层次遍历", nonRec.levelTraversal(tree))
print("非递归层次遍历", nonRec.levelTraversal(levelExam))
print("非递归层次遍历", nonRec.levelOrder(levelExam))

let rightside: TreeNode = [1,2,3,nil,5,nil,4]

print(nonRec.rightSideView(rightside))
