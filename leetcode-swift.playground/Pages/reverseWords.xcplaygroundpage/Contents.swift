//: [Previous](@previous)

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        let split = s.mySplit(separator: " ").reversed()
        let result = split.joined(separator: " ")
        return result
    }
}

extension String {
    func mySplit(separator: String) -> [String] {
        var result: [String] = []
        var i = startIndex
        var j = startIndex
        var k = startIndex

        while i == j && k < endIndex {

            Loop1: repeat {
                let jtoK = String(self[j...k])
                if jtoK == separator {
                    break Loop1
                }else if separator.hasPrefix(jtoK) {
                    k = index(after: k)
                }else {
                    j = index(after: j)
                    k = j
                }
            } while k < endIndex && String(self[j...k]) != separator

            let ele = String(self[i..<j])
            if !ele.isEmpty {
                result.append(ele)
            }

            if k < endIndex {
                i = index(after: k)
                j = i
                k = i
            }
        }
        return result
    }
}

let result = Solution().reverseWords("a good   example")

let res = "a good   example".split(separator: " ")
let res1 = "a good   example".mySplit(separator: " ")
//let sss = "a good"
//let idx = sss.index(after: sss.startIndex)
//sss[idx..<idx]
//: [Next](@next)
