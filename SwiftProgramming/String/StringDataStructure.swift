//
//  StringDataStructure.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 26/09/21.
//

import UIKit

class StringDataStructure {
    
    
    //Valid Parentheses
    func validParentheses(string: String) -> Bool{
        var stack = Stack<Character>()
        for value in string {
            switch value{
            case "{":
                stack.push("{")
            case "(":
                stack.push("(")
            case "[":
                stack.push("[")
            case ")":
                let char = stack.pop()
                if char != "(" {
                    return false
                }
            case "]":
                let char = stack.pop()
                if char != "[" {
                    return false
                }
            case "}":
                let char = stack.pop()
                if char != "{" {
                    return false
                }
            default:
                return false
            }
        }
        return stack.isEmpty == true ? true : false
    }
    
    
    //A string is called a palindrome string if the reverse of that string is the same as the original string. For example, radar , level
    func isPalindrome(_ s: String) -> Bool {
        var array = [Character]()
        for char in s {
            if char.isLetter || char.isNumber{
                array.append(char)
            }
        }
        var start = 0
        var end = array.count - 1
        while start <= end {
            if array[start].lowercased() == array[end].lowercased() {
                start = start + 1
                end = end - 1
            } else {
                return false
            }
        }
        return true
    }
    
    
    // Given a string s, return true if the s can be palindrome after deleting at most one character from it.
    func validPalindrome(_ s: String) -> Bool {
            var array = [Character]()
            var count  = 0
            for char in s {
                if char.isLetter || char.isNumber{
                    array.append(char)
                }
            }
            var start = 0
            var end = array.count - 1
            while start <= end {
                if array[start].lowercased() != array[end].lowercased() {
                    if count != 0{
                        return false
                    }
                }
                if array[start].lowercased() != array[end].lowercased() && count == 0 {
                    count = 1
                    if start + 1 <= end || start <= end - 1 {
                        if array[start] == array[end - 1] {
                            start = start - 1
                        } else {
                            end = end + 1
                        }
                    }
                    
                }
                start = start + 1
                end = end - 1
            }
            return true
        }
    
    
    func canCompleteCircuit(_ A: [Int], _ B: [Int]) -> Int {
        var S = 0
        var result = 0
        var actualResult = 0
        for i in 0..<A.count {
            result = result + (A[i] - B[i])
            actualResult = actualResult + (A[i] - B[i])
            if result < 0 {
                result = 0
                S = i + 1
            }
        }
        return actualResult < 0 ? -1 : S
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if needle.count > haystack.count {
            return -1
        }
        for i in 0..<haystack.count {
            var count = 0
            for j in 0..<needle.count {
                if i + j >= haystack.count {
                    break
                }
                if haystack[i + j] != needle[j] {
                    break
                }
                count = count + 1
            }
            if count == needle.count {
                return i
            }
        }
        return -1
    }
    

    func majorityElement(_ A: [Int]) -> Int {
        var map = [Int : Int]()
        for key in A {
            if let value = map[key] {
                map[key] = value + 1
            } else {
                map[key] = 1
            }
        }
        var max = Int.min
        var result = 0
        for (key, value) in map {
            if value > max {
                max = value
                result = key
            }
        }
        return result
    }
    
    func majorityElementa(_ A: [Int]) -> Int {
            var map = [Int : Int]()
            var max = Int.min
            var result = 0
            for key in A {
                if let value = map[key] {
                    map[key] = value + 1
                    if value + 1 > max {
                        max = value + 1
                        result = key
                    }
                } else {
                    map[key] = 1
                    if 1 > max {
                        max = 1
                        result = key
                    }
                }
            }
            return result
        }
    
    
    func getColorCombination(color: String) -> String {
        switch color {
        case "U":
            return "U"
        case "R":
            return "R"
        case "B":
            return "B"
        case "Y":
            return "Y"
        case "O":
            return "RY"
        case "P":
            return "RB"
        case "G":
            return "YB"
        case "A":
            return "RYB"
        default:
            return "U"
        }
    }
    
    func colorCombination(string: String) -> String {
        let colorCombination = getColorCombination(color: string)
        return colorCombination
    }
    
