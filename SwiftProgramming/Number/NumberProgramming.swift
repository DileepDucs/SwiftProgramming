//
//  NumberProgramming.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 14/10/21.
//

import Foundation

class NumberProgramming {
    
    func largestGoodInteger(_ num: String) {
        let digits = num.flatMap{Int(String($0))}
        for (index, value) in digits.enumerated() {
            
        }
        
    }
    
    func checkIntCount(index: Int, array: [Character]) {
        var i = 1
        
    }
    
    func isHappy(_ n: Int) -> Bool {
        var tempArray = [Int]()
        return isHappyHelper(n, store: &tempArray)
    }
        
    func isHappyHelper(_ n: Int, store: inout [Int]) -> Bool {
        var array = [Int]()
        store.append(n)
        var temp = n
        while temp != 0 {
            array.append(temp % 10)
            temp = temp / 10
        }
        array = array.reversed()
        var sum = 0
        for value in array {
            sum = sum + (value * value)
        }
        if sum == 1 {
            return true
        } else {
            if store.contains(sum) {
                return false
            }
            return isHappyHelper(sum, store: &store)
        }
    }
    
    func mySqrt(_ x: Int) -> Int {
        if x == 1 || x == 0 {
            return x
        }
        var i = 1
        var result = 1
        while result <= x {
            i = i + 1
            result = i * i
        }
        return i - 1
    }
    
    func addBinary(_ a: String, _ b: String) {
        var aCount = a.count - 1
        var bCount = b.count - 1
        var sum = ""
        var reminder: Character = "0"
        while aCount >= 0 && bCount >= 0 {
            var result = getSum(a: a[aCount], b: b[bCount])
            result = getSum(a: Character(result), b: reminder)
            reminder = getReminder(a: a[aCount], b: b[bCount], result: reminder)
            sum = result + sum
            aCount = aCount - 1
            bCount = bCount - 1
        }
        while aCount >= 0{
            let result = getSum(a: a[aCount], b: reminder)
            sum = result + sum
            reminder = getReminder2(a: a[aCount], b: reminder)
            aCount = aCount - 1
        }
        while bCount >= 0 {
            let result = getSum(a: reminder, b: b[bCount])
            sum = result + sum
            reminder = getReminder2(a: reminder, b: b[bCount])
            bCount = bCount - 1
        }
        if reminder == "1" {
            sum = "1" + sum
        }
        print(sum)
    }
        
    func getSum(a: Character, b: Character) -> String{
        switch (a, b) {
        case ("0", "0"):
            return "0"
        case ("0", "1"):
            return "1"
        case ("1", "0"):
            return "1"
        case ("1", "1"):
            return "0"
        default:
            return "0"
        }
    }
    
    func getReminder(a: Character, b: Character, result: Character) -> Character {
        if a == "1" && b == "1" || a == "1" && result == "1" || b == "1" && result == "1" {
            return "1"
        } else  {
            return "0"
        }
    }
    
    func getReminder2(a: Character, b: Character) -> Character {
        if a == "1" && b == "1" {
            return "1"
        } else  {
            return "0"
        }
    }
    
    func checkAnagram(first: String, second: String) -> Bool {
        if first.count != second.count {
            return false
        }
        var dict = [Character: Int]()
        for key in first {
            dict[key] = 1
        }
        
        for key in second {
            guard let _ = dict[key] else { return false }
        
        }
        return true
    }
    
    func checkArray() {
        let list = ["eat", "ate", "tea", "bat", "tap", "tab"]
        var dict = [String: Int]()
        for value in list {
            let sorted = String(value.sorted())
            if let value = dict[sorted] {
                dict[sorted] = value
            } else {
                dict[sorted] = 1
            }
        }
        print(dict)
    }
    
    func integerToBinary() {
        let num = 529
        let str = String(num, radix: 2)
        var temp = [Int]()
        for value in str.enumerated() {
                if value.element == "1" {
                    temp.append(value.offset)
                }
        }
        print(temp)
        var max  = 0
        for i in 0..<temp.count - 1 {
            let diff = temp[i + 1] - temp[i]
            if diff > max {
                max = diff - 1
            }
        }
        var array = [1, 3, 6, 4, 1, 2]
        var result = 1
        print(result)
        var time = getTotalHours(start: "09:42", end: "11:42")
        var totalTimeCount = time.hour + (time.minute > 0 ? 1 : 0)
        var cost = 0
        if totalTimeCount == 0 {
            cost = 0
        } else if totalTimeCount == 1{
            cost = 2 + 3
        } else {
            cost = 2 + (4 * totalTimeCount) - 1
        }
       
        solution(826)
    }
    
    public func solution1(_ A : [Int]) {
        var count = 0
        for i in 0..<A.count - 1 {
            var sum = A[i]
            for j in i + 1..<A.count {
                sum = sum + A[j]
                if sum == 0 {
                    count = count + 1
                }
            }
        }
        if A.contains(0) {
            count = count + 1
        }
        print(count)
    }
    
    func getAllSum(arr: [Int]) {
        var count = 0
        var map = [Int: Int]()
        var i = -1
        var sum = 0
        map[0] = 1
        while i < arr.count - 1 {
            i = i + 1
            sum = sum + arr[i]
            if let value = map[sum] {
                count = count + value
                map[sum] = value + 1
            } else {
                map[sum] = 1
            }
        }
        print(count)
    }
    
    
    // Good Solution
    public func solution(_ N : Int) {
        let string = N >= 0 ? String(N) : String(-N)
        var max = Int.min
        var min = Int.max
        let size = getIntSiz(n: N)
        for index in 0...size {
            let insertedString = insertChar(numString: string, index: index)
            if let intValue = Int(insertedString) {
                if N >= 0 {
                    if intValue > max {
                        max = intValue
                    }
                } else {
                    if intValue < min {
                        min = intValue
                    }
                }
            }
        }
        
        print(N >= 0 ? max : -min)
        getAllSum(arr: [2, -2, 3, 0, 4, -7])
        
    }
    
