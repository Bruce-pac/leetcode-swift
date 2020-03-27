//: [Previous](@previous)

import Foundation

class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        var dic: [Int: Int] = [:]
        for item in deck {
            if let count = dic[item] {
                dic[item] = count + 1
            }else{
                dic[item] = 1
            }
        }
        let values = dic.values.sorted()
        guard let first = values.first, first > 1 else { return false }
        if values.count == 1 {
            return true
        }
        let second = values[1]
        var diviso = 1
        if first == second && first.isPrime() {
            diviso = first
        }else{
            let small = smallesrCommonDiviso(x: first, second)
            diviso = small == 1 ? min(first, second) : small
        }

        if diviso <= 1 {
            return false
        }

        var result = true
        for item in values {
            if item.isMultiple(of: diviso) {
                continue
            }else{
                result = false
                break
            }
        }
        return result
    }

    func smallesrCommonDiviso(x: Int,_ y: Int) -> Int {
        if x.isPrime() || y.isPrime() {
            return 1
        }
        let primeWithin10 = [2,3,5,7]
        for item in primeWithin10 {
            if x.isMultiple(of: item) && y.isMultiple(of: item) {
                return item
            }
        }
        return 1
    }
}

extension Int {
    func isPrime() -> Bool {
        let primeWithin10 = [2,3,5,7]

        if primeWithin10.contains(self) {
            return true
        }
        if self.isMultiple(of: 2) ||
        self.isMultiple(of: 3) || self.isMultiple(of: 5) ||
        self.isMultiple(of: 7) {
            return false
        }else{
            return true
        }
    }
}

//let path = Bundle.main.path(forResource: "File", ofType: nil)!
//let content = try! String(contentsOfFile: path)
//let arr = content.split(separator: ",").compactMap { Int($0) }
//print(arr.count)
let result = Solution().hasGroupsSizeX([1,1,2,2,2,2])


//: [Next](@next)
