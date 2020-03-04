import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.isEmpty || nums2.isEmpty {
            return []
        }

        var intersection: [Int] = []
        var nums1hash: [Int: Int] = [:] //key是元素，value是出现的次数
        var nums2hash: [Int: Int] = [:]

        for x in nums1 {
            if let count = nums1hash[x] {
                nums1hash[x] = count + 1
            } else {
                nums1hash[x] = 1
            }
        }
        for x in nums2 {
            if let count = nums2hash[x] {
                nums2hash[x] = count + 1
            } else {
                nums2hash[x] = 1
            }
        }
        for n in nums1hash {
            if let count = nums2hash[n.key] {
                let num = min(n.value, count)
                let temp = Array(repeating: n.key, count: num)
                intersection.append(contentsOf: temp)
            }
        }

        return intersection

    }
}

let result = Solution().intersect([1,2], [1,1])