    func getIntSiz(n: Int) -> Int {
        var count = 0
        var number = n
        while number != 0 {
            number = number / 10
            count = count + 1
        }
        return count
    }
    
    func insertChar(numString: String, index: Int) -> String {
        var str1 = numString
        let ch :Character = "5"
        let i = str1.index(str1.startIndex, offsetBy: index)
        str1.insert(ch, at: i)
        return str1
    }
    
//    public func solution(_ N : Int) -> String {
//        var result = ""
//        if N == 0 {
//            return result
//        }
//        for _ in stride(from: 1, through: N/2, by: 1) {
//            result = result + "+-"
//        }
//        if N % 2 != 0 {
//            result = result + "+"
//        }
//        return result
//    }
    
    
    
    
    public func solution(_ A : inout [Int]) -> Int {
        var fib = [Int]()
        fib.append(1)
        fib.append(2)
        var fs = 1
        while(fib[fs - 1] <= A.count) {
            fib[fs] = fib[fs - 1] + fib[fs - 2]
            fs = fs + 1
        }
        var result = -1
        for i in 0..<A.count {
            if i == A.count || A[i] == 1 {
                var min = Int.max
                for j in 0..<fs where fib[j] <= i + 1 {
                    var from = i - fib[j]
                    if from == -1 {
                        min = 1
                    } else if A[from] > 0{
                        if A[from] + 1 < min {
                            min = A[from] + 1
                        }
                    }
                }
                if i < A.count {
                    if min == Int.max {
                        A[i] = 0
                    } else {
                        A[i] = min
                    }
                } else {
                    if min != Int.max {
                        result = min
                    }
                }
            }
        }
        return result
    }
    
    
    func getTotalHours(start: String, end: String) -> (hour: Int, minute: Int) {
        let startHour = Int(String(start[0]) + String(start[1])) ?? 0
        let startMinutes = Int(String(start[3]) + String(start[4])) ?? 0
        
        let endHour = Int(String(end[0]) + String(end[1])) ?? 0
        let endMinutes = Int(String(end[3]) + String(end[4])) ?? 0
        
        let totalHour = endHour - startHour
        let totaMinutes = endMinutes - startMinutes
        return (totalHour, totaMinutes)
    }
    
    func getTotalHourAndMinute(start: String, end: String) -> (hour: Int, minute: Int) {
        var startHour = Int(start.prefix(2)) ?? 0
        var startMinute = Int(start.suffix(2)) ?? 0
        
        var endHour = Int(end.prefix(2)) ?? 0
        var endMinute = Int(end.suffix(2)) ?? 0
        
        let totalHour = endHour - startHour
        let totaMinute = endMinute - startMinute
        return (totalHour, totaMinute)
    }
    
    func checkArray(A: [Int], value: Int) -> Bool {
        return A.contains(value)
    }
    
    
    //Q1). Write a program to reverse an integer in swift.
    // 102032 -> 230201
    func reverseNumber(value: Int) {
        var number = value
        var reverse = 0
        while number != 0 {
            reverse = reverse * 10 + (number % 10)
            number = number / 10
        }
        print(reverse)
    }
    
    //Q2). Write a program in C to check whether an integer is Armstrong number or not.
    /** Given number = 153
       1^3 = (1*1*1) = 1
       5^3 = (5*5*5) = 125
       3^3= (3*3*3) = 27
       Now add the cube
       1+125+27 = 153
     */
    
    func isArmstrongNumber(value: Int) {
        var number = value
        var n = 0
        while number != 0 {
            n = n + 1
            number = number / 10
        }
        number = value
        var result = 0
        while number != 0 {
            result = result + (Int(pow(Double(number % 10), Double(n))))
            number = number / 10
        }
        if result == value {
            print("\(value) : Yes Armstrong Number")
        } else {
            print("\(value): No this is not Armstrong Number")
        }
    }
    
    //Q3). Write a program in C to check given number is prime or not.
    
    func isGivenNumberPrime(value: Int) {
        
    }
    
    // Write a program in C to print the Fibonacci series using iteration.
    func fibo(n: Int) {
        var a = 0
        var b = 1
        print(b)
        for _ in 1..<n {
            let sum = a + b
            a = b
            b = sum
            print(sum)
        }
    }
    
    func fibo( n: Int) -> Int {

            guard n > 1 else { return n }

            return fibo(n: n-1) + fibo(n: n-2)
    }
    
    func fibonacciOf(_ number: Int) -> Int {
        if number == 1 || number == 2 {
            return 1
        }

        return fibonacciOf(number - 2) + fibonacciOf(number - 1)
    }

    
    
    //Q5). Write a program in C to print the Fibonacci series using recursion.
    //Q6). Write a program in C to check whether a number is palindrome or not using iteration.
    //Q7). Write a program in C to check whether a number is palindrome or not using recursion.
}

extension String {
    mutating func insert(string:String,ind:Int) {
        self.insert(contentsOf: string, at:self.index(self.startIndex, offsetBy: ind) )
    }
}
