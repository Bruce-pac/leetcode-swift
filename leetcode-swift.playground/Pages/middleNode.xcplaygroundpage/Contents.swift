//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomDebugStringConvertible {
    public var debugDescription: String{
        let arr = array(from: self).map { "\($0)" }
        return arr.joined(separator: "->")
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var result = [ListNode]()
        var nextIdx = head.next
        result.append(head)
        while let next = nextIdx  {
            result.append(next)
            nextIdx = next.next
        }
        let midIdx = result.count / 2
        return result[midIdx]
    }

}

func array(from listNode: ListNode) -> [Int] {
    var result = [Int]()
    var nextIdx = listNode.next
    result.append(listNode.val)
    while let next = nextIdx  {
        result.append(next.val)
        nextIdx = next.next
    }
    return result
}

func node(with array: [Int]) -> ListNode? {
    guard !array.isEmpty else {
        return nil
    }
    if array.count == 1 {
        return ListNode(array.first!)
    }
    let node = ListNode(array.first!)
    let dropFirst = Array(array.dropFirst())

    _ = dropFirst.reduce(node) { (res, ele) -> ListNode? in
        res?.next = ListNode(ele)
        return res?.next
    }
    return node
}

let head = node(with: [1,2,3,4,5,6])

let result = Solution().middleNode(head)
//: [Next](@next)
