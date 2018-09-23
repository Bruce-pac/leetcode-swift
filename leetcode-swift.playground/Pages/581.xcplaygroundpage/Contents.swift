//: [Previous](@previous)

import Foundation

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        if sorted == nums {
            return 0
        }
        let sortedReversed: [Int] = sorted.reversed()
        var startIndex: Int = 0
        var endIndex: Int = 0

        for (n,x) in nums.enumerated() {
            if x != sorted[n] {
                startIndex = n
                break
            }
        }
        for (n,x) in nums.reversed().enumerated() {
            if x != sortedReversed[n] {
                endIndex = sorted.count - 1 - n
                break
            }
        }
        let count = endIndex - startIndex + 1

        return count
    }
}

Solution().findUnsortedSubarray([1,2,3,4])
