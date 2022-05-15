//
//  ArrayDataStructure.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 26/09/21.
//

import UIKit

class ArrayDataStructure {
    
    //How to verify if a number is prime or not?
    //Compute the first five Fibonacci numbers.
    //Determine the factors of a number.
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var result = [Int]()
        var i = 0
        var j = 0
        while i < m && j < n {
            if nums1[i] <= nums2[j] {
                result.append(nums1[i])
                i = i + 1
            } else {
                result.append( nums2[j])
                j = j + 1
            }
        }
        while i < m {
            result.append(nums1[i])
            i = i + 1
        }
        
        while j < n {
            result.append(nums2[j])
            j = j + 1
        }
        nums1 = result
    }
    
    
    func lengthOfLastWord(_ s: String){
        var end = s.count - 1
        var start  = 0
        var length = 0
        var p = 0
        while start <= end {
            if s[start] == " " {
                length = 0
            } else {
                length = length + 1
                p = length
            }
            start = start + 1
        }
        
        length == 0 ? p : length
        print(length)
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var end = digits.count - 1
        let start = 0
        var result = digits
        var reminder = 1
        while end >= start {
            let value = (result[end] + reminder)
            result[end] = value % 10
            reminder = value / 10
            end = end - 1
        }
        if reminder > 0 {
            result.insert(1, at: 0)
        }
        return result
    }
    
    func getFinalOrder(k: Int, ammount: [Int]) -> [Int]{
        var queue = [Int]()
        var result = [Int]()
        var temp = ammount
        for i in 0..<ammount.count {
            queue.append(i + 1)
        }
        while queue.count != 0{
            if let q = queue.first {
                if let value = temp.first {
                    if value <= k {
                        result.append(q)
                        queue.removeFirst()
                        temp.removeFirst()
                    } else {
                        let p = value - k
                        temp.append(p)
                        temp.removeFirst()
                        queue.append(q)
                        queue.removeFirst()
                    }
                }
            }
        }
        return result
    }
    
    func binarySearch() -> Bool{
        let array = [2, 4, 5, 7, 8, 9, 10, 18]
        let key = 18
        var start = 0
        var end = array.count - 1
        var mid = (start + end) / 2
        while start <= end{
            mid = (start + end) / 2
            if array[mid] == key {
                return true
            } else if array[mid] > key {
                end = mid - 1
            } else if array[mid] < key {
                start = mid + 1
            }
        }
        return false
    }
    
    func matrixElementsSum(matrix: [[Int]]) {
        var rowCount = matrix.count
        var colCount = matrix[0].count
        for col in 0..<colCount {
            for row in 0..<rowCount {
                print(matrix[row][col])
            }
            print("***********")
        }
    }

    /**
     Given a sequence of integers as an array, determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element from the array.
     */
    func almostIncreasingSequence(sequence: [Int]) -> Bool {
        var count = 0
        for i in 1..<sequence.count {
            if sequence[i] <= sequence[i - 1] {
                count = count + 1
                if (i > 1 && i < sequence.count - 1 &&  sequence[i] <= sequence[i - 2] && sequence[i + 1] <=
                sequence[i - 1] ) {
                    count = count + 1
                }
            }
        }
        return count <= 1
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count
        var mid = start + nums.count / 2
        while start < end {
            if nums[mid] == target {
                return mid
            } else if target > nums[mid] {
                mid = (end - mid) / 2
            } else {
                mid = (mid - start) / 2
            }
        }
        return -1
    }
    
    
    // Pre condition: sorted array(increasing order)
    func sumOfTwoNumberOfSortedArray(array: [Int], sum: Int) {
        var first = 0
        var last = array.count - 1
        while first <= last {
            if array[first] + array[last] == sum {
                print("Sum: \(array[first]) + \(array[last]) = \(sum)")
                first = first + 1
            } else if array[first] + array[last] < sum {
                first = first + 1
            } else {
                last = last - 1
            }
        }
    }
    
    
    //  find all pairs in an array of integers whose sum is equal to the given number
    func allPairsInArraySum(array: [Int], sum: Int) {
        for (index, value) in array.enumerated() {
            for item in (index + 1)..<array.count {
                if value + array[item] == sum {
                    print("\(value), \(array[item])")
                }
            }
        }
    }
    
    
    /*
     Removing duplicates from the array
     let array = [7, 9, 1, 2, 2, 4, 5, 6, 4]
     result = [7, 9, 1, 2, 4, 5, 6]
     **/
    
    func removingDuplicates(array: [Int]) -> [Int] {
        var set = Set<Int>()
        var resultArray = [Int]()
        for value in array {
            if !set.contains(value) {
                set.insert(value)
                resultArray.append(value)
            }
        }
        return resultArray
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var set = Set<Int>()
        var resultArray = [Int]()
        for value in nums {
            if !set.contains(value) {
                set.insert(value)
                resultArray.append(value)
            }
        }
        nums = resultArray
        return set.count
    }
    
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var resultArray = [Int]()
        for value in nums {
            if value != val {
                resultArray.append(value)
            }
        }
        nums = resultArray
        return resultArray.count
    }
    
    func secondHeighest(array: [Int]) {
        if array.count < 2 {
            print("Does not exist")
            return
        }
        var max = Int.min
        var sMax = Int.min
        for value in array {
            if value > max {
                sMax = max
                max = value
            } else if value > sMax && value != max {
                sMax = value
            }
        }
    }
    
    func secondSmallest(array: [Int]) {
        if array.count < 2 {
            print("Second Smallest no not possible")
            return
        }
        
        var min = Int.max
        var sMin = Int.max
        for value in array {
            if value < min {
                sMin = min
                min = value
            } else if value < sMin && min != value {
                sMin = value
            }
        }
    }
    
    // triplets
    /**
     Input:-    [1, 2, 3, 5, 8, 9, 10, 12]
     Output:- [[1, 2, 3], [2, 3, 5], [3, 5, 8], [5, 8, 9]]
     */
    func triplets(array: [Int]) {
        if array.count < 3 {
            print("Triplates not possible")
            return
        }
        var triple = [[Int]]()
        for (index, _) in (0..<array.count - 2).enumerated() {
            let array = [array[index], array[index + 1], array[index + 2]]
            triple.append(array)
        }
        print(triple)
    }
    
    func secondLargestNumber(array: [Int]) {
        if array.count < 2 {
            print("Second largest not possible")
            return
        }
        var slargest = Int.min
        var largest = Int.min
        for value in array {
            if value > largest {
                slargest = largest
                largest = value
            } else if value > slargest && value != largest {
                slargest = value
            }
        }
        print(largest)
        print(slargest)
    }
    
    func secondSmallestNumber(array: [Int]) {
        if array.count < 2 {
            print("Second largest not possible")
            return
        }
        var ssmallest = Int.max
        var smallest = Int.max
        for value in array {
            if value < smallest {
                ssmallest = smallest
                smallest = value
            } else if value < ssmallest && value != smallest {
                ssmallest = value
            }
        }
        print(smallest)
        print(ssmallest)
    }
    
    
    
    // Find first repetition of number in an array
    func firstRepetitionOfNumber(array: [Int]) -> Int {
        var dict = [Int : Int]()
        for value in array {
            if let _ = dict[value] {
                return value
            } else {
                dict[value] = 1
            }
        }
        return -1
    }
    
    //In an array 1-100 numbers are stored, one number is missing how do you find it?
    
    func findMissingNumber(array: [Int], n: Int) {
        let actualSum = (n * (n + 1)) / 2
        var sum = 0
        for value in array {
            sum = sum + value
        }
        print(actualSum - sum)
    }
    
    // Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one
    // duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
    /**
     // Input: [1,3,4,2,2]
     // Output: 2
     // Example 2:

     // Input: [3,1,3,4,2]
     // Output: 3
     */
    
    func exactlyOneNumberIsDuplicate(array: [Int], n: Int) {
        let actualSum = (n * (n + 1)) / 2
        var sum = 0
        for value in array {
            sum = sum + value
        }
        print(sum - actualSum)
    }
    
}

extension Array {
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        forEach { element in
            result.append(transform(element))
        }
        return result
    }
    
    func customCompactMap<T>(_ transform:(Element) -> T?) -> [T] {
        var result = [T]()
        forEach { element in
            if let transformedElement = transform(element) {
                result.append(transformedElement)
            }
        }
        return result
    }
    
    func customFilter(_ isInclude:(Element) -> Bool) -> [Element] {
        var result = [Element]()
        return result
    }
}

