//
//  RecursionQn.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 19/02/22.
//

import UIKit

//Letter Combinations of a Phone Number |
//https://leetcode.com/problems/letter-combinations-of-a-phone-number/

class Recursion {
    
    func climbStairs(_ n: Int) -> Int {
        var dp = [Int]()
        for _ in 1...n + 1 {
            dp.append(-1)
        }
        fib(n, dp: &dp)
        return dp[n]
    }
    
    func fib(_ n: Int, dp: inout [Int]) -> Int {
        if n <= 1 {
            dp[n] = 1
            return dp[n]
        }
        if dp[n] != -1 {
            return dp[n]
        }
        dp[n] = fib(n - 1, dp: &dp) + fib(n - 2, dp: &dp)
        return  dp[n]
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        var results = [String]()
        if digits.count == 0 {
            return results
        }
        var sb = ""
        backtrack(digits: digits, i: 0, sb: &sb, list: &results)
        return results
    }
    
    func backtrack(digits: String, i: Int, sb: inout String, list: inout [String]) {
        if i == digits.count {
            list.append(sb)
            return
        }
        let curr = getMapString(value: digits[i])
        for k in 0..<curr.count {
            sb.append(curr[k])
            backtrack(digits: digits, i: i + 1, sb: &sb, list: &list)
            let index = sb.index(sb.startIndex, offsetBy: sb.count - 1)
            sb.remove(at: index)
        }
    }
    
    func getMapString(value: Character) -> String {
        switch value {
        case "2":
            return "abc"
        case "3":
            return "def"
        case "4":
            return "ghi"
        case "5":
            return "jkl"
        case "6":
            return "mno"
        case "7":
            return "pqrs"
        case "8":
            return "tuv"
        case "9":
            return "wxyz"
        default:
            return ""
        }
    }
    
    func display() {
        let result = letterCombinations("")
        print(result)
    }
    
}

class GenerateParenthesis {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var sb = ""
        backTrack(n: n, sb: sb, results: &result, open: 0, close: 0)
        return result
    }
    
    func backTrack(n: Int, sb: String, results: inout [String], open: Int, close: Int) {
        if sb.count == n * 2 {
            results.append(sb)
            return
        }
        if open < n {
            backTrack(n: n, sb: sb + "(", results: &results, open: open + 1, close: close)
        }
        if close < open {
            backTrack(n: n, sb: sb + ")", results: &results, open: open, close: close + 1)
        }
    }
}

class NextPermutation {
    
    
    func nextPermutationAlternative() {
        var array = [1, 5, 8, 4, 7, 6, 5, 3, 1]
        var idx = -1
        for i in (1..<array.count).reversed() {
            if array[i] > array[i - 1] {
                idx = i - 1
                break
            }
        }
        if idx == -1 {
            array = array.reversed()
        } else {
            var nextMax = 999999
            var temp = array[idx]
            var p = 0
            for k in idx..<array.count - 1 {
                if temp < array[k + 1] && nextMax > array[k + 1] {
                    nextMax = array[k + 1]
                    p = k + 1
                }
            }
            temp = array[idx]
            array[idx] = array[p]
            array[p] = temp            
            
        }
        print(array)
        
    }
    
    func swapConsucative(i: Int, max: Int, array: inout [Int]) {
        
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        var num = ""
        for value in nums {
            num = num + String(value)
        }
        var set = Set<String>()
        permute(string: &num, l: 0, r: num.count - 1, set: &set)
        let sortedArry = set.sorted()
        let resultIndex = getIndex(array: sortedArry, key: num)
        let value = sortedArry[resultIndex].flatMap{ $0}
        nums.removeAll()
        for ch in value {
            if let number = Int(String(ch)) {
                nums.append(number)
            }
        }
        print(nums)
        
    }
    
    func getIndex(array: [String], key: String) -> Int {
        var i = 0
        while i < array.count {
            if array[i] == key {
                return (i + 1) % array.count
            }
            i = i + 1
        }
        return -1
    }
    
    func permute(string: inout String, l: Int, r: Int, set: inout Set<String>) {
        if l == r {
            set.insert(string)
        }
        if l <= r {
            for i in l...r {
                string = string.swap(l, i)
                permute(string: &string, l: l + 1, r: r, set: &set)
                string = string.swap(l, i)
            }
        }
    }
}