    func colorProblem(color: String) {
        var red = [Int]()
        var yellow = [Int]()
        var blue = [Int]()
        var index = 0
        for value in color {
            yellow.insert(colorCombination(string: String(value)).contains("Y") ? 1 : 0, at: index)
            blue.insert(colorCombination(string: String(value)).contains("B") ? 1 : 0, at: index)
            red.insert(colorCombination(string: String(value)).contains("R") ? 1 : 0, at: index)
            index = index + 1
        }
        print(" Color: \(color)")
        print("   Red: \(red)")
        print("Yellow: \(yellow)")
        print("  Blue: \(blue)")
        let result = calculateOneCotiCount(array: yellow) + calculateOneCotiCount(array: blue) + calculateOneCotiCount(array: red)
        print("count:\(result)")
    }
    
    func calculateOneCotiCount(array: [Int]) -> Int {
        var count = 0
        var track = false
        for i in 0..<array.count {
            if array[i] == 1 {
                if track == false {
                    track = true
                    count = count + 1
                }
            } else {
                track = false
            }
        }
        return count
    }
    
    func getTotalColor(array: [Int]) -> Int {
        var pointer1 = 0
        var pointer0 = 0
        var count = 0
        while pointer1 < array.count {
            if array[pointer1] == 1 {
                pointer1 = pointer1 + 1
                count = count + 1
            } else {
                
            }
        }
        return 0
    }
    
    func calculate() {
        guard let n = Int(readLine(strippingNewline: true)!) else { return }
        for i in 1...n {
            guard let m = Int(readLine(strippingNewline: true)!) else { return }
            guard let string = readLine() else { return }
            let result = colorProblem(color: string)
            print("Case #\(i): \(result)")
        }
    }
    
    func calculate4() {
        guard let n = Int(readLine(strippingNewline: true)!) else { return }
        for i in 1...n {
            guard let S = readLine() else { return }
            guard let F = readLine() else { return }
            let result = getNearstCount(string: S, fav: F)
            print("Case #\(i): \(result)")
        }
    }

    func getNearstCount(string: String, fav: String) -> Int {
        var map = [Character : Int]()
        var sum = 0
        for value in string {
            if fav.contains(value) {
                map[value] = 0
            } else {
                let charValue = value.asciiValue
                var min = Int.max
                for value in fav {
                    let favValue = value.asciiValue
                    let modules = abs(Int(favValue!) - Int(charValue!))
                    let cycle = 26 - modules
                    let minValue = getMinValue(a: modules, b: cycle)
                    if minValue < min {
                        min = minValue
                    }
                }
                map[value] = min
                sum = sum + min
            }
        }
        return sum
    }
    
    func getMinValue(a: Int, b: Int) -> Int{
        return a < b ? a : b
    }
    
    func swap(a: inout Character, b: inout Character) {
        let c = a
        a = b
        b = c
    }
    
    // Permutation
    // HELPER Function
    func permute(string: String, left: Int, right: Int){
        var stringArray = Array(string)
        if ( left == right) {
            print(string)
        }else{
            for i in left ..< right{
                stringArray.swapAt(left, i);
                permute(string: String(stringArray), left: left + 1, right: right);
                stringArray.swapAt(left, i);
            }
        }
    }

    func permutationOfString() {
        let string = "ABCD"
        permute(string: string, left: 0, right: string.count)
    }
    
    // Remove all occurrences of a character in a string
    /**
     Input : s = "geeksforgeeks"
             c = 'e'
     Output : s = "gksforgks"
     
     Input : s = "geeksforgeeks"
             c = 'g'
     Output : s = "eeksforeeks"
     */
    
    func removeAllOccurrences(string: String, character: Character) {
        var resultString = ""
        for char in string {
            if char != character {
                resultString = resultString + "\(char)"
            }
        }
        print(resultString)
    }
    
    //remove any given character
    func removingAnyCharacterFrom(string: String, character: Character) {
        var result = ""
        for char in string {
            if char != character {
                result = result + "\(char)"
            }
        }
        print(result)
    }
    
