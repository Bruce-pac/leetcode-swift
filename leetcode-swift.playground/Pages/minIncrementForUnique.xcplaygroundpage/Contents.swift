//: [Previous](@previous)

import Foundation

class Solution {
    /*
     改变数组中重复元素的最少操作次数，每次操作递增 1。
     先升序排序，迭代数组，假如当前数小于等于前一个数，就使得这个位置的数比前一个数大1。
     排序的目的相当于把重复的数统计出来放到一起。
     */
    func minIncrementForUnique(_ A: [Int]) -> Int {

        var mutableA = A.sorted()

        var result = 0

        for (n, x) in mutableA.enumerated() {
            print(n)
            if n == 0 {
                continue
            }
            let front = mutableA[n - 1]

            if x <= front {
                result += front - x + 1
                mutableA[n] = front + 1
            }
        }
        return result
    }
}

let solution = Solution()
let result = solution.minIncrementForUnique([3,2,1,2,1,7])
//: [Next](@next)
