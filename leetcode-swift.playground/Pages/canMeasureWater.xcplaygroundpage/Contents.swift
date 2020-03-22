//: [Previous](@previous)

import Foundation

class Solution {
    func bfs_canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        let sum = x + y
        if z > sum || z < 0 {
            return false
        }

        if x == y {
            return z == 0 || z == sum || z == x
        }

        var remainSet: [(Int, Int)] = []
        // 每次操作的可能结果
        var queue: [(Int, Int)] = [(0,0)]
        remainSet.append((0,0))

        while !queue.isEmpty {
            let remain = queue.removeFirst()
            let (remainX, remainY) = remain
            if remainX == z || remainY == z || remainX + remainY == z {
                return true
            }

            var nextStates: [(Int, Int)] = []
            nextStates.append((x, remainY))
            nextStates.append((remainX, y))
            nextStates.append((0, remainY))
            nextStates.append((remainX, 0))

            let yneed = y - remainY
            if remainX > yneed {
                nextStates.append(((remainX - yneed), y))
            }else{
                nextStates.append((0, (remainX + remainY)))
            }

            let xneed = x - remainX
            if remainY > xneed {
                nextStates.append((x, (remainY - xneed)))
            }else{
                nextStates.append(((remainX + remainY), 0))
            }

            for item in nextStates {
                if remainSet.contains(where: { (pair) -> Bool in
                    return pair.0 == item.0 && pair.1 == item.1
                }) {
                    continue
                }
                queue.append(item)
                remainSet.append(item)
            }
        }
        return false
    }

    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        let sum = x + y
        if z > sum || z < 0 {
            return false
        }

        if x == y || x == 0 || y == 0 {
            return z == 0 || z == sum || z == x
        }

        /*
         把两壶水看成一个整体，总量sum初始值为0，根据题目允许的操作，两壶水只可能被输入a次的x水量或b次的y水量，或者被输出p次的x水量或q次的y水量，因此可得:
         a*x+b*y-p*x-q*y=sum
         m*x+n*y=sum
         只要z == sum 即可以
         根据贝祖定理，可得z必须是x和y的最大公约数的倍数
         */
        return z.isMultiple(of: freatestCommonDiviso(x: x, y))
    }

    func freatestCommonDiviso(x: Int,_ y: Int) -> Int {
        let maxi = max(x, y)
        let mini = min(x, y)

        let (_, r) = maxi.quotientAndRemainder(dividingBy: mini)
        var remainder = r
        var result = mini
        var dividend = mini

        while remainder != 0 {
            let (_, r1) = dividend.quotientAndRemainder(dividingBy: remainder)
            if r1 == 0 {
                result = remainder
                break
            }else{
                dividend = remainder
                remainder = r1
            }
        }
        return result
    }
}
let solution = Solution()
let n1 = solution.freatestCommonDiviso(x: 1997, 615)
let n2 = solution.freatestCommonDiviso(x: 2, 6)
let n3 = solution.freatestCommonDiviso(x: 100, 75)
let n4 = solution.freatestCommonDiviso(x: 319, 377)
let result = Solution().canMeasureWater(22003, 31237, 1)
let result1 = Solution().canMeasureWater(2, 6, 5)
let result2 = Solution().canMeasureWater(3, 5, 4)
let result3 = Solution().canMeasureWater(0, 0, 1)

//: [Next](@next)



