//: [Previous](@previous)

import Foundation


///
/// - Parameters:
///   - item: <#item description#>
///   - list: <#list description#>
func nonRecursive_binarySearch(_ item: Int, list: [Int]) throws -> Int {
    var midIdx: Int = 0
    var leftIdx: Int = list.startIndex
    var rightIdx: Int = list.endIndex

    while leftIdx <= rightIdx {
        midIdx = (leftIdx + rightIdx) / 2
        let mid = list[midIdx]
        if item < mid {
            rightIdx = midIdx - 1
        }else if item > mid {
            leftIdx = midIdx + 1
        }else {
            break
        }
    }
    return midIdx
}

func recursive_binarySearch(_ item: Int, list: [Int]) throws -> Int {
    let midIdx = (list.startIndex + list.endIndex) / 2
    let mid = list[midIdx]
    var result: Int
    if item < mid {
        let start = list.startIndex
        let leftList = Array(list[start..<midIdx])
        result = try recursive_binarySearch(item, list: leftList) + start
        return result
    } else if item > mid {
        let start = midIdx + 1
        let rightList = Array(list[start..<list.endIndex])
        result = try recursive_binarySearch(item, list: rightList) + start
    }else {
        result = midIdx
    }
    return result
}

/// leetcode
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty {
        return -1
    }
    let midIdx = (nums.startIndex + nums.endIndex) / 2
    let mid = nums[midIdx]
    var result: Int
    if target < mid {
        let start = nums.startIndex
        let leftList = Array(nums[start..<midIdx])
        let inner = search(leftList, target)
        if inner < 0 {
            return -1
        }
        result = inner + start
        return result
    } else if target > mid {
        let start = midIdx + 1
        let rightList = Array(nums[start..<nums.endIndex])
        let inner = search(rightList, target)
        if inner < 0 {
            return -1
        }
        result = inner + start
    }else {
        result = midIdx
    }
    return result
}

do {
    let idx = try recursive_binarySearch(2, list: [1,2,3,4,5,6,100])
    print(idx)
} catch {
    print(error)
}

let ii = search([0,1,2,3,4,5,6], 7)


//: [Next](@next)
