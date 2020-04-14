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

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else { return nil }
        var left = array(from: l1)
        var right = array(from: l2)

        if left.count < right.count {
            let complement = right.count - left.count
            let count = 1...complement
            count.forEach { _ in
                left.insert(0, at: 0)
            }
        }else if left.count > right.count {
            let complement = left.count - right.count
            let count = 1...complement
            count.forEach { _ in
                right.insert(0, at: 0)
            }
        }

        var resultArr: [Int] = []
        var flag = false

        var leftIdx = left.index(before: left.endIndex)
        var rightIdx = right.index(before: right.endIndex)

        while leftIdx >= 0 && rightIdx >= 0 {
            let atLeft = left[leftIdx]
            let atRight = right[rightIdx]
            let sum = atLeft + atRight + (flag ? 1 : 0)
            if sum >= 10 {
                let remain = sum - 10
                resultArr.insert(remain, at: 0)
                flag = true
            }else{
                resultArr.insert(sum, at: 0)
                flag = false
            }
            leftIdx = leftIdx - 1
            rightIdx = rightIdx - 1
        }
        if flag {
            resultArr.insert(1, at: 0)
        }

        let result = node(with: resultArr)
        return result
    }
}
let l1 = node(with: [7,2,4,3])
let l2 = node(with: [5,6,4])

let result = Solution().addTwoNumbers(l1, l2)

//: [Next](@next)
