//: [Previous](@previous)

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let wordArr = str.components(separatedBy: " ")
        if pattern.count != wordArr.count {
            return false
        }

        var patternMap: [String: String] = [String: String]()

        for (n,x) in pattern.enumerated() {
            let strX = String(x)
            if patternMap[strX] == nil {//没有strx这个key
                let word = wordArr[n]
                let flag = patternMap.values.contains(word)
                if !flag {
                    patternMap[strX] = word
                }else {
                    return false
                }
            }else {
                if patternMap[strX] != wordArr[n] {
                    return false
                }
            }
        }
        return true
    }
}

let result = Solution().wordPattern("abba", "dog dog dog dog")