    /**
     find the first non-repeating character in it
     */
    func findFirstNonRepeatingChar(string: String) {
        var dict = [Character: Int]()
        for char in string {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        for char in string {
            if dict[char] == 1 {
                print("First unique key is: \(char)")
                break
            }
        }
    }
    

    /**
     Input : str = "geeksforgeeks"
              c = 'e'
     Output : 4
     'e' appears four times in str.

     Input : str = "abccdefgaa"
               c = 'a'
     Output : 3
     */
    func countOccurrenceOfGivenCharacterFrom(string: String, character: Character) {
        var count = 0
        for char in string {
            if char == character {
                count = count + 1
            }
        }
        print(count)
    }
    
    //**Reverse String
    func reverseString(string: String) -> String{
       var reverseString = ""
        for char in string {
            // This place string are reversing
            reverseString = "\(char)" + reverseString
        }
        return reverseString
    }
    
//    func isPalindrome(string: String) -> Bool {
//        return string == reverseString(string: string) ? true : false
//    }
    
    //Reverse String
    //One-liner using Higher-order function "Reduce" on the string.
    
    func reverseStringHigherOrder(string: String) -> String {
        return string.reduce("") { "\($1)" + $0 }
    }
    
    /*
     Check whether two strings are anagram of each other
     
     Write a function to check whether two given strings are anagram of each other or not. An anagram of a string is another string that contains the same characters, only the order of characters can be different. For example, “abcd” and “dabc” are an anagram of each other.
     Listen == Silent, Triangle == Integral
     **/
    // nLogn time complexity
    func isAnagram(string1: String, string2: String) -> Bool {
        
        if string1.count != string2.count {
            return false
        }
        if string1.sorted() == string2.sorted() {
            return true
        }
        return false
    }
    
    //
    func isAnagramBestApproach(string1: String, string2: String) -> Bool {
        var dict = [Character : Int]()
        for char in string1 {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        
        for char in string2 {
            if let value = dict[char] {
                dict[char] = value - 1
            } else {
                dict[char] = -1
            }
        }
        let value = dict.filter({ $0.value != 0})
        return value.isEmpty
    }
    
    //deferExample1:- 1, 2, 3, 4, 5
    
    
    func missingCharacter(string: String) {
        var alphabetArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        for char in string {
            alphabetArray = alphabetArray.filter {$0 != String(char)}
        }
        let string = alphabetArray.joined()
        print(string)
        
    }
    
    func checkAllCharacterOfString(string: String) -> Bool{
        guard let firstChar = string.first else { return  false }
        for char in string {
            if firstChar != char {
                return false
            }
        }
        return true
    }
    
    func romanToInt(_ s: String) -> Int {
        var array = Array(s)
        var sum = 0
        var count = 0
        while count < array.count {
            if (array[count] == "I" || array[count] == "X" || array[count] == "C") && ((count + 1) < array.count) {
                let str = String(array[count]) + String(array[count + 1])
                let value = getIntFromRoman(char: str)
                if value == 0 {
                    sum = sum + getIntFromRoman(char: String(array[count]))
                    count = count + 1
                } else {
                    sum = sum + value
                    count = count + 2
                }
                    
            } else {
                let str = String(array[count])
                sum = sum + getIntFromRoman(char: str)
                count = count + 1
            }
        }
        return sum
    }

    func getIntFromRoman(char: String) -> Int {
        switch char {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        case "IV":
            return 4
        case "IX":
            return 9
        case "XL":
            return 40
        case "XC":
            return 90
        case "CD":
            return 400
        case "CM":
            return 900
        default:
            return 0
        }
    }
    
    func givenStringPalindrome(string: String) -> Bool {
        let reverseString = String(string.reversed())
        return reverseString == string
    }
    
    func isPalindrome(string: String) -> Bool {
       // let array = Array(string)
        var low = 0, high = string.count - 1
        while low < high {
            if string[low] != string[high] {
                return false
            }
            low = low + 1
            high = high - 1
        }
        return true
    }
    
    //Return maximum occurring character in an input string
    
    func maximumOccuringChar(string: String) {
        var dict = [Character : Int]()
        for char in string {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        guard let keee = dict.max(by: {$0.value < $1.value}) else { return }
        print(keee)
    }
    
    /*Print all the duplicates in the input string
     “geeksforgeeks”
     count[‘e’] = 4
     count[‘g’] = 2
     count[‘k’] = 2
     */
    func printAllDuplicates(string: String) {
        var dict = [Character : Int]()
        for char in string {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        print(dict)
        dict = dict.filter({$0.value != 1})
        print(dict)
    }
    
    /*
     Program to find the initials of a name.
     Input  : prabhat kumar singh
     Output : P K S
     **/
    
    func printInitialsOfName(string: String) {
        guard var name = string.first?.uppercased() else {
            print("String is Empty")
            return
        }
        for (index, char) in string.enumerated() {
            if char == " " {
                let nextChar = string[index + 1]
                name = name + " " + nextChar.uppercased()
            }
        }
        print(name)
    }
    
    /*
     Find one extra character in a string
     Input : string strA = "abcd";
             string strB = "cbdae";
     Output : e
     **/
    
    func findOneExtraCharacter(firstString: String, secondString: String) {
        var dict = [Character : Int]()
        for char in secondString.count > firstString.count ? secondString : firstString {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        
        for char in secondString.count > firstString.count ? firstString : secondString {
            if let value = dict[char] {
                dict[char] = value - 1
            } else {
                print(char)
                break
            }
        }
        let result = dict.filter({$0.value == 1})
        if !result.isEmpty {
            print(result)
        }
    }
    
    /*
     Change string to a new character set
     Given a 26 letter character set, which is equivalent to character set of English alphabet i.e. (abcd….xyz) and act as a relation. We are also given several sentences and we have to translate them with the help of given new character set.
     New character set : qwertyuiopasdfghjklzxcvbnm
     Input : "utta"
     Output : geek
     **/
    func newCharSet(characterSet: String, code: String) {
        var dict = [Character : Character]()
        var result = ""
        var count = 0
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for char in  characterSet {
            dict[char] = alphabet[count]
            count = count + 1
        }
        for char in code {
            if let value = dict[char] {
                result = result + String(value)
            }
        }
        print(result)
        for char in 1...5 {
            print(char)
        }
        
    }
    
    //How to calculate the number of vowels and consonants in a string?
    func isVowels(char: Character) -> Bool{
        switch char {
        case "A", "E", "I", "O", "U":
            return true
        default:
            return false
        }
    }
    // Helper method
    func calculateNumberOfVowelsAndConsonants(string: String) {
        var vowels = 0
        var consonants = 0
        for char in string {
            if isVowels(char: char.convertUpperCase) {
                vowels = vowels + 1
            } else {
                consonants = consonants + 1
            }
        }
        print("Vovales: \(vowels), Consonants: \(consonants)")
    }
    
    // A Program to check if strings are rotations of each other or not
    //str1 = "ABACD" str2 = "CDABA"
    
    func checkRotationsOfTwoString(string1: String, string2: String) -> Bool{
        if string1.count != string2.count {
            return false
        }
        if string1.isEmpty && string2.isEmpty {
            return true
        }
        var matchingIndex = getFirstMatchingCharacterIndex(string1: string1, string2: string2)
        if matchingIndex == -1 {
            return false
        }
        for char in string1 {
            if char == string2[matchingIndex % string2.count] {
                matchingIndex = matchingIndex + 1
            } else {
                return false
            }
        }
        return true
    }
    
    // Helper function
    func getFirstMatchingCharacterIndex(string1: String, string2: String) -> Int {
        let firstChar = string1.first
        var index = 0
        for char in string2 {
            if firstChar == char {
                return index
            }
            index = index + 1
        }
        return -1
    }
    
    // Second Approach ( A Program to check if strings are rotations of each other or not)
    
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension String {
    func swap(_ a: Int, _ b: Int) -> String{
        var characters = Array(self)
        characters.swapAt(a, b)
        return String(characters)
    }
}

extension Character {
    var convertUpperCase: Character {
        return Character(String(self).uppercased())
    }
}
