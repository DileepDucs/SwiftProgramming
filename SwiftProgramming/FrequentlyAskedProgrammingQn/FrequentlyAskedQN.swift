//
//  FrequentlyAskedQN.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 14/01/22.
//

import Foundation

class FrequentlyAskedQN {
    
    
    //Longest common subarray in the given two arrays
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var max = Int.min
        for index in 0..<nums1.count {
            var count = 0
            var firstIndex = index
            for subIndex in 0..<nums2.count {
                if firstIndex < nums1.count && nums1[firstIndex] == nums2[subIndex] {
                    count = count + 1
                    if count > max {
                        max = count
                    }
                    firstIndex = firstIndex + 1
                }
            }
        }
        return max < 0 ? 0 : max
    }
    
    func findLengthOptimum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var result = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        var max = 0
        for i in 1...n {
            for j in 1...m {
                if nums1[i - 1] == nums2[j - 1] {
                    result[i][j] = 1 + result[i - 1][j - 1]
                }
            }
        }
        
        for i in 0...n {
            var string = ""
            for j in 0...m {
                string = string + " " + "\(result[i][j])"
                if result[i][j] > max {
                    max = result[i][j]
                }
            }
            print(string)
        }
        return max
    }
    
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        if nums.count < 1{
            return 0
        }
        var sum = 0
        var result = Int.max
        var start = 0
        var i = 0
        while i < nums.count {
            sum = sum + nums[i]
            if sum == target {
                let count = i - start
                if count < result {
                    result = count
                }
                i = i + 1
            } else if sum < target {
                i = i + 1
            } else {
                sum = sum - nums[start]
                start = start + 1
                i = i + 1
                if sum == target {
                    let count = i - start
                    if count < result {
                        result = count
                    }
                }
            }
        }
        return result
    }
    
    // LinkedList Problems
    func linkedListProblems() {
        let linkedList = LinkedList()
        var head = Node(1)
        //
        linkedList.reverseListWithoutRecursion()
        
        //
        linkedList.reverseList(head)
        
        //How to traverse to the middle of a linked list?
        
        // Implement the process of reversing a linked list.
        
        
    }
    
    func stringProgramming() {
        //How can you reverse a string?
        var string = "GAABBAAG"
        var reverseString = ""
        for value in string.enumerated() {
            reverseString = String(value.element) + reverseString
        }
        print(reverseString)
        
        //What is a palindrome string? //palindrome string is the one which on reversing remains the same
        
        
        //How to get the matching characters in a string?
        
        //How to get the non-matching characters in a string?
        
        //How to calculate the number of vowels and consonants in a string?
        
        //prove that the two strings are anagrams?
        
        //Find the count for the occurrence of a particular character in a string.
        
        //How to verify if two strings are a rotation mutually?
        
        //How to calculate the number of numerical digits in a string?
        
        //How to compute the first character of a string that is not repeated?
        
        //How to perform swapping two strings by not using a third variable?
        
        //How to remove special characters in a string that is in lowercase?
    }
    
    func numberProgramming() {
        //Compute the first five Fibonacci numbers.
        
        //Determine the factors of a number.
        
        //How to search a missing number in an array that contains integers from 1 to 100?
        
        //How to get the matching elements in an integer array?
        
        //How to delete the repeated elements in an integer array?
        
        //Determine the largest and the smallest element of an array which is not sorted.
        
        // Determine the second largest element of an array.
        
        //Explain the reversal of an array.
        
        //How to verify if a number is prime or not?
        
        //How to reverse a number?
    }
}


