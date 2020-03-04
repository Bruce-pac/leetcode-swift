
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
        let arr = Solution().array(from: self).map { "\($0)" }
        return arr.joined(separator: "->")
    }
}
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let arrs = lists.compactMap { (node) -> [Int]? in
            guard let node = node else { return nil }
            return self.array(from: node)
        }
        let arr = arrs.flatMap { $0 }.sorted()
        return node(with: arr)
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
}

let node1 = Solution().node(with: [1,4,5])
let node2 = Solution().node(with: [1,3,4])
let node3 = Solution().node(with: [2,6])
let list = [node1,node2,node3]
let node = Solution().mergeKLists(list)
print(node!)



