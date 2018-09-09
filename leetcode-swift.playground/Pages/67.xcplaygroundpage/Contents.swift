//: [Previous](@previous)

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aarr = a.map { (char) -> Int in
            let i = Int(String(char))
            return i!
        }
        let barr = b.map { (char) -> Int in
            let i = Int(String(char))
            return i!
        }
        let acount = aarr.count
        let bcount = barr.count
        if acount < bcount {
            let zeroCount = bcount - acount
            let zeroArr: [Int] = Array(repeating: 0, count: zeroCount)
            let filla = zeroArr + aarr
            let result = addBinary(filla, barr)
            let rStr = result.reduce("") { (r, i) -> String in
                let str = r.appending("\(i)")
                return str
            }
            return rStr
        }else if bcount < acount {
            let zeroCount = acount - bcount
            let zeroArr = Array(repeating: 0, count: zeroCount)
            let fillb = zeroArr + barr
            let result = addBinary(fillb, aarr)
            let rStr = result.reduce("") { (r, i) -> String in
                let str = r.appending("\(i)")
                return str
            }
            return rStr
        }else {
            let result = addBinary(aarr, barr)
            let rStr = result.reduce("") { (r, i) -> String in
                let str = r.appending("\(i)")
                return str
            }
            return rStr
        }
    }
    func addBinary(_ a: [Int],_ b: [Int]) -> [Int] {
        var flag: Bool = false
        var result: [Int] = [Int]()
        for (n,x) in a.reversed().enumerated() {
            let bx = b.reversed()[n]
            if x + bx == 2 {
                if flag {
                    result.append(1)
                }else {
                    result.append(0)
                }
                flag = true
            }else if x + bx == 1 {
                if flag {
                    result.append(0)
                    flag = true
                }else{
                    result.append(1)
                    flag = false
                }
            }else {
                if flag {
                    result.append(1)
                }else {
                    result.append(0)
                }
                flag = false
            }
            if n == a.count - 1 {
                if x + bx == 2 {
                    result.append(1)
                }else if x + bx == 1 {
                    if flag {
                        result.append(1)
                    }
                }
            }
        }
        return result.reversed()
    }
}

Solution().addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011")
