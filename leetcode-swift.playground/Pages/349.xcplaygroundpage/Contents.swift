import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.isEmpty || nums2.isEmpty {
            return []
        }
        var intersection: Set<Int> = []
        var hash: [Int: Int] = [:] //key是元素，value是索引

        for (n,x) in nums1.enumerated() {
            hash[x] = n
        }
        for x in nums2 {
            if hash[x] != nil {
                intersection.insert(x)
            }
        }

        return Array(intersection)
    }
}
