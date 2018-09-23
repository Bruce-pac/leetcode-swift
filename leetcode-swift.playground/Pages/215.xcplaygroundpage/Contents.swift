//: [Previous](@previous)

import Foundation

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted(by: >)
        return sortedNums[k-1]
    }
}

Solution().findKthLargest([3,2,1,5,6,4], 2)
