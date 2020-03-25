//: [Previous](@previous)

import Foundation

class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        let flat = grid.flatMap { $0 }
        let allCount = flat.reduce(0, +)
        //叠放超过1个正方体的网格的正方体数量的数组
        let verticalOverlapSquares = flat.filter { $0 > 1 }
        // 上下重叠的面数
        let verticalOverlap = verticalOverlapSquares.reduce(0, +) * 2 - 2 * verticalOverlapSquares.count

        let rowFaces = grid.hirozonFaces()
        var columns = Array(repeating: [Int](), count: grid.count)

        for (_, row) in grid.enumerated() {
            for (idx, item) in row.enumerated() {
                var column = columns[idx]
                column.append(item)
                columns[idx] = column
            }
        }
        let columnFaces = columns.hirozonFaces()

        return allCount * 6 - verticalOverlap - rowFaces - columnFaces
    }
}

extension Array where Element == [Int] {
    func hirozonFaces() -> Int {
        let rowFaces = self.map { $0.splitTwo() }
            .flatMap({ (splitArrs) -> [[Int]] in
                return splitArrs
        })
        .filter { $0.count > 1 }
        .reduce(0) { (result, items) -> Int in
            let sorted = items.sorted()
            let faces = (sorted.count - 1) * 2 * sorted[0]
            return result + faces
        }
        return rowFaces
    }
}

extension Array {
    /// 每两个相邻元素为一组
    func splitTwo() -> [[Element]]  {
        let num = count - 1
        var result = Array<[Element]>(repeating: [Element](), count: num)
        var i = startIndex
        var j = index(after: i)

        while j < endIndex  {
            let front = self[i]
            let after = self[j]
            var arr = result[i]
            arr.append(contentsOf: [front, after])
            result[i] = arr
            i = index(after: i)
            j = index(after: j)
        }
        return result
    }
}

let split2 = [3,4,5,6].splitTwo()


let result = Solution().surfaceArea([[2]])

//: [Next](@next)
