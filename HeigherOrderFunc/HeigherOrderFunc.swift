//
//  HeigherOrderFunc.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 21/05/22.
//

import Foundation

class HeigherOrderFunc {
    // TODO: Sorting
    func sorting() {
        let numbers = [3, 6, 1, 8, 9, 5, 6]
        let ascending = numbers.sorted()
        let sortedBy = numbers.sorted { a, b in
            return a > b
        }
        let sorteddd = numbers.sorted(by: > )
    }
    
    // TODO: MAP
    func map() {
        let numbers = [3, 6, 1, 8, 9, 5, 6]
        let map1 = numbers.map { a in
            return String(a)
        }
        let map4 = numbers.map{ String($0) }
        let alphabet = ["k", "g", "d", "a", "s"]
        let map2 = alphabet.map{ $0.uppercased()}
        let mpa3 = alphabet.myMap{ $0.lowercased() }
    }
    
    func compactMap() {
        let possibleNumbers = ["1", "2", "three", "///4///", "5"]
        let map: [Int?] = possibleNumbers.map { Int($0) }
        print(map)
        let compactMap: [Int] = possibleNumbers.compactMap { Int($0) }
        print(compactMap)
        let myCompactMap: [Int] = possibleNumbers.myCompactmap{ Int($0)}
        print(myCompactMap)
    }
    
    func filter() {
        let numbers = [3, 6, 1, 8, 9, 5, 10, 4, 6]
        let filter = numbers.filter { a in
            return a % 2 == 0
        }
        print(filter)
        let filter1 = numbers.filter { $0 % 2 == 0}
        print(filter1)
        let filter2 = numbers.myFilter { $0 % 2 == 0}
        print(filter2)
        let filter3 = numbers.myFilter { $0 > 4}
        print(filter3)
    }
    
    func reduce() {
        let numbers = [3, 6, 1]
        let sum = numbers.reduce(0, +)
        print(sum)
        let sum1 = numbers.reduce(0) { $0 + $1}
        print(sum1)
        let sum2 = numbers.myReduce(0, +)
        print(sum2)
        let sum3 = numbers.myReduce(15) { $0 + $1}
        print(sum3)
    }
}

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for value in self {
            result.append(transform(value))
        }
        return result
    }
    
    func myCompactmap<T>(_ transform: (Element) -> T?) -> [T] {
        var result = [T]()
        for value in self {
            if let transformItem = transform(value) {
                result.append(transformItem)
            }
        }
        return result
    }
    
    func myFilter(_ transform: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        for value in self {
            if transform(value) {
                result.append(value)
            }
        }
        return result
    }
    
    func myReduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element)-> Result) -> Result {
        var result = initialResult
        for value in self {
            result = nextPartialResult(result, value)
        }
        return result
    }
}
