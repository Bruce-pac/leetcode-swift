//: [Previous](@previous)

import Foundation

func qsort(_ arr: [Int]) -> [Int] {
    if arr.isEmpty || arr.count == 1 {
        return arr
    }
    if arr.count == 2 {
        let mini = min(arr[0], arr[1])
        let maxi = max(arr[0], arr[1])
        return [mini, maxi]
    }
    var result = arr

    let (leftArr, mid, rightArr) = partition(arr)

    let sortedLeft = qsort(leftArr)
    let sortedRight = qsort(rightArr)
    result = sortedLeft + [mid] + sortedRight
    return result
}

func partition(_ arr: [Int]) -> (left: [Int], mid: Int, right: [Int]) {

    let mid = arr[0]

    var result = arr
    var i: Int = 1
    var j = arr.index(before: arr.endIndex)

    while true {
        while i < result.endIndex && result[i] < mid  {
            i = result.index(after: i)
        }

        while j > result.startIndex && result[j] > mid {
            j = result.index(before: j)
        }
        if i < j && i < result.endIndex && j > result.startIndex{
            let left = result[i]
            let right = result[j]
            result[i] = right
            result[j] = left
        }else {
            break
        }
    }
    result.swapAt(j, 0)

    let leftArr = Array(result[0..<j])
    let rightArr: [Int] = Array(result.dropFirst(j+1))
    return (leftArr, result[j], rightArr)
}

func partition(_ result: inout [Int], left: Int, right: Int) -> Int {
    // 取最左边为基准值
    let mid = result[left]
    var i = left
    var j = right

    while i < j {
        while i < j && result[j] >= mid {
            j = result.index(before: j)
        }
        // 两种写法都行
//        result[i] = result[j]
        result.swapAt(i, j)

        while i < j && result[i] <= mid  {
            i = result.index(after: i)
        }
//        result[j] = result[i]
        result.swapAt(i, j)
    }
    result[i] = mid

    return i
}

func qsort(_ result: inout [Int], left: Int, right: Int) {

    if left < right {
        let mid = partition(&result, left: left, right: right)
        qsort(&result, left: left, right: mid - 1)
        qsort(&result, left: mid + 1, right: right)
    }
}

func sortArray(_ nums: [Int]) -> [Int] {

    if nums.isEmpty || nums.count == 1 {
        return nums
    }
    if nums.count == 2 {
        let mini = min(nums[0], nums[1])
        let maxi = max(nums[0], nums[1])
        return [mini, maxi]
    }
    var result = nums
    qsort(&result, left: 0, right: result.index(before: result.endIndex))
    return result
}

let input = Array(0...100).shuffled()

let result1 = sortArray(input)
print(result1)

//print(arr.count)

//print(result.count)
//: [Next](@next)
