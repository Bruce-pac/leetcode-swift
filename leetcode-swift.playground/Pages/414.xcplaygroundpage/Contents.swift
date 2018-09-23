//: [Previous](@previous)

import Foundation

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted(by: >)
        var map: [Int:Int] = [Int:Int]()
        for (_,x) in sortedNums.enumerated() {
            if let a = map[x] {
                map[x] = a + 1
            }else {
                map[x] = 1
            }
        }
        let mapKeys = map.keys.sorted(by: >)
        if mapKeys.count < 3 {
            return mapKeys.first!
        }else {
            return mapKeys[2]
        }
    }
}

Solution().thirdMax([2, 2, 3, 1])
