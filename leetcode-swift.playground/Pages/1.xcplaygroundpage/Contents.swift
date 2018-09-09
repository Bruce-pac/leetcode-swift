//: [Previous](@previous)

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var map: [Int:Int] = [Int:Int]()
        for (n,x) in nums.enumerated() {
            let num = target - x
            if map.keys.contains(num) {
                return [map[num]! + 1,n + 1]
            }
            map[x] = n
        }
        return [Int]()
    }
}

Solution().twoSum([2, 7, 11, 15], 9)
