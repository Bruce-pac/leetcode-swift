//: [Previous](@previous)

import Foundation

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map: [String: String] = [String: String]()
        for (n,x) in s.enumerated() {
            let strX = String(x)
            if map[strX] == nil {
                let st = t.string(at: n)
                let flag = map.values.contains(st)
                if !flag {
                    map[strX] = st
                }else{
                    return false
                }
            }else {
                if map[strX] != t.string(at: n) {
                    return false
                }
            }
        }
        return true
    }
}

extension String {
    func string(at index: Int) -> String {
        let subtIndex = String.Index(encodedOffset: index)
        let subtIndexadd1 = self.index(subtIndex, offsetBy: 1)
        let subt = self[subtIndex..<subtIndexadd1]
        let st = String(subt)
        return st
    }
}

Solution().isIsomorphic("paper", "tqtle")
