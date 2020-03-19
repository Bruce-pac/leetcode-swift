//: [Previous](@previous)

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        // key->字母，value->字母个数
        var dic: [Character: Int] = [:]
        for item in s {
            if let count = dic[item] {
                dic[item] = count + 1
            }else {
                dic[item] = 1
            }
        }
        var result: Int = 0
        var hasOdd: Bool = false

        for (_, n) in dic {
            if n.isMultiple(of: 2) {
                result += n
            }else {
                hasOdd = true
                if n > 2 {
                    result += n - 1
                }
            }
        }
        return hasOdd ? result + 1 : result
    }
}

//: [Next](@next)

let result = Solution().longestPalindrome("abccccdd")
print(result)
