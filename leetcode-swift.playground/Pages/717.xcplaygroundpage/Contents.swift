//: [Previous](@previous)

import Foundation

class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        switch bits.count {
        case 1...1000:
            break
        default:
            return false
        }
       let no0or1 = bits.filter { (bit) -> Bool in
            if bit != 0 && bit != 1 {
                return true
            }
            return false
        }
        if no0or1.count != 0 {
            return false
        }
        if bits.count == 1 {
           return bits.first == 0
        }
        if bits.dropLast().last == 0 {
            return true
        }
        let reverse = bits.reversed().dropFirst()

        var topOnes: [Int] = []

        for bit in reverse {
            if bit == 1 {
                topOnes.append(bit)
            }else {
                break
            }
        }

        let remainder = topOnes.count % 2
        if remainder == 0 {
            return true
        }else {
            return false
        }
    }
}

Solution().isOneBitCharacter([0, 1, 0])
