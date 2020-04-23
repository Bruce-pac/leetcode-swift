//: [Previous](@previous)

import Foundation

class Solution {

    var table: [Int] = [1,1,2]

    func numWays(_ n: Int) -> Int {
        if n < table.count {
            return table[n]
        }
        let result = numWays(n-1) + numWays(n-2)
        table.insert(result, at: n)

        if result > 1000000007 {
            return result % 1000000007
        }
        return result
    }

    func climbStairs(_ n: Int) -> Int {
        if n < table.count {
            return table[n]
        }
        let result = climbStairs(n-1) + climbStairs(n-2)
        table.insert(result, at: n)
        return result
    }
}

let result = Solution().numWays(100)


//: [Next](@next)
